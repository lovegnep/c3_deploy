





x588040_var_FileId 		= 588040

x588040_var_LevelMin		=	60






function x588040_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x588040_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x588040_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x588040_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x588040_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x588040_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x588040_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 1000000
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







function x588040_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
