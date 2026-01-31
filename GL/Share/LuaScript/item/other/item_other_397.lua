





x418397_var_FileId 		= 418397 

x418397_var_LevelMin		=	65






function x418397_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418397_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418397_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418397_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418397_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418397_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418397_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	local year,month,day = GetYearMonthDay()		
	if year > 2011 then
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1414)
		return 0
	end
	
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	
	local varToday = GetDayOfYear() 
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_397_DATE[1], MD_ITEM_OTHER_397_DATE[2],MD_ITEM_OTHER_397_DATE[3])
	
	if varToday == 500 then varToday = 0 end
	if varLastday == 501 then varLastday = 1 end
	
	if varLastday ~= 0 then
		local varDaycount = 0
		if varToday < varLastday-1 then
			varDaycount = varToday + 366 - varLastday
		else
			varDaycount = varToday + 1 - varLastday
		end
		--print (1111111111111111111111) 
		if varDaycount < 30 then
		--print (2222222222222222222222) 
			local varMsg = format("还有%d天才能使用周年庆黄金军饷礼包", 30-varDaycount)
			Msg2Player(varMap,varPlayer,varMsg,8,3)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			return
		end
	end
	--print (3333333333333333333) 
	SetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_397_DATE[1], MD_ITEM_OTHER_397_DATE[2], MD_ITEM_OTHER_397_DATE[3], varToday+1)

    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
	
	if curTimes == 1 then
		StartItemTask(varMap)
		StopItemTask(varMap,varPlayer)
		DepletingUsedItem(varMap, varPlayer)
		AddMoney(varMap, varPlayer, 3, 200000, 327)
		Msg2Player(varMap, varPlayer, "使用周年庆黄金军饷礼包，获得#G200两金卡", 8, 3)
		Msg2Player(varMap, varPlayer, "使用周年庆黄金军饷礼包，获得#G200两金卡", 8, 2)
	else
		AddMoney(varMap, varPlayer, 3, 100000, 327)
		Msg2Player(varMap, varPlayer, "使用周年庆黄金军饷礼包，获得#G100两金卡", 8, 3)
		Msg2Player(varMap, varPlayer, "使用周年庆黄金军饷礼包，获得#G100两金卡", 8, 2)
	end
	
	return 1
end




function x418397_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
