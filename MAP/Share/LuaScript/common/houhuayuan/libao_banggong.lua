





x320010_var_FileId = 320010
x320010_var_ItemList = {}
x320010_var_LevelMin = 1	






function x320010_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x320010_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x320010_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x320010_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x320010_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end







function x320010_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x320010_var_LevelMin then
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
		AddGuildUserPoint(varMap,varPlayer,100)
		Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点帮贡", 100),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x320010_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
