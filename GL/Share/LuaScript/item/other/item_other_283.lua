





x418283_var_FileId 		= 418283

x418283_var_LevelMin		=	1






function x418283_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418283_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418283_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418283_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418283_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418283_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418283_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if GetGuildID(varMap, varPlayer) == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"没有帮会无法使用该礼包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddGuildUserPoint(varMap,varPlayer,100000)
		Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100000),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100000),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x418283_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
