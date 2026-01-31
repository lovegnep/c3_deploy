





x430036_var_FileId = 430036
x430036_var_ItemId   = 12030512
x430036_var_ItemList = {}
x430036_var_LevelMin = 1



function x430036_ProcDefaultEvent( varMap, varPlayer, varBagIdx )



end






function x430036_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430036_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430036_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430036_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430036_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
		
		
		
		
		
	

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return
	end

	local UsedItemIndex = GetBagIndexOfUsedItem(varMap,varPlayer)
	local bBindItem= IsItemBind(varMap,varPlayer, UsedItemIndex )

	StartItemTask(varMap)

		ItemAppendBind( varMap, 10310026,1 )	

	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼盒，获得了掌门牌：清一色(7天)")
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







function x430036_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
