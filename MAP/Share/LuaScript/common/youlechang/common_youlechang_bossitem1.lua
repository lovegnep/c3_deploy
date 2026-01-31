x310343_var_FileId = 310343 


x310343_var_DestSceneName = "撒马尔罕"
x310343_var_DestSceneId = {11}
x310343_var_BossType = {17014,17015,17016,17017,17018,17019,17020}

function x310343_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

	
	if varMap == 11 then
	local bossnb = random(1,7)
	local varRet = CreateMonster( varMap, x310343_var_BossType[bossnb], PlayerPosX, PlayerPosZ, 1, -1, x310343_var_FileId, -1, 21)

		if varRet > 0 then
			if DelItem( varMap, varPlayer, 12035001, 1) ~= 1 then return 0 end
			local message = "扎兰丁的部将出现了！"
			Msg2Player(varMap,varPlayer,message, 8, 2)
			Msg2Player(varMap,varPlayer,message, 8, 3)
			
		end
	
	
	else
		local varText = format("这里无法召出扎兰丁部将，请前往撒马尔罕" )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end	
end

function x310343_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310343_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310343_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310343_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310343_ProcActivateOnce( varMap, varPlayer )
end

function x310343_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310343_ProcDie(varMap, varPlayer, varKiller)
	
	GamePlayScriptLog(varMap, varKiller, 551)
				
end

