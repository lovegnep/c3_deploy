





x418019_var_FileId = 418019
x418019_var_ItemList = {}
x418019_var_LevelMin = 20	
x418019_var_ItemList = {12030201,12030202,12041101,12010020,12030200} 
x418019_var_ItemName = {"修理石","江湖请柬","修行草","小生命清露","小喇叭"} 












function x418019_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418019_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418019_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418019_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418019_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	return 1;
end








function x418019_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418019_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local j = random(1,5)
	local varI = random(1,5)	
	local varItem = 0
	local itemName = 0
	local varCountry = LuaCallNoclosure(888888,"GetCountryName",varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)

	if j < 5 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			AddMoney( varMap, varPlayer, 1, 500*nLevel )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"很遗憾，幸运擦肩而过，祝您下次好运！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		if varI<=5 then
			varItem = x418019_var_ItemList[varI]
			itemName = 	x418019_var_ItemName[varI]
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
			local varMsg = format("#G恭喜%s#Y%s#G获得了#R%s#G幸运奖品，每人都有可能获得这份幸运，马上到领奖大使处去领取吧！",varCountry,nName,itemName)
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







function x418019_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
