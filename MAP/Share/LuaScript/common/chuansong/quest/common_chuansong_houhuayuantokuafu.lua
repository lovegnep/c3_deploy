--DECLARE_QUEST_INFO_START--
x490700_var_FileId = 490700

x490700_var_Info = {
									 		{ levelMin = 70, levelMax = 79,  info = "前往70级跨服后花园（一）", map = 539, gamelog = 11083, server = 7 },
									 		{ levelMin = 70, levelMax = 79,  info = "前往70级跨服后花园（二）", map = 540, gamelog = 11083, server = 8 },
									 		{ levelMin = 80, levelMax = 89,  info = "前往80级跨服后花园（一）", map = 541, gamelog = 11084, server = 7 },
									 		{ levelMin = 80, levelMax = 89,  info = "前往80级跨服后花园（二）", map = 542, gamelog = 11084, server = 8 },
									 		{ levelMin = 90, levelMax = 160, info = "前往90级以上跨服后花园", map = 543, gamelog = 11085, server = 7 },
									 }

--DECLARE_QUEST_INFO_STOP--

function x490700_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(2005) ~= 1 then
		return
	end
	local level = GetLevel( varMap, varPlayer )
	if ( level < 70 ) then
		Msg2Player(varMap,varPlayer,"只有70级以上的玩家才能使用此功能",8,3)
		return
	end
	for varI,item in x490700_var_Info do
		if ( level >= item.levelMin and level <= item.levelMax ) then
			TalkAppendButton(varMap, x490700_var_FileId, item.info, 14, varI )
		end
	end
end

function x490700_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, index)
	
	local varNum = GetMapServerCurUserNum(x490700_var_Info[index].server)
	if varNum == -1 then
		Msg2Player(varMap,varPlayer,"跨服服务器忙",8,3)
		return
	end
         
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
	if ( level >= x490700_var_Info[index].levelMin and level <= x490700_var_Info[index].levelMax ) then
		GamePlayScriptLog( varMap, varPlayer, x490700_var_Info[index].gamelog )
		NewWorld(varMap, varPlayer, x490700_var_Info[index].map, X, Y, 490700)
	end
	
end

function x490700_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x490700_CheckPushList(varMap, varPlayer, varTalknpc)
end

function x490700_ProcAccept(varMap, varPlayer)
end

function x490700_ProcQuestAbandon(varMap, varPlayer, varQuest)
end

function x490700_CheckSubmit( varMap, varPlayer, varTalknpc)
end

function x490700_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x490700_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x490700_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end
