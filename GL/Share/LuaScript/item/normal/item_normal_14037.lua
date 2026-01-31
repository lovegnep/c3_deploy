





x414037_var_FileId 		= 414037 

x414037_var_LevelMin		=	20






function x414037_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414037_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414037_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414037_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414037_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414037_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414037_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			local nMoney = 20000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了%d两银卡", nMoney/1000),4,3)
			Msg2Player(varMap,varPlayer,format("你获得了%d两银卡", nMoney/1000),4,2)

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414037_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
