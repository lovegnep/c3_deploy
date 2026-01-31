





x418057_var_FileId = 418057
x418057_var_ItemList = {}
x418057_var_LevelMin = 15	
x418057_var_ItemList = {10200010,10230010,10240010,10250010,10260010,10270010}






function x418057_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418057_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418057_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418057_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418057_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418057_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418057_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local nZhiYe = GetZhiye( varMap, varPlayer);
	local varItem = 0;

	if nZhiYe==0 then
		varItem = 10010030
	elseif nZhiYe==1 then
		varItem = 10020030
	elseif nZhiYe==2 then
		varItem = 10030030
	elseif nZhiYe==3 then
		varItem = 10040030
	elseif nZhiYe==4 then
		varItem = 10050030
	elseif nZhiYe==5 then
		varItem = 10060030
	elseif nZhiYe==6 then
		varItem = 10350003
	elseif nZhiYe==7 then
		varItem = 10360003
	elseif nZhiYe==8 then
		varItem = 10370003
	elseif nZhiYe==9 then
		varItem = 10380003
	elseif nZhiYe==10 then
		varItem = 10390003
	elseif nZhiYe==11 then
		varItem = 10400003
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, varItem, 1 )	
	ItemAppendBind( varMap, 12030320, 1 )	
	ItemAppendBind( varMap, 11000200, 10 )	
	ItemAppendBind( varMap, 11000600, 5 )	
	ItemAppendBind( varMap, 19010001, 1 )	
	

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







function x418057_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
