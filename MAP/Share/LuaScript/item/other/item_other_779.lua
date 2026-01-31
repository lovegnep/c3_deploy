





x418779_var_FileId 		= 418779

x418779_var_LevelMin		=	1






function x418779_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418779_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418779_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418779_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418779_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418779_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418779_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12031002, 2 )
		ItemAppendBind( varMap, 12031003, 2 )
		ItemAppendBind( varMap, 12031004, 2 )		
		ItemAppendBind( varMap, 12031005, 2 )		
		ItemAppendBind( varMap, 12110206, 5 )		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得若干烟花和玫瑰。。")
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







function x418779_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
