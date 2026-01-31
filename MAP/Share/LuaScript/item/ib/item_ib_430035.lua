





x430035_var_FileId = 430035
x430035_var_ItemId   = 10310025
x430035_var_ItemList = {}
x430035_var_LevelMin = 1



function x430035_ProcDefaultEvent( varMap, varPlayer, varBagIdx )



end






function x430035_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430035_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430035_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430035_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430035_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
		
		
		
		
		
	

	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return
	end

	local UsedItemIndex = GetBagIndexOfUsedItem(varMap,varPlayer)
	local bBindItem= IsItemBind(varMap,varPlayer, UsedItemIndex )

	StartItemTask(varMap)

		ItemAppendBind( varMap, 10310025,1 )	

	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼盒，获得了掌门牌：碰碰胡(7天)")
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







function x430035_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
