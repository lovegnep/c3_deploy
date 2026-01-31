





x418742_var_FileId 		= 418742

x418742_var_LevelMin		=	1






function x418742_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418742_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418742_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418742_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418742_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418742_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418742_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 10310002, 1 )
		ItemAppendBind( varMap, 11000306, 20 )
		ItemAppendBind( varMap, 11970023, 100 )
		ItemAppendBind( varMap, 11990122, 100 )
		ItemAppendBind( varMap, 12041102, 10 )
		ItemAppendBind( varMap, 12035299, 1 )
		ItemAppendBind( varMap, 12035300, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得：掌门牌：小四喜(永不磨损)，烈焱碎片20个，黄金乱士符100个等。")
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







function x418742_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
