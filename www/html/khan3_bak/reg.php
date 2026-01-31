<?php
     header("Content-Type:text/html;charset=gb2312");
    $databaseConnection = null;
    function getConnect() {
        $hosthome = "localhost";
        $database = "Billing";
        $userName = "root";
        $password = "123456";
        global $databaseConnection;
        $databaseConnection = @mysql_connect($hosthome, $userName, $password) or die (mysql_error());
        mysql_query("set names gbk");
        @mysql_select_db($database, $databaseConnection) or die (mysql_error());
    }

    function closeConnect() {
        global $databaseConnection;
        if ($databaseConnection) {
            @mysql_close($databaseConnection) or die (mysql_error());
        }
    }
	
	    if (empty($_POST)) {
        exit("您提交的表单数据超过post_max_size! <br>");
    }

    //-- 判断输入密码与确认密码是否相同
    $password = $_POST['pwd'];
    $confirmPassword = $_POST['repwd'];
    if ($password != $confirmPassword) {
        exit("输入的密码与确认密码不相等！");
    }
	
	$userName = $_POST['name'];
	   
	//-- 判断输入密码是否为空
	if ($userName  == '' || $password  == '' || $confirmPassword  == '' ) 
       {
		exit("您要使用的帐号或密码含不能为空！");
	   }
	   
	//-- 判断长度是否符合规定
    if (strlen($userName) < 4 || strlen($userName) > 18)
        {
	    exit("您要使用的帐号长度不符合规定！");
	   }
	
	$password=md5($password);
	$password=strtolower($password);
    $userName = ltrim($userName);
	$userName =strtolower($userName);     

    // 判断用户名是否重复
    $userNameSQL = "select * from GameUser where userName = '$userName'";
    getConnect();
    $resultSet = mysql_query($userNameSQL);
    if (mysql_num_rows($resultSet) > 0) {
        exit("用户名已被占用，请更换其他用户名！");
    }

	$srcDataStr = date("Y-m-d H:i:s");
    $registerSQL = "insert into GameUser (UserName,Password,IdCardType,ActiveTime,RegTime,LoginTimes,AdId,IsAdult,IsIdentity,IsBindSecureCard,WorldID,UserStatus,MobileStatus,PhoneStatus,SecretCardStatus,IsBindPasspod,PasspodStatus,LastLoginTime,ThisLoginTime,LastUserStatus) values ('" . $userName . "','" .$password . "','0','" . $srcDataStr . "','" . $srcDataStr . "','0','0','0','0','0','0','0','0','0','0','0','0','" . $srcDataStr . "','" . $srcDataStr . "','0')";
    mysql_query($registerSQL);
    $userID = mysql_insert_id();
	$sql0="insert into UserGolds (UserName,Golds,GoldStatus,Coins,CoinStatus,AdId,UserLevel) VALUES ('".$userName."','100000','0','0','0','0','31')";
    mysql_query($sql0);
        echo "注册成功！<br>您的注册用户名为：" . $userName;
		echo "<br>赠送800锭现金！赠送31级VIP";
    closeConnect();
?>