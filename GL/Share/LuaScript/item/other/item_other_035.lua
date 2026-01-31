






x418035_var_FileId = 418035
x418035_var_ItemList = {}
x418035_var_LevelMin = 1	






function x418035_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418035_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418035_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418035_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418035_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418035_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418035_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local  nZhiYe = GetZhiye( varMap, varPlayer);
	local itemId1 = 0
	local itemId2 = 0
	local itemId3 = 0
	if nZhiYe == 0 then
		itemId1 = 14010003
		itemId2 = 10284003
		itemId3 = 10294003
	elseif nZhiYe == 1 then
		itemId1 = 14010003
		itemId2 = 10284013
		itemId3 = 10294013
	elseif nZhiYe == 2 then
		itemId1 = 14010008
		itemId2 = 10284023
		itemId3 = 10294023
	elseif nZhiYe == 3 then
		itemId1 = 14010008	
		itemId2 = 10284033
		itemId3 = 10294033
	elseif nZhiYe ==4 then
		itemId1 = 14010013
		itemId2 = 10284043
		itemId3 = 10294043
	elseif nZhiYe == 5 then
		itemId1 = 14010013	
		itemId2 = 10284053
		itemId3 = 10294053	
	elseif nZhiYe == 6 then
		itemId1 = 14010003
		itemId2 = 10288020
		itemId3 = 10298020
	elseif nZhiYe == 7 then
		itemId1 = 14010003
		itemId2 = 10288024
		itemId3 = 10298024
	elseif nZhiYe == 8 then
		itemId1 = 14010008
		itemId2 = 10288028
		itemId3 = 10298028
	elseif nZhiYe == 9 then
		itemId1 = 14010008	
		itemId2 = 10288032
		itemId3 = 10298032
	elseif nZhiYe ==10 then
		itemId1 = 14010013
		itemId2 = 10288036
		itemId3 = 10298036
	elseif nZhiYe == 11 then
		itemId1 = 14010013	
		itemId2 = 10288040
		itemId3 = 10298040	
	end
		
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000202, 700 )	
	ItemAppendBind( varMap, 11050003, 700 )	
	ItemAppend( varMap, 11060003, 50 )	

	ItemAppend( varMap, 11000123, 1 )	
	ItemAppend( varMap, 14040003, 1 )	
	ItemAppend( varMap, itemId1, 1 )	
	ItemAppend( varMap, itemId2, 1 )	
	ItemAppend( varMap, itemId3, 1 )	
	

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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有12个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418035_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
