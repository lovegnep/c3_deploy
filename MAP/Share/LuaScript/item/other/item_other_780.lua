





x418780_var_FileId 		= 418780

x418780_var_LevelMin		=	1






function x418780_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418780_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418780_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418780_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418780_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418780_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418780_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030802, 1 )
		ItemAppendBind( varMap, 12050261, 1 )
		ItemAppendBind( varMap, 11990011, 1 )		
		ItemAppendBind( varMap, 12041101, 1 )		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得宫廷时装礼包,黄金虎降世符,三番令1个，修行草1个。")
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







function x418780_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
