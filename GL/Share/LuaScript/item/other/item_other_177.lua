





x418177_var_FileId = 418177
x418177_var_ItemList = {}
x418177_var_LevelMin = 1	






function x418177_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418177_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418177_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418177_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418177_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418177_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418177_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030258, 30 )	
		ItemAppendBind( varMap, 11000545, 1 )	
		ItemAppendBind( varMap, 11000546, 1 )	
		ItemAppendBind( varMap, 11000548, 2 )	
		ItemAppendBind( varMap, 11000547, 2 )	
		ItemAppendBind( varMap, 12050269, 1 )	


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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418177_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
