/*
Navicat MySQL Data Transfer

Source Server         : 121.204.249.159
Source Server Version : 50173
Source Host           : 121.204.249.159:3306
Source Database       : Billing

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-08-16 23:56:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `AwardLog`
-- ----------------------------
DROP TABLE IF EXISTS `AwardLog`;
CREATE TABLE `AwardLog` (
  `AwardLogID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AwardID` bigint(20) NOT NULL,
  `CenterAwardId` bigint(20) NOT NULL,
  `method` tinyint(4) NOT NULL,
  `Inip` varchar(24) DEFAULT NULL,
  `AddDate` datetime NOT NULL,
  `Username` varchar(30) NOT NULL,
  `CharGuid` bigint(20) NOT NULL,
  `WorldID` int(11) NOT NULL,
  `Result` tinyint(4) NOT NULL,
  `AdId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AwardLogID`)
) ENGINE=MyISAM AUTO_INCREMENT=410 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of AwardLog
-- ----------------------------

-- ----------------------------
-- Table structure for `ChargeList`
-- ----------------------------
DROP TABLE IF EXISTS `ChargeList`;
CREATE TABLE `ChargeList` (
  `UserName` varchar(20) NOT NULL,
  `money` int(20) NOT NULL DEFAULT '0',
  `awardid` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ChargeList
-- ----------------------------

-- ----------------------------
-- Table structure for `GameUser`
-- ----------------------------
DROP TABLE IF EXISTS `GameUser`;
CREATE TABLE `GameUser` (
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(32) DEFAULT NULL,
  `RealName` varchar(16) DEFAULT NULL,
  `IdCard` varchar(18) DEFAULT NULL,
  `IdCardType` tinyint(4) DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `RegTime` datetime DEFAULT NULL,
  `BlockStartTime` datetime DEFAULT NULL,
  `BlockEndTime` datetime DEFAULT NULL,
  `LoginTimes` int(11) DEFAULT NULL,
  `AdId` int(11) DEFAULT NULL,
  `IsAdult` tinyint(4) DEFAULT NULL,
  `IsIdentity` tinyint(4) DEFAULT NULL,
  `IsBindSecureCard` tinyint(4) DEFAULT NULL,
  `WorldID` int(11) DEFAULT NULL,
  `UserStatus` tinyint(4) DEFAULT NULL,
  `MobileStatus` tinyint(4) DEFAULT NULL,
  `PhoneStatus` tinyint(4) DEFAULT NULL,
  `SecretCardStatus` tinyint(4) DEFAULT NULL,
  `IsBindPasspod` tinyint(4) DEFAULT NULL,
  `PasspodStatus` tinyint(4) DEFAULT NULL,
  `LastLoginTime` datetime DEFAULT NULL,
  `LastLoginIp` varchar(15) DEFAULT NULL,
  `ThisLoginTime` datetime DEFAULT NULL,
  `ThisLoginIp` varchar(15) DEFAULT NULL,
  `LastUserStatus` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of GameUser
-- ----------------------------

-- ----------------------------
-- Table structure for `UserAward`
-- ----------------------------
DROP TABLE IF EXISTS `UserAward`;
CREATE TABLE `UserAward` (
  `AwardID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CenterAwardId` bigint(20) DEFAULT NULL,
  `Username` varchar(30) NOT NULL,
  `Charguid` bigint(20) NOT NULL,
  `Worldid` int(11) NOT NULL,
  `ItemID` bigint(20) NOT NULL,
  `ItemNumber` int(11) NOT NULL,
  `AddDate` datetime NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ToDate` datetime NOT NULL,
  `GetDate` datetime DEFAULT NULL,
  `Type` tinyint(4) NOT NULL,
  `AwardStatus` tinyint(4) NOT NULL,
  `AdId` int(11) DEFAULT NULL,
  `SubtractId` bigint(20) DEFAULT NULL,
  `CDKey` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`AwardID`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UserAward
-- ----------------------------

-- ----------------------------
-- Table structure for `UserCostLog`
-- ----------------------------
DROP TABLE IF EXISTS `UserCostLog`;
CREATE TABLE `UserCostLog` (
  `LogId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) DEFAULT NULL,
  `AdId` int(11) DEFAULT NULL,
  `WorldId` int(11) DEFAULT NULL,
  `CostMoney` bigint(20) DEFAULT NULL,
  `LogTime` datetime DEFAULT NULL,
  `Charguid` bigint(20) DEFAULT NULL,
  `Inip` varchar(24) DEFAULT NULL,
  `Result` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`LogId`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UserCostLog
-- ----------------------------

-- ----------------------------
-- Table structure for `UserGolds`
-- ----------------------------
DROP TABLE IF EXISTS `UserGolds`;
CREATE TABLE `UserGolds` (
  `UserName` varchar(30) NOT NULL,
  `Golds` int(11) DEFAULT NULL,
  `GoldStatus` tinyint(4) DEFAULT NULL,
  `Coins` int(11) DEFAULT NULL,
  `CoinStatus` tinyint(4) DEFAULT NULL,
  `AdId` int(11) DEFAULT NULL,
  `UserLevel` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of UserGolds
-- ----------------------------

-- ----------------------------
-- View structure for `v_GameUser`
-- ----------------------------
DROP VIEW IF EXISTS `v_GameUser`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_GameUser` AS select `a`.`UserName` AS `UserName`,`a`.`Password` AS `Password`,`a`.`RealName` AS `RealName`,`a`.`IdCard` AS `IdCard`,`a`.`IdCardType` AS `IdCardType`,`a`.`ActiveTime` AS `ActiveTime`,`a`.`RegTime` AS `RegTime`,`a`.`BlockStartTime` AS `BlockStartTime`,`a`.`BlockEndTime` AS `BlockEndTime`,`a`.`LoginTimes` AS `LoginTimes`,`a`.`AdId` AS `AdId`,`a`.`IsAdult` AS `IsAdult`,`a`.`IsIdentity` AS `IsIdentity`,`a`.`IsBindSecureCard` AS `IsBindSecureCard`,`a`.`WorldID` AS `WorldID`,`a`.`UserStatus` AS `UserStatus`,`a`.`MobileStatus` AS `MobileStatus`,`a`.`PhoneStatus` AS `PhoneStatus`,`a`.`SecretCardStatus` AS `SecretCardStatus`,`a`.`IsBindPasspod` AS `IsBindPasspod`,`a`.`PasspodStatus` AS `PasspodStatus`,`a`.`LastLoginTime` AS `LastLoginTime`,`a`.`LastLoginIp` AS `LastLoginIp`,`a`.`ThisLoginTime` AS `ThisLoginTime`,`a`.`ThisLoginIp` AS `ThisLoginIp`,`a`.`LastUserStatus` AS `LastUserStatus`,(case when ((`a`.`RealName` <> _latin1'') and (`a`.`IdCard` <> _latin1'')) then 1 else 0 end) AS `RealIsIdentity`,(case when isnull(`b`.`Golds`) then 0 else `b`.`Golds` end) AS `Golds`,(case when isnull(`b`.`UserLevel`) then 0 else `b`.`UserLevel` end) AS `UserLevel` from (`GameUser` `a` left join `UserGolds` `b` on((`a`.`UserName` = `b`.`UserName`))) ;

-- ----------------------------
-- Procedure structure for `sp_Addgold`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_Addgold`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Addgold`(p_UserName varchar(30),p_money int)
begin
declare pmoney INT;
declare pa INT;
set pmoney=-1;
set pa=0;
	if (p_money >0) THEN	
			update UserGolds set Golds=Golds+40000*p_money where UserName=p_UserName;
			select money into pmoney from ChargeList where UserName=p_UserName;
			if (pmoney<0) then
				insert into ChargeList value(p_UserName,p_money,0);
			ELSE
				update ChargeList set money=money+p_money where UserName=p_UserName;
			end if;
			
			select money,awardid into pmoney,pa from ChargeList where UserName=p_UserName;

			if (pmoney>=100) THEN
				update UserGolds set UserLevel=4 where UserName=p_UserName;
			end if;

			if (pmoney>=300) THEN
				if (pa<1) then
					call sp_Award_Add (p_UserName,1001,1);
					update ChargeList set awardid=1 where UserName=p_UserName;
					set pa=1;
				end if;
					update UserGolds set UserLevel=5 where UserName=p_UserName;
			end if;

			IF (pmoney >=500) THEN
				if (pa<2) then
					call sp_Award_Add (p_UserName,1000,1);
					call sp_Award_Add (p_UserName,310,1);
					update ChargeList set awardid=2 where UserName=p_UserName;
					set pa=2;
				end if;
				update UserGolds set UserLevel=6 where UserName=p_UserName;
			end if;

			IF (pmoney >=800) THEN
				if (pa<3) then
					call sp_Award_Add (p_UserName,1001,1);
					call sp_Award_Add (p_UserName,1000,1);
					call sp_Award_Add (p_UserName,310,2);
					update ChargeList set awardid=3 where UserName=p_UserName;
					set pa=3;
				end if;
				update UserGolds set UserLevel=7 where UserName=p_UserName;
			end if;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_AddLibao`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_AddLibao`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddLibao`(p_UserName varchar(30),p_money int)
begin

	if (p_money >=800) THEN	
		update UserGolds set Golds=Golds+32000000 where UserName=p_UserName;
		call sp_Award_Add (p_UserName,1001,1);
		call sp_Award_Add (p_UserName,1000,1);
		call sp_Award_Add (p_UserName,310,2);
	ELSEIF (p_money >=500) THEN
		update UserGolds set Golds=Golds+20000000 where UserName=p_UserName;
		call sp_Award_Add (p_UserName,1000,1);
		call sp_Award_Add (p_UserName,310,1);
	ELSEIF (p_money >=300) THEN
		update UserGolds set Golds=Golds+12000000 where UserName=p_UserName;
		call sp_Award_Add (p_UserName,1001,1);
	ELSEIF (p_money >=100) THEN
		update UserGolds set Golds=Golds+4000000 where UserName=p_UserName;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_Award_Add`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_Award_Add`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Award_Add`(p_UserName varchar(30),p_ItemId bigint,p_ItemNumber int)
begin
declare p_CenterAwardId bigint;
declare p_CharGuid bigint;
declare p_WorldId int;
declare p_StartDate datetime;
declare p_ToDate datetime;
declare p_Type tinyint;
declare p_ClientIp varchar(15);
declare p_AdId int;
declare p_SubtractId bigint;
set p_CenterAwardId = 0 ;
set p_CharGuid= 0;
set p_WorldId=0;
set p_Type=0;
set p_ClientIp='';
set p_AdId=0;
set p_SubtractId=0;
	if p_ItemNumber>0 THEN
	
	if (p_StartDate is null) THEN	
		set p_StartDate=now();
	end if;

	if (p_ToDate is null) THEN
		set p_ToDate=ADDDATE(p_StartDate,90);
  end if;

	insert into UserAward (CenterAwardId,UserName,CharGuid,WorldId,ItemId,ItemNumber,AddDate,StartDate,ToDate,Type,AdId,SubtractId) values (p_CenterAwardId,p_UserName,p_CharGuid,p_WorldId,p_ItemId,p_ItemNumber,p_StartDate,p_StartDate,p_ToDate,p_Type,p_AdId,p_SubtractId);
	insert into AwardLog (CenterAwardId,method,Inip,UserName,CharGuid,WorldId,AdId) values (p_CenterAwardId,0,p_ClientIp,p_UserName,p_CharGuid,p_WorldId,p_AdId);
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_Award_Get`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_Award_Get`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Award_Get`(p_UserName varchar(30),
p_CharGuid bigint,
p_WorldID int,
p_startAwardID bigint,
p_INIP varchar(24))
begin
declare p_Result tinyint;
declare p_ItemID bigint;
declare p_ItemNumber int;
declare p_AwardStatus tinyint;
declare p_AwardID bigint;
declare logresult tinyint;
	set p_AwardID=0;
	set p_AwardStatus = 2; 
	set p_Result=0;
	set p_ItemID=0;
	set p_ItemNumber=0;
	set logresult=0;
	select result into logresult from AwardLog where AwardID=p_startAwardID and Username=p_UserName and result=1 limit 1;
if logresult=0 THEN
	select AwardID,ItemID,ItemNumber,AwardStatus into p_AwardID,p_ItemID,p_ItemNumber,p_AwardStatus 
	from UserAward where AwardID=p_startAwardID limit 1;
	if p_AwardID>0 then    
		if p_AwardStatus=2 then 
			set p_Result=2;
			insert into AwardLog (AwardID,method,Inip,Username,CharGuid,WorldID,Result) values (p_AwardID,1,p_INIP,p_UserName,p_CharGuid,p_WorldID,p_Result);
		elseif p_AwardStatus=1 then 
			set p_Result=0;
			insert into AwardLog (AwardID,method,Inip,Username,CharGuid,WorldID,Result) values (p_AwardID,1,p_INIP,p_UserName,p_CharGuid,p_WorldID,p_Result);
		else
			set p_Result=1;
			update UserAward set Username=p_UserName,AwardStatus=1,WorldID=p_WorldID,GetDate=NOW() where AwardID=p_startAwardID and Adid<1;
			insert into AwardLog (AwardID,method,Inip,Username,CharGuid,WorldID,Result) values (p_AwardID,1,p_INIP,p_UserName,p_CharGuid,p_WorldID,p_Result);
		end if;
	else  
		set p_Result=0; 
		insert into AwardLog (AwardID,method,Inip,Username,CharGuid,WorldID,Result) values (p_AwardID,1,p_INIP,p_UserName,p_CharGuid,p_WorldID,p_Result);
	end if;
ELSE
	set p_Result=2;
end if;
	select p_Result ,p_ItemID ,p_ItemNumber ;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_Award_Query`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_Award_Query`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Award_Query`(p_UserName varchar(30),
p_CharGuid bigint,
p_Type tinyint,
p_startAwardID bigint,
p_WorldID int,
p_CDKey varchar(16))
begin
  if p_CDKey ='' THEN
		if p_WorldID>0 and p_CharGuid>0 then	
			select * from 
				(select AwardID,ItemID,ItemNumber from UserAward
					where AwardID>=p_startAwardID and UserName=p_UserName  and AwardStatus=0  and now() between StartDate and ToDate and WorldID=0 and CharGuid=0 limit 6
				union all
				select AwardID,ItemID,ItemNumber from UserAward
					where AwardID>=p_startAwardID and UserName=p_UserName  and AwardStatus=0  and now() between StartDate and ToDate and WorldID=p_WorldID and CharGuid=0 limit 6
				union all
				select AwardID, ItemID,ItemNumber from UserAward 
					where AwardID>=p_startAwardID and UserName=p_UserName  and AwardStatus=0  and now() between StartDate and ToDate and WorldID=p_WorldID and CharGuid=p_CharGuid 
					and charguid=p_charguid limit 6
				) a order by AwardId limit 6;
		else
			select AwardID,ItemID,ItemNumber from UserAward
				where AwardID>=p_startAwardID and UserName=p_UserName  and AwardStatus=0  and now() between StartDate and ToDate order by AwardId limit 6;
		end if;
else
	select AwardID,ItemID,ItemNumber from UserAward
				where AwardID>=p_startAwardID and CDKey=p_CDKey and (AwardStatus=0 or Adid!=0) and now() between StartDate and ToDate order by AwardId limit 1;
end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_GameLogin_CharLeave`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GameLogin_CharLeave`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GameLogin_CharLeave`(
p_UserName varchar(30)
)
begin
	update GameUser set UserStatus=0,WorldID=0 
where UserName=p_UserName and UserStatus=1;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_GameLogin_Check`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GameLogin_Check`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GameLogin_Check`(p_UserName varchar(30),
p_Password varchar(32),
p_INIP varchar(24))
label_main:begin
declare p_UserStatus tinyint ;
declare p_ADID int ;
declare p_IsBindSecureCard tinyint ;
declare p_Money bigint ;
declare p_IsAdult tinyint ;
declare p_IsIdentity tinyint ;
declare p_UserLevel int ;
declare p_IsBindPhone tinyint ;
declare p_IsSecureCardExpired tinyint ;
declare p_IsBindPasspod tinyint ;
declare p_IsDiffLogin tinyint ;



declare p_cnt int;
declare p_UserPassword varchar(32);
declare p_LoginTimes int;
declare p_DBUserStatus tinyint;
declare p_RegTime datetime;
declare p_BlockStartTime datetime;
declare p_BlockendTime datetime;
declare p_DBSecretCardStatus tinyint;
declare p_DBPasspodStatus tinyint;
declare p_DBMobileStatus tinyint;
declare p_LastLoginTime datetime;
declare p_LastLoginIp varchar(15);
declare p_ThisLoginTime datetime;
declare p_ThisLoginIp varchar(15);
declare p_LastUserStatus tinyint;
declare p_RealName varchar(16);
declare p_IdCard varchar(18);
declare p_now datetime;
set p_IsDiffLogin=0;
set p_cnt=0;
set p_LoginTimes=0;
set p_UserStatus=1; 
set p_RegTime=null;
set p_BlockStartTime=null;
set p_BlockendTime=null;
set p_ADID = 0;
set p_IsBindSecureCard=0;
set p_Money=0;
set p_IsAdult=0;
set p_UserLevel=0;
set p_IsBindPhone=0;
set p_IsSecureCardExpired=0;
set p_IsBindPasspod=0;
set p_DBSecretCardStatus=0;
set p_DBPasspodStatus=0;
set p_DBMobileStatus=0;
set p_LastLoginTime=null;
set p_LastLoginIp='';
set p_ThisLoginTime=null;
set p_ThisLoginIp='';
set p_LastUserStatus=0;
set p_RealName='';
set p_IdCard='';
set p_now=now();

select Password,UserStatus,RealName,IdCard,RegTime,BlockStartTime,BlockendTime,SecretCardStatus,
LoginTimes,AdId,IsBindSecureCard,IsAdult,RealIsIdentity,PhoneStatus,IsBindPasspod,PasspodStatus,MobileStatus,LastLoginTime,LastLoginIp,
ThisLoginTime,ThisLoginIp,LastUserStatus,Golds,UserLevel 
into p_UserPassword,p_DBUserStatus,p_RealName,p_IdCard,p_RegTime,p_BlockStartTime,p_BlockendTime,p_DBSecretCardStatus,p_LoginTimes,p_ADID,
p_IsBindSecureCard,p_IsAdult,p_IsIdentity,p_IsBindPhone,p_IsBindPasspod,p_DBPasspodStatus,p_DBMobileStatus,p_LastLoginTime,p_LastLoginIp,
p_ThisLoginTime,p_ThisLoginIp,p_LastUserStatus,p_Money,p_UserLevel from v_GameUser where UserName=p_UserName limit 1;

set p_cnt=FOUND_ROWS() ;

if (p_ADID is null) then set p_ADID=0; end if;
if (p_IsBindSecureCard is null) then set p_IsBindSecureCard=0; end if;
if (p_Money is null) then set p_Money=0; end if;
if (p_IsAdult is null) then set p_IsAdult=0; end if;
if (p_IsIdentity is null) then set p_IsIdentity=0; end if;
if (p_UserLevel is null) then set p_UserLevel=0; end if;
if (p_IsBindPhone is null) then set p_IsBindPhone=0; end if;
if (p_IsBindPasspod is null) then set p_IsBindPasspod=0; end if;
if (p_LastUserStatus is null) then set p_LastUserStatus=0; end if;
if (p_RealName is null) then set p_RealName=''; end if;
if (p_IdCard is null) then set p_IdCard=''; end if;
if (p_RealName='' and p_IdCard='') then set p_IsAdult=1;  end if;
set p_IsAdult=0;

if (p_cnt=0 or p_DBUserStatus is null) then	
set p_UserStatus = 11;	
select p_UserStatus,p_ADID,p_IsBindSecureCard,p_Money,p_IsAdult,p_IsIdentity,p_UserLevel,p_IsBindPhone,p_IsSecureCardExpired,p_IsBindPasspod,p_IsDiffLogin;
leave label_main ;	
end if;


if (p_DBUserStatus=3) then
	if (p_BlockendTime>=p_now or p_BlockendTime is null) then	
		set p_UserStatus = 5;
		select p_UserStatus,p_ADID,p_IsBindSecureCard,p_Money,p_IsAdult,p_IsIdentity,p_UserLevel,p_IsBindPhone,p_IsSecureCardExpired,p_IsBindPasspod,p_IsDiffLogin;
		leave label_main ;
	end if;
	set p_DBUserStatus = 0;	
	update GameUser set UserStatus=0 where UserName=p_UserName;
end if;

if (p_UserPassword<>p_Password) then	
set p_UserStatus = 1;	
select p_UserStatus,p_ADID,p_IsBindSecureCard,p_Money,p_IsAdult,p_IsIdentity,p_UserLevel,p_IsBindPhone,p_IsSecureCardExpired,p_IsBindPasspod,p_IsDiffLogin;
leave label_main ;
end if;


if (p_DBUserStatus=1) then      
update GameUser set UserStatus=0,SecretCardStatus=0,PasspodStatus=0,LastUserStatus=1 where UserName=p_UserName and UserStatus=p_DBUserStatus;
set p_UserStatus = 4;	
select p_UserStatus,p_ADID,p_IsBindSecureCard,p_Money,p_IsAdult,p_IsIdentity,p_UserLevel,p_IsBindPhone,p_IsSecureCardExpired,p_IsBindPasspod,p_IsDiffLogin;
leave label_main ;
end if;

if (p_DBUserStatus=0) then    
update GameUser set SecretCardStatus=0,PasspodStatus=0,LoginTimes=LoginTimes+1,LastUserStatus=0,LastLoginTime=ThisLoginTime,LastLoginIp=ThisLoginIp,ThisLoginTime=p_now,ThisLoginIp=p_INIP where UserName=p_UserName;	
set p_LoginTimes=p_LoginTimes+1;
set p_UserStatus = 0;
select p_UserStatus,p_ADID,p_IsBindSecureCard,p_Money,p_IsAdult,p_IsIdentity,p_UserLevel,p_IsBindPhone,p_IsSecureCardExpired,p_IsBindPasspod,p_IsDiffLogin;
leave label_main ;
end if;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_GamePay_GetGold`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GamePay_GetGold`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GamePay_GetGold`(
p_UserName varchar(30),
p_CharGuid bigint,
p_CostMoney bigint,
p_WorldID int,
p_INIP varchar(24)
)
begin
declare p_Result tinyint ;
declare p_Money bigint ;
declare p_AdId int;
declare p_GoldStatus tinyint;
set p_AdId=0;
set p_Money=0;
set p_Result=3;
select Golds,GoldStatus,AdId into p_Money,p_GoldStatus,p_AdId from UserGolds where UserName=p_UserName;
	if FOUND_ROWS()>0 then 
			if p_GoldStatus=2 then 
				set p_Result=2;
				insert into UserCostLog (UserName,AdId,WorldId,CostMoney,charguid,Inip,Result) values (p_UserName,p_AdId,p_WorldID,p_CostMoney,p_CharGuid,p_INIP,p_Result);
			elseif p_CostMoney>p_Money then
				set p_Result=1; 
				insert into UserCostLog (UserName,AdId,WorldId,CostMoney,charguid,Inip,Result) values (p_UserName,p_AdId,p_WorldID,p_CostMoney,p_CharGuid,p_INIP,p_Result);
			ELSE

				START TRANSACTION;
				set p_Result=0;
				set p_Money=p_Money-p_CostMoney;
				update UserGolds set Golds=p_Money where UserName=p_UserName;
				insert into UserCostLog (UserName,AdId,WorldId,CostMoney,charguid,Inip,Result) values (p_UserName,p_AdId,p_WorldID,p_CostMoney,p_CharGuid,p_INIP,p_Result);
				if (p_Money<0) then				
					rollback;
					set p_Result=1;
					insert into UserCostLog (UserName,AdId,WorldId,CostMoney,charguid,Inip,Result) values (p_UserName,p_AdId,p_WorldID,p_CostMoney,p_CharGuid,p_INIP,p_Result);
				else
					commit;
				end if;

			end if;
	else 
		set p_Result=1; 
	end if;
select p_Result,p_Money;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_GamePay_QueryAccount`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GamePay_QueryAccount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GamePay_QueryAccount`(
p_UserName varchar(30)
)
begin
declare p_Money bigint;
	select Golds into p_Money from UserGolds where UserName=p_UserName limit 1;
	if  p_Money is null then
		set  p_Money=0;
	end if;
select p_Money;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_GetGameUserInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_GetGameUserInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetGameUserInfo`(
p_UserId bigint,
p_UserName varchar(30)
)
begin
declare p_IsAdult tinyint;
declare p_IsIdentity tinyint;
declare p_IdCard varchar(18);
declare p_IdCardType tinyint;
declare p_RealName varchar(16) ;
select 
p_IsAdult=IsAdult,
p_IsIdentity=IsIdentity,
p_IdCard=IdCard,
p_IdCardType=IdCardType,
p_RealName=RealName 
from GameUser 
where UserName=p_UserName 
limit 1;
if(p_UserId is null) then set p_UserId=0; end if;
if(p_IsAdult is null) then set p_IsAdult=0; end if;
if(p_IsIdentity is null) then set p_IsIdentity=0; end if;
if(p_IdCard is null) then set p_IdCard=''; end if;
if(p_IdCardType is null) then set p_IdCardType=0; end if;
if(p_RealName is null) then set p_RealName=''; end if;
select p_IsAdult,p_IsIdentity,p_IdCard,p_IdCardType,p_RealName;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `sp_UpdateGameUserStatus`
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_UpdateGameUserStatus`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_UpdateGameUserStatus`(
p_UserName varchar(30),
p_UserStatus int
)
BEGIN
	update GameUser set UserStatus=p_UserStatus where UserName=p_UserName;
END
;;
DELIMITER ;
