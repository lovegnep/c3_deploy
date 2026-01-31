





x418228_var_FileId = 418228
x418228_var_ItemList = {}
x418228_var_LevelMin = 1	






function x418228_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418228_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418228_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418228_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418228_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418228_ProcActivateOnce( varMap, varPlayer, varImpact )
		
	local year,month,day =GetYearMonthDay()
	if year ~= 2011 then
		if DepletingUsedItem(varMap, varPlayer) == 1 then 
			StartTalkTask(varMap)
			TalkAppendString(varMap,"礼包已过期")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		return
	end
	if GetLevel(varMap, varPlayer)< x418228_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppend( varMap, 10287300, 1 )	
		ItemAppend( varMap, 10287306, 1 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了神·情深似海(夫)1个，神·情深似海(妻)1个")
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







function x418228_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
