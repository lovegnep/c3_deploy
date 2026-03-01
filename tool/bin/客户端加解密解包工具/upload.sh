#!/bin/bash

# --- 配置区域 ---
# 待上传的文件路径
SOURCE_FILE="/var/www/html/khan3/xiazai_khan3/Entrance.txt"
# 接口地址
API_URL="http://192.168.50.195:8888/encrypt"
# 响应结果保存路径
OUTPUT_FILE="./test.txt"
# 日志文件（可选）
LOG_FILE="/tmp/upload_debug.log"

# --- 逻辑执行 ---

# 1. 检查文件是否存在
if [ ! -f "$SOURCE_FILE" ]; then
    echo "错误: 找不到文件 $SOURCE_FILE"
    exit 1
fi

echo "正在上传 $SOURCE_FILE 到 $API_URL ..."

# 2. 执行 curl 调用
# -s: 静默模式
# -S: 显示错误
# -o: 将输出写入文件
# -w: 获取 HTTP 状态码
HTTP_CODE=$(curl -s -S \
    --location "$API_URL" \
    --form "file=@$SOURCE_FILE" \
    -o "$OUTPUT_FILE" \
    -w "%{http_code}")

# 3. 结果判断
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "上传成功！"
    echo "响应已保存至: $OUTPUT_FILE"
else
    echo "上传失败，HTTP 状态码: $HTTP_CODE"
    echo "请检查 $OUTPUT_FILE 获取具体报错信息。"
    exit 1
fi
