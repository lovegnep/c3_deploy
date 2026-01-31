<?php
/**
 * 道具补偿发放后台工具
 * 需要登录验证，从trophy.tab读取道具列表，向useraward表插入补偿记录
 * 兼容 PHP 5.1.6
 */
error_reporting(E_ALL);
ini_set('display_errors', '1');
ini_set('log_errors', '1');

session_start();

// 配置信息
define('DB_HOST', '127.0.0.1');
define('DB_PORT', '3306');
define('DB_USER', 'root');
define('DB_PASS', '123456');
define('DB_NAME', 'billing'); // 需要根据实际情况填写数据库名，请修改为实际的数据库名
define('DB_CHARSET', 'gb2312'); // 编码20936对应GB2312

// 管理员账号密码（建议修改为更安全的密码）
define('ADMIN_USER', 'skdjfiuiuewjjjdsss');
define('ADMIN_PASS', '12210980948081248...**&&^^%^%%'); // 请修改此密码

// 获取当前脚本所在目录
$script_dir = dirname(__FILE__);
// trophy.tab文件路径 - 使用绝对路径
define('TROPHY_FILE', $script_dir . '/tabs/trophy.tab');

// 登录验证
function checkLogin() {
    return isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true;
}

// 处理登录
if (isset($_POST['action']) && $_POST['action'] === 'login') {
    $username = isset($_POST['username']) ? trim($_POST['username']) : '';
    $password = isset($_POST['password']) ? trim($_POST['password']) : '';
    
    if ($username === ADMIN_USER && $password === ADMIN_PASS) {
        $_SESSION['admin_logged_in'] = true;
        header('Location: award_admin.php');
        exit;
    } else {
        $error = '用户名或密码错误';
    }
}

// 处理登出
if (isset($_GET['action']) && $_GET['action'] === 'logout') {
    session_destroy();
    header('Location: award_admin.php');
    exit;
}

// 读取trophy.tab文件
function readTrophyFile() {
    $trophies = array();
    $trophy_file = TROPHY_FILE;
    $file_path = $trophy_file;
    
    // 尝试多个可能的路径
    $possible_paths = array(
        $file_path,
        dirname(__FILE__) . '/tabs/trophy.tab',
        dirname(__FILE__) . '/../tabs/trophy.tab',
        './tabs/trophy.tab',
        '../tabs/trophy.tab'
    );
    
    $file_path = '';
    foreach ($possible_paths as $path) {
        if (file_exists($path)) {
            $file_path = $path;
            break;
        }
    }
    
    if (empty($file_path)) {
        return $trophies;
    }
    
    // PHP 5.1.6兼容：使用file_get_contents然后分行处理
    $content = @file_get_contents($file_path);
    if ($content === false) {
        return $trophies;
    }
    
    // 处理不同换行符
    $content = str_replace("\r\n", "\n", $content);
    $content = str_replace("\r", "\n", $content);
    $lines = explode("\n", $content);
    
    if (count($lines) < 3) {
        return $trophies;
    }
    
    // 跳过类型行和表头行
    for ($i = 2; $i < count($lines); $i++) {
        $line = trim($lines[$i]);
        if (empty($line)) {
            continue;
        }
        // 检查注释行
        if (strlen($line) > 0 && $line[0] === '#') {
            continue;
        }
        
        $cols = explode("\t", $line);
        if (count($cols) >= 2) {
            $id = trim($cols[0]);
            $name = trim($cols[1]);
            if (!empty($id) && is_numeric($id)) {
                $trophies[$id] = $name;
            }
        }
    }
    
    return $trophies;
}

// 连接数据库
function getDbConnection() {
    // PHP 5.1.6兼容：mysql_connect参数格式
    $host = DB_HOST;
    if (DB_PORT != '3306') {
        $host = DB_HOST . ':' . DB_PORT;
    }
    
    $conn = @mysql_connect($host, DB_USER, DB_PASS);
    if (!$conn) {
        die('数据库连接失败: ' . mysql_error());
    }
    
    // 选择数据库
    $db_name = DB_NAME;
    if (!empty($db_name)) {
        if (!@mysql_select_db($db_name, $conn)) {
            mysql_close($conn);
            die('选择数据库失败: ' . mysql_error());
        }
    }
    
    // 设置字符集
    @mysql_query("SET NAMES '" . DB_CHARSET . "'", $conn);
    @mysql_query("SET CHARACTER SET '" . DB_CHARSET . "'", $conn);
    
    return $conn;
}

// 处理发放补偿
if (checkLogin() && isset($_POST['action']) && $_POST['action'] === 'award') {
    $username = isset($_POST['username']) ? trim($_POST['username']) : '';
    $itemId = isset($_POST['item_id']) ? intval($_POST['item_id']) : 0;
    $itemNumber = isset($_POST['item_number']) ? intval($_POST['item_number']) : 0;
    $worldid = isset($_POST['worldid']) ? intval($_POST['worldid']) : 1200;
    $charguid = isset($_POST['charguid']) ? intval($_POST['charguid']) : 0;
    $days = isset($_POST['days']) ? intval($_POST['days']) : 90; // 默认90天有效期
    
    // 验证必填项
    if (empty($username)) {
        $award_error = '请填写用户名';
    } elseif ($itemId <= 0) {
        $award_error = '请填写有效的道具ID';
    } elseif ($itemNumber <= 0) {
        $award_error = '请填写有效的道具数量';
    } else {
        $conn = getDbConnection();
        
        $now = date('Y-m-d H:i:s');
        $toDate = date('Y-m-d H:i:s', strtotime("+{$days} days"));
        
        $sql = "INSERT INTO useraward (CenterAwardId, Username, Charguid, Worldid, ItemID, ItemNumber, AddDate, StartDate, ToDate, GetDate, Type, AwardStatus, AdId, SubtractId, CDKey) 
                VALUES (0, '" . mysql_real_escape_string($username, $conn) . "', $charguid, $worldid, $itemId, $itemNumber, 
                '$now', '$now', '$toDate', NULL, 0, 0, 0, 0, NULL)";
        
        $result = mysql_query($sql, $conn);
        if ($result) {
            $award_success = '补偿发放成功！AwardID: ' . mysql_insert_id($conn);
        } else {
            $award_error = '发放失败: ' . mysql_error($conn);
        }
        
        mysql_close($conn);
    }
}

// 如果未登录，显示登录页面
if (!checkLogin()) {
    // 设置输出编码
    header('Content-Type: text/html; charset=gb2312');
    ?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>道具补偿后台 - 登录</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f5f5; padding: 50px; }
        .login-box { max-width: 400px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #333; margin-bottom: 30px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; color: #666; }
        input[type="text"], input[type="password"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 12px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        button:hover { background: #0056b3; }
        .error { color: red; margin-top: 10px; }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>道具补偿后台</h1>
        <form method="post">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label>用户名:</label>
                <input type="text" name="username" value="">
            </div>
            <div class="form-group">
                <label>密码:</label>
                <input type="password" name="password" value="">
            </div>
            <button type="submit">登录</button>
            <?php if (isset($error)): ?>
                <div class="error"><?php echo htmlspecialchars($error, ENT_QUOTES, 'GB2312'); ?></div>
            <?php endif; ?>
        </form>
    </div>
</body>
</html>
    <?php
    exit;
}

// 已登录，显示主界面
// 设置输出编码
header('Content-Type: text/html; charset=gb2312');

$trophies = readTrophyFile();
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <title>道具补偿后台</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background: #f5f5f5; padding: 20px; }
        .container { max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h1 { color: #333; margin-bottom: 20px; }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; padding-bottom: 20px; border-bottom: 2px solid #eee; }
        .logout { color: #007bff; text-decoration: none; }
        .logout:hover { text-decoration: underline; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; color: #666; font-weight: bold; }
        input[type="text"], select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        button { padding: 12px 24px; background: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        button:hover { background: #0056b3; }
        .success { background: #d4edda; color: #155724; padding: 15px; border-radius: 4px; margin-bottom: 20px; }
        .error { background: #f8d7da; color: #721c24; padding: 15px; border-radius: 4px; margin-bottom: 20px; }
        .form-row { display: table; width: 100%; }
        .form-row .form-group { display: table-cell; width: 50%; padding-right: 10px; }
        .form-row .form-group:last-child { padding-right: 0; }
        .trophy-select { max-height: 300px; overflow-y: auto; border: 1px solid #ddd; border-radius: 4px; padding: 10px; margin-top: 10px; }
        .trophy-item { padding: 5px; cursor: pointer; }
        .trophy-item:hover { background: #f0f0f0; }
        .trophy-item.selected { background: #007bff; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>道具补偿发放系统</h1>
            <a href="?action=logout" class="logout">退出登录</a>
        </div>
        
        <?php if (isset($award_success)): ?>
            <div class="success"><?php echo htmlspecialchars($award_success, ENT_QUOTES, 'GB2312'); ?></div>
        <?php endif; ?>
        
        <?php if (isset($award_error)): ?>
            <div class="error"><?php echo htmlspecialchars($award_error, ENT_QUOTES, 'GB2312'); ?></div>
        <?php endif; ?>
        
        <form method="post">
            <input type="hidden" name="action" value="award">
            
            <div class="form-row">
                <div class="form-group">
                    <label>用户名 (Username): *</label>
                    <input type="text" name="username" value="" placeholder="例如: kt01">
                </div>
                
                <div class="form-group">
                    <label>世界ID (Worldid):</label>
                    <input type="text" name="worldid" value="1200">
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label>角色GUID (Charguid):</label>
                    <input type="text" name="charguid" value="0">
                </div>
                
                <div class="form-group">
                    <label>道具数量 (ItemNumber): *</label>
                    <input type="text" name="item_number" value="" placeholder="例如: 999000">
                </div>
            </div>
            
            <div class="form-group">
                <label>道具ID (ItemID): *</label>
                <input type="text" name="item_id" id="item_id" value="" placeholder="从下方选择或手动输入">
                <div class="trophy-select">
                    <?php foreach ($trophies as $id => $name): ?>
                        <div class="trophy-item" onclick="selectTrophy(<?php echo $id; ?>)">
                            <strong><?php echo htmlspecialchars($id, ENT_QUOTES, 'GB2312'); ?></strong> - <?php echo htmlspecialchars($name, ENT_QUOTES, 'GB2312'); ?>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
            
            <div class="form-group">
                <label>有效期 (天数):</label>
                <input type="text" name="days" value="90">
            </div>
            
            <?php 
            $trophy_file_path = TROPHY_FILE;
            $trophy_count = count($trophies);
            if ($trophy_count == 0): ?>
                <div class="error" style="margin-top: 20px;">
                    警告：无法读取trophy.tab文件！<br>
                    文件路径: <?php echo htmlspecialchars($trophy_file_path, ENT_QUOTES, 'GB2312'); ?><br>
                    请检查文件是否存在。
                </div>
            <?php endif; ?>
            
            <button type="submit">发放补偿</button>
        </form>
    </div>
    
    <script>
        function selectTrophy(id) {
            document.getElementById('item_id').value = id;
            // 高亮选中的项
            var items = document.querySelectorAll('.trophy-item');
            for (var i = 0; i < items.length; i++) {
                items[i].className = 'trophy-item';
                if (items[i].textContent.indexOf(id + ' -') === 0 || items[i].textContent.indexOf(id + ' -') > -1) {
                    items[i].className = 'trophy-item selected';
                }
            }
        }
    </script>
</body>
</html>
