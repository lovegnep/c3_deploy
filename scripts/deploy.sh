#!/bin/bash
set -u
# deploy_prepare.sh
# 用途：根据入参判断局域网/公网部署，修改 ifcfg alias、iptables、配置文件并执行资源加密/上传流程
# 运行示例:
#   ./deploy_prepare.sh            # 局域网部署（自动取本机IP）
#   ./deploy_prepare.sh 98.33.55.33  # 如果和本机IP不同，则视为公网部署，参数为公网IP

# ----------------------
# 配置区（必要时手动调整）
# ----------------------
DOWNLOAD_DIR="/www/wwwroot/default/khan3/xiazai_khan3"
ENTRANCE_ZIP_NAME="Entrance.zip"
SRC_ENTRANCE_FILE="src/Entrance.txt"         # 用于加密前的源文件路径（相对执行目录）
CRYPT_CMD="./CryptCmd.exe"                   # 加密工具（wine 会执行它）
WINEPREFIX="${WINEPREFIX:-/root/.wine32}"        # 可覆盖
NETMASK_DEFAULT="255.255.255.0"
PORT_HINT="27711"                            # 用于从 BaseServerConfig.ini 中识别目标 IP 的端口标记

# 要替换的文件列表（相对/绝对路径）
AREAINFO="${DOWNLOAD_DIR}/areainfo.ini"
PATCHINFO="${DOWNLOAD_DIR}/PatchInfo.txt"
BA1="/home/khan3/MAP/Server/Config/BaseServerConfig.ini"
BA2="/home/khan3/GL/Server/Config/BaseServerConfig.ini"

# ----------------------
# 日志/工具
# ----------------------
log() { echo -e "[`date +'%F %T'`] $*"; }

# ----------------------
# 获取主路由接口与本机 IP（IPv4）
# ----------------------
get_default_iface() {
    ip route 2>/dev/null | awk '/default/ {print $5; exit}'
}

get_ip_for_iface() {
    local ifname="$1"
    ip -4 addr show dev "$ifname" 2>/dev/null | awk '/inet / {print $2}' | cut -d/ -f1 | head -n1
}

DEFAULT_IFACE="$(get_default_iface || true)"
if [ -z "$DEFAULT_IFACE" ]; then
    # 回退：选第一个有全局 IPv4 的接口
    DEFAULT_IFACE="$(ip -4 -o addr show scope global 2>/dev/null | awk '{print $2; exit}' || true)"
fi

LOCAL_IP=""
if [ -n "$DEFAULT_IFACE" ]; then
    LOCAL_IP="$(get_ip_for_iface "$DEFAULT_IFACE" || true)"
fi

if [ -z "$LOCAL_IP" ]; then
    # 更保守的回退：hostname -I
    LOCAL_IP="$(hostname -I 2>/dev/null | awk '{print $1}' || true)"
fi
LOCAL_IP=$(ip route get 1 | awk '{print $7; exit}')

if [ -z "$LOCAL_IP" ]; then
    log "错误: 无法检测到本机 IPv4 地址，请手工指定或确保网络正常。"
    exit 1
fi

# ----------------------
# 解析脚本参数，判断部署类型
# ----------------------
MODE="lan"   # lan 或 public
NEW_IP=""
if [ $# -ge 1 ]; then
    INPUT_IP="$1"
    # 简单格式校验
    if ! echo "$INPUT_IP" | grep -E -q '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
        log "警告: 提供的参数 '$INPUT_IP' 不是标准 IPv4 格式，继续但请注意。"
    fi
    if [ "$INPUT_IP" = "$LOCAL_IP" ]; then
        MODE="lan"
        NEW_IP="$LOCAL_IP"
    else
        MODE="public"
        NEW_IP="$INPUT_IP"
    fi
else
    MODE="lan"
    NEW_IP="$LOCAL_IP"
fi

log "检测到网卡: ${DEFAULT_IFACE:-<unknown>}, 本机IP: $LOCAL_IP"
log "运行模式: $MODE, 目标 IP: $NEW_IP"

# ----------------------
# 帮助函数：备份文件
# ----------------------
backup_file() {
    local f="$1"
    if [ -f "$f" ]; then
        cp -a "$f" "${f}.bak.$(date +%F_%H%M%S)" || true
    fi
}

# ----------------------
# 公网部署：创建 ifcfg alias 文件（ifcfg-<iface>:1）
# ----------------------
IFCFG_DIR="/etc/sysconfig/network-scripts"
if [ "$MODE" = "public" ]; then
    if [ -z "$DEFAULT_IFACE" ]; then
        log "错误: 无法确定默认网卡，请手动创建 ifcfg-<dev>:1 并设置 IP=$NEW_IP"
    else
        SRC_IFCFG="${IFCFG_DIR}/ifcfg-${DEFAULT_IFACE}"
        ALIAS_IFCFG="${IFCFG_DIR}/ifcfg-${DEFAULT_IFACE}:1"
        if [ ! -d "$IFCFG_DIR" ]; then
            log "警告: $IFCFG_DIR 不存在。跳过自动创建别名配置。"
        else
            if [ -f "$SRC_IFCFG" ]; then
                backup_file "$ALIAS_IFCFG"
                cp -a "$SRC_IFCFG" "$ALIAS_IFCFG"
            else
                # 生成一个最小模板
                cat > "$ALIAS_IFCFG" <<EOF
DEVICE=${DEFAULT_IFACE}:1
BOOTPROTO=static
ONBOOT=yes
IPADDR=${NEW_IP}
NETMASK=${NETMASK_DEFAULT}
# 不要加 GATEWAY，否则会冲突
EOF
                chmod 644 "$ALIAS_IFCFG"
                log "已创建别名配置 $ALIAS_IFCFG（使用模板）。"
            fi

            # 编辑内容确保 IP / NETMASK / DEVICE / ONBOOT / BOOTPROTO 正确
            # 删除 GATEWAY 行以避免冲突
            sed -i "/^GATEWAY=/d" "$ALIAS_IFCFG"
            # 设置必要字段（优先覆盖）
            awk -v dev="${DEFAULT_IFACE}:1" -v ip="$NEW_IP" -v nm="$NETMASK_DEFAULT" '
                BEGIN{foundIP=0; foundDev=0; foundOn=0; foundBoot=0}
                /^DEVICE=/{print "DEVICE="dev; foundDev=1; next}
                /^IPADDR=/{print "IPADDR="ip; foundIP=1; next}
                /^NETMASK=/{print "NETMASK="nm; foundNm=1; next}
                /^ONBOOT=/{print "ONBOOT=yes"; foundOn=1; next}
                /^BOOTPROTO=/{print "BOOTPROTO=static"; foundBoot=1; next}
                {print}
                END{
                  if(!foundDev) print "DEVICE="dev
                  if(!foundIP) print "IPADDR="ip
                  if(!foundNm) print "NETMASK="nm
                  if(!foundOn) print "ONBOOT=yes"
                  if(!foundBoot) print "BOOTPROTO=static"
                }' "$ALIAS_IFCFG" > "${ALIAS_IFCFG}.tmp" && mv "${ALIAS_IFCFG}.tmp" "$ALIAS_IFCFG"
            log "已生成/更新别名配置 $ALIAS_IFCFG（IP=${NEW_IP}）。"
        fi
    fi
fi

# ----------------------
# 查找旧 IP（多来源）
# 1) 优先尝试从 ifcfg alias 文件读 OLD_IP_IFCFG（若存在）
# 2) 否则尝试从 BaseServerConfig.ini 中基于 Port=PORT_HINT 找到 OLD_IP_INI
# 3) 其余再退回为 LOCAL_IP
# ----------------------
OLD_IP_IFCFG=""
IFCFG_ALIAS_CAND="${IFCFG_DIR}/ifcfg-${DEFAULT_IFACE}:1"
if [ -f "$IFCFG_ALIAS_CAND" ]; then
    OLD_IP_IFCFG=$(grep -E '^IPADDR=' "$IFCFG_ALIAS_CAND" 2>/dev/null | head -n1 | awk -F= '{print $2}' | tr -d '"' | tr -d "'")
fi

OLD_IP_INI=""
if [ -f "$BA1" ]; then
    OLD_IP_INI=$(awk -F= -v port="$PORT_HINT" '
        /^IP=/{ip=$2}
        $0 ~ ("Port="port) { if (ip) {gsub(/^[ \t]+|[ \t]+$/,"",ip); print ip; exit} }
    ' "$BA1" | tr -d '"' | tr -d "'")
fi

# 优先级：ifcfg alias 的 IP（如果存在），否则 ini 中的 IP，否则 use LOCAL_IP
OLD_IP="${OLD_IP_IFCFG:-${OLD_IP_INI:-$LOCAL_IP}}"
log "推断到的旧 IP: $OLD_IP"

# ----------------------
# 公网部署：启用 ip_forward 并永久写入 sysctl.conf
# ----------------------
if [ "$MODE" = "public" ]; then
    log "[步骤] 开启临时 IP 转发"
    echo 1 > /proc/sys/net/ipv4/ip_forward || log "警告: 写 /proc/sys/net/ipv4/ip_forward 失败（权限？）"

    log "[步骤] 将 net.ipv4.ip_forward 写入 /etc/sysctl.conf（备份后写入）"
    backup_file /etc/sysctl.conf
    # 使用精确配置项（覆盖或追加）
    if grep -q '^net.ipv4.ip_forward' /etc/sysctl.conf 2>/dev/null; then
        sed -i 's/^net.ipv4.ip_forward.*/net.ipv4.ip_forward = 1/' /etc/sysctl.conf
    else
        echo -e "\n# enable ip forwarding for NAT" >> /etc/sysctl.conf
        echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
    fi
    sysctl -p >/dev/null 2>&1 || log "警告: sysctl -p 执行失败，请手动 sysctl -p 检查。"
fi

# ----------------------
# 替换 iptables 规则（仅在公网模式下执行）
# 逻辑：导出 iptables-save 到临时文件，替换OLD_IP -> NEW_IP，然后 restore 并保存到 /etc/sysconfig/iptables（备份）
# ----------------------
if [ "$MODE" = "public" ]; then
    # 5. 配置内核转发与 Iptables
    echo "[2/4] 配置内核转发与 Iptables..."
    echo 1 > /proc/sys/net/ipv4/ip_forward
    if ! grep -q "net.ipv4.ip_forward = 1" /etc/sysctl.conf; then
        echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
    fi

    iptables -F
    iptables -t nat -F

    for PORT in 27711 27712 27713; do
        iptables -t nat -A PREROUTING -d "$LOCAL_IP" -p tcp --dport "$PORT" -j DNAT --to-destination "$NEW_IP:$PORT"
    done
    iptables-save > /etc/sysconfig/iptables
    chkconfig iptables on
else
  iptables -F
  iptables -X
  iptables -Z
  iptables -t nat -F
  iptables -t nat -X
  iptables -t mangle -F
  iptables -t mangle -X
  iptables -P INPUT ACCEPT
  iptables -P FORWARD ACCEPT
  iptables -P OUTPUT ACCEPT
  iptables-save > /etc/sysconfig/iptables
  chkconfig iptables on

    log "局域网模式：跳过 iptables nat 替换步骤。清空所有iptables"
fi

# ----------------------
# 替换若干配置文件中的 IP（将 OLD_IP 替换为 NEW_IP）
# - areainfo.ini
# - Patchinfo.txt
# - BaseServerConfig.ini (两个路径)
# 但实际替换应使用从 ini 推断的 OLD_IP_INI（如果存在），否则用 OLD_IP
# ----------------------
REPLACE_FROM="${OLD_IP_INI:-$OLD_IP}"   # 优先从 ini 中推断出的旧 IP
REPLACE_TO="$NEW_IP"
log "[步骤] 在配置文件中替换 IP: ${REPLACE_FROM} -> ${REPLACE_TO}"

# helper 替换函数（备份并替换）
replace_in_file() {
    local f="$1"
    if [ -f "$f" ]; then
#        backup_file "$f"
        sed -i "s/${REPLACE_FROM//\//\\/}/${REPLACE_TO//\//\\/}/g" "$f" && log " -> $f 替换完成" || log " -> $f 替换失败"
    else
        log " -> 跳过: $f 不存在"
    fi
}

#替换areainfo.txt
sed -i "s#\(url=http://\)[0-9\.]*#\1${REPLACE_TO}#g" "$AREAINFO" && log " -> $AREAINFO 替换完成" || log " -> $AREAINFO 替换失败"
sed -i "s#\(http://\)[0-9\.]*#\1${REPLACE_TO}#g" "$PATCHINFO" && log " -> $PATCHINFO 替换完成" || log " -> $PATCHINFO 替换失败"

#replace_in_file "$AREAINFO"
#replace_in_file "$PATCHINFO"
replace_in_file "$BA1"
replace_in_file "$BA2"



# ----------------------
# 如果存在 src/Entrance.txt，先替换 IP（全部替换为 NEW_IP），再用 wine+CryptCmd.exe 加密并把结果放到 DOWNLOAD_DIR（备份旧ZIP）
# ----------------------
if [ -f "$SRC_ENTRANCE_FILE" ]; then
    log "[步骤] 处理入口文件加密流程: $SRC_ENTRANCE_FILE"
    # 备份 src
    backup_file "$SRC_ENTRANCE_FILE"

# 将 Entrance.txt 中所有 IPv4 地址替换为 NEW_IP
sed -E -i "s/[0-9]{1,3}(\.[0-9]{1,3}){3}/${NEW_IP}/g" "$SRC_ENTRANCE_FILE" \
    || log "警告: Entrance.txt IP 替换失败"

    # 执行加密（如果有 wine + CryptCmd.exe）
    if command -v wine >/dev/null 2>&1 && [ -f "$CRYPT_CMD" ]; then
        log "[步骤] 使用 wine 执行 CryptCmd.exe 加密"
        # 生成临时 dst 目录
        DST_DIR="./dst_entrance_$$"
        rm -rf "$DST_DIR" && mkdir -p "$DST_DIR"
        # 执行（保持 WINEPREFIX）
        if WINEPREFIX="$WINEPREFIX" wine "$CRYPT_CMD" -src src -dst "$DST_DIR" >/dev/null 2>&1; then
            # 检查生成的 entrance.txt
            if [ -f "${DST_DIR}/entrance.txt" ]; then
                # 准备移动到下载目录
                if [ -d "$DOWNLOAD_DIR" ]; then
                    # 备份旧 zip
                    if [ -f "${DOWNLOAD_DIR}/${ENTRANCE_ZIP_NAME}" ]; then
                        mv "${DOWNLOAD_DIR}/${ENTRANCE_ZIP_NAME}" "${DOWNLOAD_DIR}/${ENTRANCE_ZIP_NAME}.bak.$(date +%F_%H%M%S)" || true
                    fi
                    # 把生成的 entrance.txt 重命名并打包
                    TMP_ZIP="./${ENTRANCE_ZIP_NAME}.tmp_$$"
                    cp "${DST_DIR}/entrance.txt" ./Entrance.cfg || true
                    zip -j "$TMP_ZIP" ./Entrance.cfg >/dev/null 2>&1 || { log "警告: zip 打包失败（尝试直接复制）。"; }
                    # 如果 zip 成功，移动 zip，否则直接复制 Entrance.cfg
                    if [ -f "$TMP_ZIP" ]; then
                        mv "$TMP_ZIP" "${DOWNLOAD_DIR}/${ENTRANCE_ZIP_NAME}"
                        rm -f ./Entrance.cfg
                        log " -> 已生成并移动 ${DOWNLOAD_DIR}/${ENTRANCE_ZIP_NAME}"
                    else
                        cp -a "${DST_DIR}/entrance.txt" "${DOWNLOAD_DIR}/Entrance.txt" && log " -> 已复制 ${DOWNLOAD_DIR}/Entrance.txt（未打包）"
                    fi
                else
                    log "警告: 下载目录 $DOWNLOAD_DIR 不存在，跳过移动"
                fi
            else
                log "警告: 加密后未生成 ${DST_DIR}/entrance.txt"
            fi
        else
            log "警告: wine + CryptCmd.exe 执行失败或返回非零"
        fi
        # 清理临时目录
        rm -rf "$DST_DIR"
    else
        log "提示: 未检测到 wine 或 $CRYPT_CMD，跳过自动加密（你可以手动运行: WINEPREFIX=$WINEPREFIX wine $CRYPT_CMD -src src -dst dst）"
    fi
else
    log "提示: 源入口文件 $SRC_ENTRANCE_FILE 不存在，跳过加密步骤。"
fi

# ----------------------
# 尝试保存/重启 network 服务以使 ifcfg 生效（如果进行了别名创建）
# ----------------------
if [ "$MODE" = "public" ] && [ -n "$DEFAULT_IFACE" ]; then
    # 保存 iptables 到文件（再次尝试）
    if command -v service >/dev/null 2>&1 && service iptables save >/dev/null 2>&1; then
        log "iptables 保存成功 (service iptables save)。"
    else
        # 备用保存（iptables-save 写文件）
        iptables-save > /etc/sysconfig/iptables && log "iptables-save -> /etc/sysconfig/iptables"
    fi

    # 重启 network 服务（兼容 systemctl 或 service）
    if command -v systemctl >/dev/null 2>&1; then
        if systemctl restart network 2>/dev/null; then
            log "network 服务已用 systemctl 重启。"
        else
            log "警告: systemctl restart network 失败（systemd 发行版可能使用 NetworkManager）。"
        fi
    else
        service network restart >/dev/null 2>&1 && log "network 服务已重启 (service)" || log "警告: network 重启失败"
    fi
fi

TARGET_FILE="/www/server/panel/vhost/nginx/${NEW_IP}.conf"

if [ ! -f "$TARGET_FILE" ]; then
    cp /www/server/panel/vhost/nginx/default "$TARGET_FILE"
    sed -i "s/[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+/${NEW_IP}/g" "$TARGET_FILE" && log " -> $TARGET_FILE 替换完成" || log " -> $TARGET_FILE 替换失败"

    #重启nginx
    nginx -s reload
fi

# 修改网站权限
chown -R www:www /www/wwwroot/default/khan3

log "----------------------------------------"
log "所有操作完成。请手动检查日志输出中提到的警告（如果有）。"
log "说明："
log " - 若是在非 CentOS 系统，/etc/sysconfig/network-scripts/ifcfg-* 目录可能不存在，请手工调整。"
log " - 若要撤销改动，请使用备份文件（.bak.*）。"
log " - 若有特殊端口/规则需要添加，请在脚本中补充 iptables 规则模板。"
log "----------------------------------------"

exit 0
