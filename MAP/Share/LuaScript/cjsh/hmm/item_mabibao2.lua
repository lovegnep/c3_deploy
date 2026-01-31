





x930134_var_FileId 		= 930134

x930134_var_LevelMin		=	1
x930134_var_Nummabi		=	1000






function x930134_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930134_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930134_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930134_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930134_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930134_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930134_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        AddHorseMoney(varMap, varPlayer, x930134_var_Nummabi )
		Msg2Player(varMap,varPlayer,format("您获得了%d点马币", x930134_var_Nummabi),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点马币", x930134_var_Nummabi),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930134_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
