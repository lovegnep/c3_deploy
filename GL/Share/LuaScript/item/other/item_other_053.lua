





x418053_var_FileId = 418053
x418053_var_ItemList = {}
x418053_var_LevelMin = 65	






function x418053_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418053_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418053_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418053_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418053_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418053_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418053_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local  nZhiYe = GetZhiye( varMap, varPlayer);
	local itemId1 = 0
	if nZhiYe == 0 or nZhiYe == 1 or nZhiYe == 6 or nZhiYe == 7 then
		itemId1 = 14030003
	elseif nZhiYe == 2 or nZhiYe == 3 or nZhiYe == 8 or nZhiYe == 9 then
		itemId1 = 14030008
	elseif nZhiYe ==4 or nZhiYe == 5 or nZhiYe == 10 or nZhiYe == 11 then
		itemId1 = 14030013
	end
		
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11050003, 15 )	
	ItemAppendBind( varMap, 12030323, 1 )	
	ItemAppendBind( varMap, 11000202, 10 )	
	ItemAppendBind( varMap, 12010301, 3 )	
	ItemAppendBind( varMap, itemId1, 1 )	
	ItemAppendBind( varMap, 12030210, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+10000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得10000点声望！")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418053_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
