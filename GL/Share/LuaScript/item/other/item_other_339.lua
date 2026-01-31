x418339_var_FileId = 418339 


function x418339_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418339_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1 
	
	
end

function x418339_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418339_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418339_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418339_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11010001, 60 ) --一级皇家秘银60个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2509)
		local message = format("打开皇家秘银包，获得了物品：#R60个一级皇家秘银")
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
			ItemAppendBind( varMap, 12030689, 1 ) --皇家时装礼包
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R皇家时装礼包"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开皇家秘银包，获得了皇家时装礼包"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		end
	end
end

function x418339_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
