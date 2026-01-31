













x403117_var_FileId = 403117 





x403117_var_Buf2 = -1 
PK_SWITCH_LEVEL = 20




function x403117_ProcEventEntry( varMap, varPlayer, varBagIdx )
    
    
end






function x403117_ProcIsSpellLikeScript( varMap, varPlayer)
    
	return 1; 
end






function x403117_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403117_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
    
    if GetLevel( varMap, varPlayer) < 20 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "角色等级小于"..PK_SWITCH_LEVEL.."级不能使用此道具" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
    end
    
    local pkValue = GetPKValue( varMap, varPlayer)
    
    if pkValue == 0 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "你的PK值为0，不需要使用观音水" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
    end
	return 1; 
end







function x403117_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403117_ProcActivateOnce( varMap, varPlayer )
	SetPKValue( varMap, varPlayer, 0)
    StartTalkTask( varMap)
    TalkAppendString( varMap, "PK值清零" )
    StopTalkTask()
    DeliverTalkTips( varMap, varPlayer)
	return 1;
end







function x403117_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
