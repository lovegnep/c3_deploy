





x418319_var_FileId = 418319
x418319_var_ItemList = {}
x418319_var_LevelMin = 1	






function x418319_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418319_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418319_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418319_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418319_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418319_ProcActivateOnce( varMap, varPlayer, varImpact )

	local year,month,day = GetYearMonthDay()		
	if year > 2011 then
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1414)
		return 0
	end
	
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	
	local varToday = GetDayOfYear() 
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_319_DATE[1], MD_ITEM_OTHER_319_DATE[2],MD_ITEM_OTHER_319_DATE[3])
	
	if varToday == 500 then varToday = 0 end
	if varLastday == 501 then varLastday = 1 end
	
	if varLastday ~= 0 then
		local varDaycount = 0
		if varToday < varLastday-1 then
			varDaycount = varToday + 366 - varLastday
		else
			varDaycount = varToday + 1 - varLastday
		end
		 
		if varDaycount < 30 then
			local varMsg = format("还有%d天才能使用冲级达人钻石大礼包", 30-varDaycount)
			Msg2Player(varMap,varPlayer,varMsg,8,3)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			return
		end
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_319_DATE[1], MD_ITEM_OTHER_319_DATE[2], MD_ITEM_OTHER_319_DATE[3], varToday+1)

    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
	
	if curTimes == 1 then
		StartItemTask(varMap)
		StopItemTask(varMap,varPlayer)
		DepletingUsedItem(varMap, varPlayer)
		AddMoney(varMap, varPlayer, 3, 2000000, 327)
		Msg2Player(varMap, varPlayer, "使用冲级达人钻石大礼包，获得#G2000两金卡", 8, 3)
		Msg2Player(varMap, varPlayer, "使用冲级达人钻石大礼包，获得#G2000两金卡", 8, 2)
	else
		AddMoney(varMap, varPlayer, 3, 1500000, 327)
		Msg2Player(varMap, varPlayer, "使用冲级达人钻石大礼包，获得#G1500两金卡", 8, 3)
		Msg2Player(varMap, varPlayer, "使用冲级达人钻石大礼包，获得#G1500两金卡", 8, 2)
	end
	
	return 1
end







function x418319_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
