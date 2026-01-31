x418341_var_FileId = 418341 


function x418341_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418341_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418341_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418341_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418341_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418341_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11000908, 100 ) --蓝光珐琅100个
	ItemAppendBind( varMap, 12030694, 1 ) --主手图谱·生命奖券1个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2511)
		local message = format("打开蓝光珐琅包，获得了物品：#R100个蓝光珐琅和1个主手图谱·生命奖券")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3) 
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				
end

function x418341_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
