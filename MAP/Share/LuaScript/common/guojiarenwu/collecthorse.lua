


x300516_var_FileId = 300516
x300516_var_QuestName = "【个人】内政任务"

x300516_var_strQuestSubmitContent = "\t你捕捉到我要的马了吗？"
x300516_var_strWrongHorse = "\t这不是我要的马。"
x300516_var_strGoodHorse = "\t这是一匹千载难逢的良马幼仔，你真的要把它交给国家吗？"
x300516_var_strNormalHorse = "\t感谢你给我们提供战马，你真的要把它交给国家吗？"


x300516_var_CollectHorse_Quest_ID	= 6430
x300516_var_CollectHorse_Quest_ID_End   = 6446
x300516_var_CollectHorse_Young		= 6445

x300516_var_IsGoodHorse = 2

x300516_var_CommitedHorseID_HIGH = 4

x300516_var_CommitedHorseID_LOW = 5

x300516_ProceRoundCount = 10

x300516_HighBonusCircleCount = 10
x300516_LevelToCapital = 300	

function x300516_ProcCanCompleteQuest ( varMap, varPlayer, varTalknpc, varQuest )

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	
		StartTalkTask( varMap)
		
			TalkAppendString(varMap, "#Y"..x300516_var_QuestName)
			TalkAppendString( varMap, x300516_var_strQuestSubmitContent)
		StopTalkTask()
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)

	    
		StartGCDTask( varMap);
			GCDAppendInt( varMap, x300516_var_FileId);
			GCDAppendInt( varMap, varQuest);
			GCDAppendInt( varMap, varTalknpc);
			DeliverGCDInfo( varMap, varPlayer, 101);
		StopGCDTask( varMap)
		
		return 0
end










function x300516_ProcCommitPet( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, iHorseIndex)

	
	if (x300516_IsCollectHorse(varQuest) == 0) then
		return 0
	end

	local curQuestId = x300516_GetMD(varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID)
	
	if (varQuest ~= curQuestId) then
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	local horseTypeID = GetHorseDataID( varMap, varPlayer, iHorseIndex )

	if (x300516_IsNeededHorse(varQuest, horseTypeID) == 0) then
		
		StartTalkTask( varMap)
		
			TalkAppendString(varMap, "#Y"..x300516_var_QuestName)
			TalkAppendString( varMap, x300516_var_strWrongHorse)
		StopTalkTask()
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)
		return 0
	end

	local bIsGood = 1
	local kindtype = mod(horseTypeID, 10)
	if (kindtype == 1) then
		bIsGood = 0
	end

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300516_var_IsGoodHorse, bIsGood)
	
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300516_var_CommitedHorseID_HIGH, horseGUID_high)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300516_var_CommitedHorseID_LOW, horseGUID_low)
	
	StartTalkTask(varMap);
	
	TalkAppendString(varMap, "#Y"..x300516_var_QuestName)
	local varStr
	if(bIsGood == 0) then
		varStr = x300516_var_strNormalHorse
	else
		varStr = x300516_var_strGoodHorse
	end
	TalkAppendString( varMap, varStr)

	local curlevel = GetLevel(varMap, varPlayer)
	local varExp = x300516_GetExpAward ( varMap, varPlayer, curlevel );
	local money,shengw = x300516_GetMoneyAward ( varMap, varPlayer, curlevel );
	if bIsGood == 1 then
		varExp = varExp * 2
		money = money * 2
		shengw = shengw * 2
	end
	if(varExp > 0) then
		AddQuestExpBonus(varMap, varExp)
	end
	if(money > 0) then
		AddQuestMoneyBonus2(varMap, money)
	end
	if(shengw > 0) then
		AddQuestMoneyBonus5(varMap, shengw)
	end
	StopTalkTask();

	DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x300516_var_FileId, varQuest )
	return 1
end


function x300516_HorseSubmit( varMap, varPlayer, varQuest )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	
	local horseGUID_high = GetQuestParam( varMap, varPlayer, varQuestIdx, x300516_var_CommitedHorseID_HIGH)
	local horseGUID_low = GetQuestParam( varMap, varPlayer, varQuestIdx, x300516_var_CommitedHorseID_LOW)
	
	local varRet = FreeHorse( varMap, varPlayer, horseGUID_high, horseGUID_low)
	if (varRet <= 0) then
		local strErr
		if (varRet == 0) then
			strErr = "骑乘已锁定，不能交付"
		elseif (varRet == -2) then
			strErr = "骑乘正在出战状态，不能交付"
		else
			strErr = "您所选择的骑乘并不存在"
		end
		Msg2Player(varMap, varPlayer, strErr, 8, 3)	
		Msg2Player(varMap, varPlayer, strErr, 8, 2)
		return 0, 0
	end

	local bGoodHorse = GetQuestParam( varMap, varPlayer, varQuestIdx, x300516_var_IsGoodHorse)
	local awardrate
	if(bGoodHorse == 1) then
		awardrate =  2
	else
		awardrate = 1
	end

	


	
	StartGCDTask( varMap)
		DeliverGCDInfo( varMap, varPlayer, 102)
	StopGCDTask( varMap)

	
	
	return 1, awardrate
end


function x300516_GetExpAward(varMap, varPlayer, startlevel)

	x300516_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300516_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300516_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)
	
	varCircle = varCircle + 1
	if (varCircle > x300516_ProceRoundCount) then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local exp_rate
	if GetLevel(varMap, varPlayer) >= 60 then
		exp_rate = 3650
	else
		exp_rate = 2800
	end

	local BonusExp = startlevel * exp_rate * (varCircle * 2 - 1) / 200
	if (highcircle <= x300516_HighBonusCircleCount) then
		BonusExp = BonusExp * 5
	end
    
    BonusExp = BonusExp * 2
	return BonusExp;

end


function x300516_GetMoneyAward(varMap, varPlayer, startlevel)

	x300516_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300516_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300516_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

	varCircle = varCircle + 1
	if (varCircle > x300516_ProceRoundCount) then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local BonusMoney = startlevel
	local shengw = 5
	if (highcircle <= x300516_HighBonusCircleCount) then
		BonusMoney = BonusMoney * 5
		shengw = 25
	end
	return BonusMoney,shengw;
end

function x300516_SetMD(varMap, varPlayer, MDNAME, value)
	SetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3], value);
end

function x300516_GetMD(varMap, varPlayer, MDNAME)

	return GetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3])
end



function x300516_CheckDayChanged(varMap, varPlayer)
	local varLastday = x300516_GetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY)
	local varToday = GetDayOfYear()
	if varLastday ~= varToday then	
		x300516_SetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, varToday)	
		x300516_SetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH, 0)
	end
end

function x300516_IsNeededHorse(varQuest, horseId)

	if x300516_IsCollectHorse(varQuest) == 0 then
		return 0
	end

	local kindtype = mod(horseId, 10)
	if (varQuest < x300516_var_CollectHorse_Young) then
		if (kindtype >= 5) then
			return 0
		end
		local group = floor(horseId / 100)
		if (group ~= varQuest - x300516_var_CollectHorse_Quest_ID + 2 ) then
			return 0
		end
	else
		if (kindtype > 5) then
			return 0
		end
		local group = floor(horseId / 10)
		if (group > 5) then
			return 0
		end
	end

	return 1
end


function x300516_IsCollectHorse(varQuest)
	if varQuest >= x300516_var_CollectHorse_Quest_ID and varQuest <= x300516_var_CollectHorse_Quest_ID_End then
		return 1
	else
		return 0
	end
end





















