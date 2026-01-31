
x300353_var_FileId = 300353
x300353_var_Buf1 = 7519 

function x300353_ProcEventEntry( varMap, varPlayer, varBagIdx )
		local varCanPlay =  LuaCallNoclosure( 300352, "PositionUseItem", varMap, varPlayer, varBagIdx, x300353_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300353_var_Buf1, 0);
    end

    return varCanPlay
end

function x300353_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x300353_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x300353_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300353_ProcDeplete( varMap, varPlayer )
	return 0
end

function x300353_ProcActivateOnce( varMap, varPlayer )
end

function x300353_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
