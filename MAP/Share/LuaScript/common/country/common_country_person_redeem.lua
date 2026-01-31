
x300637_var_FileId          		= 300637
x300637_var_Leader_Index      		= 5
x300637_var_QuestName       		="【国家】领取国民津贴"
x300637_var_HaveBonusThisWeek			="\t您本周已经领取过国民津贴了，每周只能领取一次。"
x300637_var_LevelError				="\t很遗憾，只有不低于60级的玩家才可以领取国民津贴。"
x300637_var_WeekDayError				="\t很遗憾，只有周日才可以领取国民津贴。"
x300637_var_ExploitError				="\t很遗憾，只有本周功勋值不低于18点的玩家才能领取国民津贴。"
x300637_var_BonusTips					="#Y【国家】领取国民津贴\n\t#W国民津贴，是为了奖励国家普通国民对国家做出的贡献。\n\t每天是否能坚持完成#G一整轮内政#W，将直接影响国民津贴的多少。\n\t等级不低于#G60#W，每周功勋值不低于#G18#W点的玩家，每#G周日#W可以在我这里领取国民津贴。#r \n\t您本周的功勋值为#G%d#W\n\t您本周共完成了#G%d#W轮内政任务"
x300637_var_BonusTips1        ="\n\t按照以上的统计，您共可以领取：\n\t#R%d#W锭#R%d#W两#R%d#W文现金\n\t#R%d#W锭#R%d#W两#R%d#W文现银"
x300637_var_GiveBonusTips				="#Y领取国民津贴完成，您获得#R%d#Y锭#R%d#Y两#R%d#Y文现金的奖励。"
x300637_var_GiveBonusTips1			="#Y领取国民津贴完成，您获得#R%d#Y锭#R%d#Y两#R%d#Y文现银的奖励。"
x300637_var_EmpireBonusTips	    ="\n\t#R您为皇帝国成员，额外获得75两现金的奖励。#W"
x300637_var_GameOpenID				= 1033
x300637_var_GamePlayID				= 1342
x300637_var_Multiple 				= 2*5
x300637_var_Multiple_Money2			= 2*2
x300637_var_Empireextra     = 15000*5

function x300637_GetCurrentWeek()
		
	local nCurrentTime = (GetCurrentTime()+8*3600)/86400 - 4  
	local nWeek = floor(nCurrentTime / 7)		 
	return nWeek
end

function x300637_GetLastWeek(varMap,varPlayer)
	
	return GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_PERSON_REDEEM_WEEK[1],MD_COUNTRY_PERSON_REDEEM_WEEK[2],MD_COUNTRY_PERSON_REDEEM_WEEK[3])
	
end

function x300637_SetLastWeek(varMap,varPlayer)
	
	SetPlayerGameData(varMap,varPlayer,MD_COUNTRY_PERSON_REDEEM_WEEK[1],MD_COUNTRY_PERSON_REDEEM_WEEK[2],MD_COUNTRY_PERSON_REDEEM_WEEK[3],x300637_GetCurrentWeek())
end

function x300637_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	
	if GetGameOpenById(x300637_var_GameOpenID) ~= 1 then
		return
	end
		
	TalkAppendButton(varMap,x300637_var_FileId,x300637_var_QuestName,3,-1);
	
end

function x300637_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	if GetGameOpenById(x300637_var_GameOpenID) ~= 1 then
		return
	end

	local varLevel = GetLevel(varMap,varPlayer)
	local nWeekDay = GetWeek()
	local nExploit = GetExploit(varMap,varPlayer)
	local money1 = 0		
	local money2 = 0		
	if nExploit >=18 then
		money1 = 2*1000   
		money2 = 8*1000   
	else
		money1 = 0
		money2 = 0
    end

	local ding = 0
	local liang = 0
	local wen = 0
	local ding1 = 0
	local liang1 = 0
	local wen1 = 0
	
	local lastweek = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEK[1],MD_NEIZHENG_WEEK[2],MD_NEIZHENG_WEEK[3])
	local round = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEKCOUNT[1],MD_NEIZHENG_WEEKCOUNT[2],MD_NEIZHENG_WEEKCOUNT[3])
	
	if round < 0 then 
		round = 0 
	end
	
	if x300637_GetCurrentWeek() ~= lastweek then
		round = 0
	end
	
	money1 = (money1 + round*1000) * x300637_var_Multiple
		if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
			money1 = money1 + x300637_var_Empireextra 
		end
	money2 = (money2 + round*4*1000) * x300637_var_Multiple_Money2
	 local	ding = floor( money1 / (1000*1000) )
	 local	liang = floor( mod(money1,1000*1000)/ 1000 )
	 local  wen = mod(money1,1000)
	 local	ding1 = floor( money2 / (1000*1000) )
	 local	liang1 = floor( mod(money2,1000*1000)/ 1000 )
	 local  wen1 = mod(money2,1000)
	
	local varMsg = format(x300637_var_BonusTips..x300637_var_BonusTips1,nExploit,round,ding,liang,wen,ding1,liang1,wen1)
		if GetCurCountry(varMap, varPlayer) == GetEmpireCountry() then
			varMsg = format(x300637_var_BonusTips..x300637_var_EmpireBonusTips..x300637_var_BonusTips1,nExploit,round,ding,liang,wen,ding1,liang1,wen1)	
		end
	StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
    StopTalkTask(varMap)
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300637_var_FileId, x300637_var_FileId)
end

function x300637_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	
	if GetGameOpenById(x300637_var_GameOpenID) ~= 1 then
		return 0
	end
	
    return 1
end

function x300637_ProcAccept( varMap, varPlayer )
	
	if GetGameOpenById(x300637_var_GameOpenID) ~= 1 then
		return
	end
	
	if x300637_GetCurrentWeek() == x300637_GetLastWeek(varMap,varPlayer) then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300637_var_HaveBonusThisWeek)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 60 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300637_var_LevelError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local nWeekDay = GetWeek()
	if nWeekDay ~= 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300637_var_WeekDayError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local nExploit = GetExploit(varMap,varPlayer)
	if nExploit < 18 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300637_var_ExploitError)
	    StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local money1 = 2*1000		
	local money2 = 8*1000		
	local ding = 0
	local liang = 0
	local wen = 0
	local ding1 = 0
	local liang1 = 0
	local wen1 = 0
	
	local lastweek = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEK[1],MD_NEIZHENG_WEEK[2],MD_NEIZHENG_WEEK[3])
	local round = GetPlayerGameData(varMap,varPlayer,MD_NEIZHENG_WEEKCOUNT[1],MD_NEIZHENG_WEEKCOUNT[2],MD_NEIZHENG_WEEKCOUNT[3])
	
	if round < 0 then 
		round = 0 
	end
	
	if x300637_GetCurrentWeek() ~= lastweek then
		round = 0
	end
	
	money1 = (money1 + round*1000) * x300637_var_Multiple
	money2 = (money2 + round*4*1000) * x300637_var_Multiple_Money2 
	
	if GetCurCountry(varMap, varPlayer) == GetEmpireCountry()  then
		money1 = money1 + x300637_var_Empireextra 
	end
	
	--AddMoney(varMap,varPlayer,3,money1,x300637_var_FileId)
	--更现金奖励
	AddGold(varMap, varPlayer, money1 )	
	--现银奖励	
	AddMoney(varMap,varPlayer,0,money2,x300637_var_FileId)	
	x300637_SetLastWeek(varMap,varPlayer)
	
	GamePlayScriptLog(varMap,varPlayer,x300637_var_GamePlayID)

	 local	ding = floor( money1 / (1000*1000) )
	 local	liang = floor( mod(money1,1000*1000)/ 1000 )
	 local  wen = mod(money1,1000)
	 local	ding1 = floor( money2 / (1000*1000) )
	 local	liang1 = floor( mod(money2,1000*1000)/ 1000 )
	 local  wen1 = mod(money2,1000)
		
	local varMsg  = format(x300637_var_GiveBonusTips,ding,liang,wen)
	local varMsg1 = format(x300637_var_GiveBonusTips1,ding1,liang1,wen1)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	Msg2Player(varMap, varPlayer, varMsg1, 0, 3)
end

function x300637_ProcQuestAbandon( varMap, varPlayer, varQuest )
end

function x300637_ProcContinue( varMap, varPlayer, varTalknpc )
end

function x300637_CheckSubmit( varMap, varPlayer )
end

function x300637_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

function x300637_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end

function x300637_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end

function x300637_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
