
x413308_var_FileId = 413308
x413308_var_Buf1 = 7524 

function x413308_ProcEventEntry( varMap, varPlayer, varBagIdx )
 
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413308_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413308_var_Buf1, 0);
    end

    return varCanPlay
end

function x413308_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413308_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413308_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413308_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413308_ProcActivateOnce( varMap, varPlayer )
end

function x413308_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
