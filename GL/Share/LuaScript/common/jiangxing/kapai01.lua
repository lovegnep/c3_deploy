





x603000_var_FileId 		= 603000

x603000_var_LevelMin		=	1






function x603000_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x603000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x603000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x603000_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x603000_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x603000_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x603000_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45013715, 1 )
		ItemAppendBind( varMap, 45013745, 1 )
		ItemAppendBind( varMap, 45013775, 1 )
		ItemAppendBind( varMap, 45013805, 1 )
		ItemAppendBind( varMap, 45013835, 1 )
		ItemAppendBind( varMap, 45013865, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#R打开获得一套神·帝国真主5星将星卡：神·张飞，神·窝阔台，神·贵由，神·蒙哥，神·忽必烈，神·拖雷")
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







function x603000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
