





x418013_var_FileId = 418013
x418013_var_ItemList = {}
x418013_var_LevelMin = 40	






function x418013_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418013_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418013_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418013_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418013_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418013_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418013_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030011, 10 )	
	ItemAppend( varMap, 11050001, 20 )	
	ItemAppendBind( varMap, 12030321, 1 )	
	ItemAppendBind( varMap, 11000201, 20 )	
	ItemAppendBind( varMap, 12054300, 2 )	
	ItemAppendBind( varMap, 12041101, 5 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varShengWang = GetShengWang( varMap, varPlayer )
			SetShengWang( varMap, varPlayer, varShengWang+5000 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！获得5000点声望！")
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







function x418013_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
