












x310367_var_FileId = 310367







function x310367_ProcEventEntry( varMap, varPlayer, varBagIdx )
end






function x310367_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310367_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310367_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	return 1; 
end







function x310367_ProcDeplete( varMap, varPlayer )
    
	
		
	
	return 1
end








function x310367_ProcActivateOnce( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, 9060) < 1 then
        Msg2Player(varMap, varPlayer, "道具使用失败，请先领取挖宝大作战任务", 0, 2)
		Msg2Player(varMap, varPlayer, "道具使用失败，请先领取挖宝大作战任务", 0, 3)
        return
    end
    if LuaCallNoclosure( 310364, "ProcUseShovel", varMap, varPlayer, 1) == 1 then
        x310367_LogicDeplete( varMap, varPlayer)
    end

	return 1
end







function x310367_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310367_LogicDeplete( varMap, varPlayer)
    
    
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    if curTimes <= 1 then
        
        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
    else
        
        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
    end
end

