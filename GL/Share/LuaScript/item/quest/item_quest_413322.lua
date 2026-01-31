
x413322_var_FileId = 413322
x413322_var_Buf1 = 7524 

function x413322_ProcEventEntry( varMap, varPlayer, varBagIdx )
 
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413322_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413322_var_Buf1, 0);
    end

    return varCanPlay
end

function x413322_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413322_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413322_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413322_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413322_ProcActivateOnce( varMap, varPlayer )
end

function x413322_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
