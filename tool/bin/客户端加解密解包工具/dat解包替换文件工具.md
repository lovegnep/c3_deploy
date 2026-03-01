# 成吉思汗客户端dat文件命令行解包
_Exported on 2026/3/1 at GMT+8 18:10:26 from Cursor (2.5.26)_

---

**User**

这是成吉思汗网络游戏的客户端解包工具，以及加解密功能。源码位于/Users/gnep/work/khan3_release/Tools/Gen_Pack(New)。编译环境为win server2003 ， vs .net 2003。如截图所示，包浏览器可以打开dat文件浏览其中的文件，且可能右键插入导出等功能。我想实现命令行下的解包功能，扫描指定目录下的dat文件，比如0.dat，将其中的内容解包到./0res目录下。帮我实现，注意文件编码要gbk

---

**Cursor**

让我先看关键的源文件来理解dat包的格式和解包逻辑。

---

**User**

继续

---

**Cursor**

让我继续分析关键源码文件，理解 dat 文件格式和解包逻辑。

现在让我深入了解 `kfile` 适配器和关键工具函数。

Now let me look at more key files to understand the full picture.

现在我已经完全理解了代码架构。让我创建 `UnpackCmd` 命令行解包工具。

现在将所有包含中文的文件转换为 GBK 编码。

让我验证一下 GBK 编码是否正确。

所有文件已创建完成。以下是实现的总结：

## 创建的文件

所有文件位于 `Tools/Gen_Pack(New)/UnpackCmd/` 目录下：

| 文件 | 说明 |
|------|------|
| `UnpackCmd.cpp` | 主程序源码（GBK编码） |
| `UnpackCmd.vcproj` | VS .NET 2003 工程文件 |
| `UnpackCmd.sln` | VS .NET 2003 解决方案文件 |
| `build.bat` | 命令行编译脚本（GBK编码） |

## 工作原理

工具调用 KPM 库（kpmLib）的 API 来操作 dat 归档文件：

1. **`KPM_OpenArchive`** — 打开 dat 归档
2. **`KPM_FindFirstFile` / `KPM_FindNextFile`** — 枚举归档中的所有文件
3. **`KPM_FileOpen` + `KPM_GetFileSize` + `KPM_ReadFile`** — 打开并读取单个文件到内存
4. 将内存数据写入磁盘文件
5. **`KPM_SearchClose` / `KPM_CloseArchive`** — 关闭句柄

默认跳过 `(list)`、`(attr)`、`(sign)` 等 KPM 内部元数据文件，`(version)` 等数据文件正常提取。

## 用法示例

```bat
UnpackCmd.exe                          扫描当前目录所有 DAT 文件解包
UnpackCmd.exe -src .\res               扫描 res 目录
UnpackCmd.exe -dat 0                   仅解包 0.dat -> .\0res\
UnpackCmd.exe -src .\res -dat 0 -all   解包含内部文件
UnpackCmd.exe -quiet                   安静模式
```

对于 `0.dat`，提取结果输出到 `.\0res\` 目录；对于 `1.dat`，输出到 `.\1res\`，以此类推。

## 编译方式

**方式一**：用 VS .NET 2003 打开 `UnpackCmd.sln`，选择 Release 配置编译。

**方式二**：命令行编译——先运行 `vcvars32.bat` 设置环境变量，然后执行 `build.bat`。

链接依赖：
- `kpmLib.lib`（KPM 归档操作）
- `zlib.lib`（KPM 内部解压缩依赖）
- `shlwapi.lib`（路径工具函数）

---

**User**

很好，已经成功编译并运行。如图所示我想替换0.dat中的(version)文件，但是无法替换，帮我实现命令行工具实现该功能

---

**Cursor**

我来看看现有的替换逻辑，然后创建命令行替换工具。

现在我明白了。GUI工具替换时会自动修改 `(version)` 文件中的版本索引，而替换 `(version)` 本身时，在索引中找不到自身条目导致报错 `search key "" from version failed`。

我来创建一个命令行工具 `PatchCmd`，使用归档重建方式直接替换文件，绕过版本索引检查。

现在转换为 GBK 编码。

所有文件创建完成，编码正确。

## 总结

创建了 `PatchCmd` 工具，位于 `Tools/Gen_Pack(New)/PatchCmd/`。

### 为什么 GUI 工具替换 (version) 失败

GUI 的替换流程（`ChunkReplaceDlg.cpp` 第 117-123 行）在替换任何文件时，会自动在 `(version)` 文件内容中搜索被替换条目的名称来更新版本索引：

```cpp
const char* key = ::strstr( buf , des_alics.GetBuffer() );
if ( ! key )
{
    log_mgr::single()->output_log( "search key \"\" from version failed" ...);
    throw "";
}
```

当替换 `(version)` 文件本身时，`(version)` 内容中并不包含自身的索引条目，搜索失败导致报错。

### PatchCmd 的工作原理

采用**归档重建方式**（与 `KpmFiller::fill()` 相同的策略），完全绕过版本索引检查：

1. 打开源 DAT 归档
2. 创建临时 DAT (`Xtmp.dat`)
3. 枚举所有常规文件（跳过 `(list)`/`(attr)`/`(sign)` 内部元数据）
4. 逐文件拷贝，遇到目标条目则用新数据替换
5. 关闭两个归档
6. 原文件备份为 `.bak`，临时文件重命名为原文件名

### 用法

```bat
REM 替换 (version) 文件
PatchCmd.exe -dat 0.dat -name "(version)" -file new_version.txt

REM 替换其他文件
PatchCmd.exe -dat 0.dat -name entrance.td -file entrance.td

REM 插入新文件（条目不存在时自动插入）
PatchCmd.exe -dat 0.dat -name new_file.cfg -file new_file.cfg

REM 删除条目
PatchCmd.exe -dat 0.dat -name old_file.cfg -remove
```

### 编译方式

与 UnpackCmd 相同：打开 `PatchCmd.sln` 编译，或运行 `build.bat`。链接依赖：`kpmLib.lib` + `zlib.lib` + `shlwapi.lib`。

