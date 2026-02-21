#!/bin/sh
#
# check_itemserial.sh
# 启动服务端前检查 t_itemserial.sn 与 t_item MAX(guid) 的一致性
# 如果 sn 落后于实际物品最大 guid，自动修正，防止重复GUID问题
#
# 适配环境: CentOS 5.8 / MySQL 5.0 / Bash 3.x
#

DB_NAME="khan3"
DB_USER="root"
DB_PASS="123456"
DB_HOST="127.0.0.1"

SAFETY_MARGIN=10000

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] $1"
}

log_warn() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [WARN] $1"
}

log_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] $1"
}

run_sql() {
    mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" -N -B "$DB_NAME" -e "$1" 2>/dev/null
}

log_info "========== ItemSerial Check Start =========="

# 1. 检查数据库连接
TEST_CONN=$(run_sql "SELECT 1")
if [ "$TEST_CONN" != "1" ]; then
    log_error "Cannot connect to database $DB_NAME, abort!"
    exit 1
fi
log_info "Database connection OK."

# 2. 查询 t_item 中的最大 guid
MAX_GUID=$(run_sql "SELECT IFNULL(MAX(guid), 0) FROM t_item WHERE valid = 1")
if [ -z "$MAX_GUID" ]; then
    MAX_GUID=0
fi
log_info "t_item MAX(guid) = $MAX_GUID"

# 3. 逐条检查 t_itemserial 中每个 server 的 sn
SERIAL_LIST=$(run_sql "SELECT sid, sn FROM t_itemserial where sid = 0 ORDER BY sid")
if [ -z "$SERIAL_LIST" ]; then
    log_warn "t_itemserial is empty, nothing to check."
    log_info "========== ItemSerial Check End =========="
    exit 0
fi

FIXED_COUNT=0

echo "$SERIAL_LIST" | while read SID SN; do
    if [ -z "$SID" ] || [ -z "$SN" ]; then
        continue
    fi

    log_info "  sid=$SID, sn=$SN, max_guid=$MAX_GUID"

    if [ "$MAX_GUID" -ge "$SN" ]; then
        NEW_SN=$(expr $MAX_GUID + $SAFETY_MARGIN)
        log_warn "  sid=$SID: sn($SN) <= max_guid($MAX_GUID)! Fixing sn -> $NEW_SN"
        run_sql "UPDATE t_itemserial SET sn = $NEW_SN WHERE sid = $SID"
        VERIFY_SN=$(run_sql "SELECT sn FROM t_itemserial WHERE sid = $SID")
        if [ "$VERIFY_SN" = "$NEW_SN" ]; then
            log_info "  sid=$SID: Fix verified OK. sn is now $VERIFY_SN"
        else
            log_error "  sid=$SID: Fix verification FAILED! Expected $NEW_SN, got $VERIFY_SN"
            exit 1
        fi
    else
        GAP=$(expr $SN - $MAX_GUID)
        log_info "  sid=$SID: OK (sn ahead by $GAP)"
    fi
done

# 4. 检查同一玩家是否存在不同 itemclass 却使用相同 guid 的物品
#    注意：同一 itemclass 使用相同 guid 是允许的，只有不同 itemclass 共用 guid 才需要修复
log_info "Checking for duplicate GUIDs across different itemclass..."

DUP_SQL="SELECT COUNT(*) FROM ( \
  SELECT a.playerguid, a.guid, a.world, a.server \
  FROM t_item a, t_item b \
  WHERE a.valid = 1 AND b.valid = 1 \
    AND a.playerguid = b.playerguid \
    AND a.guid = b.guid \
    AND a.world = b.world \
    AND a.server = b.server \
    AND a.itemclass != b.itemclass \
    AND a.aid < b.aid \
  GROUP BY a.playerguid, a.guid, a.world, a.server \
) AS dup"

DUP_COUNT=$(run_sql "$DUP_SQL")
if [ -z "$DUP_COUNT" ]; then
    DUP_COUNT=0
fi

if [ "$DUP_COUNT" -gt 0 ]; then
    log_warn "Found $DUP_COUNT duplicate GUID groups (different itemclass sharing same guid)!"

    DETAIL_SQL="SELECT DISTINCT t.playerguid, t.guid, t.world, t.server, t.aid, t.slot, t.itemclass \
      FROM t_item t \
      WHERE t.valid = 1 \
        AND EXISTS ( \
          SELECT 1 FROM t_item o \
          WHERE o.valid = 1 \
            AND o.playerguid = t.playerguid \
            AND o.guid = t.guid \
            AND o.world = t.world \
            AND o.server = t.server \
            AND o.itemclass != t.itemclass \
        ) \
      ORDER BY t.playerguid, t.guid, t.aid"

    log_warn "Details:"
    run_sql "$DETAIL_SQL" | while read PG GD WD SV AID SLOT IC; do
        log_warn "  playerguid=$PG guid=$GD world=$WD server=$SV aid=$AID slot=$SLOT itemclass=$IC"
    done

    log_info "Auto-fixing: assigning new guid to the later item in each conflict pair..."

    SAFE_SN=$(run_sql "SELECT IFNULL(MAX(sn), 0) FROM t_itemserial")
    CUR_MAX=$(run_sql "SELECT IFNULL(MAX(guid), 0) FROM t_item WHERE valid = 1")
    if [ "$SAFE_SN" -gt "$CUR_MAX" ]; then
        NEXT_SN=$SAFE_SN
    else
        NEXT_SN=$CUR_MAX
    fi

    # 找出冲突组：同一玩家、同一 guid 但不同 itemclass
    CONFLICT_SQL="SELECT a.playerguid, a.guid, a.world, a.server \
      FROM t_item a, t_item b \
      WHERE a.valid = 1 AND b.valid = 1 \
        AND a.playerguid = b.playerguid \
        AND a.guid = b.guid \
        AND a.world = b.world \
        AND a.server = b.server \
        AND a.itemclass != b.itemclass \
        AND a.aid < b.aid \
      GROUP BY a.playerguid, a.guid, a.world, a.server"

    run_sql "$CONFLICT_SQL" | while read PG GD WD SV; do
        # 每组冲突中，保留 aid 最小的那条，其余的分配新 guid
        KEEP_AID=$(run_sql "SELECT MIN(aid) FROM t_item WHERE playerguid = $PG AND guid = $GD AND world = $WD AND server = $SV AND valid = 1")
        log_info "  Conflict group: playerguid=$PG guid=$GD -- keeping aid=$KEEP_AID"

        run_sql "SELECT aid, itemclass FROM t_item WHERE playerguid = $PG AND guid = $GD AND world = $WD AND server = $SV AND valid = 1 AND aid != $KEEP_AID ORDER BY aid" | while read FIX_AID FIX_IC; do
            NEXT_SN=$(expr $NEXT_SN + 1)
            log_warn "  Fixing aid=$FIX_AID (itemclass=$FIX_IC): guid $GD -> $NEXT_SN"
            run_sql "UPDATE t_item SET guid = $NEXT_SN WHERE aid = $FIX_AID"
        done
    done

    NEW_MAX=$(run_sql "SELECT IFNULL(MAX(guid), 0) FROM t_item WHERE valid = 1")
    FINAL_SN=$(expr $NEW_MAX + $SAFETY_MARGIN)
    run_sql "UPDATE t_itemserial SET sn = $FINAL_SN WHERE sn < $FINAL_SN and sid = 0"
    log_info "Updated t_itemserial sn to $FINAL_SN after duplicate fix."
else
    log_info "No cross-itemclass duplicate GUIDs found. OK."
fi

log_info "========== ItemSerial Check End =========="
exit 0
