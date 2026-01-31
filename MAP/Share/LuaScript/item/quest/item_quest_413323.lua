
x413323_var_FileId = 413323
x413323_var_Buf1 = 7528 

function x413323_ProcEventEntry( varMap, varPlayer, varBagIdx )

		local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413323_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413323_var_Buf1, 0);
    end

    return varCanPlay
end

function x413323_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413323_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413323_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413323_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413323_ProcActivateOnce( varMap, varPlayer )
end

function x413323_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
