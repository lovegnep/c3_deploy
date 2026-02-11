#!/bin/bash

# 检查是否提供了新IP参数
if [ -z "$1" ]; then
    echo "错误: 请提供新的IP地址作为参数。"
    echo "用法: $0 <New_IP>"
    exit 1
fi

NEW_IP=$1
CFG_FILE="/etc/sysconfig/network-scripts/ifcfg-eth0:1"

# 1. 检查配置文件是否存在
if [ ! -f "$CFG_FILE" ]; then
    echo "错误: 找不到文件 $CFG_FILE"
    exit 1
fi

# 2. 获取旧IP (Old IP)
# 提取 IPADDR= 后面的内容，并去除可能存在的引号
OLD_IP=$(grep "^IPADDR" "$CFG_FILE" | awk -F= '{print $2}' | tr -d '"' | tr -d "'")

if [ -z "$OLD_IP" ]; then
    echo "错误: 在配置文件中未找到 IPADDR 定义。"
    exit 1
fi

echo "----------------------------------------"
echo "检测到旧 IP: $OLD_IP"
echo "目标新 IP: $NEW_IP"
echo "----------------------------------------"

# 3. 替换 ifcfg-eth0:1 中的 IP
echo "[1/3]正在修改网卡配置文件..."
# 备份原文件
cp "$CFG_FILE" "${CFG_FILE}.bak_$(date +%F_%T)"
# 执行替换
sed -i "s/$OLD_IP/$NEW_IP/g" "$CFG_FILE"

if [ $? -eq 0 ]; then
    echo " -> 配置文件 IP 替换成功。"
else
    echo " -> 配置文件替换失败！"
    exit 1
fi

# 4. 替换 iptables 中的 IP (包括 NAT 表)
echo "[2/3]正在替换 iptables 规则..."

# 导出当前运行的规则到临时文件
IPT_DUMP="/tmp/iptables_dump.txt"
iptables-save > "$IPT_DUMP"

# 在导出的规则文件中直接替换 IP
# 这比逐条去 delete 再 add 规则要安全且准确得多，且涵盖 filter, nat 等所有表
sed -i "s/$OLD_IP/$NEW_IP/g" "$IPT_DUMP"


AREAINFO="/var/www/html/khan3/xiazai_khan3/areainfo.ini"
sed -i "s/$OLD_IP/$NEW_IP/g" "$AREAINFO"
echo " -> areainfo.ini替换完成"


BA1="/home/khan3/MAP/Server/Config/BaseServerConfig.ini"
sed -i "s/$OLD_IP/$NEW_IP/g" "$BA1"


BA2="/home/khan3/GL/Server/Config/BaseServerConfig.ini"
sed -i "s/$OLD_IP/$NEW_IP/g" "$BA2"
echo " -> BaseServerConfig.ini替换完成"

# 将修改后的规则恢复到内存中
iptables-restore < "$IPT_DUMP"

if [ $? -eq 0 ]; then
    echo " -> iptables 规则替换并加载成功。"
else
    echo " -> iptables 规则恢复失败，请检查！"
    rm -f "$IPT_DUMP"
    exit 1
fi

# 清理临时文件
rm -f "$IPT_DUMP"

# 5. 保存转发规则
echo "[3/3]正在保存防火墙配置到磁盘..."
service iptables save
service network restart



echo "----------------------------------------"
echo "所有操作完成。"
echo "----------------------------------------"
