





x418169_var_FileId = 418169
x418169_var_ItemList = {}
x418169_var_LevelMin = 1	






function x418169_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418169_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418169_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418169_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418169_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418169_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418169_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030320, 1 )	
		ItemAppendBind( varMap, 11000600, 3 )	
		ItemAppendBind( varMap, 10222006, 1 )	
		ItemAppendBind( varMap, 12110206, 5 )	
		ItemAppendBind( varMap, 12031002, 10 )	


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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418169_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
