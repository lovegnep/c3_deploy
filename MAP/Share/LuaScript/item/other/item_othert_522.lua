





x432522_var_FileId = 432522
x432522_var_ItemList = {}
x432522_var_LevelMin = 1	






function x432522_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432522_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432522_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432522_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432522_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432522_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x432522_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	StartItemTask(varMap)
	if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,10287302, 1 )	
		ItemAppend( varMap,10287308, 1 )
	else
		ItemAppend( varMap,10287302, 1 )	
		ItemAppend( varMap,10287308, 1 )	
	end	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432522_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
