x310057_var_FileId = 310057 


x310057_var_DestSceneName1 = "后花园"
x310057_var_DestSceneId = {44}


function x310057_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

	
	if varMap == 44 then
	local Positionx1 = 472
	local Positionz1 = 251
	local distanceRet = 5 * 5 - (Positionx1 - PlayerPosX) * (Positionx1 - PlayerPosX) - (Positionz1 - PlayerPosZ) * (Positionz1 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx1, Positionz1 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3246, PlayerPosX, PlayerPosZ, 0, -1, x310057_var_FileId, 160055, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在后花园召出了冥龙"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
		
	
	end
	else
		local varText = format("这里毫无灵气，无法召唤出冥龙之魂！" )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end	
end

function x310057_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310057_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310057_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310057_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310057_ProcActivateOnce( varMap, varPlayer )
end

function x310057_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310057_ProcDie(varMap, varPlayer, varKiller)
	
	x310057_UpdateTopList(varMap, varKiller)
	GamePlayScriptLog(varMap, varKiller, 551)
				
end

function x310057_UpdateTopList(varMap,varPlayer)

	local varLastday = GetPlayerGameData( varMap, varPlayer, MD_TULONG_DAY[1], MD_TULONG_DAY[2], MD_TULONG_DAY[3] )
	local curCount = GetPlayerGameData( varMap, varPlayer, MD_TULONG_COUNT[1], MD_TULONG_COUNT[2], MD_TULONG_COUNT[3] )
	local curday = GetWeekFirstDay()
	if varLastday ~= curday then
		curCount = 0
	end
	curCount = curCount + 1
	SetPlayerGameData( varMap, varPlayer, MD_TULONG_COUNT[1], MD_TULONG_COUNT[2], MD_TULONG_COUNT[3], curCount )
	SetPlayerGameData( varMap, varPlayer, MD_TULONG_DAY[1], MD_TULONG_DAY[2], MD_TULONG_DAY[3], curday )
	
	SendToplistKeyValue2GL(varMap, varPlayer, TULONG_TOPLIST, curCount)
	
end
