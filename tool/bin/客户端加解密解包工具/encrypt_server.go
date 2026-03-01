package main

import (
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"strconv"
)

func main() {
	// 1. 定义命令行参数
	port := flag.Int("port", 8080, "服务器监听端口")
	exePath := flag.String("exe", "./CryptCmd.exe", "加密工具路径")
	logPath := flag.String("log", "./logs/server.log", "日志文件输出路径")
	flag.Parse()

	// 2. 初始化日志配置
	setupLogging(*logPath)

	// 将工具路径转为绝对路径
	absExePath, err := filepath.Abs(*exePath)
	if err != nil {
		log.Fatalf("【错误】无法获取工具绝对路径: %v\n", err)
	}

	// 确保基础工作目录存在
	baseTmpDir := "./temp_work"
	os.MkdirAll(baseTmpDir, 0755)
	absBaseTmpDir, _ := filepath.Abs(baseTmpDir)

	http.HandleFunc("/encrypt", func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodPost {
			http.Error(w, "Method Not Allowed", http.StatusMethodNotAllowed)
			return
		}

		// 创建任务唯一目录
		taskDir, err := os.MkdirTemp(absBaseTmpDir, "task_")
		if err != nil {
			log.Printf("【错误】创建临时目录失败: %v\n", err)
			http.Error(w, "服务器内部错误", http.StatusInternalServerError)
			return
		}
		defer os.RemoveAll(taskDir)

		srcDir := filepath.Join(taskDir, "src")
		dstDir := filepath.Join(taskDir, "dst")
		os.MkdirAll(srcDir, 0755)
		os.MkdirAll(dstDir, 0755)

		// 接收文件
		file, header, err := r.FormFile("file")
		if err != nil {
			http.Error(w, "上传失败", http.StatusBadRequest)
			return
		}
		defer file.Close()



		originalFilename := header.Filename // 假设用户上传的文件名

        	// 1. 获取原始后缀（带点，如 .old）并转为小写进行比对
        	ext := strings.ToLower(filepath.Ext(originalFilename))

        	// 2. 定义合法的后缀 map (使用 map 查找比 if 嵌套效率更高)
        	validExts := map[string]bool{
        		".tab": true,
        		".lua": true,
        		".txt": true,
        		".xml": true,
        	}

        	finalFilename := originalFilename

        	// 3. 判断逻辑
        	if !validExts[ext] {
        		// 如果不在合法范围内，移除原后缀并强行添加 .tab
        		// filepath.Ext(originalFilename) 会返回 ".old"
        		// strings.TrimSuffix 会去掉这个后缀
        		baseName := strings.TrimSuffix(originalFilename, filepath.Ext(originalFilename))
        		finalFilename = baseName + ".tab"
        		log.Printf("【警告】用户上传的文件不在加密范围内，替换文件后缀: %s   =>   %s\n", header.Filename, finalFilename)
        	}

        //加密程序只会处理  *.tab   *.lua  *.txt  *.xml
		inputFilePath := filepath.Join(srcDir, finalFilename)
		out, err := os.Create(inputFilePath)
		if err != nil {
			log.Printf("【错误】保存文件失败: %v\n", err)
			return
		}
		io.Copy(out, file)
		out.Close()

		// 3. 执行加密命令并打印到日志
		cmd := exec.Command(absExePath, "-src", srcDir, "-dst", dstDir, "-quiet")

		// 记录详细调试信息到日志文件
		log.Printf("【执行命令】: %s\n", cmd.String())

		output, err := cmd.CombinedOutput()
		if err != nil {
			log.Printf("【加密失败】: %v, 输出内容: %s\n", err, string(output))
			http.Error(w, "加密工具执行异常", http.StatusInternalServerError)
			return
		}

		// 4. 严格读取 dst 目录并返回文件
		files, err := os.ReadDir(dstDir)
		if err != nil || len(files) == 0 {
			log.Printf("【错误】未在 dst 目录发现生成文件\n")
			http.Error(w, "生成结果为空", http.StatusInternalServerError)
			return
		}
		if len(files) > 1 {
			log.Printf("【异常】dst 目录产生多个文件: %d 个\n", len(files))
			http.Error(w, "逻辑错误：生成了多个文件", http.StatusInternalServerError)
			return
		}

		targetFile := files[0]
		encryptedFilePath := filepath.Join(dstDir, targetFile.Name())

		// 返回文件
		w.Header().Set("Content-Disposition", fmt.Sprintf("attachment; filename=\"%s\"", targetFile.Name()))
		w.Header().Set("Content-Type", "application/octet-stream")
		http.ServeFile(w, r, encryptedFilePath)

		log.Printf("【成功】任务完成: %s -> %s\n", header.Filename, targetFile.Name())
	})

	addr := ":" + strconv.Itoa(*port)
	log.Printf("--- 服务启动 ---\n")
	log.Printf("监听地址: http://localhost%s/encrypt\n", addr)
	log.Printf("加密工具: %s\n", absExePath)
	log.Printf("日志路径: %s\n", *logPath)

	log.Fatal(http.ListenAndServe(addr, nil))
}

// setupLogging 负责配置日志输出
func setupLogging(path string) {
	// 确保日志目录存在
	dir := filepath.Dir(path)
	if err := os.MkdirAll(dir, 0755); err != nil {
		fmt.Printf("无法创建日志目录: %v\n", err)
		os.Exit(1)
	}

	// 以追加模式打开文件
	f, err := os.OpenFile(path, os.O_RDWR|os.O_CREATE|os.O_APPEND, 0666)
	if err != nil {
		fmt.Printf("无法打开日志文件: %v\n", err)
		os.Exit(1)
	}

	// 同时输出到控制台（调试用）和文件
	multi := io.MultiWriter(os.Stdout, f)
	log.SetOutput(multi)

	// 可选：设置日志格式（日期 时间 毫秒 文件行号）
	log.SetFlags(log.Ldate | log.Ltime | log.Lshortfile)
}
