#!/bin/bash

# ================= 配置区域 =================
# 数据库信息 (来自你的 odbc.ini)
DB_USER="root"
DB_PASS="123456"
DB_NAME="khan3"  # 如果想备份所有数据库，请看下文注释

# 备份存储路径 (NAS挂载点)
BACKUP_DIR="/mnt/nas/top/mysql_data"

# 获取当前日期，格式: 20260215
DATE=$(date +%Y%m%d)

# 保留最近多少天的备份 (例如 30 天)
RETENTION_DAYS=30

# ================= 脚本逻辑 =================

# 1. 检查备份目录是否存在，不存在则创建
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# 2. 执行备份命令
# 使用 gzip 压缩，减少 NAS 空间占用
# 格式: khan3_20260215.sql.gz
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${DATE}.sql.gz"

echo "开始备份数据库: $DB_NAME ..."

# 针对 MySQL 5.0 的标准备份指令
# 如果你想备份所有数据库，将 $DB_NAME 替换为 --all-databases
/usr/bin/mysqldump -u$DB_USER -p$DB_PASS $DB_NAME | gzip > $BACKUP_FILE

# 3. 检查备份是否成功
if [ $? -eq 0 ]; then
  echo "备份成功! 文件路径: $BACKUP_FILE"
  # 获取文件大小
  ls -lh $BACKUP_FILE
else
  echo "备份失败! 请检查密码或磁盘空间。"
  exit 1
fi

# 4. 清理旧备份 (删除超过 RETENTION_DAYS 天的文件)
echo "正在清理 ${RETENTION_DAYS} 天前的旧备份..."
find $BACKUP_DIR -name "*.sql.gz" -type f -mtime +$RETENTION_DAYS -exec rm {} \;

echo "所有操作完成。"
