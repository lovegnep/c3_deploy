





x418024_var_FileId = 418024
x418024_var_ItemList = {}
x418024_var_LevelMin = 10	
x418024_var_ItemList = {10200020,10230020,10240020,10250020,10260020,10270020}






function x418024_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418024_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418024_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418024_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418024_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418024_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418024_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local nZhiYe = GetZhiye( varMap, varPlayer);
	local varItem = 0;

	if nZhiYe==0 then
		varItem = 10010020
	elseif nZhiYe==1 then
		varItem = 10020020
	elseif nZhiYe==2 then
		varItem = 10030020
	elseif nZhiYe==3 then
		varItem = 10040020
	elseif nZhiYe==4 then
		varItem = 10050020
	elseif nZhiYe==5 then
		varItem = 10060020
	elseif nZhiYe==6 then
		varItem = 10350002
	elseif nZhiYe==7 then
		varItem = 10360002
	elseif nZhiYe==8 then
		varItem = 10370002
	elseif nZhiYe==9 then
		varItem = 10380002
	elseif nZhiYe==10 then
		varItem = 10390002
	elseif nZhiYe==11 then
		varItem = 10400002
	end

	if varItem==0 then
		return
	end
	
	local varI = random(1,7)
	local j = random(1,7)
	while(varI==j) do
		j = random(1,7)
	end
	
	local itemId2 = 0
	if varI<=6 then
		itemId2 = x418024_var_ItemList[varI]
	else
		itemId2 = varItem
	end

	local itemId3 = 0
	if j<=6 then
		itemId3 = x418024_var_ItemList[j]
	else
		itemId3 = varItem
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, itemId2, 1 )	
	ItemAppendBind( varMap, itemId3, 1 )	
	ItemAppendBind( varMap, 10300103, 1 )	
	ItemAppendBind( varMap, 12030319, 1 )	
	ItemAppendBind( varMap, 11000200, 5 )	
	ItemAppendBind( varMap, 12030333, 1 )	
	ItemAppendBind( varMap, 12030334, 1 )	
	ItemAppendBind( varMap, 12030335, 1 )	

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







function x418024_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
