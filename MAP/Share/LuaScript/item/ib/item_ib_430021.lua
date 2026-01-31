





x430021_var_FileId = 430021
x430021_var_ItemId   = 12030422
x430021_var_ItemList = {}
x430021_var_LevelMin = 1



function x430021_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430021_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430021_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430021_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430021_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430021_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x430021_var_LevelMin then
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
		ItemAppendBind( varMap, 12030202,1 )	
		ItemAppendBind( varMap, 12041101,14 )	
		ItemAppendBind( varMap, 11990011,1 )	
		ItemAppendBind( varMap, 12030200,1 )	
		ItemAppendBind( varMap, 12031012,1 )	
		ItemAppendBind( varMap, 12031013,1 )	
		ItemAppendBind( varMap, 12031019,1 )	
		ItemAppendBind( varMap, 12031031,1 )	
	else
		ItemAppend( varMap, 12030202,1 )	
		ItemAppend( varMap, 12041101,14 )	
		ItemAppend( varMap, 11990011,1 )	
		ItemAppend( varMap, 12030200,1 )	
		ItemAppend( varMap, 12031012,1 )	
		ItemAppend( varMap, 12031013,1 )	
		ItemAppend( varMap, 12031019,1 )	
		ItemAppend( varMap, 12031031,1 )	
	end
	

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







function x430021_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
