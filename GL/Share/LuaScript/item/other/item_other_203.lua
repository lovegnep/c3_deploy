





x418203_var_FileId = 418203
x418203_var_ItemList = {}
x418203_var_LevelMin = 1	






function x418203_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418203_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418203_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418203_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418203_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418203_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418203_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12110206, 5 )	
		ItemAppendBind( varMap, 12050281, 1 )	
		ItemAppendBind( varMap, 10300151, 1 )	
		ItemAppendBind( varMap, 19010007, 1 )	
		ItemAppendBind( varMap, 11000200, 10 )	
		ItemAppendBind( varMap, 12030320, 1 )	
		ItemAppendBind( varMap, 12031033, 10 )	
		ItemAppendBind( varMap, 12031034, 10 )	

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







function x418203_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
