





x418129_var_FileId = 418129
x418129_var_ItemList = {}
x418129_var_LevelMin = 1	






function x418129_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418129_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418129_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418129_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418129_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418129_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418129_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end


	




	
	local  nZhiYe = GetZhiye( varMap, varPlayer);	
	local itemId1 = 0

	if nZhiYe == 0 or nZhiYe == 1 or nZhiYe == 6 or nZhiYe == 7 then
		itemId1 = 11000905  
		itemId2 = 12041211	
		itemId3 = 12041110	
	elseif nZhiYe == 2 or nZhiYe == 3 or nZhiYe == 8 or nZhiYe == 9 then
		itemId1 = 11000905  
		itemId2 = 12041213 	
		itemId3 = 12041111 	
	elseif nZhiYe ==4 or nZhiYe == 5 or nZhiYe == 10 or nZhiYe == 11 then
		itemId1 = 11000905  
		itemId2 = 12041212	
		itemId3 = 12041112	
	end
	



















	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12010203, 10 )	
	ItemAppendBind( varMap, 11970021, 3 )	
	ItemAppendBind( varMap, itemId1, 1 )	
	ItemAppendBind( varMap, itemId2, 1 )	
	ItemAppendBind( varMap, itemId3, 1 )	
	
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418129_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
