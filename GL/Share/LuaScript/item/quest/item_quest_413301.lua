
x413301_var_FileId = 413301
x413301_var_Buf1 = 7524 

function x413301_ProcEventEntry( varMap, varPlayer, varBagIdx )
 
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413301_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413301_var_Buf1, 0);
    end

    return varCanPlay
end

function x413301_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413301_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413301_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413301_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413301_ProcActivateOnce( varMap, varPlayer )
end

function x413301_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
