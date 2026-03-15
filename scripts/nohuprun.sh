#!/bin/bash

LOG_DIR="/home/khan3/logs"
mkdir -p "$LOG_DIR"

### 脚本1内容
cd /home/khan3/GL/Server/
nohup ./billing    > "$LOG_DIR/billing.log"    2>&1 &
sleep 2
nohup ./DBCenter   > "$LOG_DIR/DBCenter.log"   2>&1 &
sleep 4
nohup ./DBShare    > "$LOG_DIR/DBShare_GL.log" 2>&1 &
sleep 4
nohup ./GLServer   > "$LOG_DIR/GLServer.log"   2>&1 &

# 脚本1和脚本2之间休眠5秒
sleep 5

### 脚本2内容
cd /home/khan3/MAP/Server/
nohup ./DBShare    > "$LOG_DIR/DBShare_MAP.log" 2>&1 &
sleep 20
nohup ./MapServer  > "$LOG_DIR/MapServer.log"   2>&1 &

# 脚本2和脚本3之间休眠5秒
sleep 15

### 脚本3内容
cd /home/khan3/GL/Server/
nohup ./LoginCenter > "$LOG_DIR/LoginCenter.log" 2>&1 &

