





x418141_var_FileId = 418141
x418141_var_ItemList = {}
x418141_var_LevelMin = 1	






function x418141_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418141_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418141_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418141_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418141_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418141_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418141_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000500, 3 )	
	ItemAppendBind( varMap, 11000503, 4 )	
	ItemAppendBind( varMap, 11000502, 2 )	
        ItemAppendBind( varMap, 11000504, 3 )	

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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有12个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418141_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
