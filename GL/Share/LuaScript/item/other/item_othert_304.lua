x432304_var_FileId = 432304 


function x432304_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432304_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432304_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432304_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432304_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432304_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 4 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	
	local cur_metier = GetZhiye( varMap , varPlayer )
	if cur_metier == 0 or cur_metier == 1 or cur_metier == 6 or cur_metier == 7 then
		ItemAppendBind( varMap, 12041014, 3 ) --近攻280攻击药3个
	elseif cur_metier == 2 or cur_metier == 3 or cur_metier == 8 or cur_metier == 9 then
		ItemAppendBind( varMap, 12041034, 3 ) --远攻280攻击药3个
	elseif cur_metier == 4 or cur_metier == 5 or cur_metier == 10 or cur_metier == 11 then
		ItemAppendBind( varMap, 12041024, 3 ) --魔攻280攻击药3个
	end
	
	ItemAppendBind( varMap, 12041044, 1 ) --480全防药1个
	ItemAppendBind( varMap, 12500053, 1 ) --平衡神水大礼包1个
	ItemAppendBind( varMap, 12500059, 1 ) --神水奖券1个
	
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2514) 
		local message = ""
		
		local cur_metier = GetZhiye( varMap , varPlayer )
		if cur_metier == 0 or cur_metier == 1 or cur_metier == 6 or cur_metier == 7 then
			message = format("打开攻防大师包，获得了物品：#R3个四象神力丸和1个神水奖券等")
		elseif cur_metier == 2 or cur_metier == 3 or cur_metier == 8 or cur_metier == 9 then
			message = format("打开攻防大师包，获得了物品：#R3个四象仙火丸和1个神水奖券等")
		elseif cur_metier == 4 or cur_metier == 5 or cur_metier == 10 or cur_metier == 11 then
			message = format("打开攻防大师包，获得了物品：#R3个四象魔道丸和1个神水奖券等")
		end
		
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				
end

function x432304_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
