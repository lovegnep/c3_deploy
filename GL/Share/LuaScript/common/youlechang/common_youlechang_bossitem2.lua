x310344_var_FileId = 310344 


x310344_var_DestSceneName = ""
x310344_var_DestSceneId = {17}
x310344_var_BossType = {17021,17022,17023,17024,17025,17026,17027}

function x310344_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

	
	if varMap == 17 then
	local bossnb = random(1,7)
	local varRet = CreateMonster( varMap, x310344_var_BossType[bossnb], PlayerPosX, PlayerPosZ, 1, -1, x310344_var_FileId, -1, 21)

		if varRet > 0 then
			if DelItem( varMap, varPlayer, 12035002, 1) ~= 1 then return 0 end
			local message = "弗拉基米尔的部将出现了！"
			Msg2Player(varMap,varPlayer,message, 8, 2)
			Msg2Player(varMap,varPlayer,message, 8, 3)
			
		end
	
	
	else
		local varText = format("这里无法召出弗拉基米尔部将，请前往莫斯科公国" )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end	
end

function x310344_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310344_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310344_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310344_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310344_ProcActivateOnce( varMap, varPlayer )
end

function x310344_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310344_ProcDie(varMap, varPlayer, varKiller)
	
	GamePlayScriptLog(varMap, varKiller, 551)
				
end

