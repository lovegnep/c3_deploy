





x930157_var_FileId 		= 930157

x930157_var_LevelMin		=	1






function x930157_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930157_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930157_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930157_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930157_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930157_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930157_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddHonor(varMap, varPlayer, 10000)
		Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 10000),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 10000),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930157_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
