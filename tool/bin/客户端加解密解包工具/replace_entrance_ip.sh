#!/bin/bash

# 判断是否传入文件
if [ $# -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

# 获取本机IP（排除127.0.0.1）
LOCAL_IP=`/sbin/ifconfig | grep "inet addr:" | grep -v "127.0.0.1" | head -n 1 | awk -F: '{print $2}' | awk '{print $1}'`

if [ -z "$LOCAL_IP" ]; then
    echo "Cannot detect local IP!"
    exit 1
fi

echo "Local IP detected: $LOCAL_IP"

# 备份文件
cp $FILE ${FILE}.bak

# 替换文件中的所有IPv4地址
sed -i "s/[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+/$LOCAL_IP/g" $FILE

echo "IP replaced successfully!"
echo "Backup file: ${FILE}.bak"

exit 0
