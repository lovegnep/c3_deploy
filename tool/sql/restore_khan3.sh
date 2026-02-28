DB_USER=root
DB_PASS=123456
DB_NAME=khan3
Br5ACKUP_FILE=./khan3.sql.gz

# 删除旧库
mysql -u$DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS $DB_NAME;"

# 创建新库
mysql -u$DB_USER -p$DB_PASS -e "CREATE DATABASE $DB_NAME;"

# 恢复
zcat $BACKUP_FILE | mysql -u$DB_USER -p$DB_PASS $DB_NAME
