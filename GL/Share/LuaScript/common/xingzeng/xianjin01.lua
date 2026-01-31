





x588038_var_FileId 		= 588038

x588038_var_LevelMin		=	60






function x588038_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x588038_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x588038_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x588038_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x588038_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x588038_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x588038_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 10000
		AddGold(varMap, varPlayer, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1484)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x588038_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
