




x430106_var_FileId 		= 430106 


x430106_var_LevelMin		= 70
x430106_var_LevelMax		= 80

x430106_var_Exp           = 910000




function x430106_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430106_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430106_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430106_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < x430106_var_LevelMin then
        Msg2Player( varMap, varPlayer, "你的等级低于使用此物品的最低级别", 8, 3)
        return 0
    end
    if varLevel >= x430106_var_LevelMax then
        Msg2Player( varMap, varPlayer, "你的等级高于使用此物品的最高级别", 8, 3)
        return 0
    end
    if GetTiredTime( varMap, varPlayer) >= 480 then
        Msg2Player( varMap, varPlayer, "您处于疲劳状态，无法再次使用月饼", 8, 3)
        return 0
    end
	return 1; 
end







function x430106_ProcDeplete( varMap, varPlayer)
    if DepletingUsedItem( varMap, varPlayer) == 1 then
        return 1;
    end

    return 0
end








function x430106_ProcActivateOnce( varMap, varPlayer, varImpact)

	--2011-07-30 by rj 增加外挂吃月饼的 MD 防护
	local currDay = GetDayOfYear()
	local lastDay = GetPlayerGameData(varMap, varPlayer, MD_EATMOONCAKE_DAY[1], MD_EATMOONCAKE_DAY[2], MD_EATMOONCAKE_DAY[3])
	if currDay ~= lastDay then
		SetPlayerGameData(varMap, varPlayer, MD_EATMOONCAKE_DAY[1], MD_EATMOONCAKE_DAY[2], MD_EATMOONCAKE_DAY[3], currDay)
		SetPlayerGameData(varMap, varPlayer, MD_EATMOONCAKE_DAYCOUNT[1], MD_EATMOONCAKE_DAYCOUNT[2], MD_EATMOONCAKE_DAYCOUNT[3], 0)
	end
	local dayCount = GetPlayerGameData(varMap, varPlayer, MD_EATMOONCAKE_DAYCOUNT[1], MD_EATMOONCAKE_DAYCOUNT[2], MD_EATMOONCAKE_DAYCOUNT[3])
	if dayCount > 17 then 
		Msg2Player(varMap, varPlayer, "道具使用异常，请稍后再试",8,3)
		return
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_EATMOONCAKE_DAYCOUNT[1], MD_EATMOONCAKE_DAYCOUNT[2], MD_EATMOONCAKE_DAYCOUNT[3], dayCount + 1)
	
    AddExp( varMap, varPlayer, x430106_var_Exp)
    IncreaseTiredTime( varMap, varPlayer, 120)
end







function x430106_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

