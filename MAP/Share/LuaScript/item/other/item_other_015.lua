





x418015_var_FileId = 418015
x418015_var_ItemList = {}
x418015_var_LevelMin = 60	






function x418015_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418015_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418015_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418015_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418015_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418015_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418015_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppend( varMap, 11050002, 30 )	
	ItemAppendBind( varMap, 12030322, 1 )	
	ItemAppendBind( varMap, 11000202, 30 )	
	ItemAppendBind( varMap, 11990114, 1 )	
	ItemAppendBind( varMap, 12030201, 5 )	
	ItemAppendBind( varMap, 12050227, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+15000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得15000点声望！")
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







function x418015_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
