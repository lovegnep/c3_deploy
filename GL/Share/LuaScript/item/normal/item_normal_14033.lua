





x414033_var_FileId 		= 414033 

x414033_var_LevelMin		=	1






function x414033_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414033_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414033_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414033_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414033_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414033_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414033_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddBattleHonour(varMap, varPlayer, 100)
		Msg2Player(varMap,varPlayer,format("您获得了%d点战场功绩", 100),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点战场功绩", 100),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414033_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
