





x418745_var_FileId 		= 418745

x418745_var_LevelMin		=	1






function x418745_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418745_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418745_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418745_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418745_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418745_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418745_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 10310044, 1 )
		ItemAppendBind( varMap, 11970023, 100 )
		ItemAppendBind( varMap, 11990122, 100 )
		ItemAppendBind( varMap, 12041102, 10 )
		ItemAppendBind( varMap, 12035298, 1 )
		ItemAppendBind( varMap, 12035299, 1 )
		ItemAppendBind( varMap, 12035300, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得：战天斗地(永不磨损)，黄金乱士符100个等。")
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







function x418745_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
