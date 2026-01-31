






x418034_var_FileId = 418034
x418034_var_ItemList = {}
x418034_var_LevelMin = 1	






function x418034_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418034_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418034_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418034_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418034_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418034_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418034_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local nZhiYe = GetZhiye( varMap, varPlayer)
	local itemId1 = 0
	if nZhiYe == 0 or nZhiYe == 1 or nZhiYe == 6 or nZhiYe == 7 then
		itemId1 = 14010002 
	elseif nZhiYe == 2 or nZhiYe == 3 or nZhiYe == 8 or nZhiYe == 9 then
		itemId1 = 14010007 
	elseif nZhiYe ==4 or nZhiYe == 5 or nZhiYe == 10 or nZhiYe == 11 then
		itemId1 = 14010012 
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000201, 200 )	
	ItemAppendBind( varMap, 11050002, 260 )	
	ItemAppend( varMap, 11060002, 50 )	
	ItemAppend( varMap, 11000101, 1 )	
	ItemAppend( varMap, 11000111, 1 )	
	ItemAppend( varMap, 14040002, 1 )	
	ItemAppend( varMap, itemId1, 1 )	
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)

			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了套餐道具！")
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







function x418034_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
