x418332_var_FileId = 418332 


function x418332_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418332_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418332_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418332_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418332_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418332_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 12030258, 25 ) --全福月饼25个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2502) 
		local message = format("打开月饼大礼包，获得了物品：#R25个全福月饼")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

	if GetBagSpace(varMap, varPlayer) >= 1 then
		local varRand = random (1,100)
		if varRand <= 10 then
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12030688, 1 ) --8%经验时装包
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R精品节日时装礼包"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开月饼大礼包，获得了精品节日时装礼包"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		end
	end
end

function x418332_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
