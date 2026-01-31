





x603013_var_FileId 		= 603013

x603013_var_LevelMin		=	1






function x603013_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x603013_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x603013_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x603013_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x603013_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x603013_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x603013_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45014130, 1 )
		ItemAppendBind( varMap, 45013720, 1 )
		ItemAppendBind( varMap, 45013765, 1 )
		ItemAppendBind( varMap, 45013905, 1 )
		ItemAppendBind( varMap, 45013745, 1 )
		ItemAppendBind( varMap, 45013660, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#R打开获得一套神·勇冠三军5星将星卡！")
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







function x603013_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
