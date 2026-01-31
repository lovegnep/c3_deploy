





x418066_var_FileId = 418066
x418066_var_ItemList = {}
x418066_var_LevelMin = 40	






function x418066_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418066_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418066_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418066_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418066_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418066_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418066_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local  nZhiYe = GetZhiye( varMap, varPlayer);
	local itemId1 = 0
	if nZhiYe == 0 or nZhiYe == 1  or nZhiYe == 6 or nZhiYe == 7 then
		itemId1 = 14030002
	elseif nZhiYe == 2 or nZhiYe == 3  or nZhiYe == 8 or nZhiYe == 9 then
		itemId1 = 14030007
	elseif nZhiYe ==4 or nZhiYe == 5  or nZhiYe == 10 or nZhiYe == 11 then
		itemId1 = 14030012
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11050001, 20 )	
	ItemAppendBind( varMap, 12030321, 1 )	
	ItemAppendBind( varMap, 11000201, 20 )	
	ItemAppendBind( varMap, 12041101, 5 )	
	ItemAppendBind( varMap, 11000111, 1 )	
	ItemAppendBind( varMap, 11990110, 1 )	
	ItemAppendBind( varMap, 12030011, 5 )	
	ItemAppendBind( varMap, 12030012, 5 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+5000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得5000点声望！")
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







function x418066_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
