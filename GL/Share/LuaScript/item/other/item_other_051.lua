





x418051_var_FileId = 418051
x418051_var_ItemList = {}
x418051_var_LevelMin = 30	






function x418051_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418051_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418051_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418051_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418051_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418051_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418051_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030321, 1 )	
	ItemAppendBind( varMap, 11000200, 5 )	
	ItemAppendBind( varMap, 11050001, 5 )	
	ItemAppendBind( varMap, 11000100, 1 )
	ItemAppendBind( varMap, 12010200, 3 )
	ItemAppendBind( varMap, 12050000, 1 )
	ItemAppendBind( varMap, 11990011, 1 )	
	ItemAppendBind( varMap, 12030251, 1 )	

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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有8个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418051_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
