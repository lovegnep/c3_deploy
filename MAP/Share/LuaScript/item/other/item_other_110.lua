





x418110_var_FileId = 418110
x418110_var_ItemList = {}
x418110_var_LevelMin = 20	
x418110_var_ItemList = {11970021,11990011,10300111,10300120,10300129,12030323,12030396}
x418110_var_ItemList2 = {12030319,12030320,12030321,12030322}
x418110_var_ItemName = {"乱士符","三番令","苗疆时装（1天）","百夷时装（1天）","大理时装（1天）","100两小钱包","150两小钱包"} 
x418110_var_ItemName2 = {"小钱包","小钱包","小钱包","小钱包"} 



















function x418110_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418110_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418110_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418110_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418110_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	return 1;
end








function x418110_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418110_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local j = random(1,7)
	local varI = random(1,7)	
	local varItem = 0
	local itemName = 0
	local itemId2 = 0
	local itemName2 = 0
	local varCountry = LuaCallNoclosure(888888,"GetCountryName",varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	local k = random(1,4)

	if j < 5 then
			itemId2 = x418110_var_ItemList2[k]
		StartItemTask(varMap)
			ItemAppendBind( varMap,itemId2, 1 )	

		local varRet = StopItemTask(varMap,varPlayer)

		if varRet > 0 then
			if(DepletingUsedItem(varMap, varPlayer)) == 1 then

				StartTalkTask(varMap)
				TalkAppendString(varMap,"很遗憾，幸运与您擦肩而过，祝您下次好运！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"使用物品异常！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
		
	else
		if varI<=7 then
			varItem = x418110_var_ItemList[varI]
			itemName = 	x418110_var_ItemName[varI]
	StartItemTask(varMap)
	ItemAppendBind( varMap,varItem, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具")
			StopTalkTask(varMap)
			AddMoney( varMap, varPlayer, 1, 500*nLevel )
			local nName=GetName(varMap,varPlayer)
			local varMsg = format("#G恭喜#R%s王国#G的#Y%s#G获得了#R%s#G的幸运奖品，每人都有可能获得这份幸运，马上到领奖大使处去领取吧！",varCountry,nName,itemName)
			LuaAllScenceM2Wrold (varMap, varMsg, 0, 1)
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
		else
			return
		end
	end


end







function x418110_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
