





x418197_var_FileId = 418197
x418197_var_ItemList = {}
x418197_var_LevelMin = 1	






function x418197_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418197_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418197_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418197_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418197_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418197_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	
	local varToday = GetDayOfYear() 
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_197_DATE[1], MD_ITEM_OTHER_197_DATE[2],MD_ITEM_OTHER_197_DATE[3])
	
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
			local varMsg = format("还有%d天才能使用天尊麒麟金卡", 30-varDaycount)
			Msg2Player(varMap,varPlayer,varMsg,8,3)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			return
		end
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_197_DATE[1], MD_ITEM_OTHER_197_DATE[2], MD_ITEM_OTHER_197_DATE[3], varToday+1)

    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
	
	if curTimes == 1 then
		StartItemTask(varMap)
		StopItemTask(varMap,varPlayer)
		DepletingUsedItem(varMap, varPlayer)
	end
	
	AddMoney(varMap, varPlayer, 3, 2000000, 327)
	Msg2Player(varMap, varPlayer, "使用天尊麒麟金卡，获得#G2000两金卡#W", 8, 3)
	Msg2Player(varMap, varPlayer, "使用天尊麒麟金卡，获得#G2000两金卡#W", 8, 2)
	return 1
end







function x418197_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
