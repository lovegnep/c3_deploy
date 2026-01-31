






x418032_var_FileId = 418032
x418032_var_ItemList = {}
x418032_var_LevelMin = 1	






function x418032_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418032_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418032_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418032_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418032_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418032_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418032_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	









		
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030202, 1 )	
	ItemAppendBind( varMap, 12041101, 15 )	
	ItemAppendBind( varMap, 12030013, 50 )	
	ItemAppend( varMap, 11960005, 1000 )	
	ItemAppend( varMap, 11990110, 1 )	
	ItemAppend( varMap, 12030027, 1 )	
	ItemAppend( varMap, 12041103, 5 )	
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney( varMap, varPlayer, 3, 20000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了套餐道具！同时获得返还金卡20两！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有10个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418032_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
