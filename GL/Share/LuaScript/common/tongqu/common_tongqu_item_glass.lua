x300322_var_FileId = 300322 

function x300322_ProcEventEntry( varMap, varPlayer, varBagIdx )

	local lastTime = GetPlayerRuntimeData( varMap, varPlayer, RD_TONGQU_CD)
	local curTime = GetCurrentTime()
	local message;

	if curTime - lastTime < 10 then
		message = "真视眼镜每10秒内只能使用一次"
		StartTalkTask(varMap)
		TalkAppendString(varMap, message)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,message, 8, 2)
		return
	end
	
	SetPlayerRuntimeData( varMap, varPlayer, RD_TONGQU_CD, curTime)

	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7515, 0)
	message = "你现在可以看到附近游走的生物了，请赶快进行捕捉吧！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, message)
	DeliverTalkTips(varMap, varPlayer)
	StopTalkTask(varMap)
	Msg2Player(varMap,varPlayer,message, 8, 2)
	DoAction(varMap, varPlayer, 100, -1)
	SetViewBeastie( varMap, varPlayer, 1 )

	return
end

function x300322_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x300322_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300322_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300322_ProcDeplete( varMap, varPlayer )

	return 0
end

function x300322_ProcActivateOnce( varMap, varPlayer )
end

function x300322_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
