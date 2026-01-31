





x418301_var_FileId 		= 418301

x418301_var_LevelMin		=	1






function x418301_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418301_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418301_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418301_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418301_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418301_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418301_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030320, 1 )--10两小钱包
		ItemAppendBind( varMap, 12010020, 1 )--小生命清露
		ItemAppendBind( varMap, 11990110, 1 ) --募集券
		ItemAppendBind( varMap, 12031020, 5 ) --战神×5
		ItemAppendBind( varMap, 11990015, 10 )--藏宝令x10
		ItemAppendBind( varMap, 11990011, 5 )--三番令x5

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开顺网特权卡，获得1个小钱包，1个小生命清露，1个募集券，5个战神等道具。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418301_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
