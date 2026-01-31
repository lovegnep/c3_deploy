#!/bin/sh

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
./MapServer &

# 脚本2和脚本3之间休眠5秒
sleep 20

### 脚本3内容
cd /home/khan3/GL/Server/
./LoginCenter &

