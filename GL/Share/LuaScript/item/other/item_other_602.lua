





x418602_var_FileId 		= 418602 

x418602_var_LevelMin		=	1






function x418602_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418602_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418602_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418602_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418602_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418602_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418602_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 1000
		AddMoney(varMap, varPlayer, 3, nMoney)
		
	  GamePlayScriptLog( varMap, varPlayer, 1481)
	
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418602_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
