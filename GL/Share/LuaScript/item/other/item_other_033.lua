






x418033_var_FileId = 418033
x418033_var_ItemList = {}
x418033_var_LevelMin = 1	






function x418033_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418033_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418033_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418033_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418033_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418033_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418033_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local  nZhiYe = GetZhiye( varMap, varPlayer);
	local itemId1 = 0
	if nZhiYe == 0 or nZhiYe == 1 or nZhiYe == 6 or nZhiYe == 7 then
		itemId1 = 14010001 
	elseif nZhiYe == 2 or nZhiYe == 3 or nZhiYe == 8 or nZhiYe == 9 then
		itemId1 = 14010006 
	elseif nZhiYe ==4 or nZhiYe == 5 or nZhiYe == 10 or nZhiYe == 11 then
		itemId1 = 14010011 
	end
		
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000200, 100 )	
	ItemAppendBind( varMap, 11050001, 130 )	
	ItemAppend( varMap, 11060001, 20 )	
	ItemAppend( varMap, 11000100, 1 )	
	ItemAppend( varMap, 11000110, 1 )	
	ItemAppend( varMap, 14040001, 1 )	
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有7个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418033_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
