
x413309_var_FileId = 413309
x413309_var_Buf1 = 7528 

function x413309_ProcEventEntry( varMap, varPlayer, varBagIdx )

		local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413309_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413309_var_Buf1, 0);
    end

    return varCanPlay
end

function x413309_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413309_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413309_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413309_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413309_ProcActivateOnce( varMap, varPlayer )
end

function x413309_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
