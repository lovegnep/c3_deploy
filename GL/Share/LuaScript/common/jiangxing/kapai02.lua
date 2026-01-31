





x603001_var_FileId 		= 603001

x603001_var_LevelMin		=	1






function x603001_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x603001_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x603001_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x603001_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x603001_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x603001_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x603001_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45013895, 1 )
		ItemAppendBind( varMap, 45013925, 1 )
		ItemAppendBind( varMap, 45013955, 1 )
		ItemAppendBind( varMap, 45013985, 1 )
		ItemAppendBind( varMap, 45013720, 1 )
		ItemAppendBind( varMap, 45013750, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#R打开获得一套神·回鹘部族5星将星卡：神·萨尔沃，神·萨伊，神·萨尔干，神·伊珊，神·卡尔木，神·伊娜")
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







function x603001_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
