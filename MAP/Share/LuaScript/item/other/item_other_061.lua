





x418061_var_FileId = 418061
x418061_var_ItemList = {}
x418061_var_LevelMin = 50	






function x418061_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418061_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418061_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418061_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418061_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418061_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418061_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 11050002, 10 )	
	ItemAppendBind( varMap, 12030322, 1 )	
	ItemAppendBind( varMap, 11000201, 5 )	
	ItemAppendBind( varMap, 12050227, 1 )	
	ItemAppendBind( varMap, 12030201, 1 )	
	ItemAppendBind( varMap, 12050009, 1 )	
	ItemAppendBind( varMap, 12050092, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+7500 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得7500点声望！")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有7个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418061_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
