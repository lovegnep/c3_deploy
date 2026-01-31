





x418068_var_FileId = 418068
x418068_var_ItemList = {}
x418068_var_LevelMin = 60	
x418068_var_ItemList = {11000500,11000502,11000503,11000504}






function x418068_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418068_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418068_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418068_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418068_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418068_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418068_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local varItem = 0
	local varI = random(1,4)
	
	varItem = x418068_var_ItemList[varI]
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11050002, 30 )	
	ItemAppendBind( varMap, 12030322, 1 )	
	ItemAppendBind( varMap, 11000202, 30 )	
	ItemAppendBind( varMap, 12050227, 1 )	
	ItemAppendBind( varMap, 12030201, 5 )	
	ItemAppendBind( varMap, 12050092, 1 )	
	ItemAppendBind( varMap, varItem, 1 )	
	ItemAppendBind( varMap, 12054300, 2 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+15000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得15000点声望！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
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







function x418068_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
