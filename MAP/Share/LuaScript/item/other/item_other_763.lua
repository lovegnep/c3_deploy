





x418763_var_FileId 		= 418763

x418763_var_LevelMin		=	1






function x418763_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418763_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418763_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418763_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418763_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418763_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418763_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12035319, 1 )
		ItemAppendBind( varMap, 12035320, 1 )
		ItemAppendBind( varMap, 12035321, 1 )		
		ItemAppendBind( varMap, 12035322, 1 )		
		ItemAppendBind( varMap, 12035323, 1 )		

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得：升星水晶包、日常消耗道具包、装备养成道具包等。")
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







function x418763_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
