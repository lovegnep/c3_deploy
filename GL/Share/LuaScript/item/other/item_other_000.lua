





x418000_var_FileId = 418000
x418000_var_ItemList = {10200010,10230010,10240010,10250010,10260010,10270010}






function x418000_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418000_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418000_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418000_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local nZhiYe = GetZhiye( varMap, varPlayer);
	local varItem = 0;



	if nZhiYe==0 then
		varItem = 10010010
	elseif nZhiYe==1 then
		varItem = 10020010
	elseif nZhiYe==2 then
		varItem = 10030010
	elseif nZhiYe==3 then
		varItem = 10040010
	elseif nZhiYe==4 then
		varItem = 10050010
	elseif nZhiYe==5 then
		varItem = 10060010
	elseif nZhiYe==6 then
		varItem = 10350001
	elseif nZhiYe==7 then
		varItem = 10360001
	elseif nZhiYe==8 then
		varItem = 10370001
	elseif nZhiYe==9 then
		varItem = 10380001
	elseif nZhiYe==10 then
		varItem = 10390001
	elseif nZhiYe==11 then
		varItem = 10400001
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
		itemId2 = x418000_var_ItemList[varI]
	else
		itemId2 = varItem
	end

	local itemId3 = 0
	if j<=6 then
		itemId3 = x418000_var_ItemList[j]
	else
		itemId3 = varItem
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12010001, 5 )
	ItemAppendBind( varMap, itemId2, 1 )
	ItemAppendBind( varMap, itemId3, 1 )
	ItemAppendBind( varMap, 12010100, 1 )
	
	ItemAppendBind( varMap, 12030306, 1 )
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
