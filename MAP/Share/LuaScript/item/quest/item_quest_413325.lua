
x413325_var_FileId = 413325
x413325_var_Buf1 = 7524 

function x413325_ProcEventEntry( varMap, varPlayer, varBagIdx )

		local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413325_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413325_var_Buf1, 0);
    end

    return varCanPlay
end

function x413325_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413325_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413325_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413325_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413325_ProcActivateOnce( varMap, varPlayer )
end

function x413325_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
