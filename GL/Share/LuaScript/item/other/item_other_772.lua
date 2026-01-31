





x418772_var_FileId 		= 418772

x418772_var_LevelMin		=	1






function x418772_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418772_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418772_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418772_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418772_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418772_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418772_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030801, 1 )
		ItemAppendBind( varMap, 11990050, 2 )
		ItemAppendBind( varMap, 12030016, 1 )		
		ItemAppendBind( varMap, 12041101, 1 )			
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"右键点击打开，将获得银卡包100两，还魂丹2个，队伍召集令1个，修行草1个。")
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







function x418772_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
