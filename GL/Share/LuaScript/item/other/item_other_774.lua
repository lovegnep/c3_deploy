





x418774_var_FileId 		= 418774

x418774_var_LevelMin		=	1






function x418774_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418774_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418774_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418774_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418774_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418774_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418774_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030801, 5 )
		ItemAppendBind( varMap, 12030934, 1 )
		ItemAppendBind( varMap, 12010020, 1 )		
		ItemAppendBind( varMap, 12030011, 40 )		
		ItemAppendBind( varMap, 12030012, 20 )		
		ItemAppendBind( varMap, 12054300, 5 )		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"右键点击打开获得银卡500两，皇权贵族时装礼包，小生命清露1个，4倍经验酒40个等。")
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
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418774_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
