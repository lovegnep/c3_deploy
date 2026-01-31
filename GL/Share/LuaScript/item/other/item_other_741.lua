





x418741_var_FileId 		= 418741

x418741_var_LevelMin		=	1






function x418741_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418741_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418741_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418741_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418741_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418741_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418741_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 10310002, 1 )
		ItemAppendBind( varMap, 11000306, 10 )
		ItemAppendBind( varMap, 11970023, 80 )
		ItemAppendBind( varMap, 11990122, 80 )
		ItemAppendBind( varMap, 12041102, 10 )
		ItemAppendBind( varMap, 12030218, 20 )


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得：掌门牌:小四喜(永不磨损)，烈焱碎片10个，黄金乱士符80个等。")
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
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418741_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
