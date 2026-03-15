<?php
// =============================
// 脚本管理 & 进程状态监控面板
// =============================

// 脚本路径（根据实际部署修改）
$SCRIPT_DIR   = '/root';
$DEPLOY_SCRIPT = $SCRIPT_DIR . '/deploy.sh';
$RUN_SCRIPT    = $SCRIPT_DIR . '/run.sh';

// run.sh 中管理的程序列表
$processes = [
    ['name' => 'billing',     'bin' => 'billing',     'cwd' => '/home/khan3/GL/Server/'],
    ['name' => 'DBCenter',    'bin' => 'DBCenter',    'cwd' => '/home/khan3/GL/Server/'],
    ['name' => 'DBShare(GL)', 'bin' => 'DBShare',     'cwd' => '/home/khan3/GL/Server/'],
    ['name' => 'GLServer',    'bin' => 'GLServer',    'cwd' => '/home/khan3/GL/Server/'],
    ['name' => 'LoginCenter', 'bin' => 'LoginCenter', 'cwd' => '/home/khan3/GL/Server/'],
    ['name' => 'DBShare(MAP)','bin' => 'DBShare',     'cwd' => '/home/khan3/MAP/Server/'],
    ['name' => 'MapServer',   'bin' => 'MapServer',   'cwd' => '/home/khan3/MAP/Server/'],
];

// =============================
// API 接口处理
// =============================
if (isset($_GET['action'])) {
    header('Content-Type: application/json; charset=utf-8');

    $action = $_GET['action'];

    // 获取进程状态
    if ($action === 'status') {
        $result = [];
        foreach ($processes as $proc) {
            $bin = $proc['bin'];
            $cwd = rtrim($proc['cwd'], '/');
            $running = false;
            $pid = '-';

            // 用 pgrep 找到所有匹配的进程 PID
            $pids = [];
            exec('pgrep -x ' . escapeshellarg($bin), $pids);

            foreach ($pids as $p) {
                $p = trim($p);
                if ($p === '') continue;

                if ($proc['bin'] === 'DBShare') {
                    // DBShare 有两个实例，通过 /proc/PID/cwd 区分工作目录
//                     $link = @readlink('/proc/' . $p . '/cwd');
                    $link = trim(shell_exec("sudo pwdx $p | awk '{print $2}'"));
                    if ($link !== false && rtrim($link, '/') === $cwd) {
                        $running = true;
                        $pid = $p;
                        break;
                    }
                } else {
                    $running = true;
                    $pid = $p;
                    break;
                }
            }

            $result[] = [
                'name'    => $proc['name'],
                'running' => $running,
                'pid'     => $pid,
            ];
        }
        echo json_encode(['code' => 0, 'data' => $result]);
        exit;
    }

    // 执行 deploy.sh（同步执行，返回全部输出）
    if ($action === 'deploy') {
        $ip = isset($_POST['ip']) ? trim($_POST['ip']) : '';
        // 参数校验
        if ($ip !== '' && !preg_match('/^\d{1,3}(\.\d{1,3}){3}$/', $ip)) {
            echo json_encode(['code' => 1, 'msg' => 'IP 格式不合法']);
            exit;
        }
        $cmd = 'sudo /bin/bash '
             . escapeshellarg($DEPLOY_SCRIPT)
             . ($ip !== '' ? ' ' . escapeshellarg($ip) : '')
             . ' 2>&1';
        $output = [];
        $retval = 0;
        exec($cmd, $output, $retval);
        echo json_encode([
            'code'   => $retval === 0 ? 0 : 1,
            'output' => implode("\n", $output),
        ]);
        exit;
    }

    // 执行 run.sh（后台执行，不返回输出）
    if ($action === 'run') {
        $cmd = 'nohup sudo /bin/bash '
             . escapeshellarg($RUN_SCRIPT)
             . ' > /tmp/run_sh.log 2>&1 &';
        exec($cmd);
        echo json_encode(['code' => 0, 'msg' => 'run.sh 已在后台启动']);
        exit;
    }

    // 重启服务器
    if ($action === 'reboot') {
        exec('sudo /sbin/reboot 2>&1 &');
        echo json_encode(['code' => 0, 'msg' => '服务器正在重启...']);
        exit;
    }

    echo json_encode(['code' => 1, 'msg' => '未知操作']);
    exit;
}
?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>服务器管理面板</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: "Microsoft YaHei", "PingFang SC", Arial, sans-serif; background: #f0f2f5; color: #333; }
.container { max-width: 960px; margin: 30px auto; padding: 0 20px; }
h1 { text-align: center; margin-bottom: 24px; font-size: 22px; color: #1a1a1a; }
.card { background: #fff; border-radius: 8px; box-shadow: 0 1px 4px rgba(0,0,0,0.08); padding: 20px; margin-bottom: 20px; }
.card h2 { font-size: 16px; margin-bottom: 14px; padding-bottom: 8px; border-bottom: 1px solid #eee; color: #333; }
.btn { display: inline-block; padding: 8px 22px; border: none; border-radius: 4px; font-size: 14px; cursor: pointer; color: #fff; transition: opacity .2s; }
.btn:hover { opacity: 0.85; }
.btn:disabled { opacity: 0.5; cursor: not-allowed; }
.btn-blue { background: #1677ff; }
.btn-green { background: #52c41a; }
.btn-red { background: #ff4d4f; }
.form-row { display: flex; align-items: center; gap: 12px; margin-bottom: 10px; }
.form-row label { font-size: 14px; white-space: nowrap; }
.form-row input[type=text] { padding: 6px 10px; border: 1px solid #d9d9d9; border-radius: 4px; font-size: 14px; width: 220px; }
#deploy-output { background: #1e1e1e; color: #d4d4d4; font-family: "Courier New", Consolas, monospace; font-size: 13px; line-height: 1.6; padding: 14px; border-radius: 4px; max-height: 400px; overflow-y: auto; white-space: pre-wrap; word-break: break-all; display: none; margin-top: 12px; }
table { width: 100%; border-collapse: collapse; font-size: 14px; }
th, td { padding: 10px 12px; text-align: left; border-bottom: 1px solid #f0f0f0; }
th { background: #fafafa; font-weight: 600; color: #555; }
.status-dot { display: inline-block; width: 10px; height: 10px; border-radius: 50%; margin-right: 6px; vertical-align: middle; }
.dot-green { background: #52c41a; }
.dot-red { background: #ff4d4f; }
.refresh-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; }
.refresh-bar span { font-size: 12px; color: #999; }
.spinner { display: none; width: 16px; height: 16px; border: 2px solid #ccc; border-top-color: #1677ff; border-radius: 50%; animation: spin .6s linear infinite; vertical-align: middle; margin-left: 8px; }
@keyframes spin { to { transform: rotate(360deg); } }
</style>
</head>
<body>
<div class="container">
    <h1>服务器管理面板</h1>

    <!-- deploy.sh -->
    <div class="card">
        <h2>环境部署 (deploy.sh)</h2>
        <div class="form-row">
            <label>公网 IP（留空则局域网模式）：</label>
            <input type="text" id="deploy-ip" placeholder="例如 98.33.55.33">
            <button class="btn btn-blue" id="btn-deploy" onclick="runDeploy()">执行部署</button>
            <div class="spinner" id="deploy-spinner"></div>
        </div>
        <div id="deploy-output"></div>
    </div>

    <!-- run.sh -->
    <div class="card">
        <h2>启动服务 (run.sh)</h2>
        <div class="form-row">
            <button class="btn btn-green" id="btn-run" onclick="runStart()">启动所有服务</button>
            <div class="spinner" id="run-spinner"></div>
            <span id="run-msg" style="font-size:13px; color:#666;"></span>
        </div>
    </div>

    <!-- 进程状态 -->
    <div class="card">
        <div class="refresh-bar">
            <h2 style="border:none; margin:0; padding:0;">进程运行状态</h2>
            <span id="last-refresh">--</span>
        </div>
        <table>
            <thead>
                <tr><th>进程名称</th><th>状态</th><th>PID</th></tr>
            </thead>
            <tbody id="proc-tbody">
                <tr><td colspan="3" style="text-align:center;color:#999;">加载中...</td></tr>
            </tbody>
        </table>
    </div>

    <!-- 重启服务器 -->
    <div class="card">
        <h2>系统操作</h2>
        <div class="form-row">
            <button class="btn btn-red" id="btn-reboot" onclick="rebootServer()">重启服务器</button>
            <div class="spinner" id="reboot-spinner"></div>
            <span id="reboot-msg" style="font-size:13px; color:#666;"></span>
        </div>
    </div>
</div>

<script>
// 执行 deploy.sh
function runDeploy() {
    var btn = document.getElementById('btn-deploy');
    var spinner = document.getElementById('deploy-spinner');
    var output = document.getElementById('deploy-output');
    var ip = document.getElementById('deploy-ip').value.trim();

    btn.disabled = true;
    spinner.style.display = 'inline-block';
    output.style.display = 'block';
    output.textContent = '正在执行 deploy.sh，请等待...\n';

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '?action=deploy', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            btn.disabled = false;
            spinner.style.display = 'none';
            if (xhr.status === 200) {
                try {
                    var res = JSON.parse(xhr.responseText);
                    output.textContent = res.output || '(无输出)';
                    if (res.code !== 0) {
                        output.textContent += '\n\n[脚本返回非零退出码]';
                    }
                } catch(e) {
                    output.textContent = '解析响应失败: ' + xhr.responseText;
                }
            } else {
                output.textContent = '请求失败: HTTP ' + xhr.status;
            }
            output.scrollTop = output.scrollHeight;
        }
    };
    xhr.send('ip=' + encodeURIComponent(ip));
}

// 执行 run.sh
function runStart() {
    var btn = document.getElementById('btn-run');
    var spinner = document.getElementById('run-spinner');
    var msg = document.getElementById('run-msg');

    btn.disabled = true;
    spinner.style.display = 'inline-block';
    msg.textContent = '';

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '?action=run', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            btn.disabled = false;
            spinner.style.display = 'none';
            if (xhr.status === 200) {
                try {
                    var res = JSON.parse(xhr.responseText);
                    msg.textContent = res.msg || 'OK';
                } catch(e) {
                    msg.textContent = '响应解析失败';
                }
            } else {
                msg.textContent = '请求失败: HTTP ' + xhr.status;
            }
            // 启动后刷新状态
            setTimeout(refreshStatus, 3000);
        }
    };
    xhr.send();
}

// 刷新进程状态
function refreshStatus() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '?action=status', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            try {
                var res = JSON.parse(xhr.responseText);
                if (res.code === 0) {
                    renderTable(res.data);
                }
            } catch(e) {}
            document.getElementById('last-refresh').textContent =
                '上次刷新: ' + new Date().toLocaleTimeString();
        }
    };
    xhr.send();
}

function renderTable(data) {
    var tbody = document.getElementById('proc-tbody');
    var html = '';
    for (var i = 0; i < data.length; i++) {
        var p = data[i];
        var dotCls = p.running ? 'dot-green' : 'dot-red';
        var label  = p.running ? '运行中' : '未运行';
        html += '<tr>'
              + '<td>' + escHtml(p.name) + '</td>'
              + '<td><span class="status-dot ' + dotCls + '"></span>' + label + '</td>'
              + '<td>' + escHtml(String(p.pid)) + '</td>'
              + '</tr>';
    }
    tbody.innerHTML = html;
}

function escHtml(s) {
    var d = document.createElement('div');
    d.appendChild(document.createTextNode(s));
    return d.innerHTML;
}

// 重启服务器
function rebootServer() {
    if (!confirm('确定要重启服务器吗？所有服务将会中断！')) return;

    var btn = document.getElementById('btn-reboot');
    var spinner = document.getElementById('reboot-spinner');
    var msg = document.getElementById('reboot-msg');

    btn.disabled = true;
    spinner.style.display = 'inline-block';
    msg.textContent = '';

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '?action=reboot', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            spinner.style.display = 'none';
            if (xhr.status === 200) {
                try {
                    var res = JSON.parse(xhr.responseText);
                    msg.textContent = res.msg || 'OK';
                } catch(e) {
                    msg.textContent = '服务器正在重启...';
                }
            } else {
                msg.textContent = '服务器正在重启...';
            }
        }
    };
    xhr.send();
}

// 页面加载后立即刷新，之后每 5 秒刷新一次
refreshStatus();
setInterval(refreshStatus, 5000);
</script>
</body>
</html>
