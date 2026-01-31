





x418026_var_FileId = 418026
x418026_var_ItemList = {}
x418026_var_LevelMin = 20	
x418026_var_ItemList = {10246092,10286092,10296072}






function x418026_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418026_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418026_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418026_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418026_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418026_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418026_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local varI = random(1,3)
	
	local varItem = 0
	if varI<=3 then
		varItem = x418026_var_ItemList[varI]
	end
	
	local  nZhiYe = GetZhiye( varMap, varPlayer);
	local itemId1 = 0
	if nZhiYe == 0 or nZhiYe == 1 or nZhiYe == 6 or nZhiYe == 7 then
		itemId1 = 14030001
	elseif nZhiYe == 2 or nZhiYe == 3 or nZhiYe == 8 or nZhiYe == 9 then
		itemId1 = 14030006
	elseif nZhiYe ==4 or nZhiYe == 5 or nZhiYe == 10 or nZhiYe == 11 then
		itemId1 = 14030011
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, varItem, 1 )	
	ItemAppendBind( varMap, 12030320, 1 )	
	ItemAppendBind( varMap, 11000200, 10 )	
	ItemAppendBind( varMap, 11000600, 5 )	
	ItemAppendBind( varMap, 11000110, 1 )	
	ItemAppendBind( varMap, itemId1, 1 )	

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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418026_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
