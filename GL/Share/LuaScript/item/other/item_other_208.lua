





x418208_var_FileId = 418208
x418208_var_ItemList = {}
x418208_var_LevelMin = 1	






function x418208_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418208_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418208_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418208_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418208_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418208_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418208_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12033111, 1 )	
		ItemAppendBind( varMap, 12041098, 2 )	
		ItemAppendBind( varMap, 12041099, 2 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了掌门牌:清一色(7天)礼包，暴韧神水，生命神水")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有3个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418208_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
