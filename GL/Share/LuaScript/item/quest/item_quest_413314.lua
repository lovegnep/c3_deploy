
x413314_var_FileId = 413314
x413314_var_Buf1 = 7524 

function x413314_ProcEventEntry( varMap, varPlayer, varBagIdx )
 
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413314_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413314_var_Buf1, 0);
    end

    return varCanPlay
end

function x413314_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413314_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413314_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413314_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413314_ProcActivateOnce( varMap, varPlayer )
end

function x413314_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
