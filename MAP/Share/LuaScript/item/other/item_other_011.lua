





x418011_var_FileId = 418011
x418011_var_ItemList = {}
x418011_var_LevelMin = 20	
x418011_var_ItemList = {10246092,10286092,10296072}






function x418011_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418011_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418011_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418011_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418011_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418011_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418011_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local varI = random(1,3)
	
	local varItem = 0
	if varI<=3 then
		varItem = x418011_var_ItemList[varI]
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, varItem, 1 )	
	ItemAppendBind( varMap, 12030320, 1 )	
	ItemAppendBind( varMap, 11000200, 10 )	

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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有3个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418011_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
