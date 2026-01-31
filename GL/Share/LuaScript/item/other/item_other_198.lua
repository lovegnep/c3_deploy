





x418198_var_FileId = 418198
x418198_var_ItemList = {}
x418198_var_LevelMin = 1	






function x418198_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418198_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418198_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418198_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418198_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418198_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418198_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12010020, 1 )	
		ItemAppendBind( varMap, 12031019, 5 )	
		ItemAppendBind( varMap, 12260002, 1 )	
		ItemAppendBind( varMap, 12050276, 1 )	
		ItemAppendBind( varMap, 10300150, 1 )	
		ItemAppendBind( varMap, 19010007, 1 )	
		ItemAppendBind( varMap, 11000200, 10 )	
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







function x418198_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
