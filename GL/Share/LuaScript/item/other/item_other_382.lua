x418382_var_FileId = 418382 


function x418382_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if GetBagSpace(varMap, varPlayer) < 1 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end

	local varItem = 11000606 --四级冥铁
	
	StartItemTask( varMap )
	if IsItemBind( varMap, varPlayer, varBagIdx ) == 0 then
		ItemAppend( varMap, varItem, 5 )
	else
		ItemAppendBind( varMap, varItem, 5 )
	end
	
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		local message = format("你打开四级冥铁礼包，获得了物品：#R#{_ITEM%d}", varItem )
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)
		GamePlayScriptLog( varMap, varPlayer, 2641)
	else
		local strText = "背包空间不足,不能使用此物品"
		StartTalkTask(varMap)
		TalkAppendString(varMap, strText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end

function x418382_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x418382_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418382_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x418382_ProcDeplete( varMap, varPlayer )

	return 0
end

function x418382_ProcActivateOnce( varMap, varPlayer )
end

function x418382_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
