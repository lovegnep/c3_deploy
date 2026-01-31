x432322_var_FileId = 432322 


function x432322_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432322_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432322_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432322_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432322_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432322_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11000501, 50 ) --紫檀木炭50个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2505) 
		local message = format("打开炫紫神迷包，获得了物品：#R50个紫檀木炭")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

	if GetBagSpace(varMap, varPlayer) >= 1 then
		local varRand = random (1,100)
		if varRand <= 1 then
			StartItemTask( varMap )
			ItemAppendBind( varMap, 11000137, 1 ) --玄金钻
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R玄金钻"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开炫紫神迷包，获得了玄金钻"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		end
	end
end

function x432322_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
