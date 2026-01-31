
x300684_var_FileId	= 300684
x300684_var_QuestName       		="【国家】领取军饷"
x300684_var_HaveBonusThisWeek			="\t您本周已经领取过军饷了，每周只能领取一次。"
x300684_var_LevelError				="\t很遗憾，只有军阶不低于新丁的玩家才可以领取军饷。"
x300684_var_WeekDayError				="\t很遗憾，只有周日才可以领取军饷。"
x300684_var_ExploitError				="\t很遗憾，只有本周功勋值不低于12点的玩家才能领取军饷。"
x300684_var_NoJiangHuError      ="\t很遗憾，只有处于江湖请柬或朝廷请柬状态的玩家才能领取军饷。"
x300684_var_BonusTips					= "#Y【国家】领取军饷\n\t#W军饷，是为了奖励国家普通国民对国家做出的贡献。\n\t您的军阶等级和您本周完成内政任务的次数，将直接影响军饷的多少。\n\t军阶不低于#G新丁#W，每周功勋值不低于#G12#W点的且处于江湖请柬或朝廷请柬状态的玩家，每#G周日#W可以在我这里领取军饷。#r \n\t%s\n\t您本周的功勋值为#G%d#W。\n\t您本周共完成了#G%d#W轮内政任务。\n\t您当前#G%s#W处于江湖或朝廷请柬状态。按照以上的统计，您共可以领取：\n\t#R%d#W锭#R%d#W两#R%d#W文现金"
x300684_var_GiveBonusTips				="#Y领取军饷完成，您获得#R%d#Y锭#R%d#Y两#R%d#Y文现金的奖励。"
x300684_var_GameOpenID				= 1082
x300684_var_GameLogID         = 0   
x300684_var_Multiple 				= 5

----------------------------------------------------------------------------------------------
--取得今天的是第几个周
----------------------------------------------------------------------------------------------
function x300684_GetCurrentWeek()
	
	local day, week = GetWeek();
	return week;
	
end


----------------------------------------------
--得到内政任务所用的周数形式
----------------------------------------------
function x300684_GetNeiZhengWeek()
	local nCurrentTime = (GetCurrentTime()+8*3600)/86400 - 4  
	local nWeek = floor(nCurrentTime / 7)		 
	return nWeek
end

----------------------------------------------------------------------------------------------
--取得最后一周0
----------------------------------------------------------------------------------------------
function x300684_GetLastWeek( varMap, varPlayer )
	
	return GetPlayerGameData(varMap,varPlayer,MD_GET_MILITARY_MONEY_WEEKOFYEAR[1],MD_GET_MILITARY_MONEY_WEEKOFYEAR[2],MD_GET_MILITARY_MONEY_WEEKOFYEAR[3])
	
end

----------------------------------------------------------------------------------------------
--设置最后一周
----------------------------------------------------------------------------------------------
function x300684_SetLastWeek( varMap, varPlayer)
	
	SetPlayerGameData(varMap,varPlayer,MD_GET_MILITARY_MONEY_WEEKOFYEAR[1],MD_GET_MILITARY_MONEY_WEEKOFYEAR[2],MD_GET_MILITARY_MONEY_WEEKOFYEAR[3],x300684_GetCurrentWeek())
end


function x300684_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuestId )
	
	--活动是否开启
	if GetGameOpenById( x300684_var_GameOpenID	) ~= 1 then
		return
	end
	
	--刷新BUF列表
	TalkAppendButton(varMap,x300684_var_FileId,x300684_var_QuestName,3,-1);
	
end

function x300684_ProcEventEntry( varMap, varPlayer, varTalknpc, varFileId, varExt )

	--活动是否开启
	if GetGameOpenById(x300684_var_GameOpenID) ~= 1 then
		return
	end

	local militaryRankLevel = GetPlayerMilitaryRankLevel(varMap,varPlayer) --军阶等级
	local nExploit = GetExploit(varMap,varPlayer)										 --功勋点
	--获取内政完成次数
	local lastweek = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEK[1],MD_NEIZHENG_WEEK[2],MD_NEIZHENG_WEEK[3])
	local round = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEKCOUNT[1],MD_NEIZHENG_WEEKCOUNT[2],MD_NEIZHENG_WEEKCOUNT[3])
	if round < 0 then 
		round = 0 
	end
	--如果周不匹配
	if x300684_GetNeiZhengWeek() ~= lastweek then
		round = 0
	end
	
	--是否处于江湖状态
	local AwardGetBufList = {9011,9012,9013}
	local bHaveBuf = 0
	for i, item in AwardGetBufList do
		if IsHaveSpecificImpact(varMap, varPlayer, item) > 0 then
			bHaveBuf = 1
			break
		end
	end
	
	
	local money = 0		--领取金卡数目
	
	if militaryRankLevel > 0 and nExploit >= 12 and bHaveBuf == 1 and round > 0 then
		money = GetMilitaryRankMoneyByLevel( militaryRankLevel ) * round * 2 * x300684_var_Multiple;
	end
	
	local ding = 0
	local liang = 0
	local wen = 0
	
	if money > 0 then 
		ding = floor( money / (1000*1000) )
		liang = floor( mod(money,1000*1000)/ 1000 )
		wen = mod(money,1000)
	end

	--格式化相关信息
	local yesnostr = ""
	if bHaveBuf == 0 then
		yesnostr = "不"
	end
	
	local militaryInfo = "您还没有获得军阶。"
	if militaryRankLevel > 0 then
		local militaryRankName = GetMilitaryRankNameByLevel( militaryRankLevel );
		militaryInfo = "您当前的军阶为#G"..tostring(militaryRankName).."#W。"
	end

	local msg = format(x300684_var_BonusTips,militaryInfo,nExploit,round,yesnostr,ding,liang,wen )

	--所有检查通过，则显示奖励界面
	StartTalkTask(varMap)
	TalkAppendString(varMap, msg)
  StopTalkTask(varMap)	
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300684_var_FileId, x300684_var_FileId)
end

----------------------------------------------------------------------------------------------
--检测接受条件
----------------------------------------------------------------------------------------------
function x300684_ProcAcceptCheck( varMap, varPlayer, NPCId )
	
	--活动是否开启
	if GetGameOpenById(x300684_var_GameOpenID) ~= 1 then
		return 0
	end
	
    return 1
end

----------------------------------------------------------------------------------------------
--接受
----------------------------------------------------------------------------------------------
function x300684_ProcAccept( varMap, varPlayer )
	
	--活动是否开启
	if GetGameOpenById(x300684_var_GameOpenID) ~= 1 then
		return
	end
	
	--检查是否领过
	if x300684_GetCurrentWeek() == x300684_GetLastWeek(varMap,varPlayer) then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300684_var_HaveBonusThisWeek)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	--检查军阶等级
	local level = GetPlayerMilitaryRankLevel(varMap,varPlayer)
	if level <= 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300684_var_LevelError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	--检查时间
	local nWeekDay = GetWeek()
	if nWeekDay ~= 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300684_var_WeekDayError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	--检查功勋
	local nExploit = GetExploit(varMap,varPlayer)
	if nExploit < 12 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300684_var_ExploitError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	--检查江湖
	local AwardGetBufList = {9011,9012,9013}
	local bHaveBuf = 0
	for i, item in AwardGetBufList do
		if IsHaveSpecificImpact(varMap, varPlayer, item) > 0 then
			bHaveBuf = 1
			break
		end
	end
	if bHaveBuf == 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300684_var_NoJiangHuError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	
	--计算奖励
	local money = 0		--金卡
	local ding = 0
	local liang = 0
	local wen = 0
	
	
	local lastweek = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEK[1],MD_NEIZHENG_WEEK[2],MD_NEIZHENG_WEEK[3])
	local round = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEKCOUNT[1],MD_NEIZHENG_WEEKCOUNT[2],MD_NEIZHENG_WEEKCOUNT[3])
	
	if round < 0 then 
		round = 0 
	end
	
	--如果周不匹配
	if x300684_GetNeiZhengWeek() ~= lastweek then
		round = 0
	end
	
	if round == 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"您本周完成0轮内政任务，无法领取军饷!")
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	money = GetMilitaryRankMoneyByLevel( level ) * round * 2 * x300684_var_Multiple; 
	
	if money == 0 then
		return
	end
	
	--添加金卡
	--AddMoney(varMap,varPlayer,3,money,x300684_var_FileId)
	--添加现金
	AddGold(varMap, varPlayer, money )	
	--设置领取的最后周
	x300684_SetLastWeek(varMap,varPlayer)
	
	--记录玩法日志
	if x300684_var_GameLogID > 0 then
		GamePlayScriptLog(varMap,varPlayer, x300684_var_GameLogID)
	end

	--获取奖历提示
	 local	ding = floor( money / (1000*1000) )
	 local	liang = floor( mod(money,1000*1000)/ 1000 )
	 local  wen = mod(money,1000)
	
	
	local msg  = format(x300684_var_GiveBonusTips,ding,liang,wen)
	Msg2Player(varMap, varPlayer, msg, 0, 3)

end

----------------------------------------------------------------------------------------------
--放弃
----------------------------------------------------------------------------------------------
function x300684_ProcQuestAbandon( varMap, varPlayer, varQuestId )
end

----------------------------------------------------------------------------------------------
--继续
----------------------------------------------------------------------------------------------
function x300684_OnContinue( varMap, varPlayer, varTalknpc )
end

----------------------------------------------------------------------------------------------
--检测是否可以提交
----------------------------------------------------------------------------------------------
function x300684_CheckSubmit( varMap, varPlayer )
end

----------------------------------------------------------------------------------------------
--提交
----------------------------------------------------------------------------------------------
function x300684_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, varQuestId )
end

----------------------------------------------------------------------------------------------
--杀死怪物或玩家
----------------------------------------------------------------------------------------------
function x300684_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, varQuestId )
end

----------------------------------------------------------------------------------------------
--进入区域事件
----------------------------------------------------------------------------------------------
function x300684_ProcAreaEntered( varMap, varPlayer, zoneId, varQuestId )
end

----------------------------------------------------------------------------------------------
--道具改变
----------------------------------------------------------------------------------------------
function x300684_ProcQuestItemChanged( varMap, varPlayer, itemdataId, varQuestId )
end
