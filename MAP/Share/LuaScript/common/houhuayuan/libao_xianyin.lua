





x320014_var_FileId 		= 320014 

x320014_var_LevelMin		=	1






function x320014_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x320014_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x320014_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x320014_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x320014_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x320014_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x320014_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 0
		local Level = GetLevel(varMap,varPlayer)
		if Level <75 then
			nMoney = Level * 100
		elseif Level >= 75 then
			nMoney = Level * 150
		end
		AddMoney(varMap, varPlayer, 0, nMoney)
		Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}现银的奖励。", nMoney),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}现银的奖励。", nMoney),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x320014_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
