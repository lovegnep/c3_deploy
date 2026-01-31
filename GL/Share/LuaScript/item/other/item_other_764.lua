





x418764_var_FileId 		= 418764

x418764_var_LevelMin		=	1






function x418764_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418764_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418764_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418764_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418764_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418764_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418764_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000205, 5 )
		ItemAppendBind( varMap, 11000206, 5 )
		ItemAppendBind( varMap, 11000207, 5 )		
		ItemAppendBind( varMap, 11000208, 5 )		
	

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得：精致的世传水晶*5、精致的国传水晶*5等。")
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







function x418764_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
