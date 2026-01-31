x310326_var_FileId = 310326 


x310326_var_DestSceneName = "阿尔金山"
x310326_var_DestSceneId = {8}
x310326_var_BossType = {17007,17008,17009,17010,17011,17012,17013}

function x310326_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

	
	if varMap == 8 then
	local bossnb = random(1,7)
	local varRet = CreateMonster( varMap, x310326_var_BossType[bossnb], PlayerPosX, PlayerPosZ, 1, -1, x310326_var_FileId, -1, 21)

		if varRet > 0 then
			if DelItem( varMap, varPlayer, 12035000, 1) ~= 1 then return 0 end
			local message = "屈出律的部将出现了！"
			Msg2Player(varMap,varPlayer,message, 8, 2)
			Msg2Player(varMap,varPlayer,message, 8, 3)
			
		end
	
	
	else
		local varText = format("这里无法召出屈出律部将，请前往阿尔金山" )
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end	
end

function x310326_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310326_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310326_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310326_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310326_ProcActivateOnce( varMap, varPlayer )
end

function x310326_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310326_ProcDie(varMap, varPlayer, varKiller)
	
	GamePlayScriptLog(varMap, varKiller, 551)
				
end

