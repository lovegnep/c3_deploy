--DECLARE_QUEST_INFO_START--
x490701_var_FileId = 490701

--DECLARE_QUEST_INFO_STOP--

function x490701_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x490701_var_FileId, "返回本服后花园", 14 )
end

function x490701_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, index)
         
	local selfType = GetObjType(varMap, varPlayer)
	if selfType == 1 then 
		if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
	end
	
	local varText = ""
	local CanTrans = IsCashboxState(varMap,varPlayer)	
	if CanTrans == 1 then
		StartTalkTask(varMap)
			varText = "#Y运镖或者护送状态中，不允许传送"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local level = GetLevel( varMap, varPlayer )
	local country = GetCurCountry( varMap, varPlayer )
	local X = 0
	local Y = 0
	if ( country == 0 ) then
		X = 272
		Y = 426
	elseif ( country == 1 ) then
		X = 177
		Y = 42
	elseif ( country == 2 ) then
		X = 38 
		Y = 277 
	elseif ( country == 3 ) then
		X = 418
		Y = 27
	else
		return
	end
	
	NewWorld(varMap, varPlayer, 44, X, Y, 490701)
	
end

function x490701_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x490701_CheckPushList(varMap, varPlayer, varTalknpc)
end

function x490701_ProcAccept(varMap, varPlayer)
end

function x490701_ProcQuestAbandon(varMap, varPlayer, varQuest)
end

function x490701_CheckSubmit( varMap, varPlayer, varTalknpc)
end

function x490701_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x490701_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x490701_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x490701_ProcMapTimerTick(varMap, nowTime)
end

function x490701_ProcPlayerEnter(varMap, varPlayer)
end

function x490701_ProcPlayerRelive(varMap, varPlayer, varReliveOp)
	
	if ( varReliveOp == 2 ) then
		local country = GetCurCountry( varMap, varPlayer )
		local X = 0
		local Y = 0
		if ( country == 0 ) then
			X = 272
			Y = 426
		elseif ( country == 1 ) then
			X = 177
			Y = 42
		elseif ( country == 2 ) then
			X = 38 
			Y = 277 
		elseif ( country == 3 ) then
			X = 418
			Y = 27
		else
			return
		end
		
		if GetHp(varMap,varPlayer) <= 0 then
			RestoreHp(varMap, varPlayer, 0)
			RestoreRage(varMap, varPlayer, 100)
			ClearMutexState(varMap, varPlayer, 6)
			SendReliveResult(varMap, varPlayer,1)		
		end
	
		SetPos(varMap,varPlayer,X,Y)
		return 1
	end
	
	return 0
end

function x490701_ProcPlayerDie(varMap, varPlayer, varKiller)
end

function x490701_ProcPlayerLeaveGuild(varMap, varPlayer)
end

function x490701_ProcPlayerLeave( varMap, varPlayer )
end
