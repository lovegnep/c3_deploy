





x430017_var_FileId = 430017
x430017_var_ItemId   = 12030262
x430017_var_ItemList = {}
x430017_var_LevelMin = 1



function x430017_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430017_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430017_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430017_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430017_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430017_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x430017_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return
	end

	local UsedItemIndex = GetBagIndexOfUsedItem(varMap,varPlayer)
	local bBindItem= IsItemBind(varMap,varPlayer, UsedItemIndex )

	StartItemTask(varMap)
	if bBindItem== 1 then
		ItemAppendBind( varMap, 10287072,1 )	
	else
		ItemAppend( varMap, 10287072,1 )	
	end
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开首饰盒，获得了远征首饰")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x430017_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
