x418336_var_FileId = 418336 


function x418336_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418336_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418336_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418336_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418336_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418336_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 3 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11990114, 3 ) --次生钻石矿3个
	ItemAppendBind( varMap, 11990115, 2 ) --原生钻石矿2个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2506) 
		local message = format("打开钻石魅力包，获得了物品：#R3个次生钻石矿，2个原生钻石矿")
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
			ItemAppendBind( varMap, 11990113, 1 ) --钻石原石
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R钻石原石"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开钻石魅力包，获得了钻石原石"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		end
	end
end

function x418336_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
