





x418108_var_FileId = 418108
x418108_var_ItemList = {}
x418108_var_LevelMin = 1






function x418108_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418108_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418108_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418108_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418108_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418108_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418108_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 4 )	
	ItemAppendBind( varMap, 12054300, 3 ) 
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"恭喜您获得了四个修行草和三本还童书！")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有2个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418108_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
