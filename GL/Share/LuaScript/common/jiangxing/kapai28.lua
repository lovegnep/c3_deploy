





x603027_var_FileId 		= 603027

x603027_var_LevelMin		=	1






function x603027_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x603027_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x603027_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x603027_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x603027_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x603027_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x603027_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45014130, 1 )
		ItemAppendBind( varMap, 45013995, 1 )
		ItemAppendBind( varMap, 45014180, 1 )
		ItemAppendBind( varMap, 45014195, 1 )
		ItemAppendBind( varMap, 45014250, 1 )
		ItemAppendBind( varMap, 45012180, 1 )

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#R打开获得一套神·勇绝天下5星将星卡！")
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







function x603027_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
