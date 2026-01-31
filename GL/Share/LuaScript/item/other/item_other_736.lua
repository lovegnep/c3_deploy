





x418736_var_FileId 		= 418736

x418736_var_LevelMin		=	1






function x418736_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418736_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418736_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418736_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418736_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418736_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418736_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030801, 1 )
		ItemAppendBind( varMap, 12010020, 1 )
		ItemAppendBind( varMap, 12250008, 20 )
		ItemAppendBind( varMap, 11990015, 5 )
		ItemAppendBind( varMap, 11990011, 2 )	--


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得：小钱包、小生命清露、回城卷轴X20、三番令X2、藏宝令X5。")
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







function x418736_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
