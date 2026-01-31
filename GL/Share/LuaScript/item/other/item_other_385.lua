x418385_var_FileId = 418385 


function x418385_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418385_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418385_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418385_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418385_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418385_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11000365, 10 ) --高级打磨剂10个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2647)
		local message = format("打开高级打磨剂礼包，获得了物品：#R10个高级打磨剂")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3) 
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

end

function x418385_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
