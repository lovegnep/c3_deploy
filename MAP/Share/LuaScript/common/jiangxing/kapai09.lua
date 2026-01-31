





x603008_var_FileId 		= 603008

x603008_var_LevelMin		=	1






function x603008_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x603008_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x603008_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x603008_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x603008_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x603008_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x603008_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45013975, 1 )
		ItemAppendBind( varMap, 45014005, 1 )
		ItemAppendBind( varMap, 45013740, 1 )
		ItemAppendBind( varMap, 45013770, 1 )
		ItemAppendBind( varMap, 45013800, 1 )
		ItemAppendBind( varMap, 45013830, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#R打开获得一套神·鼎盛帝王5星将星卡！")
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







function x603008_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
