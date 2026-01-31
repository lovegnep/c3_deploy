

x405500_var_FileId = 405500 
function x405500_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local money = GetMoney(varMap, varPlayer, 2)
	if CostMoney(varMap, varPlayer, 2, money, 307) == 1 then
		if DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1, 107) ~= 1 then return 0 end
		local varText = "您使用了道具清除了现金"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,varText, 8, 2)
	end
end

function x405500_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x405500_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x405500_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x405500_ProcDeplete( varMap, varPlayer )

	return 0
end

function x405500_ProcActivateOnce( varMap, varPlayer )
end

function x405500_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

