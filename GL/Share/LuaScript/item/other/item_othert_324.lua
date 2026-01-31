x432324_var_FileId = 432324 


function x432324_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432324_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432324_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432324_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432324_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432324_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 11000902, 62 ) --高级洗石剂62个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2508) 
		local message = format("打开点石成金包，获得了物品：#R62个高级洗石剂")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

	if GetBagSpace(varMap, varPlayer) >= 1 then
		local varRand = random (1,100)
		if varRand <= 3 then
			StartItemTask( varMap )
			ItemAppendBind( varMap, 11000904, 1 ) --大师级洗石剂
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R大师级洗石剂"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开点石成金包，获得了大师级洗石剂"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		end
	end
end

function x432324_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
