#!/bin/sh

mkdir -p /home/khan3/GL/Server/Log
mkdir -p /home/khan3/MAP/Server/Log
rm -rf /home/khan3/GL/Server/Log/*
rm -rf /home/khan3/MAP/Server/Log/*


# 启动  前检查并修复 ItemSerial
SCRIPT_DIR=$(dirname $(readlink -f $0))
sh ${SCRIPT_DIR}/check_itemserial.sh
if [ $? -ne 0 ]; then
    echo "[ERROR] check_itemserial.sh failed, abort!"
    exit 1
fi



### 脚本1内容
cd /home/khan3/GL/Server/
./billing &
sleep 2
./DBCenter &
sleep 4
./DBShare &
sleep 4
./GLServer &

# 脚本1和脚本2之间休眠5秒
sleep 5

### 脚本2内容
cd /home/khan3/MAP/Server/


./DBShare &
sleep 20


start_mapserver() {
    echo "Starting MapServer..."
    ./MapServer &
}

check_mapserver() {
    ps -ef | grep MapServer | grep -v grep >/dev/null
}

start_mapserver

# 监控 MapServer（启动后容易崩溃）
RETRY=0
MAX_RETRY=500

while [ $RETRY -lt $MAX_RETRY ]
do
    sleep 6

    check_mapserver
    if [ $? -eq 0 ]; then
        echo "MapServer running normally"
        break
    else
        echo "MapServer crashed, restarting..."
        start_mapserver
        RETRY=$((RETRY+1))
    fi
done

if [ $RETRY -ge $MAX_RETRY ]; then
    echo "MapServer failed too many times!"
fi

# 脚本2和脚本3之间休眠5秒
sleep 20

### 脚本3内容
cd /home/khan3/GL/Server/
./LoginCenter &

