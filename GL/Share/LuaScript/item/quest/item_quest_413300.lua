
x413300_var_FileId = 413300
x413300_var_Buf1 = 7528 

function x413300_ProcEventEntry( varMap, varPlayer, varBagIdx )

		local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413300_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413300_var_Buf1, 0);
    end

    return varCanPlay
end

function x413300_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413300_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413300_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413300_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413300_ProcActivateOnce( varMap, varPlayer )
end

function x413300_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
