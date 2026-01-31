





x414500_var_FileId 		= 414500 

x414500_var_LevelMin		=	1






function x414500_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414500_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414500_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414500_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414500_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414500_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414500_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local value = GetPlayerGoodBadValue(varMap, varPlayer)
		value = value + 100000
		SetPlayerGoodBadValue(varMap, varPlayer, value)
		Msg2Player(varMap,varPlayer,format("您获得了%d点威望", 100000),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点威望", 100000),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414500_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
