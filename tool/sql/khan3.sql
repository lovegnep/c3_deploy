--
-- Table structure for table `t_skill` 生活技能表
--
DROP TABLE IF EXISTS `t_skill`;
CREATE TABLE `t_skill` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `skillid` smallint(6) NOT NULL COMMENT '生活技能ID',
  `skilllvl` smallint(6) NOT NULL COMMENT '生活技能等级',
  `skillexp` int(11) NOT NULL COMMENT '生活技能经验',
  `version` int(11) NOT NULL COMMENT '数据版本',
  PRIMARY KEY  (`aid`),
  KEY `Index_ab_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_bank`  现金寄售银行表
--
DROP TABLE IF EXISTS `t_bank`;
CREATE TABLE `t_bank` (
  `aid` int(11) NOT NULL auto_increment,
  `serialid` int(11) NOT NULL COMMENT '交易序列号',
  `shopid` int(11) NOT NULL COMMENT '商店ID',
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `gold` int(11) NOT NULL COMMENT '现金数量',
  `siller` int(11) NOT NULL COMMENT '现银数量',
  `charge` int(11) NOT NULL COMMENT '手续费',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `deleteTime` int(11) NOT NULL COMMENT '删除时间',
  `buyerguid` int(10) unsigned NOT NULL COMMENT '购买者GUID',
  `valid` smallint(6) NOT NULL default '1' COMMENT '有效标记位',
  PRIMARY KEY  (`aid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_player` 角色表
--
DROP TABLE IF EXISTS `t_player`;
CREATE TABLE `t_player` (
  `aid` bigint(20) NOT NULL auto_increment,
  `accountname` varchar(50) NOT NULL COMMENT '帐号名',
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `playername` varchar(50) NOT NULL COMMENT '角色名',
  `title` varchar(50) NOT NULL COMMENT '已废弃',
  `password` varchar(15) NOT NULL COMMENT '二级密码',
  `sex` smallint(6) NOT NULL COMMENT '性别',
  `level` int(11) NOT NULL COMMENT '等级',
  `enegry` int(11) NOT NULL COMMENT '精力值',
  `energymax` int(11) NOT NULL COMMENT '最大精力值',
  `outlook` int(11) NOT NULL COMMENT '已废弃',
  `map` int(11) NOT NULL COMMENT '场景ID',
  `x` int(11) NOT NULL COMMENT '坐标位置x',
  `z` int(11) NOT NULL COMMENT '坐标位置z',
  `profession` smallint(6) NOT NULL COMMENT '职业',
  `country` int(11) NOT NULL COMMENT '国家ID',
  `hp` int(11) NOT NULL COMMENT '血',
  `mp` int(11) NOT NULL COMMENT '蓝',
  `strikepoint` smallint(6) NOT NULL COMMENT '弹药箭支数量',
  `campdata` varchar(30) NOT NULL COMMENT '阵营数据',
  `strvalue` int(11) NOT NULL COMMENT '力量值',
  `sprvalue` int(11) NOT NULL COMMENT '已废弃',
  `convalue` int(11) NOT NULL COMMENT '体质值',
  `iprvalue` int(11) NOT NULL COMMENT '智力值',
  `dexvalue` int(11) NOT NULL COMMENT '敏捷值',
  `points` int(11) NOT NULL COMMENT '潜能点(未使用)',
  `logouttime` int(11) NOT NULL COMMENT '上次下线时间',
  `logintime` int(11) NOT NULL COMMENT '上次登录时间',
  `createtime` int(11) NOT NULL COMMENT '角色创建时间',
  `haircolordata` int(11) NOT NULL COMMENT '头发颜色',
  `hairmodeldata` int(11) NOT NULL COMMENT '发发模型',
  `facecolordata` int(11) NOT NULL COMMENT '脸部颜色',
  `facemodeldata` int(11) NOT NULL COMMENT '脸部模型',
  `vmoney` int(11) NOT NULL COMMENT '已废弃',
  `valid` smallint(6) NOT NULL COMMENT '有效标记位',
  `exp` bigint(20) unsigned NOT NULL COMMENT '经验',
  `skillpres` varchar(256) not null default '' COMMENT '生活技能配方数据',
  `questdata` varchar(2560) not null default '' COMMENT '自定义扩展数据',
  `questflag` varchar(1600) not null default '' COMMENT '任务完成标记',
  `settings` varchar(3864) not null default '' COMMENT '游戏设置数据',
  `version` int(11) NOT NULL COMMENT '数据版本',
  `guldid` int(11) NOT NULL COMMENT '帮会ID',
  `teamid` int(11) NOT NULL COMMENT '队伍ID',
  `headid` int(11) NOT NULL COMMENT '头像ID',
  `erecover` int(11) NOT NULL COMMENT '精力值恢复速度',
  `vigor` int(11) NOT NULL COMMENT '活力值',
  `maxvigor` int(11) NOT NULL COMMENT '最大活力值',
  `vrecover` int(11) NOT NULL COMMENT '活力值恢复速度',
  `pwdeltime` int(11) NOT NULL COMMENT '密码删除时间',
  `privateinfo` varchar(1382) not null default '' COMMENT '个人信息',
  `bkmap` int(11) NOT NULL COMMENT '备份场景ID',
  `bkx` int(11) NOT NULL COMMENT '备份坐标位置x',
  `bkz` int(11) NOT NULL COMMENT '备份坐标位置z',
  `nextmap` int(11) NOT NULL COMMENT '跳转目的场景ID',
  `nextx` int(11) NOT NULL COMMENT '跳转目的场景坐标位置x',
  `nextz` int(11) NOT NULL COMMENT '跳转目的场景坐标位置z',
  `titleinfo` varchar(4384) not null default '' COMMENT '称号',
  `dietime` int(11) NOT NULL COMMENT '已废弃',
  `cooldown` varchar(768) not null default '' COMMENT 'CD数据',
  `bankcount` int(11) NOT NULL COMMENT '已废弃',
  `bankend` int(11) NOT NULL COMMENT '仓库可使用格数',
  `rage` int(11) NOT NULL COMMENT '怒气值',
  `reserve` varchar(100) NOT NULL COMMENT '已废弃',
  `isfirstlogin` int(11) NOT NULL COMMENT '首次登录标记',
  `silver` int(11) NOT NULL COMMENT '现银',
  `gold` int(11) NOT NULL COMMENT '现金',
  `bsilver` int(11) NOT NULL COMMENT '银卡',
  `bgold` int(11) NOT NULL COMMENT '金卡',
  `moneymode` int(11) NOT NULL COMMENT '游戏币使用模式',
  `rongyu` int(11) NOT NULL COMMENT '江湖声望',
  `shengwang` int(11) NOT NULL COMMENT '朝廷声望',
  `wencai` int(11) NOT NULL COMMENT '已废弃',
  `passwordflag` int(11) NOT NULL COMMENT '二级密保保护类型',
  `lastpttime` int(11) NOT NULL COMMENT '上次登录保护时间',
  `pttime` int(11) NOT NULL COMMENT '当前登录保护时间',
  `ptdeltime` int(11) NOT NULL COMMENT '登录保护生效时间',
  `otherplaceflag` tinyint NOT NULL default 0 COMMENT '异地登录标记',
  `busid` int(11) NOT NULL COMMENT '镖车ID',
  `pkvalue` int(11) NOT NULL COMMENT 'PK值',
  `lastmutetime` int(11) NOT NULL COMMENT '禁言时间',
  `lastenjailtime` int(11) NOT NULL COMMENT '囚禁时间',
  `honor` int(11) NOT NULL COMMENT '荣誉值',
  `honordata` varchar(196) not null default '' COMMENT '荣誉记录',
  `inherexp` int(11) NOT NULL COMMENT '天赋经验值',
  `inherlevel` INTEGER UNSIGNED NOT NULL DEFAULT 1 COMMENT '天赋等级',
  `soulid` int(11) NOT NULL COMMENT '麻将组合类型',
  `gemaff` int(11) NOT NULL COMMENT '宝石特效',
  `guildpoint` int(11) NOT NULL COMMENT '帮贡',
  `soldlist` varchar(10240) not null default '' COMMENT '回购列表',
  `isdelchar` smallint(6) NOT NULL COMMENT '角色删除标记',
  `adid` int(11) NOT NULL COMMENT '注册地地区代码(由billing返回)',
  `setsuit` int(11) NOT NULL default '-1' COMMENT '装备套装',
  `levelaff` int(11) NOT NULL default '0' COMMENT '装备属性',
  `hotvalue` int(11) NOT NULL COMMENT '已废弃',
  `lastloginip` int(11) NOT NULL COMMENT '上次登录ip',
  `guildbuildcount` int(11) NOT NULL COMMENT '帮会建设次数',
  `guildbuildday` int(11) NOT NULL COMMENT '帮会建设时间点',
  `chgpkmodetime` int(11) NOT NULL default '0' COMMENT 'PK模式切换时间点',
  `totalonlinetime` int(10) unsigned NOT NULL COMMENT '总在线时长',
  `wallowonlinetime` int(10) unsigned NOT NULL COMMENT '疲劳时间在线计时',
  `wallowofflinetime` int(10) unsigned NOT NULL COMMENT '疲劳时间离线计时',
  `leaveguildtime` int(10) unsigned zerofill NOT NULL COMMENT '离开帮会时间',
  `isneedrename` int(10) unsigned zerofill NOT NULL COMMENT '改名标记',
  `newplayername` varchar(50) NOT NULL default '@' COMMENT '改名',
  `crc` int(10) unsigned zerofill NOT NULL COMMENT '校验码',
  `killcounttoday` int(10) unsigned zerofill NOT NULL COMMENT '每日杀人数',
  `tiredtime` int(10) NOT NULL COMMENT '疲劳时间',
  `goodbad` int(10) unsigned zerofill NOT NULL COMMENT '威望值',
  `pvp2v2level` smallint(5) unsigned NOT NULL COMMENT '2v2竞技场等级',
  `pvp2v2mark` smallint(5) unsigned NOT NULL COMMENT '2v2竞技场积分',
  `pvp2v2day` int(10) unsigned zerofill NOT NULL COMMENT '2v2竞技场时间记数',
  `bankhorsevalidct` int(10) unsigned NOT NULL default '1' COMMENT '骑乘仓库激活个数',
  `pvp2v2markweektotal` int(11) NOT NULL COMMENT '2v2竞技场周总积分',
  `dispelmastertime` int(10) unsigned zerofill NOT NULL COMMENT '师徒关系建立时间(师父记)',
  `dispelprenticetime` int(10) unsigned zerofill NOT NULL COMMENT '师徒关系建立时间(徒弟记)',
  `totalprentice` smallint(5) unsigned zerofill NOT NULL COMMENT '徒弟数量',
  `sendgifttime` int(10) unsigned zerofill NOT NULL COMMENT '送礼物时间',
  `sendgifttimes` smallint(5) unsigned zerofill NOT NULL COMMENT '送礼物次数',
  `patrolid` smallint(5) unsigned zerofill NOT NULL COMMENT '婚礼路径ID',
  `curpathnode` smallint(5) unsigned zerofill NOT NULL COMMENT '婚礼当前路径ID',
  `dbflag` int(10) unsigned NOT NULL default '0' COMMENT '角色数据库标记值',
  `exploit` int(10) unsigned zerofill NOT NULL COMMENT '功勋值',
  `exploitday` smallint(5) unsigned zerofill NOT NULL COMMENT '功勋时间点',
  `hhorseguid` int(10) unsigned NOT NULL default 0 COMMENT '当前坐骑高位ID',
  `lhorseguid` int(10) unsigned NOT NULL default 0 COMMENT '当前坐骑低位ID',
  `hchariotguid` int(10) unsigned NOT NULL default 0 COMMENT '当前战车高位ID',
  `lchariotguid` int(10) unsigned NOT NULL default 0 COMMENT '当前战车低位ID',
  `viewgroup` int(11) NOT NULL default 0 COMMENT '玩家的可视组',
  `horsemoney` int(10) unsigned NOT NULL default 0 COMMENT '马币',
  `xinyu` int(10) unsigned NOT NULL default 0 COMMENT '信誉',
  `mingwang` int(10) unsigned NOT NULL default 0 COMMENT '名望',
  `gifttime` varchar(32) NOT NULL COMMENT '礼包领取时间',
  `carddata` varchar(512) NOT NULL COMMENT '卡牌数据',
  `cardbagsize`	int(10) unsigned NOT NULL default 0 COMMENT '卡包大小',
  `peervip` int(10) unsigned NOT NULL default 0 COMMENT 'vip经验',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `Index_char_playerguid` (`playerguid`),
  UNIQUE KEY `Index_char_playername` USING HASH (`playername`),
  KEY `Index_char_accname` (`accountname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_playerrename`
--
DROP TABLE IF EXISTS `t_playerrename`;
CREATE TABLE `t_playerrename` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `oldname` varchar(50) NOT NULL COMMENT '旧角色名',
  `newname` varchar(50) NOT NULL default '@' COMMENT '新角色名',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `Index_newname` USING HASH (`newname`),
  KEY `Index_char_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_country`
--
DROP TABLE IF EXISTS `t_country`;
CREATE TABLE `t_country` (
  `countryid` int(10) unsigned NOT NULL COMMENT '国家ID',
  `countryname` varchar(45) NOT NULL COMMENT '国家名',
  `kingguid` int(10) unsigned NOT NULL COMMENT '国王GUID',
  `kingguildid` smallint(6) NOT NULL COMMENT '国王帮帮会ID',
  `kingname` varchar(45) NOT NULL COMMENT '国王角色名',
  `challenger` int(10) unsigned NOT NULL COMMENT '挑战者GUID',
  `challengerguildid` smallint(6) NOT NULL COMMENT '挑战帮帮会ID',
  `challengername` varchar(45) NOT NULL COMMENT '挑战者角色名',
  `guid_queen` int(10) unsigned NOT NULL COMMENT '王后GUID',
  `guid_general` int(10) unsigned NOT NULL COMMENT '大将军GUID',
  `guid_lminister` int(10) unsigned NOT NULL COMMENT '左丞GUID',
  `guid_rminister` int(10) unsigned NOT NULL COMMENT '右相BUID',
  `guid_lguard` int(10) unsigned NOT NULL COMMENT '左护卫GUID',
  `guid_rguard` int(10) unsigned NOT NULL COMMENT '右护卫GUID',
  `name_queen` varchar(45) NOT NULL COMMENT '王后角色名',
  `name_general` varchar(45) NOT NULL COMMENT '大将军角色名',
  `name_lminister` varchar(45) NOT NULL COMMENT '左丞角色名',
  `name_rminister` varchar(45) NOT NULL COMMENT '右相角色名',
  `name_lguard` varchar(45) NOT NULL COMMENT '左护卫角色名',
  `name_rguard` varchar(45) NOT NULL COMMENT '右护卫角色名',
  `kingsuit` int(11) NOT NULL COMMENT '国王装领取标记',
  `kingqicheng` int(11) NOT NULL COMMENT '国王坐骑领取标记',
  `resource0` int(11) NOT NULL COMMENT '国家资源 木材',
  `resource1` int(11) NOT NULL COMMENT '国家资源 食物',
  `resource2` int(11) NOT NULL COMMENT '国家资源 金钱',
  `resource3` int(11) NOT NULL COMMENT '国家资源 石头',
  `notice` varchar(255) NOT NULL COMMENT '国家公告',
  `intervalcontrol` text NOT NULL COMMENT '时间值控制数据',
  `freeparam` varchar(2560) NOT NULL COMMENT '国家自定义数据',
  `crc` int(10) unsigned zerofill NOT NULL COMMENT '校验码',
  `qinglongbang` SMALLINT NOT NULL DEFAULT -1 COMMENT '青龙帮帮会ID',
  `qinglongbangzhuguid` INTEGER UNSIGNED NOT NULL DEFAULT 4294967295 COMMENT '青龙帮主GUID',
  `qinglongbangzhuname` VARCHAR(45) NOT NULL COMMENT '青龙帮主角色名',
  `zhuquebang` SMALLINT NOT NULL DEFAULT -1 COMMENT '朱雀帮帮会ID',
  `zhuquebangzhuguid` INTEGER UNSIGNED NOT NULL DEFAULT 4294967295 COMMENT '朱雀帮主GUID',
  `zhuquebangzhuname` VARCHAR(45) NOT NULL COMMENT '朱雀帮主角色名',
  `qinglongbang_challenge` SMALLINT NOT NULL DEFAULT '-1' COMMENT '青龙挑战帮帮会ID',
  `qinglongbangzhuguid_challenge` INTEGER UNSIGNED NOT NULL DEFAULT 4294967295 COMMENT '青龙挑战帮主GUID',
  `qinglongbangzhuname_challenge` VARCHAR(45) NOT NULL COMMENT '青龙挑战帮主角色名',
  `zhuquebang_challenge` SMALLINT NOT NULL DEFAULT '-1' COMMENT '朱雀挑战帮帮会ID',
  `zhuquebangzhuguid_challenge` INTEGER UNSIGNED NOT NULL DEFAULT 4294967295 COMMENT '朱雀挑战帮主GUID', 
  `zhuquebangzhuname_challenge` VARCHAR(45) NOT NULL COMMENT '朱雀挑战帮主角色名',
  `empire_data` varchar(2048) not null default '' COMMENT '皇帝数据',
  `empire_notice` varchar(256) not null default '' COMMENT '皇帝公告',
  PRIMARY KEY  (`countryid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_friend`
--
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `aid` bigint(20) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `fguid` int(10) unsigned NOT NULL COMMENT '对方GUID',
  `ftype` int(10) unsigned NOT NULL COMMENT '类型 1:好友 16:临时好友 256:夫妻 4096:黑名单 65536:仇人 ',
  `fname` varchar(45) NOT NULL COMMENT '对方角色名',
  `flevel` int(10) unsigned NOT NULL COMMENT '对方GUID',
  `fprofession` int(10) unsigned NOT NULL COMMENT '对方职业',
  `fportrait` int(10) unsigned NOT NULL COMMENT '对方头像',
  `fguild` int(10) unsigned NOT NULL COMMENT '对方帮会ID',
  `fguildname` varchar(45) NOT NULL COMMENT '对方帮会名',
  `ftitle` varchar(45) NOT NULL COMMENT '对方称号',
  `fmapid` int(10) unsigned NOT NULL COMMENT '对方场景ID',
  `fteamsize` int(10) unsigned NOT NULL COMMENT '对方队伍人数',
  `fgovernmentpos` int(10) unsigned NOT NULL COMMENT '对方官职',
  `fcountry` int(10) unsigned NOT NULL COMMENT '对方国家ID',
  `fmasterguid` int(10) unsigned NOT NULL COMMENT '师父GUID',
  `fincreasefptime` int(10) unsigned NOT NULL COMMENT '上次增加好友度的时间点',
  `flock` int(10) unsigned NOT NULL COMMENT '锁定标记',
  `ffriendpoint` int(10) unsigned NOT NULL COMMENT '好友度',
  `version` int(10) NOT NULL COMMENT '数据版本',
  PRIMARY KEY  (`aid`),
  KEY `Index_playerguid` USING HASH (`playerguid`),
  KEY `Index_friend_fguid`(`fguid`),
  KEY `Index_friend_fname`(`fname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_guild`  帮会表
--
DROP TABLE IF EXISTS `t_guild`;
CREATE TABLE `t_guild` (
  `aid` bigint(20) NOT NULL auto_increment,
  `guildid` int(11) NOT NULL COMMENT '帮会ID',
  `guildname` varchar(150) NOT NULL COMMENT '帮会名',
  `guildstat` int(11) NOT NULL COMMENT '帮会状态 1有效 0无效',
  `chiefguid` int(10) unsigned NOT NULL COMMENT '帮主GUID',
  `proposecount` int(11) NOT NULL COMMENT '已废弃',
  `usercount` int(11) NOT NULL COMMENT '帮会成员数量',
  `familycount` int(11) NOT NULL COMMENT '家族数量',
  `guildpoint` int(11) NOT NULL COMMENT '帮会经验',
  `guildmoney` int(11) NOT NULL COMMENT '帮会金钱',
  `cityid` int(11) NOT NULL COMMENT '已废弃',
  `time` int(11) NOT NULL COMMENT '帮会成立时间',
  `logevity` int(11) NOT NULL COMMENT '已废弃',
  `contribu` int(11) NOT NULL COMMENT '已废弃',
  `honor` int(11) NOT NULL COMMENT '已废弃',
  `guilddesc` varchar(512) not null default '' COMMENT '帮会公告',
  `valid` int(11) NOT NULL COMMENT '有效标记位',
  `familydesc` varchar(150) NOT NULL default '' COMMENT '已废弃',
  `chiefname` varchar(150) NOT NULL COMMENT '帮主角色名',
  `asschiefname` varchar(150) NOT NULL COMMENT '副帮主角色名',
  `creatorname` varchar(150) NOT NULL COMMENT '创建者角色名',
  `guildlevel` int(11) NOT NULL COMMENT '帮会等级',
  `totalgp` int(11) NOT NULL COMMENT '已废弃',
  `familyuser` varchar(1920) not null default '' COMMENT '家族数据',
  `convoylist` varchar(12816) not null default '' COMMENT '帮会拉镖数据',
  `maxuser` int(11) NOT NULL COMMENT '已废弃',
  `maxfamily` int(11) NOT NULL COMMENT '已废弃',
  `maxfamilyuser` int(11) NOT NULL COMMENT '已废弃',
  `maxgoldfamilyuser` int(11) NOT NULL COMMENT '已废弃',
  `asschiefguid` int(10) unsigned NOT NULL COMMENT '副帮主GUID',
  `lastmoddesctime` int(11) NOT NULL COMMENT '修改帮会公告时间',
  `lastmodtitletime` int(11) NOT NULL COMMENT '修改帮会成员称号的时间',
  `lastmodfamilynametime` int(11) NOT NULL COMMENT '修改家族名称的时间',
  `destroycountdown` int(11) NOT NULL COMMENT '帮会解散计时',
  `countryid` int(11) NOT NULL COMMENT '帮会所属国家ID',
  `freeparam` varchar(2048) not null default '' COMMENT '帮会自定义数据',
  `expbuildcount` int(11) NOT NULL COMMENT '帮会建设次数',
  `expbuildday` int(11) NOT NULL COMMENT '帮会建设时间点',
  `isneedrename` int(11) unsigned zerofill NOT NULL COMMENT '改名标记',
  `newguildname` varchar(150) NOT NULL default '$' COMMENT '改名',
  `crc` int(10) unsigned zerofill NOT NULL COMMENT '校验码',
  `shiming` int(10) unsigned zerofill NOT NULL COMMENT '使命点',
  PRIMARY KEY  (`aid`),
  KEY `guildid` (`guildid`),
  KEY `guildname` USING HASH (`guildname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_guildmember`  帮会成员表
--
DROP TABLE IF EXISTS `t_guildmember`;
CREATE TABLE `t_guildmember` (
  `aid` bigint(20) NOT NULL auto_increment,
  `guildid` smallint(6) NOT NULL COMMENT '帮会ID',
  `userguid` int(10) unsigned NOT NULL COMMENT '帮会成员GUID',
  `username` varchar(45) NOT NULL COMMENT '帮会成员角色名',
  `userindex` int(11) NOT NULL COMMENT '帮会成员序号',
  `position` int(11) NOT NULL COMMENT '帮会职位',
  `lastlogintime` int(10) unsigned NOT NULL COMMENT '上一次登录时间',
  `level` int(10) unsigned NOT NULL COMMENT '等级',
  `professionid` smallint(6) NOT NULL COMMENT '职业',
  `curContribute` int(11) NOT NULL COMMENT '帮贡值',
  `maxContribute` int(11) NOT NULL COMMENT '最大帮贡值',
  `jointime` int(11) NOT NULL COMMENT '入帮时间',
  `familyid` int(11) NOT NULL COMMENT '家族ID',
  `sex` smallint(6) NOT NULL COMMENT '性别',
  `guildpoint` int(11) NOT NULL COMMENT '已废弃',
  `titlename` varchar(45) NOT NULL COMMENT '帮会称号',
  `merit` int(10) unsigned zerofill NOT NULL COMMENT '帮会功德值',
  PRIMARY KEY  (`aid`),
  KEY `guildid` (`guildid`),
  KEY `userguid` (`userguid`),
  KEY `username` USING HASH (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_guildrename`  帮会重命名表
--
DROP TABLE IF EXISTS `t_guildrename`;
CREATE TABLE `t_guildrename` (
  `aid` bigint(20) NOT NULL auto_increment,
  `guildid` int(10) unsigned NOT NULL COMMENT '帮会ID',
  `oldname` varchar(50) NOT NULL COMMENT '旧帮会名',
  `newname` varchar(50) NOT NULL default '@' COMMENT '新帮会名',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `Index_newname` USING HASH (`newname`),
  KEY `Index_guild_guildid` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_effect`  BUFF表
--
DROP TABLE IF EXISTS `t_effect`;
CREATE TABLE `t_effect` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `effectdata` varchar(128) not null default '' COMMENT 'BUFF数据',
  `version` int(11) NOT NULL default '0' COMMENT '数据版本',
  PRIMARY KEY  (`aid`),
  KEY `Index_effect_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_item`  物品表
--
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `guid` int(11) NOT NULL COMMENT '物品ID guid位',
  `world` int(11) NOT NULL COMMENT '物品ID world位',
  `server` int(11) NOT NULL COMMENT '物品ID server位',
  `itemclass` int(11) NOT NULL COMMENT '物品类型',
  `slot` smallint(6) NOT NULL COMMENT '物品位置',
  `creator` varchar(40) default '0' COMMENT '物品创建者',
  `valid` smallint(6) NOT NULL default '1' COMMENT '有效标记位',
  `version` int(11) default '0' COMMENT '数据版本',
  `dataproperty` varchar(512) NOT NULL default '0' COMMENT '物品详细属性数据',
  `data` varchar(40) NOT NULL COMMENT '物品参数数据',
  `termendtime` int(11) NOT NULL COMMENT '物品到期时间',
  `count` int(10) unsigned NOT NULL COMMENT '物品数量',
  `islock` int(11) NOT NULL COMMENT '物品锁定标记',
  `unlocktime` int(10) unsigned NOT NULL COMMENT '物品解锁时间',
  PRIMARY KEY  (`aid`),
  KEY `Index_it_playerguid` (`playerguid`),
  KEY `Index_it_itemguid` (`guid`,`world`,`server`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_itemserial`  物品GUID分配表
--
DROP TABLE IF EXISTS `t_itemserial`;
CREATE TABLE `t_itemserial` (
  `aid` bigint(20) NOT NULL auto_increment,
  `sid` int(11) default NULL COMMENT '服务器ID',
  `dbskey` int(11) default NULL COMMENT '未使用',
  `sn` int(11) default NULL COMMENT '物品GUID分配序号',
  PRIMARY KEY  (`aid`),
  KEY `Index_tik_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_mail`  邮件表
--
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `aid` bigint(20) NOT NULL auto_increment,
  `sendername` varchar(50) NOT NULL COMMENT '发件人角色名',
  `receivername` varchar(50) NOT NULL COMMENT '收件人角色名',
  `mailcontent` text NOT NULL COMMENT '邮件内容',
  `pindex` int(11) NOT NULL COMMENT '邮件编号',
  `valid` int(11) NOT NULL default '0' COMMENT '有效标记位',
  `playerguid` int(10) unsigned default '4294967295' COMMENT '发件者GUID',
  `portrait` int(11) NOT NULL COMMENT '发件者头像',
  `flag` int(10) unsigned NOT NULL COMMENT '邮件类型:0普通邮件 1普通邮件 2脚本邮件 3系统邮件',
  `createtime` int(10) unsigned NOT NULL COMMENT '邮件创建时间',
  `param0` int(10) unsigned NOT NULL COMMENT '邮件参数0(flag=2时有效)',
  `param1` int(10) unsigned NOT NULL COMMENT '邮件参数1(flag=2时有效)',
  `param2` int(10) unsigned NOT NULL COMMENT '邮件参数2(flag=2时有效)',
  `param3` int(10) unsigned NOT NULL COMMENT '邮件参数3(flag=2时有效)',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `Index_mail_pIndex` (`pindex`),
  KEY `Index_recer` USING HASH (`receivername`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_marry`  夫妻表
--
DROP TABLE IF EXISTS `t_marry`;
CREATE TABLE `t_marry` (
  `aid` bigint(20) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `spouseguid` int(10) unsigned NOT NULL COMMENT '配偶GUID',
  `marrytime` int(10) unsigned zerofill NOT NULL COMMENT '结婚时间',
  `ishavewedding` smallint(5) unsigned zerofill NOT NULL COMMENT '婚礼标记',
  `valid` int not null default 1 COMMENT '有效标记位',
  PRIMARY KEY  (`aid`),
  KEY `Index_playerguid` USING HASH (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_master`  师徒表
--
DROP TABLE IF EXISTS `t_master`;
CREATE TABLE `t_master` (
  `aid` bigint(20) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `masterguid` int(10) unsigned NOT NULL COMMENT '师父GUID',
  `valid` int not null default 1 COMMENT '有效标记位',
  PRIMARY KEY  (`aid`),
  KEY `Index_playerguid` USING HASH (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_master_candidate`  师徒报名表
--
DROP TABLE IF EXISTS `t_master_candidate`;
CREATE TABLE `t_master_candidate` (
  `aid` bigint(20) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `playername` varchar(45) NOT NULL COMMENT '角色名',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_quest`  任务表
--
DROP TABLE IF EXISTS `t_quest`;
CREATE TABLE `t_quest` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned default NULL COMMENT '角色GUID',
  `questid` int(11) default NULL COMMENT '任务ID',
  `scriptid` int(11) default NULL COMMENT '任务脚本ID',
  `flag` smallint(6) default NULL COMMENT '任务标记',
  `param1` int(11) default NULL COMMENT '任务参数1',
  `param2` int(11) default NULL COMMENT '任务参数2',
  `param3` int(11) default NULL COMMENT '任务参数3',
  `param4` int(11) default NULL COMMENT '任务参数4',
  `param5` int(11) default NULL COMMENT '任务参数5',
  `param6` int(11) default NULL COMMENT '任务参数6',
  `param7` int(11) default NULL COMMENT '任务参数7',
  `param8` int(11) default NULL COMMENT '任务参数8',
  `version` int(11) default NULL COMMENT '数据版本',
  PRIMARY KEY  (`aid`),
  KEY `Index_quest_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_horse`  坐骑表
--
DROP TABLE IF EXISTS `t_horse`;
CREATE TABLE `t_horse` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `hhorseguid` int(10) unsigned NOT NULL COMMENT '坐骑GUID高位',
  `lhorseguid` int(10) unsigned NOT NULL COMMENT '坐骑GUID低位',
  `dataid` int(11) NOT NULL COMMENT '坐骑类型',
  `horsename` varchar(50) NOT NULL COMMENT '坐骑名字',
  `horsenick` varchar(50) NOT NULL COMMENT '坐骑昵称',
  `level` int(11) NOT NULL COMMENT '坐骑等级',
  `takelevel` int(11) NOT NULL COMMENT '坐骑携带等级',
  `propertytype` int(11) NOT NULL COMMENT '坐骑攻击类型(无意义)',
  `behaviortype` int(11) NOT NULL COMMENT '坐骑行为类型',
  `campdata` varchar(32) not null default '' COMMENT '坐骑阵营数据',
  `genera` int(11) NOT NULL COMMENT '坐骑繁殖代数',
  `enjoyvalue` int(11) NOT NULL COMMENT '坐骑快乐度',
  `strpervalue` int(11) NOT NULL COMMENT '坐骑力量资质',
  `conpervalue` int(11) NOT NULL COMMENT '坐骑敏捷资质',
  `dexpervalue` int(11) NOT NULL COMMENT '坐骑智力资质',
  `iprpervalue` int(11) NOT NULL COMMENT '坐骑体质资质',
  `growratevalue` int(11) NOT NULL COMMENT '坐骑成长率',
  `repointvalue` int(11) NOT NULL COMMENT '坐骑潜能点',
  `exp` int(11) NOT NULL COMMENT '坐骑经验',
  `strvalue` int(11) NOT NULL COMMENT '坐骑力量属性',
  `convalue` int(11) NOT NULL COMMENT '坐骑敏捷属性',
  `dexvalue` int(11) NOT NULL COMMENT '坐骑智力属性',
  `iprvalue` int(11) NOT NULL COMMENT '坐骑体质属性',
  `skilldata` varchar(256) not null default '' COMMENT '坐骑技能数据',
  `version` int(11) NOT NULL COMMENT '数据版本',
  `strpoint` int(11) NOT NULL COMMENT '坐骑力量点数',
  `smartpoint` int(11) NOT NULL COMMENT '坐骑敏捷点数',
  `mindpoint` int(11) NOT NULL COMMENT '坐骑智力点数',
  `conpoint` int(11) NOT NULL COMMENT '坐骑体质点数',
  `modelid` int(11) NOT NULL COMMENT '坐骑模型ID',
  `mat` int(11) NOT NULL COMMENT '坐骑合成状态',
  `happinesslefttime` int(11) NOT NULL COMMENT '坐骑快乐度下降的时间计数，单位毫秒',
  `stallorder` int(11) NOT NULL COMMENT '坐骑槽位',
  `islock` int(11) NOT NULL COMMENT '坐骑是否被锁定',
  `unlocktime` int(10) unsigned NOT NULL COMMENT '坐骑解锁时间',
  PRIMARY KEY  (`aid`),
  KEY `Index_horse_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_prentice`  徒弟表
--
DROP TABLE IF EXISTS `t_prentice`;
CREATE TABLE `t_prentice` (
  `aid` bigint(20) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '师父GUID',
  `prenticeguid` int(10) unsigned NOT NULL COMMENT '徒弟GUID',
  `offlinetime` int(10) unsigned zerofill NOT NULL COMMENT '离线时间',
  `valid` int not null default 1 COMMENT '有效标记位',
  PRIMARY KEY  (`aid`),
  KEY `Index_playerguid` USING HASH (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_prentice_candidate`  徒弟报名表
--
DROP TABLE IF EXISTS `t_prentice_candidate`;
CREATE TABLE `t_prentice_candidate` (
  `aid` bigint(20) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `playername` varchar(45) NOT NULL COMMENT '角色名',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_mapvar`  场景动态数据表
--
DROP TABLE IF EXISTS `t_mapvar`;
CREATE TABLE `t_mapvar` (
  `aid` bigint(20) NOT NULL auto_increment,
  `sid` int(11) default NULL COMMENT '场景ID',
  `data` varchar(512) not null default '' COMMENT '场景动态数据',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `Index_mapvar_pindex` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_shop`  现金寄售挂单表
--
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `aid` int(11) NOT NULL auto_increment,
  `serialid` int(11) NOT NULL COMMENT '交易序列号',
  `shopid` int(11) NOT NULL COMMENT '商店ID',
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `playername` char(30) character set latin1 collate latin1_general_ci NOT NULL COMMENT '角色名',
  `gold` int(11) NOT NULL COMMENT '金额',
  `charge` int(11) NOT NULL COMMENT '手续费',
  `price` int(11) NOT NULL COMMENT '价格',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `deleteTime` int(11) default NULL COMMENT '删除时间',
  `buyerguid` int(10) unsigned default NULL COMMENT '购买者GUID',
  `valid` smallint(6) NOT NULL default '1' COMMENT '有效标记位',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_spell`  技能表
--
DROP TABLE IF EXISTS `t_spell`;
CREATE TABLE `t_spell` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `skid` int(11) NOT NULL COMMENT '技能ID',
  `version` int(11) NOT NULL COMMENT '数据版本',
  `skstate` int(11) NOT NULL COMMENT '技能状态',
  `sklevel` int(11) NOT NULL COMMENT '技能等级',
  PRIMARY KEY  (`aid`),
  KEY `Index_skill_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_stockaccount`  股票帐户表
--
DROP TABLE IF EXISTS `t_stockaccount`;
CREATE TABLE `t_stockaccount` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `playerguid` int(11) unsigned NOT NULL COMMENT '角色GUID',
  `playername` char(30) NOT NULL COMMENT '角色名',
  `gold` int(11) NOT NULL COMMENT '股票帐户现金数量',
  `siller` int(11) NOT NULL COMMENT '股票帐户现银数量',
  `lasttradetime` int(11) unsigned NOT NULL COMMENT '最近交易时间',
  `createtime` int(11) unsigned NOT NULL COMMENT '帐户创建时间',
  `valid` int(11) NOT NULL default '1' COMMENT '有效标记位',
  `lockstate` int(11) NOT NULL COMMENT '锁定标记',
  `locktime` int(10) unsigned NOT NULL COMMENT '锁定时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_stockrecord`  股票交易历史表
--
DROP TABLE IF EXISTS `t_stockrecord`;
CREATE TABLE `t_stockrecord` (
  `aid` int(11) unsigned NOT NULL auto_increment,
  `serialid` int(11) unsigned NOT NULL COMMENT '交易序号',
  `playerguid` int(11) unsigned NOT NULL COMMENT '角色GUID',
  `tradetime` int(11) unsigned NOT NULL COMMENT '交易时间',
  `tradetype` int(11) NOT NULL COMMENT '交易类型:0买单 1卖单',
  `tradegold` int(11) unsigned NOT NULL COMMENT '交易金额',
  `tradeprice` int(11) NOT NULL COMMENT '交易价格',
  `valid` int(11) NOT NULL default '1' COMMENT '有效标记位',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_stocktrade`  股票交易表
--
DROP TABLE IF EXISTS `t_stocktrade`;
CREATE TABLE `t_stocktrade` (
  `aid` int(11) unsigned NOT NULL auto_increment,
  `serialId` int(11) unsigned NOT NULL COMMENT '交易序号',
  `playerguid` int(11) unsigned NOT NULL COMMENT '角色GUID',
  `playername` char(30) NOT NULL COMMENT '角色名',
  `price` int(11) NOT NULL COMMENT '交易价格',
  `gold` int(11) unsigned NOT NULL COMMENT '交易金额',
  `charge` int(11) NOT NULL COMMENT '交易手续费',
  `tradeType` int(11) NOT NULL COMMENT '交易类型:0买单 1卖单',
  `createTime` int(11) unsigned NOT NULL COMMENT '挂单时间',
  `deleteTime` int(11) unsigned NOT NULL COMMENT '撤单时间',
  `valid` int(11) NOT NULL default '1' COMMENT '有效标记位',
  PRIMARY KEY  (`aid`),
  KEY `serialIdIndex` (`serialId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_toplist`  排行榜表
--
DROP TABLE IF EXISTS `t_toplist`;
CREATE TABLE `t_toplist` (
  `aid` bigint(20) NOT NULL auto_increment,
  `toplistid` int(11) NOT NULL COMMENT '数据序号',
  `guid` int(10) unsigned NOT NULL COMMENT '数据标识GUID',
  `level` int(11) NOT NULL COMMENT '等级',
  `country` int(11) NOT NULL COMMENT '国家',
  `playername` varchar(60) default '' COMMENT '角色名',
  `profession` int(11) NOT NULL COMMENT '职业',
  `guildname` varchar(60) default '' COMMENT '帮会名',
  `keyvalue` int(11) NOT NULL COMMENT '数据值',
  `type` int(11) NOT NULL COMMENT '榜类型',
  `typename` char(32) NOT NULL COMMENT '榜类型',
  `enterdate` int(11) NOT NULL COMMENT '进榜时间',
  `place` int(11) NOT NULL COMMENT '排序位置',
  PRIMARY KEY  (`aid`),
  KEY `toplistIdIndex` (`toplistid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_guidserial`  角色GUID分配表
--
DROP TABLE IF EXISTS `t_guidserial`;
CREATE TABLE `t_guidserial` (
  `maxplayerguid` int(10) unsigned NOT NULL COMMENT '角色分配GUID',
  PRIMARY KEY  (`maxplayerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_player_ext`  角色扩展表
--
DROP TABLE IF EXISTS `t_player_ext`;
CREATE TABLE `t_player_ext` (
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `shopfavorite` varchar(512) not null default '' COMMENT '购买收藏列表',
  `shopbuyhistory` varchar(512) not null default '' COMMENT '购买历史表',
  `battlehonour` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '战场荣誉',
  `critRate_balance` int(11) NOT NULL default 0 COMMENT '暴击平衡级别',
  `toughness_balance` int(11) NOT NULL default 0 COMMENT '韧性平衡级别',
  `hit_balance` int(11) NOT NULL default 0 COMMENT '命中平衡级别',
  `miss_balance` int(11) NOT NULL default 0 COMMENT '闪避平衡级别',
  `critDamage_balance` int(11) NOT NULL default 0 COMMENT '暴击伤害平衡级别',
  `critDamageDerate_balance` int(11) NOT NULL default 0 COMMENT '暴击减免平衡级别',
  `ctrlHit_balance` int(11) NOT NULL default 0 COMMENT '控制命中平衡级别',
  `ctrlMiss_balance` int(11) NOT NULL default 0 COMMENT '控制抵抗平衡级别',
  
  `wushi_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(武士)',
  `jianxia_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(剑侠)',
  `qishe_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(骑射)',
  `huoqiang_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(火枪)',
  `xianzhi_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(先知)',
  `saman_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(萨满)',
  `shizhijun_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(十字军)',
  `shenghuoshi_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(圣火使)',
  `cike_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(刺客)',
  `jinweijun_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(禁卫军)',
  `yinxiushi_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(隐修士)',
  `lama_zhangong_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻等级(僧侣)',
 
  `wushi_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(武士)',
  `jianxia_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(剑侠)',
  `qishe_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(骑射)',
  `huoqiang_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(火枪)',
  `xianzhi_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(先知)',
  `saman_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(萨满)',
  `shizhijun_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(十字军)',
  `shenghuoshi_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(圣火使)',
  `cike_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(刺客)',
  `jinweijun_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(禁卫军)',
  `yinxiushi_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(隐修士)',
  `lama_zhangong_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻点数(僧侣)', 
 
  `total_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻剩余系数点数', 
 
  `wushi_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(武士)',
  `jianxia_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(剑侠)',
  `qishe_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(骑射)',
  `huoqiang_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(火枪)',
  `xianzhi_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(先知)',
  `saman_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(萨满)',
  `shizhijun_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(十字军)',
  `shenghuoshi_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(圣火使)',
  `cike_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(刺客)',
  `jinweijun_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(禁卫军)',
  `yinxiushi_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(隐修士)',
  `lama_zhangong_coefficient` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专攻系数点数分配(僧侣)',  
 
  `tatol_zhanfang_point` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防点数',  
 
  `wushi_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(武士)',
  `jianxia_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(剑侠)',
  `qishe_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(骑射)',
  `huoqiang_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(火枪)',
  `xianzhi_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(先知)',
  `saman_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(萨满)',
  `shizhijun_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(十字军)',
  `shenghuoshi_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(圣火使)',
  `cike_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(刺客)',
  `jinweijun_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(禁卫军)',
  `yinxiushi_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(隐修士)',
  `lama_zhanfang_level` int(11) NOT NULL DEFAULT 0 COMMENT '天赋专防等级(僧侣)',
  `militaryrank_level` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '军阶等级',
  `militaryrank_onlinetime` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '军阶在线时间',
  `militaryrank_todayonlinetime` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '军阶当天在线时间',
  `militaryrank_todaydate` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '军阶时间点记录',
  `hellsubskill` varchar(128) not null default '' COMMENT '冥甲术数据',
  `physicalforce` int(11) NOT NULL DEFAULT 0 COMMENT '体力值',
  `maxphysicalforce` int(11) NOT NULL DEFAULT 0 COMMENT '最大体力值',
  `chariot_honour` int(10) unsigned NOT NULL default 0 COMMENT '战车荣誉',
  `chariot_honour_data` varchar(196) NOT NULL default '' COMMENT '战车荣誉记录数据',
  `cashcosttotal` int(11) NOT NULL default '0' COMMENT '现金消费总数',
  `moneyawardtotal` int(11) NOT NULL default '0' COMMENT '消费现金奖励金钱总数',
  `valid` int not null default 1 COMMENT '有效标记位',
  
  PRIMARY KEY  (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_guildskill`  帮会技能表
--
DROP TABLE IF EXISTS `t_guildskill`;
CREATE TABLE `t_guildskill` (  
`aid` bigint(20) NOT NULL auto_increment,  
`guildid` smallint(6) NOT NULL COMMENT '帮会ID',  
`skillid` int(11) NOT NULL COMMENT '技能ID',  
`skillindex` int(11) NOT NULL COMMENT '技能序号',  
`skilllevel` int(11) NOT NULL COMMENT '技能等级',  
`skilllayer` int(11) NOT NULL COMMENT '未使用',  
PRIMARY KEY  (`aid`),  
INDEX `Index_guildskill_guildid` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_dynamicshop`  动态商店表
--
DROP TABLE IF EXISTS `t_dynamicshop`;
CREATE TABLE `t_dynamicshop` (
  `aid` bigint(20) NOT NULL auto_increment COMMENT '递增序号',
  `shopid` tinyint unsigned NOT NULL COMMENT '商店ID',
  `shopindex` tinyint unsigned NOT NULL COMMENT '物品在商店中的位置',
  `count` tinyint unsigned NOT NULL COMMENT '物品剩余数',
  `price` int NOT NULL COMMENT '当前价格',
  `tick` int NOT NULL COMMENT '当前时间',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table t_chariot  战车表
--
DROP TABLE IF EXISTS `t_chariot`;
CREATE TABLE `t_chariot` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `hguid` int(10) unsigned NOT NULL COMMENT '战车高位GUID',
  `lguid` int(10) unsigned NOT NULL COMMENT '战车低位GUID',
  `dataid` int(11) NOT NULL COMMENT '战车类型ID',
  `name` varchar(50) NOT NULL COMMENT '战车名',
  `level` int(11) NOT NULL COMMENT '战车等级',
  `hp` int(11) NOT NULL COMMENT '血',
  `mp` int(11) NOT NULL COMMENT '蓝',
  `element` int(11) NOT NULL COMMENT '战车元素属性',
  `growrate` int(11) NOT NULL COMMENT '战车成长率',
  `skilldata` varchar(360) NOT NULL COMMENT '战车技能数据',
  `equipdata` varchar(8192) NOT NULL COMMENT '战车装备数据',
  `version` int(11) NOT NULL COMMENT '数据版本',
  PRIMARY KEY  (`aid`),
  KEY `Index_chariot_playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table t_lostitem  遗失物品表
--
DROP TABLE IF EXISTS `t_lostitem`;
CREATE TABLE `t_lostitem` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '失主GUID',
  `srcplayerguid` int(10) unsigned NOT NULL COMMENT '窃贼GUID',
  `srcplayername` varchar(50) NOT NULL COMMENT '窃贼角色名',
  `guid` int(11) NOT NULL default 0 COMMENT '物品GUID guid位',
  `world` int(11) NOT NULL default 0 COMMENT '物品GUID world位',
  `server` int(11) NOT NULL default 0 COMMENT '物品GUID server位',
  `itemclass` int(11) NOT NULL default 0 COMMENT '物品类型',
  `creator` varchar(40) NOT NULL default '' COMMENT '物品创建者',
  `dataproperty` varchar(512) NOT NULL default '' COMMENT '物品详细属性数据',
  `data` varchar(40) NOT NULL default '' COMMENT '物品参数数据',
  `termendtime` int(11) NOT NULL default 0 COMMENT '物品到期时间',
  `islock` int(11) NOT NULL default 0 COMMENT '物品锁定标记',
  `unlocktime` int(10) unsigned NOT NULL default 0 COMMENT '物品解锁时间',
  `gmoptime` int(10) unsigned NOT NULL default 0 COMMENT 'GM操作时间',
  PRIMARY KEY  (`aid`),
  KEY `Index_lostitem_playerguid` (`playerguid`),
  KEY `Index_lostitem_itemguid` (`guid`,`world`,`server`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `t_mpvppoint`  跨服战场积分表
--
DROP TABLE IF EXISTS `t_mpvppoint`;
CREATE TABLE `t_mpvppoint` (
   `aid` bigint(20) NOT NULL auto_increment,
   `unitid` int(11) NOT NULL default '0' COMMENT '存储单位Id',
   `unitname` varchar(50) NOT NULL COMMENT '存储单位名字',
   `world` int(11) NOT NULL default '0' COMMENT '服务器Id',
   `currentpoint` int(11) NOT NULL default '0' COMMENT '当前赛季的积分',
   `totalpoint` int(11) NOT NULL default '0' COMMENT '总积分',   
   `currentwintimes` int(11) NOT NULL default '0' COMMENT '当前赛季赢得的场次',
   `currentjointimes` int(11) NOT NULL default '0' COMMENT '当前赛季参加的场次',
   `totalwintimes` int(11) NOT NULL default '0' COMMENT '总共赢得的场次',
   `totaljointimes` int(11) NOT NULL default '0' COMMENT '总共参加的场次',
   `mpvptypename` varchar(50) NOT NULL COMMENT '跨服战的类型',
   `currentweek` int(11) NOT NULL default '0' COMMENT '当前周',
   `startweek` int(11) NOT NULL default '0' COMMENT '开始周',
   `params` int(11) NOT NULL default '-1' COMMENT '附加参数',
   `valid` int(11) NOT NULL default '0' COMMENT '有效字段',
   PRIMARY KEY  (`aid`),
   KEY `unitid` (`unitid`, `world`)
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `t_item`  坐骑装备表
--
DROP TABLE IF EXISTS `t_horseequip`;
CREATE TABLE `t_horseequip` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `hhorseguid` int(10) unsigned NOT NULL COMMENT '高位坐骑GUID',
  `lhorseguid` int(10) unsigned NOT NULL COMMENT '低位坐骑GUID',
  `guid` int(11) NOT NULL COMMENT '物品ID guid位',
  `world` int(11) NOT NULL COMMENT '物品ID world位',
  `server` int(11) NOT NULL COMMENT '物品ID server位',
  `itemclass` int(11) NOT NULL COMMENT '物品类型',
  `slot` smallint(6) NOT NULL COMMENT '物品位置',
  `creator` varchar(40) default '0' COMMENT '物品创建者',
  `valid` smallint(6) NOT NULL default '1' COMMENT '有效标记位',
  `version` int(11) default '0' COMMENT '数据版本',
  `dataproperty` varchar(512) NOT NULL default '0' COMMENT '物品详细属性数据',
  `data` varchar(40) NOT NULL COMMENT '物品参数数据',
  `termendtime` int(11) NOT NULL COMMENT '物品到期时间',
  `count` int(10) unsigned NOT NULL COMMENT '物品数量',
  `islock` int(11) NOT NULL COMMENT '物品锁定标记',
  `unlocktime` int(10) unsigned NOT NULL COMMENT '物品解锁时间',
  PRIMARY KEY  (`aid`),
  KEY `Index_it_playerguid` (`playerguid`),
  KEY `Index_it_horseguid` (`hhorseguid`,`lhorseguid`),
  KEY `Index_it_itemguid` (`guid`,`world`,`server`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `t_substitute`;
CREATE TABLE `t_substitute` (
`aid` bigint(20) NOT NULL auto_increment,
`playerguid` int(10) unsigned NOT NULL,
`playername` varchar(60) NOT NULL COMMENT '角色名',
`mapid`	int(10) NOT NULL COMMENT '地图Id',
`xpos` int(11) NOT NULL COMMENT 'x坐标',
`zpos` int(11) NOT NULL COMMENT 'z坐标',
`profession` int(11) NOT NULL COMMENT '职业',
`extexp` int(10) unsigned NOT NULL COMMENT '额外经验',
`offlinetime` int(10) unsigned NOT NULL COMMENT '离线时间',
`camp`	int(10) unsigned NOT NULL COMMENT '阵营',
`sex`	int(10) unsigned NOT NULL COMMENT '性别',
`valid` int(11) NOT NULL COMMENT '有效标识',
PRIMARY KEY  (`aid`),
KEY `playerguid` (`playerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 家园表结构
DROP TABLE IF EXISTS `t_garden`;
CREATE TABLE `t_garden` (
`aid` bigint(20) NOT NULL auto_increment,
`gardenid` int(10) unsigned NOT NULL COMMENT '家园GUID',
`playerguid` int(10) unsigned NOT NULL COMMENT '玩家GUID',
`playername` varchar(60) NOT NULL default '' COMMENT '角色名',
`level` smallint(6) NOT NULL COMMENT '家园等级',
`viewgroup` int(10) unsigned NOT NULL COMMENT '家园所使用的镜像组',
`flag` tinyint(4) NOT NULL default 0 COMMENT '该家园的怪是否已被击杀标志',
`monster` varchar(160) NOT NULL COMMENT '家园怪物',
`version` int(11) NOT NULL COMMENT '家园数据版本',
`valid` int(11) NOT NULL COMMENT '有效标识',
PRIMARY KEY  (`aid`),
KEY `playerguid` (`playerguid`),
KEY `gardenid` (`gardenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 家园资源表结构
DROP TABLE IF EXISTS `t_gardenres`;
CREATE TABLE `t_gardenres` (
`aid` bigint(20) NOT NULL auto_increment,
`gardenid` int(10) unsigned NOT NULL COMMENT '家园GUID',
`resourceid` int(10) unsigned NOT NULL COMMENT '资源Id',
`resourcetype` tinyint(4) NOT NULL COMMENT '资源类型',
`resourcepos` tinyint(4) NOT NULL COMMENT '资源位置',
`resourcenum` int(10) unsigned NOT NULL COMMENT '资源数量',
`resourcestate` tinyint(4) NOT NULL COMMENT '资源状态',
`resourcelevel` tinyint(4) NOT NULL COMMENT '土地等级',
`maturetime` int(10) unsigned NOT NULL COMMENT '成熟时间',
`valid` int(11) NOT NULL COMMENT '有效标识',
PRIMARY KEY  (`aid`),
KEY `gardenid` (`gardenid`,`resourcepos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 招募关系表
DROP TABLE IF EXISTS `t_recruit`;
CREATE TABLE `t_recruit` (
`aid` bigint(20) NOT NULL auto_increment,
`selfsnid` int(10) unsigned NOT NULL,
`recruittype` smallint(5) unsigned NOT NULL,
`playersnid` int(10) unsigned NOT NULL,
`playercountry` smallint(6) NOT NULL,
`playername` varchar(50) default NULL,
`playerguild` int(10) NOT NULL,
`playerguildname` varchar(120) default NULL,
`playerlevel` int(10) unsigned NOT NULL,
`valid` smallint(5) unsigned NOT NULL,
`recruitlevel` int(10) unsigned NOT NULL,
`recruitexp` int(10) unsigned NOT NULL,
`playerProfession` smallint(5) unsigned NOT NULL,
PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 经脉表
DROP TABLE IF EXISTS `t_channelmeridian`;
CREATE TABLE `t_channelmeridian` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playersnid` int(10) unsigned NOT NULL,
  `modetype` smallint(5) unsigned NOT NULL,
  `flagtype` smallint(5) unsigned NOT NULL,
  `protype1` smallint(5) NOT NULL,
  `provalue1` smallint(5) unsigned NOT NULL,
  `protype2` smallint(5) NOT NULL,
  `provalue2` smallint(5) unsigned NOT NULL,
  `protype3` smallint(5) NOT NULL,
  `provalue3` smallint(5) unsigned NOT NULL,
  `protype4` smallint(5) NOT NULL,
  `provalue4` smallint(5) unsigned NOT NULL,
  `valid` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 家园子资源表结构
DROP TABLE IF EXISTS `t_gardensubres`;
CREATE TABLE `t_gardensubres` (
`aid` bigint(20) NOT NULL auto_increment,
`gardenid` int(10) unsigned NOT NULL COMMENT '家园GUID',
`respos` int(10) unsigned NOT NULL COMMENT '资源位置',
`subpos` int(10) unsigned NOT NULL COMMENT '子资源位置',
`substate` tinyint(4) NOT NULL COMMENT '子资源状态',
`valid` int(11) NOT NULL COMMENT '有效标识',
PRIMARY KEY  (`aid`),
KEY `gardenid` (`gardenid`,`respos`,`subpos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- procedure routines
--
DELIMITER ;;

--
-- procedure proc_add_toplist
--
DROP PROCEDURE IF EXISTS `proc_add_toplist`;;
CREATE PROCEDURE `proc_add_toplist`(
p_toplistid		int,
p_guid			int unsigned,
p_level			int,
p_country		int,
p_playername	varchar(60),
p_profession	int,
p_guildname		varchar(60),
p_keyvalue		int,
p_typename		char(32),
p_enterdate		int,
p_place			int
)
BEGIN
	insert into t_toplist(
		toplistid,
		guid,
		level,
		country,
		playername,
		profession,
		guildname,
		keyvalue,
		type,
		typename,
		enterdate,
		place) 
	values(
		p_toplistid,
		p_guid,
		p_level,
		p_country,
		p_playername,
		p_profession,
		p_guildname,
		p_keyvalue,
		0,
		p_typename,
		p_enterdate,
		p_place );
END;;


--
-- procedure proc_change_player_name
--
DROP PROCEDURE IF EXISTS `proc_change_player_name`;;
CREATE PROCEDURE `proc_change_player_name`(pplayerguid INT UNSIGNED, pnewname varchar(150))
BEGIN
	DECLARE exception,presult INT DEFAULT 0;
	DECLARE visneedrename INT DEFAULT 0;
	DECLARE viscanusenewname INT DEFAULT 0;
	DECLARE voldname CHAR(150);
	DECLARE visrenamed INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET exception = 1;
	SELECT count(*) INTO visneedrename from t_player where playerguid=pplayerguid and valid=1;
	IF visneedrename = 1 then
		SELECT count(*) INTO viscanusenewname from t_player where playername=pnewname;
		IF viscanusenewname = 0 then
			SELECT count(*) INTO viscanusenewname from t_playerrename where newname=pnewname;
		END IF;
    
		IF viscanusenewname = 0 then
			START TRANSACTION;
			SELECT count(*) INTO visrenamed from t_playerrename where playerguid=pplayerguid;
			if visrenamed = 0 then
				select playername into voldname from t_player where playerguid=pplayerguid;
				insert into t_playerrename(playerguid,oldname,newname) values(pplayerguid,voldname,pnewname);
			else
				update t_playerrename set newname=pnewname where playerguid=pplayerguid;
			end if;
			update t_player set isneedrename=0 where playerguid=pplayerguid;
			COMMIT;
			SET presult = 1;
		ELSE
			SET presult = 0;
		END IF;
	END IF;
	
	SELECT presult;
END;;


--
-- procedure proc_change_guild_name
--
DROP PROCEDURE IF EXISTS `proc_change_guild_name`;;
CREATE PROCEDURE `proc_change_guild_name`(pplayerguid INT UNSIGNED, pnewname varchar(150))
BEGIN
	DECLARE exception,presult INT DEFAULT 0;
	DECLARE vguildid,visneedrename INT DEFAULT 0;
	DECLARE voldname CHAR(150);
	DECLARE viscanusenewname INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET exception = 1;
  SELECT count(*) INTO visneedrename from t_guild where chiefguid=pplayerguid and isneedrename = 1;
  IF visneedrename = 1 then
		SELECT count(*) INTO viscanusenewname from t_guild where guildname=pnewname;
		
		IF viscanusenewname = 0 then
    	SELECT count(*) INTO viscanusenewname from t_guildrename where newname=pnewname;
    END IF;

    IF viscanusenewname = 0 then
	    START TRANSACTION;
	    SELECT guildid,guildname INTO vguildid,voldname from t_guild where chiefguid=pplayerguid and isneedrename=1;
			update t_guild set isneedrename=0 where chiefguid=pplayerguid and isneedrename = 1;
			insert into t_guildrename(guildid,oldname,newname) values(vguildid,voldname,pnewname);
	
    	COMMIT;
    	SET presult = 1;
		ELSE
			SET presult = 0;
		END IF;
	END IF;
	SELECT presult;
END;;


--
-- procedure proc_create_newplayer
--
DROP PROCEDURE IF EXISTS `proc_create_newplayer`;;
CREATE PROCEDURE `proc_create_newplayer`(
paccountname              varchar(50) binary,
pplayername             varchar(50) binary,
psex                  smallint,
pcreatetime           int,
phaircolorvale            int,
phairmodelvalue            int,
pfacecolorvalue            int,
pfacemodelvalue            int,
pheadid               int,
pprofession         smallint,
pcountry                int,
padid			  int,
pdbflag				int unsigned)
BEGIN
	declare rguid      	  int unsigned default -1;
	declare result		  int default -1;
	declare isinrenametable		  int default 0;
	start transaction;
	select count(*) into isinrenametable from t_playerrename where newname=pplayername;
	select playerguid into rguid from t_player where playername=pplayername limit 1;
	
	if found_rows() = 0 and isinrenametable = 0 then
	set rguid = -1;
	update t_guidserial set maxplayerguid=maxplayerguid+1;
	select maxplayerguid into rguid from t_guidserial limit 1;
	
	if rguid <> -1 then
	 insert into t_player(accountname,playerguid,playername,title,password,sex,level,enegry,outlook,map,x,z,profession,
	  country,hp,mp,strikepoint,strvalue,convalue,dexvalue,sprvalue,iprvalue,points,logouttime,logintime,createtime,version,haircolordata,
	  hairmodeldata,facecolordata,facemodeldata,vmoney,settings,valid,exp,skillpres,
	  guldid,teamid,headid,erecover,vigor,maxvigor,vrecover,energymax,pwdeltime,
	  privateinfo,bkmap,bkx,bkz,nextmap,nextx,nextz,titleinfo,dietime,bankcount,bankend,cooldown,rage,silver,gold,bsilver,bgold,moneymode,
	  rongyu,shengwang,wencai,passwordflag,lastpttime,pttime,ptdeltime,busid,pkvalue,
	  lastmutetime,lastenjailtime,honor,honordata,inherexp,soulid,gemaff,guildpoint,adid,dbflag,cardbagsize)
	 values(paccountname,rguid,pplayername,'','',psex,1,0,0,0,100,100,pprofession,
	  pcountry,5000,5000,0,5,5,5,5,5,0,0,0,pcreatetime,0,phaircolorvale,
	  phairmodelvalue,pfacecolorvalue,pfacemodelvalue,0,'',1,0,'',
		-1,-1,pheadid,0,0,0,0,0,0,
		'',0,0,0,-1,0,0,'',0,0,36,'',0,0,0,0,0,0,
	         0,0,0,0,0,0,0,-1,0,0,0,0,'',0,0,-1,0,padid,pdbflag,96);
	 select row_count() into result;
	else
	 set result = -3;
	end if;
	else
	 set result = -2;
	end if;
	commit;
	SELECT result,rguid;
END;;


--
-- procedure proc_delete_player_new
--
DROP PROCEDURE IF EXISTS `proc_delete_player_new`;;
CREATE PROCEDURE `proc_delete_player_new`(
paccount              varchar(100),
pplayerguid             int unsigned)
BEGIN
	declare rplayerguid   int unsigned;
	declare rlevel      int;
	declare rdeltime    int;
	declare rnext       int;
	declare rversion  int;
	set     rplayerguid = -1;
	set     rnext = 0;
	set     rversion = 0;
	start transaction;
	          update t_player set valid = 0 where accountname= paccount and playerguid = pplayerguid;
	commit;
	select rnext,rversion;
END;;


--
-- procedure proc_fetch_guid
--
DROP PROCEDURE IF EXISTS `proc_fetch_guid`;;
CREATE PROCEDURE `proc_fetch_guid`()
BEGIN
	declare playerguid  int unsigned default -1;
	start transaction;
	select t_guidserial.maxplayerguid into playerguid from t_guidserial limit 1; 
	if playerguid<>-1 then
	    update t_guidserial set t_guidserial.maxplayerguid = playerguid+1 where t_guidserial.maxplayerguid=playerguid;
	end if;
	commit;
	select playerguid;
END;;


--
-- procedure proc_fill_mapvar
--
DROP PROCEDURE IF EXISTS `proc_fill_mapvar`;;
CREATE PROCEDURE `proc_fill_mapvar`()
BEGIN
	declare v int;
	set v = 0;
	while v<2049 do
	    insert into t_mapvar(sid,data) values(v,'');
	    set v = v +1;
	end while;
END;;


--
-- procedure proc_save_guildinfo
--
DROP PROCEDURE IF EXISTS `proc_save_guildinfo`;;
CREATE PROCEDURE `proc_save_guildinfo`(
pguildid				int,
pguildname				varchar(150),
pguildstat				int,
pchiefguid				int unsigned,
pusercount				int,
pfamilycount			int,
pguildpoint				int,
pguildmoney				int,
ptime					int,
plogevity				int,
pcontribu				int,
phonor					int,
pguilddesc				varchar(512) ,
pchiefname				varchar(150)  ,
passchiefname			varchar(150),
pcreatorname			varchar(150)  ,
pguildlevel				int ,
ptotalguildpoint		int,
pfamilyuser				varchar(1920),
pconvoylist				varchar(12816),
passchiefguid			int unsigned,
plastmoddesctime		int,
plastmodtitletime		int,
plastmodfamilynametime	int,
pdestroycountdown		int,
pcountryid				int,
pexpbuildcount			int,
pexpbuildday			int,
pfreeparam				varchar(2048),
pcrc					int unsigned,
pshiming				int,
pvalid					int
)
BEGIN
	declare rcount int;
	select guildid into rcount from t_guild where guildid = pguildid;
	if rcount = pguildid then
		update t_guild set 
			guildname=pguildname ,
			guildstat=pguildstat ,
			chiefguid=pchiefguid ,
			usercount=pusercount,    
			familycount=pfamilycount,   
			guildpoint=pguildpoint,    
			guildmoney=pguildmoney,
			time=ptime,      
			logevity=plogevity,  
			contribu=pcontribu,  
			honor=phonor,     
			guilddesc=pguilddesc, 
			chiefname=pchiefname, 
			asschiefname=passchiefname,
			creatorname=pcreatorname,     
			guildlevel=pguildlevel,      
			totalgp=ptotalguildpoint,
			familyuser=pfamilyuser,
			convoylist= pconvoylist,
			asschiefguid=passchiefguid,
			lastmoddesctime=plastmoddesctime,
			lastmodtitletime=plastmodtitletime,
			lastmodfamilynametime=plastmodfamilynametime,
			destroycountdown=pdestroycountdown,
			countryid=pcountryid,
			expbuildcount=pexpbuildcount,
			expbuildday=pexpbuildday,
			freeparam=pfreeparam,
			crc=pcrc,
			shiming=pshiming,
			valid=pvalid
		where guildid=pguildid;
	else
		insert into t_guild
			(guildid,
			guildname,   
			guildstat,   
			chiefguid,   
			usercount,      
			familycount,     
			guildpoint,      
			guildmoney,  
			time,        
			logevity,    
			contribu,    
			honor,       
			guilddesc,   
			chiefname, 
			asschiefname,
			creatorname,       
			guildlevel,        
			totalgp,
			familyuser,
			convoylist,
			asschiefguid,
			lastmoddesctime,
			lastmodtitletime,
			lastmodfamilynametime,
			destroycountdown,
			countryid,
			expbuildcount,
			expbuildday,
			freeparam,
			crc,
			shiming,
			valid)
		values
			(pguildid,       
			pguildname,     
			pguildstat ,    
			pchiefguid,     
			pusercount  ,   
			pfamilycount ,  
			pguildpoint  ,      
			pguildmoney,    
			ptime ,         
			plogevity  ,    
			pcontribu ,     
			phonor  ,       
			pguilddesc   ,
			pchiefname  ,   
			passchiefname  ,
			pcreatorname  ,       
			pguildlevel  ,        
			ptotalguildpoint,       
			pfamilyuser   , 
			pconvoylist   , 
			passchiefguid  ,
			plastmoddesctime,
			plastmodtitletime,
			plastmodfamilynametime,
			pdestroycountdown,
			pcountryid,
			pexpbuildcount,
			pexpbuildday,
			pfreeparam,
			pcrc,
			pshiming,
			pvalid);
	end if;
END;;


--
-- procedure proc_save_iteminfo
--
DROP PROCEDURE IF EXISTS `proc_save_iteminfo`;;
CREATE PROCEDURE `proc_save_iteminfo`(
pplayerguid				int unsigned,
pguid					int,
pworld					int,
pserver					int,
pitemclass				int,
pslot					smallint,
pdataproperty			varchar(512),
pversion				int,
pcreator				varchar(40),
ptermendtime			int,
pdata					varchar(40),
pcount					int,
pislock					int,
punlocktime				int unsigned)
BEGIN
	declare vcount int default 0;
	select count(1) into vcount from t_item where playerguid=pplayerguid and slot=pslot;

	if vcount >= 1 then
		update t_item set
			playerguid=pplayerguid,
			world=pworld,
			server=pserver,
			guid=pguid,
			itemclass=pitemclass,
			slot=pslot,
			dataproperty=pdataproperty,
			version=pversion,
			creator=pcreator,
			termendtime=ptermendtime,
			data=pdata,
			count=pcount,
			islock=pislock,
			unlocktime=punlocktime,
			valid=1
		where playerguid=pplayerguid and slot=pslot limit 1;
	else
		insert into t_item(playerguid,world,server,guid,itemclass,slot,dataproperty,version,creator,termendtime,data,count,islock,unlocktime,valid)
				values(pplayerguid,pworld,pserver,pguid,pitemclass,pslot,pdataproperty,pversion,pcreator,ptermendtime,pdata,pcount,pislock,punlocktime,1);
	end if;
END;;


--
-- procedure proc_save_mailinfo
--
DROP PROCEDURE IF EXISTS `proc_save_mailinfo`;;
CREATE PROCEDURE `proc_save_mailinfo`(
psendername varchar(50),
preceivername varchar(50),
pContext varchar(300),
pGuid int unsigned,
pPortrait int,
pFlag int unsigned,
pCreateTime int unsigned,
pParam0 int unsigned,
pParam1 int unsigned,
pParam2 int unsigned,
pParam3 int unsigned,
vIndex int,
pValid int)
BEGIN
	declare rcount int;
	select pindex into rcount from t_mail where pindex = vIndex;
	if rcount = vIndex then
		update t_mail set sendername=psendername,receivername=preceivername,mailcontent=pContext,playerguid=pGuid,portrait=pPortrait,flag=pFlag,
							createtime=pCreateTime,param0=pParam0,param1=pParam1,param2=pParam2,param3=pParam3,valid=pValid 
				where pindex=vIndex;
	else
		insert into t_mail(pindex,sendername,receivername,mailcontent,playerguid,portrait,flag,createtime,param0,param1,param2,param3,valid)
			  values(vIndex,psendername,preceivername,pContext,pGuid,pPortrait,pFlag,pCreateTime,pParam0,pParam1,pParam2,pParam3,pValid);
	end if;
END;;


--
-- procedure proc_update_stockaccount
--
DROP PROCEDURE IF EXISTS `proc_update_stockaccount`;;
CREATE PROCEDURE `proc_update_stockaccount`(
p_playerguid		int unsigned,
p_playername		varchar(60),
p_gold			int,
p_siller		int,
p_lasttradetime	int unsigned,
p_createTime 	int unsigned,
p_lockstate 	int,
p_locktime		int unsigned	
)
BEGIN
	DECLARE vishave INT DEFAULT 0;
  	SELECT count(*) INTO vishave from t_stockaccount where playerguid=p_playerguid and valid=1;
	if vishave = 0 then
		insert into t_stockaccount (playerguid,playername,gold,siller,lasttradetime,createtime,lockstate) values(p_playerguid,p_playername,p_gold,p_siller,p_lasttradetime,p_createTime,p_lockstate);
	else
		update t_stockaccount set gold=p_gold,siller=p_siller,lasttradetime=p_lasttradetime,lockstate=p_lockstate,locktime=p_locktime where playerguid=p_playerguid and valid=1;
	end if;
END;;


--
-- procedure proc_update_stocktrade
--
DROP PROCEDURE IF EXISTS `proc_update_stocktrade`;;
CREATE PROCEDURE `proc_update_stocktrade`(
p_serialid		int unsigned,
p_playerguid		int unsigned,
p_playername		varchar(60),
p_price			int,
p_gold			int unsigned,
p_charge		int,
p_tradeType		int,
p_createTime 	int unsigned,
p_deleteTime 	int unsigned
)
BEGIN
	DECLARE vishave INT DEFAULT 0;
  	SELECT count(*) INTO vishave from t_stocktrade where serialid=p_serialid;
	if vishave = 0 then
		insert into t_stocktrade(serialId,playerguid,playername,price,gold,charge,tradeType,createTime,deleteTime) values(p_serialid,p_playerguid,p_playername,p_price,p_gold,p_charge,p_tradeType,p_createTime,p_deleteTime);
	else
		update t_stocktrade set playerguid=p_playerguid,playername=p_playername,price=p_price,gold=p_gold,charge=p_charge,tradeType=p_tradeType,createTime=p_createTime ,deleteTime=p_deleteTime,valid=1 where serialid=p_serialid;
	end if;
END;;

--
-- function func_get_mountdataid
--
DROP FUNCTION IF EXISTS `func_get_mountmodelid`;;
CREATE FUNCTION `func_get_mountmodelid`( p_playerguid INTEGER unsigned, p_hhorseguid INTEGER unsigned, p_lhorseguid INTEGER unsigned ) returns INTEGER
BEGIN
	DECLARE vmodelid int default -1;
	select modelid into vmodelid from `t_horse` where playerguid=p_playerguid and hhorseguid=p_hhorseguid and lhorseguid=p_lhorseguid and version<>-1;
	return vmodelid;
END;;


--
-- procedure proc_save_spellinfo
--
DROP PROCEDURE IF EXISTS `proc_save_spellinfo`;;
CREATE PROCEDURE `proc_save_spellinfo`(
pplayerguid				int unsigned,
pskid					int,
pskstate				int,
psklevel				int,
pversion				int
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_spell where playerguid=pplayerguid and skid=pskid and version=-1;
	
	if rcount >= 1 then
		update t_spell set
			skstate = pskstate,
			sklevel = psklevel,
			version = pversion
			where playerguid=pplayerguid and skid=pskid and version=-1 limit 1;
	else
		insert into t_spell(playerguid,skid,skstate,sklevel,version) values(pplayerguid,pskid,pskstate,psklevel,pversion);
	end if;
END;;

--
-- procedure proc_save_skillinfo
--
DROP PROCEDURE IF EXISTS `proc_save_skillinfo`;;
CREATE PROCEDURE `proc_save_skillinfo`(
pplayerguid				int unsigned,
pskillid				int,
pskilllvl				int,
pskillexp				int,
pversion				int
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_skill where playerguid=pplayerguid and skillid=pskillid and version=-1;
	
	if rcount >= 1 then
		update t_skill set
			skilllvl = pskilllvl,
			skillexp = pskillexp,
			version = pversion
			where playerguid=pplayerguid and skillid=pskillid and version=-1 limit 1;
	else
		insert into t_skill(playerguid,skillid,skilllvl,skillexp,version) values(pplayerguid,pskillid,pskilllvl,pskillexp,pversion);
	end if;
END;;

--
-- procedure proc_save_questinfo
--
DROP PROCEDURE IF EXISTS `proc_save_questinfo`;;
CREATE PROCEDURE `proc_save_questinfo`(
pplayerguid	int unsigned,
pquestid	int,
pscriptid	int,
pflag		int,
pparam1		int,
pparam2		int,
pparam3		int,
pparam4		int,
pparam5		int,
pparam6		int,
pparam7		int,
pparam8		int,
pversion	int
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_quest where playerguid=pplayerguid and questid=pquestid and version=-1;
	
	if rcount >= 1 then
		update t_quest set
			scriptid = pscriptid,
			flag = pflag,
			param1 = pparam1,
			param2 = pparam2,
			param3 = pparam3,
			param4 = pparam4,
			param5 = pparam5,
			param6 = pparam6,
			param7 = pparam7,
			param8 = pparam8,
			version = pversion
			where playerguid=pplayerguid and questid=pquestid and version=-1 limit 1;
	else
		insert into t_quest(playerguid,questid,scriptid,flag,param1,param2,param3,param4,param5,param6,param7,param8,version) 
					values(pplayerguid,pquestid,pscriptid,pflag,pparam1,pparam2,pparam3,pparam4,pparam5,pparam6,pparam7,pparam8,pversion);
	end if;
END;;

--
-- procedure proc_save_friendinfo
--
DROP PROCEDURE IF EXISTS `proc_save_friendinfo`;;
CREATE PROCEDURE `proc_save_friendinfo`(
pplayerguid int unsigned,
pfguid int unsigned,
pftype int,
pfname varchar(128),
pflevel int,
pfprofession int,
pfportrait int,
pfguild int unsigned,
pfguildname varchar(128),
pftitle varchar(128),
pfmapid int,
pfteamsize int,
pfgovernmentpos int,
pfcountry int,
pfmasterguid int,
pfincreasefptime int,
pflock int,
pffriendpoint int,
pversion int
)
BEGIN
	declare vaid bigint default -1;
	select `aid` into vaid from t_friend use index(Index_playerguid) where playerguid=pplayerguid and fguid=pfguid and version=-1 limit 1;
	
	if vaid <> -1 then
		update t_friend set
			ftype = pftype,
			fname = pfname,
			flevel = pflevel,
			fprofession = pfprofession,
			fportrait = pfportrait,
			fguild = pfguild,
			fguildname = pfguildname,
			ftitle = pftitle,
			fmapid = pfmapid,
			fteamsize = pfteamsize,
			fgovernmentpos = pfgovernmentpos,
			fcountry = pfcountry,
			fmasterguid = pfmasterguid,
			fincreasefptime = pfincreasefptime,
			flock = pflock,
			ffriendpoint = pffriendpoint,
			version = pversion
		where aid=vaid;
	else
		insert into t_friend(playerguid,fguid,ftype,fname,flevel,fprofession,fportrait,fguild,fguildname,ftitle,fmapid,fteamsize,fgovernmentpos,fcountry,fmasterguid,fincreasefptime,flock,ffriendpoint,version) 
					values(pplayerguid,pfguid,pftype,pfname,pflevel,pfprofession,pfportrait,pfguild,pfguildname,pftitle,pfmapid,pfteamsize,pfgovernmentpos,pfcountry,pfmasterguid,pfincreasefptime,pflock,pffriendpoint,pversion);
	end if;
END;;

--
-- procedure proc_save_masterinfo
--
DROP PROCEDURE IF EXISTS `proc_save_masterinfo`;;
CREATE PROCEDURE `proc_save_masterinfo`(
pplayerguid int unsigned,
pmasterguid int unsigned
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_master where playerguid=pplayerguid and masterguid=pmasterguid and valid=0;
	
	if rcount >= 1 then
		update t_master set valid=1 where playerguid=pplayerguid and masterguid=pmasterguid and valid=0 limit 1;
	else
		insert into t_master(playerguid,masterguid,valid) values(pplayerguid,pmasterguid,1);
	end if;	
END;;


--
-- procedure proc_save_prenticeinfo
--
DROP PROCEDURE IF EXISTS `proc_save_prenticeinfo`;;
CREATE PROCEDURE `proc_save_prenticeinfo`(
pplayerguid int unsigned,
pprenticeguid int unsigned,
pofflinetime int unsigned
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_prentice where playerguid=pplayerguid and pprenticeguid=prenticeguid and valid=0;
	
	if rcount >= 1 then
		update t_prentice set offlinetime=pofflinetime,valid=1 where playerguid=pplayerguid and pprenticeguid=prenticeguid and valid=0 limit 1;
	else
		insert into t_prentice(playerguid,prenticeguid,offlinetime,valid) values(pplayerguid,pprenticeguid,pofflinetime,1);
	end if;	
END;;


--
-- procedure proc_save_marryinfo
--
DROP PROCEDURE IF EXISTS `proc_save_marryinfo`;;
CREATE PROCEDURE `proc_save_marryinfo`(
pplayerguid int unsigned,
pspouseguid int unsigned,
pmarrytime int unsigned,
pishavewedding int
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_marry where playerguid=pplayerguid and pspouseguid=spouseguid and valid=0;
	
	if rcount >= 1 then
		update t_marry set marrytime=pmarrytime,ishavewedding=pishavewedding,valid=1 where playerguid=pplayerguid and pspouseguid=spouseguid and valid=0 limit 1;
	else
		insert into t_marry(playerguid,spouseguid,marrytime,ishavewedding,valid) values(pplayerguid,pspouseguid,pmarrytime,pishavewedding,1);
	end if;	
END;;


--
-- procedure proc_save_effectinfo
--
DROP PROCEDURE IF EXISTS `proc_save_effectinfo`;;
CREATE PROCEDURE `proc_save_effectinfo`(
pplayerguid int unsigned,
peffectdata varchar(128),
pversion int
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_effect where playerguid=pplayerguid and version=-1;
	
	if rcount >= 1 then
		update t_effect set effectdata=peffectdata,version=pversion where playerguid=pplayerguid and version=-1 limit 1;
	else
		insert into t_effect(playerguid,effectdata,version) values(pplayerguid,peffectdata,pversion);
	end if;	
END;;


--
-- procedure proc_save_horseinfo
--
DROP PROCEDURE IF EXISTS `proc_save_horseinfo`;;
CREATE PROCEDURE `proc_save_horseinfo`(
pplayerguid int unsigned,
phhorseguid int unsigned,
plhorseguid int unsigned,
pdataid int,
phorsename varchar(128),
phorsenick varchar(128),
plevel int,
ptakelevel int,
ppropertytype int,
pbehaviortype int,
pcampdata varchar(32),
pgenera int,
penjoyvalue int,
pstrpervalue int,
pconpervalue int,
pdexpervalue int,
piprpervalue int,
pgrowratevalue int,
prepointvalue int,
pexp int,
pstrvalue int,
pconvalue int,
pdexvalue int,
piprvalue int,
pskilldata varchar(256),
pversion int,
pstrpoint int,
psmartpoint int,
pmindpoint int,
pconpoint int,
pmodelid int,
pmat int,
phappinesslefttime int,
pstallorder int,
pislock int,
punlocktime int unsigned
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_horse where playerguid=pplayerguid and hhorseguid=phhorseguid and lhorseguid=plhorseguid and version=-1;
	
	if rcount >= 1 then
		update t_horse set
			dataid=pdataid,
			horsename=phorsename,
			horsenick=phorsenick,
			level=plevel,
			takelevel=ptakelevel,
			propertytype=ppropertytype,
			behaviortype=pbehaviortype,
			campdata=pcampdata,
			genera=pgenera,
			enjoyvalue=penjoyvalue,
			strpervalue=pstrpervalue,
			conpervalue=pconpervalue,
			dexpervalue=pdexpervalue,
			iprpervalue=piprpervalue,
			growratevalue=pgrowratevalue,
			repointvalue=prepointvalue,
			exp=pexp,
			strvalue=pstrvalue,
			convalue=pconvalue,
			dexvalue=pdexvalue,
			iprvalue=piprvalue,
			skilldata=pskilldata,
			version=pversion,
			strpoint=pstrpoint,
			smartpoint=psmartpoint,
			mindpoint=pmindpoint,
			conpoint=pconpoint,
			modelid=pmodelid,
			mat=pmat,
			happinesslefttime=phappinesslefttime,
			stallorder=pstallorder,
			islock=pislock,
			unlocktime=punlocktime
		where playerguid=pplayerguid and hhorseguid=phhorseguid and lhorseguid=plhorseguid and version=-1 limit 1;
	else
		insert into t_horse(
			playerguid,
			hhorseguid,
			lhorseguid,
			dataid,
			horsename,
			horsenick,
			level,
			takelevel,
			propertytype,
			behaviortype,
			campdata,
			genera,
			enjoyvalue,
			strpervalue,
			conpervalue,
			dexpervalue,
			iprpervalue,
			growratevalue,
			repointvalue,
			exp,
			strvalue,
			convalue,
			dexvalue,
			iprvalue,
			skilldata,
			version,
			strpoint,
			smartpoint,
			mindpoint,
			conpoint,
			modelid,
			mat,
			happinesslefttime,
			stallorder,
			islock,
			unlocktime)
		values(
			pplayerguid,
			phhorseguid,
			plhorseguid,
			pdataid,
			phorsename,
			phorsenick,
			plevel,
			ptakelevel,
			ppropertytype,
			pbehaviortype,
			pcampdata,
			pgenera,
			penjoyvalue,
			pstrpervalue,
			pconpervalue,
			pdexpervalue,
			piprpervalue,
			pgrowratevalue,
			prepointvalue,
			pexp,
			pstrvalue,
			pconvalue,
			pdexvalue,
			piprvalue,
			pskilldata,
			pversion,
			pstrpoint,
			psmartpoint,
			pmindpoint,
			pconpoint,
			pmodelid,
			pmat,
			phappinesslefttime,
			pstallorder,
			pislock,
			punlocktime);
	end if;
END;;

--
-- procedure proc_save_playerextinfo
--
DROP PROCEDURE IF EXISTS `proc_save_playerextinfo`;;
CREATE PROCEDURE `proc_save_playerextinfo`(
pplayerguid INT UNSIGNED,
pshopfavorite VARCHAR(512),
pshopbuyhistory VARCHAR(512),
pbattlehonour INT UNSIGNED,
pphysicalforce INT,
pmaxphysicalforce INT,
pcritRate_balance INT,
ptoughness_balance INT,
phit_balance INT,
pmiss_balance INT,
pcritDamage_balance INT,
pcritDamageDerate_balance INT,
pctrlHit_balance INT,
pctrlMiss_balance INT,
pwushi_zhangong_level INT,
pjianxia_zhangong_level INT,
pqishe_zhangong_level INT,
phuoqiang_zhangong_level INT,
pxianzhi_zhangong_level INT,
psaman_zhangong_level INT,
pshizhijun_zhangong_level INT,
pshenghuoshi_zhangong_level INT,
pcike_zhangong_level INT,
pjinweijun_zhangong_level INT,
pyinxiushi_zhangong_level INT,
plama_zhangong_level INT,
pwushi_zhangong_point INT,
pjianxia_zhangong_point INT,
pqishe_zhangong_point INT,
phuoqiang_zhangong_point INT,
pxianzhi_zhangong_point INT,
psaman_zhangong_point INT,
pshizhijun_zhangong_point INT,
pshenghuoshi_zhangong_point INT,
pcike_zhangong_point INT,
pjinweijun_zhangong_point INT,
pyinxiushi_zhangong_point INT,
plama_zhangong_point INT,
ptotal_zhangong_coefficient INT,
pwushi_zhangong_coefficient INT,
pjianxia_zhangong_coefficient INT,
pqishe_zhangong_coefficient INT,
phuoqiang_zhangong_coefficient INT,
pxianzhi_zhangong_coefficient INT,
psaman_zhangong_coefficient INT,
pshizhijun_zhangong_coefficient INT,
pshenghuoshi_zhangong_coefficient INT,
pcike_zhangong_coefficient INT,
pjinweijun_zhangong_coefficient INT,
pyinxiushi_zhangong_coefficient INT,
plama_zhangong_coefficient INT,
ptatol_zhanfang_point INT,
pwushi_zhanfang_level INT,
pjianxia_zhanfang_level INT,
pqishe_zhanfang_level INT,
phuoqiang_zhanfang_level INT,
pxianzhi_zhanfang_level INT,
psaman_zhanfang_level INT,
pshizhijun_zhanfang_level INT,
pshenghuoshi_zhanfang_level INT,
pcike_zhanfang_level INT,
pjinweijun_zhanfang_level INT,
pyinxiushi_zhanfang_level INT,
plama_zhanfang_level INT,
pmilitaryrank_level INT UNSIGNED,
pmilitaryrank_onlinetime INT UNSIGNED,
pmilitaryrank_todayonlinetime INT UNSIGNED,
pmilitaryrank_todaydate INT UNSIGNED,
phellsubskill VARCHAR(128),
pchariot_honour INT UNSIGNED,
pchariot_honour_data VARCHAR(196),
pcashcosttotal INT,
pmoneyawardtotal INT
)
BEGIN
	DECLARE rcount INT DEFAULT 0;
	SELECT COUNT(1) INTO rcount FROM t_player_ext WHERE playerguid=pplayerguid;
	
	IF rcount >= 1 THEN
		UPDATE t_player_ext SET
			shopfavorite=pshopfavorite,
			shopbuyhistory=pshopbuyhistory,
			battlehonour=pbattlehonour,
			physicalforce=pphysicalforce,
			maxphysicalforce=pmaxphysicalforce,
			critRate_balance=pcritRate_balance,
			toughness_balance=ptoughness_balance,
			hit_balance=phit_balance,
			miss_balance=pmiss_balance,
			critDamage_balance=pcritDamage_balance,
			critDamageDerate_balance=pcritDamageDerate_balance,
			ctrlHit_balance=pctrlHit_balance,
			ctrlMiss_balance=pctrlMiss_balance,
			wushi_zhangong_level=pwushi_zhangong_level,
			jianxia_zhangong_level=pjianxia_zhangong_level,
			qishe_zhangong_level=pqishe_zhangong_level,
			huoqiang_zhangong_level=phuoqiang_zhangong_level,
			xianzhi_zhangong_level=pxianzhi_zhangong_level,
			saman_zhangong_level=psaman_zhangong_level,
			shizhijun_zhangong_level=pshizhijun_zhangong_level,
			shenghuoshi_zhangong_level=pshenghuoshi_zhangong_level,
			cike_zhangong_level=pcike_zhangong_level,
			jinweijun_zhangong_level=pjinweijun_zhangong_level,
			yinxiushi_zhangong_level=pyinxiushi_zhangong_level,
			lama_zhangong_level=plama_zhangong_level,
			wushi_zhangong_point=pwushi_zhangong_point,
			jianxia_zhangong_point=pjianxia_zhangong_point,
			qishe_zhangong_point=pqishe_zhangong_point,
			huoqiang_zhangong_point=phuoqiang_zhangong_point,
			xianzhi_zhangong_point=pxianzhi_zhangong_point,
			saman_zhangong_point=psaman_zhangong_point,
			shizhijun_zhangong_point=pshizhijun_zhangong_point,
			shenghuoshi_zhangong_point=pshenghuoshi_zhangong_point,
			cike_zhangong_point=pcike_zhangong_point,
			jinweijun_zhangong_point=pjinweijun_zhangong_point,
			yinxiushi_zhangong_point=pyinxiushi_zhangong_point,
			lama_zhangong_point=plama_zhangong_point,
			total_zhangong_coefficient=ptotal_zhangong_coefficient,
			wushi_zhangong_coefficient=pwushi_zhangong_coefficient,
			jianxia_zhangong_coefficient=pjianxia_zhangong_coefficient,
			qishe_zhangong_coefficient=pqishe_zhangong_coefficient,
			huoqiang_zhangong_coefficient=phuoqiang_zhangong_coefficient,
			xianzhi_zhangong_coefficient=pxianzhi_zhangong_coefficient,
			saman_zhangong_coefficient=psaman_zhangong_coefficient,
			shizhijun_zhangong_coefficient=pshizhijun_zhangong_coefficient,
			shenghuoshi_zhangong_coefficient=pshenghuoshi_zhangong_coefficient,
			cike_zhangong_coefficient=pcike_zhangong_coefficient,
			jinweijun_zhangong_coefficient=pjinweijun_zhangong_coefficient,
			yinxiushi_zhangong_coefficient=pyinxiushi_zhangong_coefficient,
			lama_zhangong_coefficient=plama_zhangong_coefficient,
			tatol_zhanfang_point=ptatol_zhanfang_point,
			wushi_zhanfang_level=pwushi_zhanfang_level,
			jianxia_zhanfang_level=pjianxia_zhanfang_level,
			qishe_zhanfang_level=pqishe_zhanfang_level,
			huoqiang_zhanfang_level=phuoqiang_zhanfang_level,
			xianzhi_zhanfang_level=pxianzhi_zhanfang_level,
			saman_zhanfang_level=psaman_zhanfang_level,
			shizhijun_zhanfang_level=pshizhijun_zhanfang_level,
			shenghuoshi_zhanfang_level=pshenghuoshi_zhanfang_level,
			cike_zhanfang_level=pcike_zhanfang_level,
			jinweijun_zhanfang_level=pjinweijun_zhanfang_level,
			yinxiushi_zhanfang_level=pyinxiushi_zhanfang_level,
			lama_zhanfang_level=plama_zhanfang_level,
			militaryrank_level=pmilitaryrank_level,
			militaryrank_onlinetime=pmilitaryrank_onlinetime,
			militaryrank_todayonlinetime=pmilitaryrank_todayonlinetime,
			militaryrank_todaydate=pmilitaryrank_todaydate,
			hellsubskill=phellsubskill,
			chariot_honour=pchariot_honour,
			chariot_honour_data=pchariot_honour_data,
			cashcosttotal=pcashcosttotal,
			moneyawardtotal=pmoneyawardtotal,
			valid=1
		WHERE playerguid=pplayerguid LIMIT 1;
	ELSE
		INSERT INTO t_player_ext(
			playerguid,
			shopfavorite,
			shopbuyhistory,
			battlehonour,
			physicalforce,
			maxphysicalforce,
			critRate_balance,
			toughness_balance,
			hit_balance,
			miss_balance,
			critDamage_balance,
			critDamageDerate_balance,
			ctrlHit_balance,
			ctrlMiss_balance,
			wushi_zhangong_level,
			jianxia_zhangong_level,
			qishe_zhangong_level,
			huoqiang_zhangong_level,
			xianzhi_zhangong_level,
			saman_zhangong_level,
			shizhijun_zhangong_level,
			shenghuoshi_zhangong_level,
			cike_zhangong_level,
			jinweijun_zhangong_level,
			yinxiushi_zhangong_level,
			lama_zhangong_level,
			wushi_zhangong_point,
			jianxia_zhangong_point,
			qishe_zhangong_point,
			huoqiang_zhangong_point,
			xianzhi_zhangong_point,
			saman_zhangong_point,
			shizhijun_zhangong_point,
			shenghuoshi_zhangong_point,
			cike_zhangong_point,
			jinweijun_zhangong_point,
			yinxiushi_zhangong_point,
			lama_zhangong_point,
			total_zhangong_coefficient,
			wushi_zhangong_coefficient,
			jianxia_zhangong_coefficient,
			qishe_zhangong_coefficient,
			huoqiang_zhangong_coefficient,
			xianzhi_zhangong_coefficient,
			saman_zhangong_coefficient,
			shizhijun_zhangong_coefficient,
			shenghuoshi_zhangong_coefficient,
			cike_zhangong_coefficient,
			jinweijun_zhangong_coefficient,
			yinxiushi_zhangong_coefficient,
			lama_zhangong_coefficient,
			tatol_zhanfang_point,
			wushi_zhanfang_level,
			jianxia_zhanfang_level,
			qishe_zhanfang_level,
			huoqiang_zhanfang_level,
			xianzhi_zhanfang_level,
			saman_zhanfang_level,
			shizhijun_zhanfang_level,
			shenghuoshi_zhanfang_level,
			cike_zhanfang_level,
			jinweijun_zhanfang_level,
			yinxiushi_zhanfang_level,
			lama_zhanfang_level,
			militaryrank_level,
			militaryrank_onlinetime,
			militaryrank_todayonlinetime,
			militaryrank_todaydate,
			hellsubskill,
			chariot_honour,
			chariot_honour_data,
			cashcosttotal,
			moneyawardtotal,
			valid)
		VALUES
			(pplayerguid,
			pshopfavorite,
			pshopbuyhistory,
			pbattlehonour,
			pphysicalforce,
			pmaxphysicalforce,
			pcritRate_balance,
			ptoughness_balance,
			phit_balance,
			pmiss_balance,
			pcritDamage_balance,
			pcritDamageDerate_balance,
			pctrlHit_balance,
			pctrlMiss_balance,
			pwushi_zhangong_level,
			pjianxia_zhangong_level,
			pqishe_zhangong_level,
			phuoqiang_zhangong_level,
			pxianzhi_zhangong_level,
			psaman_zhangong_level,
			pshizhijun_zhangong_level,
			pshenghuoshi_zhangong_level,
			pcike_zhangong_level,
			pjinweijun_zhangong_level,
			pyinxiushi_zhangong_level,
			plama_zhangong_level,
			pwushi_zhangong_point,
			pjianxia_zhangong_point,
			pqishe_zhangong_point,
			phuoqiang_zhangong_point,
			pxianzhi_zhangong_point,
			psaman_zhangong_point,
			pshizhijun_zhangong_point,
			pshenghuoshi_zhangong_point,
			pcike_zhangong_point,
			pjinweijun_zhangong_point,
			pyinxiushi_zhangong_point,
			plama_zhangong_point,
			ptotal_zhangong_coefficient,
			pwushi_zhangong_coefficient,
			pjianxia_zhangong_coefficient,
			pqishe_zhangong_coefficient,
			phuoqiang_zhangong_coefficient,
			pxianzhi_zhangong_coefficient,
			psaman_zhangong_coefficient,
			pshizhijun_zhangong_coefficient,
			pshenghuoshi_zhangong_coefficient,
			pcike_zhangong_coefficient,
			pjinweijun_zhangong_coefficient,
			pyinxiushi_zhangong_coefficient,
			plama_zhangong_coefficient,
			ptatol_zhanfang_point,
			pwushi_zhanfang_level,
			pjianxia_zhanfang_level,
			pqishe_zhanfang_level,
			phuoqiang_zhanfang_level,
			pxianzhi_zhanfang_level,
			psaman_zhanfang_level,
			pshizhijun_zhanfang_level,
			pshenghuoshi_zhanfang_level,
			pcike_zhanfang_level,
			pjinweijun_zhanfang_level,
			pyinxiushi_zhanfang_level,
			plama_zhanfang_level,
			pmilitaryrank_level,
			pmilitaryrank_onlinetime,
			pmilitaryrank_todayonlinetime,
			pmilitaryrank_todaydate,
			phellsubskill,
			pchariot_honour,
			pchariot_honour_data,
			pcashcosttotal,
			pmoneyawardtotal,
			1);
	END IF;
END;;


--
-- procedure proc_save_chariotinfo
--
DROP PROCEDURE IF EXISTS `proc_save_chariotinfo`;;
CREATE PROCEDURE `proc_save_chariotinfo`(
pplayerguid int unsigned, 
phguid int unsigned, 
plguid int unsigned, 
pdataid int unsigned, 
pname varchar(50), 
plevel int, 
php int, 
pmp int, 
pelement int, 
pgrowrate int, 
pskilldata varchar(360), 
pequipdata varchar(8192), 
pversion int
)
BEGIN
	declare rcount int default 0;
	select count(1) into rcount from t_chariot where playerguid=pplayerguid and version=-1;
	
	if rcount >= 1 then
		update t_chariot set 
			hguid=phguid,
			lguid=plguid,
			dataid=pdataid,
			name=pname,
			`level`=plevel,
			hp=php,
			mp=pmp,
			element=pelement,
			growrate=pgrowrate,
			skilldata=pskilldata,
			equipdata=pequipdata,
			version=pversion
		where playerguid=pplayerguid and version=-1 limit 1;
	else
		insert into t_chariot(playerguid,hguid,lguid,dataid,name,`level`,hp,mp,element,growrate,skilldata,equipdata,version) 
						values(pplayerguid,phguid,plguid,pdataid,pname,plevel,php,pmp,pelement,pgrowrate,pskilldata,pequipdata,pversion);
	end if;	
END;;

--
-- procedure proc_save_mpvppoint
--
DROP PROCEDURE IF EXISTS `proc_save_mpvppoint`;;
CREATE PROCEDURE `proc_save_mpvppoint`(
punitid INT,
punitname VARCHAR(50),
pworldid INT,
pcurrentpoint INT,
ptotalpoint INT,
pcurrentwintimes INT,
pcurrentjointimes INT,
ptotalwintimes INT,
ptotaljointimes INT,
pmpvptypename VARCHAR(32),
pcurrentweek INT,
pstartweek INT,
pparams INT,
pvalid INT
)
BEGIN
	DECLARE tempunitid   INT;
	DECLARE tempworld     INT;
	DECLARE tempmpvptypename VARCHAR(32);
	
	SELECT unitid, world, mpvptypename INTO tempunitid, tempworld, tempmpvptypename FROM t_mpvppoint 
		WHERE unitid=punitid AND world=pworldid AND mpvptypename=pmpvptypename;
	
	IF (tempunitid=punitid AND tempworld=pworldid AND tempmpvptypename=pmpvptypename) THEN
		UPDATE t_mpvppoint SET 
			unitname=punitname,
			currentpoint=pcurrentpoint,
			totalpoint=ptotalpoint,			
			currentwintimes=pcurrentwintimes,
			currentjointimes=pcurrentjointimes,
			totalwintimes=ptotalwintimes,
			totaljointimes=ptotaljointimes,
			currentweek=pcurrentweek,
			startweek=pstartweek,
			params=pparams,
			valid=pvalid
		WHERE unitid=punitid AND world=pworldid AND mpvptypename=pmpvptypename;
	ELSE
		INSERT INTO t_mpvppoint
			(
			unitid,
			unitname, 
			world, 
			currentpoint,
			totalpoint, 			
			currentwintimes, 
			currentjointimes,
			totalwintimes,
			totaljointimes,
			mpvptypename, 
			currentweek,
			startweek,
			params,
			valid
			)
			VALUES			
			(
			punitid,
			punitname,
			pworldid,
			pcurrentpoint,
			ptotalpoint,			
			pcurrentwintimes,
			pcurrentjointimes,
			ptotalwintimes,
			ptotaljointimes,
			pmpvptypename,
			pcurrentweek,
			pstartweek,
			pparams,
			pvalid
			);
	END IF;
END;;

DROP PROCEDURE IF EXISTS `proc_save_horseequip`;;
CREATE PROCEDURE `proc_save_horseequip`(
pplayerguid	INT UNSIGNED,
phhorseguid	INT UNSIGNED,
plhorseguid		INT UNSIGNED,
pguid					INT,
pworld					INT,
pserver					INT,
pitemclass				INT,
pslot					SMALLINT,
pdataproperty			VARCHAR(512),
pversion				INT,
pcreator				VARCHAR(40),
ptermendtime			INT,
pdata					VARCHAR(40),
pcount					INT,
pislock					INT,
punlocktime				INT UNSIGNED)
BEGIN
	DECLARE vcount INT DEFAULT 0;
	SELECT COUNT(1) INTO vcount FROM t_horseequip WHERE playerguid=pplayerguid AND slot=pslot AND hhorseguid=phhorseguid AND lhorseguid=plhorseguid;
	IF vcount >= 1 THEN
		UPDATE t_horseequip SET
			playerguid=pplayerguid,
			hhorseguid=phhorseguid,
			lhorseguid=plhorseguid,
			world=pworld,
			SERVER=pserver,
			guid=pguid,
			itemclass=pitemclass,
			slot=pslot,
			dataproperty=pdataproperty,
			VERSION=pversion,
			creator=pcreator,
			termendtime=ptermendtime,
			DATA=pdata,
			COUNT=pcount,
			islock=pislock,
			unlocktime=punlocktime,
			valid=1
		WHERE playerguid=pplayerguid AND slot=pslot AND hhorseguid=phhorseguid AND lhorseguid=plhorseguid LIMIT 1;
	ELSE
		INSERT INTO t_horseequip(playerguid,hhorseguid,lhorseguid,world,SERVER,guid,itemclass,slot,dataproperty,VERSION,creator,termendtime,DATA,COUNT,islock,unlocktime,valid)
				VALUES(pplayerguid,phhorseguid,plhorseguid,pworld,pserver,pguid,pitemclass,pslot,pdataproperty,pversion,pcreator,ptermendtime,pdata,pcount,pislock,punlocktime,1);
	END IF;
END;;

DROP PROCEDURE IF EXISTS `proc_save_substitute`;;
CREATE PROCEDURE `proc_save_substitute`(
pplayerguid					INT UNSIGNED,
pplayername					VARCHAR(60),
pmapid							INT,
pxpos								INT,
pzpos								INT,
pprofession					INT,
pextexp							INT	UNSIGNED,
pofflinetime				INT UNSIGNED,
pcamp								INT UNSIGNED,
psex								INT UNSIGNED)
BEGIN
DECLARE vcount INT DEFAULT 0;
SELECT COUNT(1) INTO vcount FROM t_substitute WHERE playerguid=pplayerguid;
IF vcount >= 1 THEN
UPDATE t_substitute SET
playername=pplayername,
mapid=pmapid,
xpos=pxpos,
zpos=pzpos,
profession=pprofession,
extexp=pextexp,
offlinetime=pofflinetime,
camp=pcamp,
sex=psex,
valid=1
WHERE playerguid=pplayerguid;
ELSE
INSERT INTO t_substitute(playerguid, playername, mapid, xpos, zpos, profession, extexp, offlinetime, camp, sex, valid)
	VALUES(pplayerguid, pplayername, pmapid, pxpos, pzpos, pprofession, pextexp, pofflinetime, pcamp, psex, 1);
END IF;
END;;

-- 家园存储过程
DROP PROCEDURE IF EXISTS `proc_save_garden`;;
CREATE PROCEDURE `proc_save_garden`(
pgardenid				INT UNSIGNED,
pplayerguid					INT UNSIGNED,
pplayername             VARCHAR(60),
plevel							INT UNSIGNED,
pviewgroup					INT UNSIGNED,
pflag						tinyint(4),
pmonster					VARCHAR(160),
pversion				INT)
BEGIN
DECLARE vcount INT DEFAULT 0;
SELECT COUNT(1) INTO vcount FROM t_garden WHERE gardenid=pgardenid;
IF vcount >= 1 THEN
UPDATE t_garden SET
level=plevel,
viewgroup=pviewgroup,
playername=pplayername,
flag=pflag,
monster=pmonster,
version=pversion,
valid=1
WHERE gardenid=pgardenid;
ELSE
INSERT INTO t_garden(gardenid, playerguid, playername, level, viewgroup, flag, monster, version, valid)
	VALUES(pgardenid, pplayerguid, pplayername, plevel, pviewgroup, pflag, pmonster, pversion, 1);
END IF;
END;;

-- 家园资源存储过程
DROP PROCEDURE IF EXISTS `proc_save_gardenres`;;
CREATE PROCEDURE `proc_save_gardenres`(
pgardenid				INT UNSIGNED,
presourceid					INT UNSIGNED,
presourcetype				INT,
presourcepos				INT,
presourcenum				INT UNSIGNED,
presourcestate				INT,
presourcelevel				INT UNSIGNED,
pmaturetime					INT UNSIGNED)
BEGIN
DECLARE vcount INT DEFAULT 0;
SELECT COUNT(1) INTO vcount FROM t_gardenres WHERE gardenid=pgardenid and resourcepos=presourcepos;
IF vcount >= 1 THEN
UPDATE t_gardenres SET
resourceid=presourceid,
resourcetype=presourcetype,
resourcepos=presourcepos,
resourcenum=presourcenum,
resourcestate=presourcestate,
resourcelevel=presourcelevel,
maturetime=pmaturetime,
valid=1
WHERE gardenid=pgardenid and resourcepos=presourcepos;
ELSE
INSERT INTO t_gardenres(gardenid, resourceid, resourcetype, resourcepos, resourcenum, resourcestate, resourcelevel, maturetime, valid)
	VALUES(pgardenid, presourceid, presourcetype, presourcepos, presourcenum, presourcestate, presourcelevel, pmaturetime, 1);
END IF;
END;;

-- 招募
DROP PROCEDURE IF EXISTS `proc_save_recruit`;;
CREATE PROCEDURE `proc_save_recruit`(
wselfsnid INT UNSIGNED,
wrecruittype SMALLINT UNSIGNED,
wplayersnid INT UNSIGNED,
wplayercountry SMALLINT,
wplayername VARCHAR(50),
wplayerguild INT UNSIGNED,
wplayerguildname VARCHAR(120),
wplayerlevel INT UNSIGNED,
wvalid SMALLINT UNSIGNED,
wrecruitlevel INT UNSIGNED,
wrecruitexp INT UNSIGNED,
wplayerProfession SMALLINT UNSIGNED
)
BEGIN
	DECLARE rcount INT DEFAULT 0;
	SELECT COUNT(1) INTO rcount FROM t_recruit WHERE selfsnid=wselfsnid AND playersnid=wplayersnid AND valid=0;
	
	IF rcount >= 1 THEN
		UPDATE t_recruit SET 
		recruittype = wrecruittype,
		playername = wplayername,
		playercountry = wplayercountry,
		playerguild = wplayerguild,
		playerguildname = wplayerguildname,
		playerlevel = wplayerlevel,
		valid = wvalid,
		recruitlevel = wrecruitlevel,
		recruitexp = wrecruitexp,
		playerProfession = wplayerProfession
		WHERE selfsnid=wselfsnid AND playersnid=wplayersnid AND valid=0 LIMIT 1;
	ELSE
		INSERT INTO t_recruit(selfsnid,recruittype,playersnid,playercountry,playername,playerguild,playerguildname,playerlevel,valid,recruitlevel,recruitexp,playerProfession) 
		VALUES(wselfsnid,wrecruittype,wplayersnid,wplayercountry,wplayername,wplayerguild,wplayerguildname,wplayerlevel,wvalid,wrecruitlevel,wrecruitexp,wplayerProfession);
	END IF;	
END;;

-- 经脉
DROP PROCEDURE IF EXISTS `proc_save_channelmeridian`;;
CREATE PROCEDURE `proc_save_channelmeridian`(
wplayersnid INT UNSIGNED,
wmodetype SMALLINT UNSIGNED,
wflagtype SMALLINT UNSIGNED,
wprotype1 SMALLINT,
wprovalue1 SMALLINT UNSIGNED,
wprotype2 SMALLINT,
wprovalue2 SMALLINT UNSIGNED,
wprotype3 SMALLINT,
wprovalue3 SMALLINT UNSIGNED,
wprotype4 SMALLINT,
wprovalue4 SMALLINT UNSIGNED,
wvalid SMALLINT UNSIGNED
)
BEGIN
	DECLARE rcount INT DEFAULT 0;
	SELECT COUNT(1) INTO rcount FROM t_channelmeridian WHERE playersnid=wplayersnid AND valid=0 AND modetype=wmodetype AND flagtype=wflagtype;
	
	IF rcount >= 1 THEN
		UPDATE t_channelmeridian SET 
		playersnid	= wplayersnid,
		modetype	= wmodetype,
		flagtype	= wflagtype,
		protype1	= wprotype1,
		provalue1	= wprovalue1,
		protype2	= wprotype2,
		provalue2	= wprovalue2,
		protype3	= wprotype3,
		provalue3	= wprovalue3,
		protype4	= wprotype4,
		provalue4	= wprovalue4,
		valid		= wvalid
		WHERE playersnid=wplayersnid AND valid=0 AND modetype=wmodetype AND flagtype=wflagtype LIMIT 1;
	ELSE
		INSERT INTO t_channelmeridian(playersnid,modetype,flagtype,protype1,provalue1,protype2,provalue2,protype3,provalue3,protype4,provalue4,valid) 
		VALUES(wplayersnid,wmodetype,wflagtype,wprotype1,wprovalue1,wprotype2,wprovalue2,wprotype3,wprovalue3,wprotype4,wprovalue4,wvalid);
	END IF;	
END;;

-- 家园子资源存储过程
DROP PROCEDURE IF EXISTS `proc_save_gardensubres`;;
CREATE PROCEDURE `proc_save_gardensubres`(
pgardenid					INT UNSIGNED,
prespos					INT,
psubpos				INT,
psubstate				INT)
BEGIN
DECLARE vcount INT DEFAULT 0;
SELECT COUNT(1) INTO vcount FROM t_gardensubres WHERE gardenid=pgardenid and respos=prespos and subpos=psubpos ;
IF vcount >= 1 THEN
UPDATE t_gardensubres SET
gardenid=pgardenid,
respos=prespos,
subpos=psubpos,
substate=psubstate,
valid=1
WHERE gardenid=pgardenid and respos=prespos and subpos=psubpos;
ELSE
INSERT INTO t_gardensubres(gardenid, respos, subpos, substate, valid)
	VALUES(pgardenid, prespos, psubpos, psubstate, 1);
END IF;
END;;

--
-- procedure proc_gm_addlostitem
--
-- 函数返回值说明：
-- 返回0: 操作成功
-- 返回1: t_lostitem表总数超过了10000，不能再添加新数据。
-- 返回2: t_lostitem表中pplayerguid玩家的相关记录超过108条，不能再添加新数据。
-- 返回3: t_lostitem表中已存在参数中指定的物品，不能添加数据。
-- 返回4: t_item表中没有参数中指定的物品。
-- 返回5: t_item表中物品有重复（数据库内部错误）。
DROP PROCEDURE IF EXISTS `proc_gm_addlostitem`;;
CREATE PROCEDURE `proc_gm_addlostitem`(
	pplayerguid int unsigned,			-- 失主的guid
	psrcplayerguid int unsigned,		-- 盗窃者的guid
	psrcplayername varchar(50),			-- 盗窃者的角色名(暂时可以传一个空字符串进来)
	pguid int,							-- 物品ID guid部分
	pworld int,							-- 物品ID world部分
	pserver int							-- 物品ID server部分
	)
label_main:BEGIN
	DECLARE vResult int default 0;
	DECLARE vTotalCount int unsigned default 0;
	DECLARE vCount int unsigned default 0;
	DECLARE pitemclass int default 0;
	DECLARE pcreator varchar(40) default '';
	DECLARE pdataproperty varchar(512) default '';
	DECLARE pdata varchar(40) default '';
	DECLARE ptermendtime int default 0;
	DECLARE pislock int default 0;
	DECLARE punlocktime int unsigned default 0;
	
	select count(1) into vTotalCount from t_lostitem;
	if vTotalCount > 10000 then
		set vResult = 1;
		select vResult;
		leave label_main;
	end if;
	
	select count(1) into vCount from t_lostitem where playerguid=pplayerguid;
	if vCount > 108 then
		set vResult = 2;
		select vResult;
		leave label_main;
	end if;
	
	select count(1) into vCount from t_lostitem where playerguid=pplayerguid and guid=pguid and world=pworld and server=pserver;
	if vCount > 0 then
		set vResult = 3;
		select vResult;
		leave label_main;
	end if;
	
	select count(1) into vCount from t_item where playerguid=psrcplayerguid and guid=pguid and world=pworld and server=pserver and valid<>0;
	if vCount = 0 then
		set vResult = 4;
		select vResult;
		leave label_main;
	end if;
	if vCount > 1 then
		set vResult = 5;
		select vResult;
		leave label_main;
	end if;
	
	select itemclass,creator,dataproperty,data,termendtime,islock,unlocktime 
		into pitemclass,pcreator,pdataproperty,pdata,ptermendtime,pislock,punlocktime 
		from t_item where playerguid=psrcplayerguid and guid=pguid and world=pworld and server=pserver and valid<>0;

	start transaction;
	insert into t_lostitem(playerguid,srcplayerguid,srcplayername,guid,world,server,itemclass,creator,dataproperty,data,termendtime,islock,unlocktime,gmoptime)
				values(pplayerguid,psrcplayerguid,psrcplayername,pguid,pworld,pserver,pitemclass,pcreator,pdataproperty,pdata,ptermendtime,pislock,punlocktime,unix_timestamp());
	update t_item set valid=0 where playerguid=psrcplayerguid and guid=pguid and world=pworld and server=pserver and valid<>0;
	commit;
	
	select vResult;
END;;


--
-- function func_Ascii2Value
--
DROP FUNCTION if EXISTS `func_Ascii2Value`;;
CREATE FUNCTION `func_Ascii2Value` (`invalue` char(1)) RETURNS INTEGER unsigned
BEGIN
	DECLARE vReturn int unsigned default 0;
	
	if 		STRCMP(invalue,'0') = 0 then set vReturn=0;
	elseif	STRCMP(invalue,'1') = 0 then set vReturn=1;
	elseif	STRCMP(invalue,'2') = 0 then set vReturn=2;
	elseif	STRCMP(invalue,'3') = 0 then set vReturn=3;
	elseif	STRCMP(invalue,'4') = 0 then set vReturn=4;
	elseif	STRCMP(invalue,'5') = 0 then set vReturn=5;
	elseif	STRCMP(invalue,'6') = 0 then set vReturn=6;
	elseif	STRCMP(invalue,'7') = 0 then set vReturn=7;
	elseif	STRCMP(invalue,'8') = 0 then set vReturn=8;
	elseif	STRCMP(invalue,'9') = 0 then set vReturn=9;
	elseif	STRCMP(invalue,'A') = 0 then set vReturn=10;
	elseif	STRCMP(invalue,'B') = 0 then set vReturn=11;
	elseif	STRCMP(invalue,'C') = 0 then set vReturn=12;
	elseif	STRCMP(invalue,'D') = 0 then set vReturn=13;
	elseif	STRCMP(invalue,'E') = 0 then set vReturn=14;
	elseif	STRCMP(invalue,'F') = 0 then set vReturn=15;
	else set vReturn=0;
	end if;
	
	return vReturn;
END;;

--
-- function func_get_uint8
--
DROP FUNCTION if EXISTS `func_get_uint8`;;
CREATE FUNCTION `func_get_uint8` (`str` char(2)) RETURNS TINYINT UNSIGNED
BEGIN
	DECLARE vReturn TINYINT unsigned default 0;
	DECLARE vTmp,vTmp1,vTmp2 TINYINT unsigned default 0;
	
	SET vTmp1 = func_Ascii2Value(SUBSTR(str,1,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,2,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + vTmp;
	
	return vReturn;
END;;

--
-- function func_get_uint16
--
DROP FUNCTION if EXISTS `func_get_uint16`;;
CREATE FUNCTION `func_get_uint16` (`str` char(4)) RETURNS SMALLINT UNSIGNED
BEGIN
	DECLARE vReturn SMALLINT unsigned default 0;
	DECLARE vTmp,vTmp1,vTmp2 SMALLINT unsigned default 0;
	
	SET vTmp1 = func_Ascii2Value(SUBSTR(str,1,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,2,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + vTmp;
	
	SET vTmp1 = func_Ascii2Value(SUBSTR(str,3,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,4,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + (vTmp<<8);
	
	return vReturn;
END;;

--
-- function func_get_uint32
--
DROP FUNCTION if EXISTS `func_get_uint32`;;
CREATE FUNCTION `func_get_uint32` (`str` char(8)) RETURNS INT UNSIGNED
BEGIN
	DECLARE vReturn int unsigned default 0;
	DECLARE vTmp,vTmp1,vTmp2 int unsigned default 0;
	
	SET vTmp1 = func_Ascii2Value(SUBSTR(str,1,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,2,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + vTmp;
	
	SET vTmp1 = func_Ascii2Value(SUBSTR(str,3,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,4,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + (vTmp<<8);

	SET vTmp1 = func_Ascii2Value(SUBSTR(str,5,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,6,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + (vTmp<<16);

	SET vTmp1 = func_Ascii2Value(SUBSTR(str,7,1));
	SET vTmp2 = func_Ascii2Value(SUBSTR(str,8,1));
	SET vTmp = (vTmp1<<4) + vTmp2;
	SET vReturn = vReturn + (vTmp<<24);
	
	return vReturn;
END;;

DROP PROCEDURE if EXISTS `proc_get_empiredata`;;
CREATE PROCEDURE `proc_get_empiredata`()
BEGIN
	DECLARE vEmpireData varchar(2048) default "";
	DECLARE vEmperorGuild int unsigned default 0;
	DECLARE vEmperorGuid int unsigned default 4294967295;
	select empire_data into vEmpireData from t_country limit 1;
	set vEmperorGuild = func_get_uint16(substr(vEmpireData,5,4));
	set vEmperorGuid = func_get_uint32(substr(vEmpireData,9,8));
	select vEmperorGuild,vEmperorGuid;
END;;

DELIMITER ;


INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(0,7001,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(1,7002,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(2,7003,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(3,7004,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(4,7005,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(5,7006,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(6,7007,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(7,7008,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(8,7009,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(9,7010,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(10,7011,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(11,7012,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(12,7013,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(13,7014,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(14,7015,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(15,7016,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(16,7017,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(17,7018,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(18,7019,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(19,7020,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(20,7021,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(21,7022,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(22,7023,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(23,7024,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(24,7025,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(25,7026,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(26,7027,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(27,7028,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(28,7029,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(29,7030,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(30,7031,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(31,7032,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(32,7033,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(33,7034,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(34,7035,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(35,7036,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(36,7037,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(37,7038,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(38,7039,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(39,7040,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(40,7041,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(41,7042,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(42,7043,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(43,7044,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(44,7045,1001);
INSERT INTO `t_itemserial`(sid,dbskey,sn) VALUES(45,7046,1001);
INSERT INTO `t_guidserial` VALUES(1010000001);
INSERT INTO `t_country` VALUES (0,'楼兰王国',4294967295,-1,'',4294967295,-1,'',4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,'','','','','','',0,0,0,0,0,0,'','','',512571189,-1,4294967295,'',-1,4294967295,'',-1,4294967295,'',-1,4294967295,'','','');
INSERT INTO `t_country` VALUES (1,'天山王国',4294967295,-1,'',4294967295,-1,'',4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,'','','','','','',0,0,0,0,0,0,'','','',512571189,-1,4294967295,'',-1,4294967295,'',-1,4294967295,'',-1,4294967295,'','','');
INSERT INTO `t_country` VALUES (2,'昆仑王国',4294967295,-1,'',4294967295,-1,'',4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,'','','','','','',0,0,0,0,0,0,'','','',512571189,-1,4294967295,'',-1,4294967295,'',-1,4294967295,'',-1,4294967295,'','','');
INSERT INTO `t_country` VALUES (3,'敦煌王国',4294967295,-1,'',4294967295,-1,'',4294967295,4294967295,4294967295,4294967295,4294967295,4294967295,'','','','','','',0,0,0,0,0,0,'','','',512571189,-1,4294967295,'',-1,4294967295,'',-1,4294967295,'',-1,4294967295,'','','');

call proc_fill_mapvar();
DROP PROCEDURE IF EXISTS `proc_fill_mapvar`;
