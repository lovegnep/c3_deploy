





x418207_var_FileId = 418207
x418207_var_ItemList = {}
x418207_var_LevelMin = 1	






function x418207_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418207_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418207_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418207_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418207_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418207_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418207_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030203, 1 )	
		ItemAppendBind( varMap, 12030218, 4 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了朝廷请柬，强效练功人偶")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有2个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418207_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
