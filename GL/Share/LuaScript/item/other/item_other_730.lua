

x418730_var_FileId = 418730
x418730_var_Item = 12031051






function x418730_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418730_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418730_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418730_ProcConditionCheck( varMap, varPlayer )
	

	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418730_ProcDeplete( varMap, varPlayer )
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return 0
	end
	
	if DepletingUsedItem(varMap, varPlayer) >0 then
		return 1
	end
	
	
	return 0;
end








function x418730_ProcActivateOnce( varMap, varPlayer, varImpact )

	
	local nMoneycount = {1,2,3,4,5,6,7,8,9,10}
	local gailv = {200,400,600,720,820,920,940,960,980,1000}
	local ranmoney = random(1000)
	local nMoney = 1000
	for k,v in gailv do
		if ranmoney <=v then
			nMoney = nMoney*nMoneycount[k]
			break
		end
	end
	local ewairanmoney = random(100000)
	local ewainMoneycount = {100,1000,5000}
	local ewaigailv = {100,110,111}
	for k,v in ewaigailv do
		if ewairanmoney <= v then
			local ewainMoney = 1000*ewainMoneycount[k]
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			varMsg = format( "恭喜%s的%s打开#{_ITEM%d}获得了#{_MONEY%d}金卡!", CountryName, Name, x418730_var_Item, ewainMoney )
			AddMoney(varMap, varPlayer, 3, ewainMoney)
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			Msg2Player(varMap,varPlayer,format("你意外获得了#{_MONEY%d}金卡", ewainMoney),4,3)
			break
		end
	end
	AddMoney(varMap, varPlayer, 3, nMoney)
	Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
	GamePlayScriptLog( varMap, varPlayer,3786)
	
	
	local item ={10340012, 10340013, 10340014,10310023,11000155,11000304}
	local itemgailv = {2,4,6,14,24,74}
	local ranitem = random(1000)
	--print(ranitem)
	local itemname = -1
	for k,v in itemgailv do
		if ranitem <= v then
			itemname = item[k]
			break
		end
	end
	
	if itemname ~= -1 then
		StartItemTask(varMap)
		ItemAppendBind( varMap, itemname, 1 )	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0  then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"恭喜你意外的获得了@item_"..itemname)	
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)		
			DeliverItemListSendToPlayer( varMap, varPlayer)
			local CounID = GetCurCountry(varMap, varPlayer)
			local CountryName = GetCountryName(CounID)
			local Name =  GetName(varMap, varPlayer)
			varMsg = format( "恭喜%s的%s打开#{_ITEM%d}获得了#{_ITEM%d}!", CountryName, Name, x418730_var_Item, itemname )
			LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
			GamePlayScriptLog( varMap, varPlayer, 3787)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包或者坐骑已满，无法得到物品！")	
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end







function x418730_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
