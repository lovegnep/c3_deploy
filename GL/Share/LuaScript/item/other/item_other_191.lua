





x418191_var_FileId = 418191
x418191_var_ItemList = {}
x418191_var_LevelMin = 1	






function x418191_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418191_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418191_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418191_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418191_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418191_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418191_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030258, 4 )	
		ItemAppendBind( varMap, 11010111, 5 )	
		ItemAppendBind( varMap, 11000551, 4 )	
		ItemAppendBind( varMap, 12050261, 1 )	
		ItemAppendBind( varMap, 10300149, 1 )	
		ItemAppendBind( varMap, 19010007, 1 )	
		ItemAppendBind( varMap, 11000200, 3 )	
		ItemAppendBind( varMap, 12030320, 1 )	


	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有8个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418191_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
