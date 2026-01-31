





x603011_var_FileId 		= 603011

x603011_var_LevelMin		=	1






function x603011_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x603011_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x603011_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x603011_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x603011_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x603011_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x603011_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45014120, 1 )
		ItemAppendBind( varMap, 45013805, 1 )
		ItemAppendBind( varMap, 45013845, 1 )
		ItemAppendBind( varMap, 45014005, 1 )
		ItemAppendBind( varMap, 45013745, 1 )
		ItemAppendBind( varMap, 45011220, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#R打开获得一套神·战神集结5星将星卡！")
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







function x603011_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
