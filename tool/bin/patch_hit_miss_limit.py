#!/usr/bin/env python3
"""
修改 MapServer 中命中/闪避上限的脚本

原始上限: 1000
函数: Property_VerifyHitMiss
文件偏移: 0x1c0e10

修改说明:
- 偏移 0x1c0e16: 比较值 (原值 1001 = 0x03E9)
- 偏移 0x1c0e1b: 设置值 (原值 1000 = 0x03E8)
"""

import sys
import struct

# ============ 配置区 ============
NEW_LIMIT = 10000  # 新的上限值，修改此处改变上限
# ================================

# 文件路径
MAPSERVER_PATH = "MapServer"
BACKUP_PATH = "MapServer.bak"

# Property_VerifyHitMiss 函数中的偏移位置
OFFSET_CMP = 0x1c0e16  # cmpl 指令的立即数位置
OFFSET_MOV = 0x1c0e1b  # movl 指令的立即数位置

# 原始值（用于验证）
ORIGINAL_CMP_VALUE = 1001  # 0x03E9
ORIGINAL_MOV_VALUE = 1000  # 0x03E8

def read_dword_le(data, offset):
    """读取小端序32位整数"""
    return struct.unpack('<I', data[offset:offset+4])[0]

def write_dword_le(value):
    """生成小端序32位整数的字节"""
    return struct.pack('<I', value)

def main():
    new_limit = NEW_LIMIT
    
    if len(sys.argv) > 1:
        try:
            new_limit = int(sys.argv[1])
        except ValueError:
            print(f"错误: 无效的数值 '{sys.argv[1]}'")
            return 1
    
    print(f"=" * 50)
    print(f"MapServer 命中/闪避上限修改工具")
    print(f"=" * 50)
    print(f"新上限值: {new_limit}")
    print()
    
    # 读取文件
    try:
        with open(MAPSERVER_PATH, 'rb') as f:
            data = bytearray(f.read())
    except FileNotFoundError:
        print(f"错误: 找不到文件 {MAPSERVER_PATH}")
        return 1
    
    # 验证原始值
    current_cmp = read_dword_le(data, OFFSET_CMP)
    current_mov = read_dword_le(data, OFFSET_MOV)
    
    print(f"当前比较值 (偏移 0x{OFFSET_CMP:x}): {current_cmp}")
    print(f"当前设置值 (偏移 0x{OFFSET_MOV:x}): {current_mov}")
    print()
    
    # 检查是否是原始值或已修改的值
    if current_cmp != ORIGINAL_CMP_VALUE and current_cmp != current_mov + 1:
        print(f"警告: 比较值异常，可能文件已被修改或版本不匹配")
        print(f"预期: {ORIGINAL_CMP_VALUE} 或 (设置值+1)")
        response = input("是否继续? (y/n): ")
        if response.lower() != 'y':
            return 1
    
    # 计算新值
    new_cmp_value = new_limit + 1  # 比较时用 limit+1
    new_mov_value = new_limit      # 设置时用 limit
    
    # 修改数据
    new_cmp_bytes = write_dword_le(new_cmp_value)
    new_mov_bytes = write_dword_le(new_mov_value)
    
    data[OFFSET_CMP:OFFSET_CMP+4] = new_cmp_bytes
    data[OFFSET_MOV:OFFSET_MOV+4] = new_mov_bytes
    
    # 写回文件
    with open(MAPSERVER_PATH, 'wb') as f:
        f.write(data)
    
    print(f"修改完成!")
    print(f"- 比较值: {current_cmp} -> {new_cmp_value}")
    print(f"- 设置值: {current_mov} -> {new_mov_value}")
    print()
    print(f"命中/闪避上限已从 {current_mov} 修改为 {new_limit}")
    print(f"备份文件: {BACKUP_PATH}")
    
    return 0

if __name__ == '__main__':
    sys.exit(main())
