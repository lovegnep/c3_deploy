
x413315_var_FileId = 413315
x413315_var_Buf1 = 7524 

function x413315_ProcEventEntry( varMap, varPlayer, varBagIdx )
 
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413315_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413315_var_Buf1, 0);
    end

    return varCanPlay
end

function x413315_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413315_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413315_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413315_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413315_ProcActivateOnce( varMap, varPlayer )
end

function x413315_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
