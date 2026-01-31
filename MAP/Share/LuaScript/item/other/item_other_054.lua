





x418054_var_FileId = 418054
x418054_var_ItemList = {}
x418054_var_LevelMin = 70	






function x418054_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418054_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418054_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418054_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418054_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418054_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418054_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11050003, 30 )	
	ItemAppendBind( varMap, 12030396, 1 )	
	ItemAppendBind( varMap, 11000202, 15 )	
	ItemAppendBind( varMap, 11000902, 1 )	
	ItemAppendBind( varMap, 11000903, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+12500 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得12500点声望！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
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







function x418054_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
