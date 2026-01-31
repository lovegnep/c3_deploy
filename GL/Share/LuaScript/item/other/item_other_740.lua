





x418740_var_FileId 		= 418740

x418740_var_LevelMin		=	1






function x418740_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418740_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418740_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418740_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418740_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418740_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418740_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12035297, 1 )
		ItemAppendBind( varMap, 11970023, 40 )
		ItemAppendBind( varMap, 11990122, 40 )
		ItemAppendBind( varMap, 12041102, 10 )
		ItemAppendBind( varMap, 12030218, 20 )	--


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得：掌门牌:小四喜（30天）礼包，黄金乱士符40个等。")
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







function x418740_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
