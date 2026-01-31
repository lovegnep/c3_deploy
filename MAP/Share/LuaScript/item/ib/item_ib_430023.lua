





x430023_var_FileId = 430023
x430023_var_ItemId   = 12030425
x430023_var_ItemList = {}
x430023_var_LevelMin = 1



function x430023_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430023_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430023_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430023_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430023_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430023_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x430023_var_LevelMin then
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
		ItemAppendBind( varMap, 11990113,4 )	
		ItemAppendBind( varMap, 11000501,20 )	

	else
		ItemAppendBind( varMap, 11990113,4 )	
		ItemAppendBind( varMap, 11000501,20 )	

	end
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"打开礼包，获得了礼包道具！")
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
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有2个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x430023_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
