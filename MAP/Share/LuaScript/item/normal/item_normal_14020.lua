





x414020_var_FileId 		= 414020 

x414020_var_LevelMin		=	1






function x414020_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414020_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414020_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414020_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414020_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414020_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414020_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 10000
		AddMoney(varMap, varPlayer, 1, nMoney)
		Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}银卡的奖励。", nMoney),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}银卡的奖励。", nMoney),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414020_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
