





x320012_var_FileId 		= 320012 

x320012_var_LevelMin		=	1






function x320012_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x320012_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x320012_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x320012_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x320012_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x320012_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x320012_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddHonor(varMap, varPlayer, 250)
		Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 250),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点荣誉", 250),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x320012_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
