





x418016_var_FileId = 418016
x418016_var_ItemList = {}
x418016_var_LevelMin = 65	






function x418016_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418016_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418016_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418016_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418016_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418016_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418016_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppend( varMap, 11050003, 30 )	
	ItemAppendBind( varMap, 12030323, 1 )	
	ItemAppendBind( varMap, 11000202, 50 )	
	ItemAppendBind( varMap, 11990115, 1 )	
	ItemAppendBind( varMap, 12010021, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+20000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得20000点声望！")
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







function x418016_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
