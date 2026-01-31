





x418603_var_FileId 		= 418603 

x418603_var_LevelMin		=	1






function x418603_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418603_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418603_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418603_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418603_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418603_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418603_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 2000
		AddMoney(varMap, varPlayer, 3, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1482)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418603_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
