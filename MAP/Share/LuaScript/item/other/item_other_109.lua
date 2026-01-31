





x418109_var_FileId = 418109
x418109_var_ItemList = {}
x418109_var_LevelMin = 1






function x418109_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418109_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418109_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418109_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418109_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418109_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418109_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 4 )	
	ItemAppendBind( varMap, 12054300, 3 ) 
	ItemAppendBind( varMap, 11990113, 2 ) 
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"恭喜您获得了四个修行草，三本还童书和两个钻石原石！")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有3个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418109_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
