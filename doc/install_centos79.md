




# 修改安装方式

j1900安装centos7.9，通过u盘安装，进入centos7.9安装后，黑屏，可以看见以及移动鼠标，感觉界面在另外一个屏幕上，怎么办

```angular2html
通过内核参数禁用驱动检查 (nomodeset)
这是解决 Linux 安装黑屏最常用的方法，它会让系统在加载完整显卡驱动前使用基本的 VESA 模式。

重新启动进入 U 盘引导界面。

在菜单选择 Install CentOS 7 时，按下键盘上的 Tab 键（如果是 UEFI 模式，可能需要按 e 键）。

在出现的启动参数行（通常以 vmlinuz... 开头）末尾，空格后输入：
nomodeset

按下 Enter（或 Ctrl+X）启动。

```

# 修改网络

检查网卡是否“打开” (ONBOOT)
这是最常见的原因。CentOS 默认安装后，网卡往往是禁用状态。

```angular2html

打开配置文件：vi /etc/sysconfig/network-scripts/ifcfg-enp2s0（文件名根据你的 ip addr 结果而定）。

找到 ONBOOT=no，将其改为 ONBOOT=yes。

确保 BOOTPROTO=dhcp。

保存退出 (:wq)。

重启网络服务：systemctl restart network。

```

# 开启ssh

```angular2html
如果服务已启动但仍无法连接（例如提示 Permission denied），检查配置文件：

编辑配置：vi /etc/ssh/sshd_config

确认以下项没有被注释（前面没有 #）：

Port 22

ListenAddress 0.0.0.0

PermitRootLogin yes (如果你需要用 root 账号直接登录，确保这里是 yes)

PasswordAuthentication yes (确保允许密码登录)

修改后必须重启服务：systemctl restart sshd

```


关闭防火墙
```angular2html
systemctl stop firewalld
systemctl disable firewalld

```

# 替换源

```angular2html

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/nodes.about.je/d' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://mirrors.aliyun.com|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's/mirrors.aliyuncs.com/mirrors.aliyun.com/g' /etc/yum.repos.d/CentOS-Base.repo

curl -o /etc/yum.repos.d/epel.repo https://mirrors.aliyun.com/repo/epel-7.repo

yum clean all
yum makecache

```

# 安装32位wine

```angular2html

yum install -y https://harbottle.gitlab.io/wine32/7/i386/wine32-release.rpm
yum install -y wine.i686
rm -rf ~/.wine32

export WINEARCH=win32
export WINEPREFIX=~/.wine32

winecfg

```

# 安装基础环境

```angular2html

yum update -y
yum groupinstall "Development Tools" -y
yum install -y glibc.x86_64 libstdc++.x86_64 libgcc.x86_64 \
               libtool-ltdl.x86_64 unixODBC.x86_64 unixODBC-devel.x86_64
yum install -y iptables-services
systemctl start iptables
systemctl enable iptables
```

# 安装宝塔和mysql php nginx

```angular2html

#宝塔脚本 
if [ -f /usr/bin/curl ];then curl -sSO https://download.bt.cn/install/install_panel.sh;else wget -O install_panel.sh https://download.bt.cn/install/install_panel.sh;fi;bash install_panel.sh ed8484bec

安装好宝塔后，再通过web界面安装以下
Nginx 1.22
MySQL 5.5
PHP 5.6

```

# 设置mysql

```angular2html

通过宝塔将root密码改为123456，动态周期改为9000
日志周期1天，防止打满磁盘

```

# 处理依赖so
```angular2html


cp -rf /home/khan3/lib/mysql-connector-odbc-3.51.26-linux-x86-64bit/lib/* /lib64

rm -rf /home/khan3/lib/odbc.ini
rm -rf /home/khan3/lib/odbcinst.ini
cp /home/khan3/lib/odbc.ini /etc
cp /home/khan3/lib/odbcinst.ini /etc

cp /home/khan3/lib/libLua_khan2_64.so /lib64
cp /home/khan3/lib/libScriptEngine_khan2_64.so /lib64

ln -s /usr/lib64/libodbc.so.2 /lib64/libodbc.so.1

cp /home/khan3/lib/libiop.so /lib64

ln -s /usr/lib64/mysql/libmysqlclient.so.18 /usr/lib64/libmysqlclient.so.15

ln -s /usr/lib64/libodbcinst.so.2 /lib64/libodbcinst.so.1


```


# 恢复mysql表结构
```angular2html
编辑配置文件：

Bash
vi /etc/my.cnf
在 [mysqld] 后面添加一行：
log_bin_trust_function_creators = 1

重启
/etc/init.d/mysqld restart


mysql -uroot -p123456 < /home/khan3/lib/all_databases.sql
mysql -uroot -p123456 Billing < /home/khan3/lib/Billing.sql
mysql -uroot -p123456 khan3 < /home/khan3/lib/khan3.sql

```


# 拷贝执行脚本

```angular2html

cp /home/khan3/scripts/check_itemserial.sh /root
cp /home/khan3/scripts/deploy.sh /root
cp /home/khan3/scripts/run.sh /root
cp /home/khan3/scripts/killall.sh /root
chmod +x *.sh
```

# 准备wine环境

```angular2html
cp /home/khan3/lib/CryptCmd.exe /root
mkdir /root/src
mkdir /root/dst
cp /home/khan3/lib/Entrance.txt /root/src
```

# 部署网站

```angular2html
cp -rf /home/khan3/www/html/khan3 /www/wwwroot/default
cp /home/khan3/lib/default /www/server/panel/vhost/nginx
chown -R www:www /home/khan3/lib/default
chown -R www:www /www/wwwroot/default

```

