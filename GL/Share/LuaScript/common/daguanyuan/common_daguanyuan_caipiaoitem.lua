












x310369_var_FileId  = 310369

x310369_var_Item      = 12035040







function x310369_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varToday = GetDayOfYear()
    if varToday ~= GetItemParam( varMap, varPlayer, varBagIdx, 4, 2) then
        Msg2Player( varMap, varPlayer, "这张彩票的兑奖时间已过期", 8, 3)
        return
    end
    local a = GetItemParam( varMap, varPlayer, varBagIdx, 8, 1)
    local b = GetItemParam( varMap, varPlayer, varBagIdx, 10, 1)
    Msg2Player( varMap, varPlayer, format( "这张彩票的号码是#G%d#cffcc00和#G%d", a, b), 8, 3)
end






function x310369_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x310369_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310369_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	return 1; 
end







function x310369_ProcDeplete( varMap, varPlayer )
    
	
		
	
	return 1
end








function x310369_ProcActivateOnce( varMap, varPlayer)
	return 1
end







function x310369_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

