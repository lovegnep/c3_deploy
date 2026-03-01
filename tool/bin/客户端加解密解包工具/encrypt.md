# Genghis Khan client tool command-line encryption
_Exported on 2026/3/1 at GMT+8 16:31:15 from Cursor (2.5.26)_

---

**User**

这是成吉思汗网络游戏的客户端解包工具，以及加解密功能。源码位于/Users/gnep/work/khan3_release/Tools/Gen_Pack(New)。编译环境为win server2003 ， vs .net 2003。如截图所示，点击按钮会将程序当前目录下的./待加密 目录下的所有文件加密到./temp/crypt目录下。我想实现命令行下的加密功能，用来程序自动调用。帮我实现，

---

**Cursor**

让我先探索源码结构和加密逻辑。

让我继续查看更多关键文件来理解项目初始化和依赖。

现在让我查看项目文件了解链接配置。

---

**User**

继续

---

**Cursor**

现在我已经完全理解了加密逻辑。让我创建命令行加密工具。

全部文件已创建完毕。以下是方案的完整说明：

---

## 命令行加密工具 CryptCmd

项目路径：`Tools/Gen_Pack(New)/CryptCmd/`

### 创建的文件

| 文件 | 说明 |
|------|------|
| `CryptCmd.cpp` | 主程序源码 |
| `CryptCmd.vcproj` | VS .NET 2003 项目文件 |
| `CryptCmd.sln` | 解决方案文件 |
| `build.bat` | 命令行编译脚本 |

### 工作原理

加密逻辑完全复用 GUI 工具的 `KylinUtils` 库（`CKU` 类），与 `CryptDlg` 中的加密行为一致：

- **XML 文件**：读入内存 -> `FileConversion(buf, buf, size)` 内存加密 -> 写出（与 GUI 的 `_deep_crypt_file_call` 中 XML 处理方式相同）
- **TAB 文件**：`FileConversion(src, dst, true)` 文件到文件加密，输出扩展名改为 `.td`
- **TXT 文件**：`FileConversion(src, dst, true)` 文件到文件加密
- **LUA 文件**：`FileConversion(src, dst, true)` 文件到文件加密

### 用法

```
CryptCmd.exe                              # 默认: .\待加密 -> .\temp\crypt
CryptCmd.exe -src .\myres -dst .\output   # 指定源和输出目录
CryptCmd.exe -no-lua -no-txt              # 只加密 XML 和 TAB
CryptCmd.exe -quiet                       # 静默模式，方便脚本调用
CryptCmd.exe -h                           # 查看帮助
```

### 返回码（便于自动化脚本判断）

| 返回码 | 含义 |
|--------|------|
| 0 | 成功 |
| 1 | 参数错误 |
| 2 | 源目录不存在 |
| 3 | 加密过程有错误 |

### 编译方式

**方式一**：用 VS .NET 2003 打开 `CryptCmd.sln`，选择 Release 配置编译。

**方式二**：先运行 VS 的 `vcvars32.bat` 设置环境，然后执行 `build.bat`。

### 链接说明

项目默认链接 `KylinUtils_Static.lib`（静态库），编译出的 exe 独立运行不需要额外 DLL。如果链接时报符号找不到，可以改为链接 `KylinUtils.lib`（DLL 导入库），此时运行需要将对应的 KylinUtils DLL 放到 exe 同目录。

### 自动化调用示例

在批处理脚本中可以这样使用：

```bat
CryptCmd.exe -src .\待加密 -dst .\temp\crypt -quiet
if errorlevel 1 (
    echo 加密失败!
    exit /b 1
)
echo 加密成功，继续下一步...
```

---

**User**

编译报错了：

---

**Cursor**

让我看看具体的编译错误，先重新读取代码文件来定位行号。

根据截图，有三类编译错误：

1. **C2065/C3861 `"size"` 未声明** — 中文注释的 UTF-8 编码在 GBK 系统下被错误解析，导致行边界混乱，`DWORD size` 声明被"吃掉"
2. **C2666 `FileConversion` 重载歧义** — `char[]` 到 `char*` 和 `bool` 到 `int` 两个隐式转换竞争
3. **C2001/C2144 常数中有换行符** — `".\待加密"` 的 UTF-8 字节在 GBK 环境下被错误解析

根本原因：文件是 UTF-8 编码，但 VS .NET 2003 在中文 Windows 上按 GBK 解析源文件。我来全面修复。

---

**User**

继续

---

**Cursor**

根据截图分析，有两类编译错误：

1. **文件编码问题**：文件是 UTF-8 编码，VS .NET 2003 期望 GBK 编码。中文字符在注释和字符串中导致编译器解析错乱（`size` 未声明、常数中有换行符等）。
2. **`FileConversion` 重载歧义**：`char*` 可同时匹配 `(const char*, const char*, bool)` 和 `(const char*, char*, int)` 两个重载。

让我修复所有问题。

现在验证文件中确实不包含任何非 ASCII 字符（GBK hex escape 本身是 ASCII 文本）。

注释中还有中文字符，在 GBK 解析下同样会导致问题。让我把注释也全部改成 ASCII。

文件已经被编码问题影响了，让我重写整个文件，确保不含任何非 ASCII 字符。

验证文件确实是纯 ASCII。

文件已确认为纯 ASCII。以下是这次修复的三个问题总结：

---

### 修复内容

**1. 编码问题（C2065 / C2001 / C2144）**

文件原来是 UTF-8 编码，但 VS .NET 2003 按 GBK 解析源文件。当 UTF-8 的中文字符（3字节/字）被当作 GBK（2字节/字）读取时，多出的字节会"吃掉"换行符，导致编译器把下一行代码当成上一行的一部分，从而产生 `size` 未声明、常数中有换行符等错误。

**解决方案**：整个源文件改为纯 ASCII，所有中文输出通过 GBK hex escape 的 `#define` 宏实现，例如：
```c
#define GBK_DAI_JIA_MI "\xb4\xfd\xbc\xd3\xc3\xdc"  // 待加密
```

**2. FileConversion 重载歧义（C2666）**

`g_crypt.FileConversion(src_path, dst_path, true)` 中，`dst_path` 是 `char[]` 衰变为 `char*`，`true` 是 `bool`。VS 2003 编译器认为同时匹配 `(const char*, const char*, bool)` 和 `(const char*, char*, int)` 两个重载。

**解决方案**：显式转型 `(const char*)dst_path`，让编译器精确匹配第一个重载。

**3. VS 2003 C++ 语法兼容（C89 风格声明）**

VS .NET 2003 对变量在块中间声明支持不完善。所有局部变量声明提到函数/块顶部，`for` 循环变量在循环外声明。

现在可以重新在 VS 2003 中编译了。

---

**User**

很好，已经编译成功并且成功运行。这个命令行程序可以移植到linux上吗，比如centos5.8或者7.9？

---

**Cursor**

这是个好问题，但直接移植存在一个核心障碍。让我分析一下依赖情况。

分析完成，结论很明确。让我整理关键信息。

---

## 能否移植到 Linux？

**短回答：不能直接移植**，核心障碍是加密算法的实现。

### 依赖分析

| 依赖项 | 能否移植 | 说明 |
|--------|----------|------|
| Win32 API (`CreateFile`, `FindFirstFile` 等) | 可以 | 用 POSIX API 替换即可 |
| `shlwapi.lib` (`PathFileExists`) | 可以 | 用 `stat()` 替换 |
| **`KylinUtils_Static.lib`** | **不能** | **Windows x86 二进制，无源码** |

整个项目中搜索了 82 个 KylinUtils 相关文件，**全部是预编译的 .lib 文件**，没有找到任何 `.cpp/.c` 源码。加密的核心逻辑 `CKU::FileConversion` 和 `CKU::LuaFileConversion` 的实现被封装在这个闭源库里。

### 三个可行方案

**方案一：用 Wine 运行 Windows 版 CryptCmd.exe（最简单）**

在 CentOS 上通过 Wine 直接运行已编译好的 Windows 程序：

```bash
# CentOS 7.9
yum install epel-release
yum install wine

# 运行
wine CryptCmd.exe -src ./to_encrypt -dst ./temp/crypt
```

优点：零开发量，马上可用。缺点：依赖 Wine，CentOS 5.8 上安装困难。

**方案二：逆向 KylinUtils_Static.lib 提取加密算法（一劳永逸）**

从 .lib 中反汇编 `FileConversion` 函数，理解加密逻辑后用纯 C 重写。这类老游戏的资源加密通常比较简单（XOR、字节置换等），逆向难度不大。可以在 Windows 上用 IDA 或 `dumpbin /DISASM` 分析 .lib 文件。

优点：彻底解决，可以在任意平台编译运行。缺点：需要逆向工程能力。

**方案三：找到 KylinUtils 源码**

KylinUtils 看起来是独立的工具库项目，可能在其他仓库或同事手里。如果能找到源码，直接跨平台编译即可。

---

**我的建议**：如果只是自动化流程需要，**方案一（Wine）在 CentOS 7.9 上最实际**。如果你能提供 `KylinUtils_Static.lib` 给我分析（或者你手头有 KylinUtils 的源码），我可以帮你做方案二的完整 Linux 移植。

---

**User**

centos7.9上使用wine报错了：[root@localhost crypt]# wine CryptCmd.exe
wine: created the configuration directory '/root/.wine'
0012:err:ole:marshal_object couldn't get IPSFactory buffer for interface {00000131-0000-0000-c000-000000000046}
0012:err:ole:marshal_object couldn't get IPSFactory buffer for interface {6d5140c1-7436-11ce-8034-00aa006009fa}
0012:err:ole:StdMarshalImpl_MarshalInterface Failed to create ifstub, hres=0x80004002
0012:err:ole:CoMarshalInterface Failed to marshal the interface {6d5140c1-7436-11ce-8034-00aa006009fa}, 80004002
0012:err:ole:get_local_server_stream Failed: 80004002
0010:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0010:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
0014:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0014:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
0014:err:ole:apartment_createwindowifneeded CreateWindow failed with error 0
0014:err:ole:apartment_createwindowifneeded CreateWindow failed with error 0
0014:err:ole:marshal_object couldn't get IPSFactory buffer for interface {00000131-0000-0000-c000-000000000046}
0014:err:ole:apartment_createwindowifneeded CreateWindow failed with error 14007
0014:err:ole:StdMarshalImpl_MarshalInterface Failed to create ifstub, hres=0x800736b7
0014:err:ole:CoMarshalInterface Failed to marshal the interface {6d5140c1-7436-11ce-8034-00aa006009fa}, 800736b7
0014:err:ole:get_local_server_stream Failed: 800736b7
000b:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
000b:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
0016:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0016:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
0018:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0018:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
Could not load wine-gecko. HTML rendering will be disabled.
0025:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0025:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
0027:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0027:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
0029:err:winediag:nodrv_CreateWindow Application tried to create a window, but no driver could be loaded.
0029:err:winediag:nodrv_CreateWindow Make sure that your X server is running and that $DISPLAY is set correctly.
Could not load wine-gecko. HTML rendering will be disabled.
wine: configuration in '/root/.wine' has been updated.
wine: Z:\root\crypt\CryptCmd.exe 的 EXE 格式无效。
[root@localhost crypt]# 

---

**Cursor**

Wine 有两个问题：1) 64位 Wine 无法运行 32位 exe；2) 缺少 VS 2003 运行时。但与其调试 Wine，不如从根本上解决——**逆向 KylinUtils_Static.lib 提取加密算法**，这样就可以写出纯 C 跨平台版本。

让我分析这个库文件。

`KylinUtils_Static.lib` 是一个 Git LFS 指针文件（131字节），真实文件没有下载。让我找找仓库中是否有实际的 .lib 文件。

---

**User**

继续

---

**Cursor**

`.lib` 文件是 Git LFS 指针，本地没有实际二进制内容。让我检查其他位置和 LFS 状态。

所有 `.lib` 文件都是 Git LFS 指针（131字节），本地没有实际二进制。但既然你 Windows 机器上能编译运行 CryptCmd.exe，我们可以用另一个方法：**写一个测试程序提取加密算法**，然后用纯 C 在 Linux 上重新实现。

思路：用已知输入（全零字节等）调用 `FileConversion`，从输出推导加密算法。

纯 ASCII，不会有编码问题。现在把它加入到项目中方便编译。

