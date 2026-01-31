





x430033_var_FileId = 430033
x430033_var_ItemId   = 12030240
x430033_var_ItemList = {}
x430033_var_LevelMin = 1



function x430033_ProcDefaultEvent( varMap, varPlayer, varBagIdx )



end






function x430033_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430033_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430033_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430033_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430033_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
		
		
		
		
		
	

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return
	end

	local UsedItemIndex = GetBagIndexOfUsedItem(varMap,varPlayer)
	local bBindItem= IsItemBind(varMap,varPlayer, UsedItemIndex )

	StartItemTask(varMap)

		ItemAppendBind( varMap, 10300145,1 )	

	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼盒，获得了节日时装")
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







function x430033_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
