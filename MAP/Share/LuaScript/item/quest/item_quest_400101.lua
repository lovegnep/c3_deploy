
x400101_var_FileId = 400101 
x400101_var_Buf1 = 7528 

function x400101_ProcEventEntry( varMap, varPlayer, varBagIdx )
local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400101_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x400101_var_Buf1, 0);
    end

    return varCanPlay
end

function x400101_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400101_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400101_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400101_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400101_ProcActivateOnce( varMap, varPlayer )
end

function x400101_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
