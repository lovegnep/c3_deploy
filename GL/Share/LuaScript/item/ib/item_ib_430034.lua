





x430034_var_FileId = 430034
x430034_var_ItemId   = 12030241
x430034_var_ItemList = {}
x430034_var_LevelMin = 1



function x430034_ProcDefaultEvent( varMap, varPlayer, varBagIdx )



end






function x430034_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430034_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430034_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430034_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430034_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
		
		
		
		
		
	

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return
	end

	local UsedItemIndex = GetBagIndexOfUsedItem(varMap,varPlayer)
	local bBindItem= IsItemBind(varMap,varPlayer, UsedItemIndex )

	StartItemTask(varMap)

		ItemAppendBind( varMap, 10310029,1 )	

	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼盒，获得了掌门牌：清一色(30天)")
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







function x430034_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
