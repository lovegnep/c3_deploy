x305034_var_FileId = 305034 
x305034_var_Mis_Count = 10

function x305034_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if x305034_GetDayCount(varMap, varPlayer) >= x305034_var_Mis_Count then
		local varReadme = "很抱歉，今天您的召唤次数已达上限！" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )	
	if varMap == 46 then
		local Positionx1 = 59
		local Positionz1 = 51
		local distanceRet = 5 * 5 - (Positionx1 - PlayerPosX) * (Positionx1 - PlayerPosX) - (Positionz1 - PlayerPosZ) * (Positionz1 - PlayerPosZ)

		if distanceRet <=0 then
			local varText = format("您应该在[%d,%d]使用此物品！", Positionx1, Positionz1 )
			Msg2Player(varMap,varPlayer,varText, 8, 2)
			Msg2Player(varMap,varPlayer,varText, 8, 3)
			return 0
		end

		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		
		CreateMonster( varMap, 56611, PlayerPosX, PlayerPosZ, 0, -1, x305034_var_FileId, 160038, 21)
		Msg2Player( varMap, varPlayer, "召唤出了黑戾魔尊", 8, 2)
		Msg2Player( varMap, varPlayer, "召唤出了黑戾魔尊", 8, 3)
		local message = GetName(varMap, varPlayer)
		message = message.."在地下粮仓二层召出了黑戾魔尊"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
		LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )
		
		x305034_SetDayCount(varMap, varPlayer)
		
	else
		local varText = format("这里毫无灵气，无法使用金色黑戾符文，请在地下粮仓二层使用！" )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end
		
end

function x305034_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x305034_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x305034_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x305034_ProcDeplete( varMap, varPlayer )

	return 0
end

function x305034_ProcActivateOnce( varMap, varPlayer )
end

function x305034_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x305034_ProcDie(varMap, varPlayer, varKiller)
	GamePlayScriptLog(varMap, varKiller, 551)
end

function x305034_GetDayCount(varMap, varPlayer)
	if x305034_var_Mis_Count > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_DATE[1], MD_HOUHUAYUAN_ZHAOHUAN_DATE[2], MD_HOUHUAYUAN_ZHAOHUAN_DATE[3])
		if varLastday ~= varToday then
			return 0
		end
		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_COUNT[1], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[2], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[3])
		return varDaycount
	end
	return 0
end

function x305034_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_DATE[1], MD_HOUHUAYUAN_ZHAOHUAN_DATE[2], MD_HOUHUAYUAN_ZHAOHUAN_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_DATE[1], MD_HOUHUAYUAN_ZHAOHUAN_DATE[2], MD_HOUHUAYUAN_ZHAOHUAN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_COUNT[1], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[2], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_COUNT[1], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[2], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_ZHAOHUAN_COUNT[1], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[2], MD_HOUHUAYUAN_ZHAOHUAN_COUNT[3], varDaycount+1)
	end
end
