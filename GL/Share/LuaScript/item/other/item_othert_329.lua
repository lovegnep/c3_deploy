x432329_var_FileId = 432329 


function x432329_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432329_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432329_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432329_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432329_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432329_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 3 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 12500054, 1 ) --冥甲大件图谱包
	ItemAppendBind( varMap, 12500055, 1 ) --冥甲小件图谱包
	ItemAppendBind( varMap, 12500058, 1 ) --战甲图谱·生命奖券
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2513)
		local message = format("打开冥甲图谱包，获得了物品：#R冥甲大件，小件图谱包各一个和1个战甲图谱·生命奖券")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3) 
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				
end

function x432329_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
