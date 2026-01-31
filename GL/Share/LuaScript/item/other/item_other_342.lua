x418342_var_FileId = 418342 


function x418342_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418342_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418342_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418342_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418342_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418342_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11000606, 5 ) --四级冥铁5个
	ItemAppendBind( varMap, 12030695, 1 ) --副手图谱·生命奖券1个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2512) 
		local message = format("打开天外冥铁包，获得了物品：#R5个四级冥铁和1个副手图谱·生命奖券")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				
end

function x418342_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
