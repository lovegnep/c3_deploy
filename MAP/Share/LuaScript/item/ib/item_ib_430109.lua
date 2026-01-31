




x430109_var_FileId 		= 430109 




function x430109_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430109_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430109_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430109_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
    
    
        
        
    
    
        
        
    
    if GetTiredTime( varMap, varPlayer) >= 480 then
        Msg2Player( varMap, varPlayer, "您处于疲劳状态，无法再次使用月饼", 8, 3)
        return 0
    end
	return 1; 
end







function x430109_ProcDeplete( varMap, varPlayer)
    if DepletingUsedItem( varMap, varPlayer) == 1 then
        return 1;
    end

    return 0
end








function x430109_ProcActivateOnce( varMap, varPlayer, varImpact)

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


	local varLevel=GetLevel(varMap, varPlayer)
	if varLevel > 0 and varLevel < 10 then
	varExpBonus = 50000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 9 and varLevel < 20 then
	varExpBonus = 50000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 19 and varLevel < 30 then
	varExpBonus = 50000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 29 and varLevel < 40 then
	varExpBonus = 270000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 39 and varLevel < 50 then
	varExpBonus = 400000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 49 and varLevel < 60 then
	varExpBonus = 550000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 59 and varLevel < 70 then
	varExpBonus = 720000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 69 and varLevel < 80 then
	varExpBonus = 910000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 79 and varLevel < 90 then
	varExpBonus = 1120000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 89 and varLevel < 100 then
	varExpBonus = 1350000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
	if varLevel > 99 then
	varExpBonus = 1580000
    AddExp( varMap, varPlayer, varExpBonus)
    IncreaseTiredTime( varMap, varPlayer, 120)
	end
end







function x430109_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

