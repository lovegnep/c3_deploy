x418333_var_FileId = 418333 


function x418333_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418333_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418333_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418333_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418333_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418333_ProcActivateOnce( varMap, varPlayer )
	if GetBagSpace(varMap, varPlayer) < 3 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 12030013, 40 ) --芝华士40瓶
	ItemAppendBind( varMap, 12030014, 20 ) --轩尼诗理查20瓶
	ItemAppendBind( varMap, 12030203, 1 ) --朝廷请柬1个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2503)
		local message = format("打开香醇美酒包，获得了物品：#R40瓶芝华士，20瓶轩尼诗理查和1个朝廷请柬")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3) 
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

	local varRand = random (1,100)
	if varRand <= 10 then
		local nValue = 100
		AddGuildUserPoint(varMap, varPlayer, nValue)	
		Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
		Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
	elseif varRand <= 20 then
		local nValue = 250
		AddHonor(varMap, varPlayer, nValue)
		Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
		Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
	end
end

function x418333_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
