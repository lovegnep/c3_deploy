#!/bin/bash


OLD_IP="223.166.61.203"
NEW_IP="223.167.220.211"

AREAINFO="/var/www/html/khan3/xiazai_khan3/areainfo.ini"
sed -i "s/$OLD_IP/$NEW_IP/g" "$AREAINFO"
echo " -> areainfo.ini替换完成"


BA1="/home/khan3/MAP/Server/Config/BaseServerConfig.ini"
sed -i "s/$OLD_IP/$NEW_IP/g" "$BA1"


BA2="/home/khan3/GL/Server/Config/BaseServerConfig.ini"
sed -i "s/$OLD_IP/$NEW_IP/g" "$BA2"
echo " -> BaseServerConfig.ini替换完成"
