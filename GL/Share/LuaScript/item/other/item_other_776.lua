





x418776_var_FileId 		= 418776

x418776_var_LevelMin		=	1






function x418776_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418776_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418776_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418776_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418776_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418776_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418776_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12010020, 1 )
		ItemAppendBind( varMap, 12030016, 2 )
		ItemAppendBind( varMap, 12041101, 2 )		
		ItemAppendBind( varMap, 12030933, 1 )		
		ItemAppendBind( varMap, 10222003, 1 )		
		ItemAppendBind( varMap, 12035330, 1 )		
		ItemAppendBind( varMap, 12035331, 1 )				
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"右键点击打开获得小生命清露1个，队伍召集令2个，修行草2个等。")
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







function x418776_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
