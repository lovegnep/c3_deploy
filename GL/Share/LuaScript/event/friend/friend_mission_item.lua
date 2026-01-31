
x300781_var_FileId = 300781
x300781_var_Buf1 = 7519 

function x300781_ProcEventEntry( varMap, varPlayer, varBagIdx )
		local varCanPlay =  LuaCallNoclosure( 300782, "PositionUseItem", varMap, varPlayer, varBagIdx, x300781_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300781_var_Buf1, 0);
    end

    return varCanPlay
end

function x300781_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x300781_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x300781_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300781_ProcDeplete( varMap, varPlayer )
	return 0
end

function x300781_ProcActivateOnce( varMap, varPlayer )
end

function x300781_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
