





x418209_var_FileId = 418209
x418209_var_ItemList = {}
x418209_var_LevelMin = 1	






function x418209_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418209_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418209_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418209_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418209_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418209_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418209_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"µÈ¼¶²»×ã")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
		AwardTitle(varMap,varPlayer,156)
		DepletingUsedItem( varMap, varPlayer)

end







function x418209_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
