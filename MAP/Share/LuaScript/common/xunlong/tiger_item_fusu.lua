x310056_var_FileId = 310056 


x310056_var_DestSceneName1 = "秦岭"
x310056_var_DestSceneName2 = "红沙漠"
x310056_var_DestSceneName3 = "波斯高原"
x310056_var_DestSceneName4 = "波兰王国"
x310056_var_DestSceneName5 = "拜占庭帝国"
x310056_var_DestSceneName6 = "西奈半岛"
x310056_var_DestSceneName7 = "九州"
x310056_var_DestSceneName8 = "印度河"
x310056_var_DestSceneName9 = "苏门答腊"
x310056_var_DestSceneId = {7,10,16,19,22,25,29,32,35}


function x310056_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

	
	if varMap == 7 then
	local Positionx1 = 111
	local Positionz1 = 169
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

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在秦岭召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
	
	elseif varMap == 10 then
	local Positionx2 = 211
	local Positionz2 = 109
	local distanceRet = 5 * 5 - (Positionx2 - PlayerPosX) * (Positionx2 - PlayerPosX) - (Positionz2 - PlayerPosZ) * (Positionz2 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx2, Positionz2 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在红沙漠召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
		
	elseif varMap == 16 then
	local Positionx3 = 90
	local Positionz3 = 198
	local distanceRet = 5 * 5 - (Positionx3 - PlayerPosX) * (Positionx3 - PlayerPosX) - (Positionz3 - PlayerPosZ) * (Positionz3 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx3, Positionz3 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在波斯高原召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
			
	elseif varMap == 19 then
	local Positionx4 = 128
	local Positionz4 = 47
	local distanceRet = 5 * 5 - (Positionx4 - PlayerPosX) * (Positionx4 - PlayerPosX) - (Positionz4 - PlayerPosZ) * (Positionz4 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx4, Positionz4 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在波兰王国召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
		
	elseif varMap == 22 then
	local Positionx5 = 160
	local Positionz5 = 176
	local distanceRet = 5 * 5 - (Positionx5 - PlayerPosX) * (Positionx5 - PlayerPosX) - (Positionz5- PlayerPosZ) * (Positionz5 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx5, Positionz5 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在拜占庭帝国召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
	
	elseif varMap == 25 then
	local Positionx6 = 181
	local Positionz6 = 64
	local distanceRet = 5 * 5 - (Positionx6 - PlayerPosX) * (Positionx6 - PlayerPosX) - (Positionz6- PlayerPosZ) * (Positionz6 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx6, Positionz6 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在西奈半岛召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
	
	elseif varMap == 29 then
	local Positionx7 = 103
	local Positionz7 = 73
	local distanceRet = 5 * 5 - (Positionx7 - PlayerPosX) * (Positionx7 - PlayerPosX) - (Positionz7- PlayerPosZ) * (Positionz7 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx7, Positionz7 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在九州召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
	
	elseif varMap == 32 then
	local Positionx8 = 100
	local Positionz8 = 100
	local distanceRet = 5 * 5 - (Positionx8 - PlayerPosX) * (Positionx8 - PlayerPosX) - (Positionz8- PlayerPosZ) * (Positionz8 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx8, Positionz8 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在印度河召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	
	
	elseif varMap == 35 then
	local Positionx9 = 100
	local Positionz9 = 100
	local distanceRet = 5 * 5 - (Positionx9 - PlayerPosX) * (Positionx9 - PlayerPosX) - (Positionz9- PlayerPosZ) * (Positionz9 - PlayerPosZ)

	if distanceRet <=0 then
		local varText = format("您应该在[%d,%d]使用此物品！", Positionx9, Positionz9 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
		return 0
	end

	local varRet = CreateMonster( varMap, 3069, PlayerPosX, PlayerPosZ, 0, -1, x310056_var_FileId, 160038, 21)

	if varRet > 0 then
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local message = GetName(varMap, varPlayer)
		message = message.."在苏门答腊召出了虎魄星君"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
	
	end
	else
		local varText = format("这里毫无灵气，无法召唤出虎魄星君！" )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end	
end

function x310056_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310056_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310056_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310056_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310056_ProcActivateOnce( varMap, varPlayer )
end

function x310056_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310056_ProcDie(varMap, varPlayer, varKiller)
	
	x310056_UpdateTopList(varMap, varKiller)
	GamePlayScriptLog(varMap, varKiller, 551)
				
end

function x310056_UpdateTopList(varMap,varPlayer)

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
