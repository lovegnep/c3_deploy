# Game client decryption tool
_Exported on 2026/3/1 at GMT+8 16:30:53 from Cursor (2.5.26)_

---

**User**

这是成吉思汗网络游戏的客户端解包工具，以及加解密功能。源码位于/Users/gnep/work/khan3_release/Tools/Gen_Pack(New)。编译环境为win server2003 ， vs .net 2003。如截图所示，点击按钮会将程序当前目录下的./待加密 目录下的所有文件加密到./temp/crypt目录下。我想实现命令行下的解密功能，用来程序自动调用。帮我实现，注意文件编码要gbk

---

**Cursor**

我已经了解了项目结构。现在已经有一个 `CryptCmd` 子项目做加密，我需要了解加密解密的具体逻辑。让我先阅读关键文件。

现在我需要了解 `CKU` 类的具体加解密实现。让我查看相关文件。

现在我对加密逻辑有了完整的理解。让我创建解密命令行工具。

现在将所有文件转换为 GBK 编码。

确认 GBK 编码转换成功。现在让我确保 `.bat` 文件使用 Windows 行尾 (CRLF)。

所有文件已创建完毕。以下是解密命令行工具 `DecryptCmd` 的实现说明：

---

**项目位置：** `Tools/Gen_Pack(New)/DecryptCmd/`

**创建的文件：**
- `DecryptCmd.cpp` — 解密主程序源码
- `DecryptCmd.vcproj` — VS .NET 2003 项目文件
- `DecryptCmd.sln` — 解决方案文件
- `build.bat` — 独立编译脚本

**所有文件均已转换为 GBK 编码。**

---

### 核心解密逻辑

通过分析现有代码，加密和解密使用 `CKU` 类的 `FileConversion` 方法：

- **tab/txt/lua 文件**：调用 `g_crypt.FileConversion(src, dst, FALSE)`，第三个参数 `FALSE` 表示解密（对应加密时传 `TRUE`）
- **xml 文件**：使用内存对称转换 `g_crypt.FileConversion(src_buf, dst_buf, size)`（与加密使用相同的3参数重载，因为该操作是对称的）
- **td 文件**：`.td` 是 `.tab` 加密后的扩展名，解密后自动还原为 `.tab`

### 两种使用模式

**1. 批量目录解密（默认）：**

```
DecryptCmd.exe                              # 默认: .\待解密 -> .\temp\decrypt
DecryptCmd.exe -src .\encrypted -dst .\out  # 自定义目录
DecryptCmd.exe -no-lua -no-txt              # 跳过指定格式
DecryptCmd.exe -quiet                       # 静默模式，仅输出 "OK N"
```

**2. 单文件解密（适合程序自动调用）：**

```
DecryptCmd.exe -file data.td -out data.tab
DecryptCmd.exe -file config.xml -out config_dec.xml
DecryptCmd.exe -file input.txt -out output.txt
DecryptCmd.exe -quiet -file a.td -out a.tab  # 静默模式
```

### 编译方法

在 Win Server 2003 + VS .NET 2003 环境下：

- **方法一**：双击 `DecryptCmd.sln` 打开 VS 编译
- **方法二**：先运行 `vcvars32.bat` 设置环境变量，再执行 `build.bat`

链接库与 `CryptCmd` 完全一致：`KylinUtils_Static.lib` + `shlwapi.lib`。

### 返回值

- `0` — 成功
- `1` — 参数错误
- `2` — 源目录/文件不存在
- `3` — 有文件解密失败

