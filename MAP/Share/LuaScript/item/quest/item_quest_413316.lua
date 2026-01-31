
x413316_var_FileId = 413316
x413316_var_Buf1 = 7524 

function x413316_ProcEventEntry( varMap, varPlayer, varBagIdx )
 
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413316_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413316_var_Buf1, 0);
    end

    return varCanPlay
end

function x413316_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413316_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413316_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413316_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413316_ProcActivateOnce( varMap, varPlayer )
end

function x413316_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
