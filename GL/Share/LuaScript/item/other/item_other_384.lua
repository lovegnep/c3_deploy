x418384_var_FileId = 418384 


function x418384_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418384_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418384_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418384_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418384_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418384_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11000552, 20 ) --完美星辰20个
	ItemAppendBind( varMap, 14040038, 1 ) --生命符石
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2646)
		local message = format("打开完美星辰包，获得了物品：#R20个完美星辰和1个高级生命符石")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3) 
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

end

function x418384_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
