
x310301_var_FileId = 310301
x310301_var_Buf1 = 8308 

function x310301_ProcEventEntry( varMap, varPlayer, varBagIdx )
		local varCanPlay =  LuaCallNoclosure( 310300, "PositionUseItem", varMap, varPlayer, varBagIdx, x310301_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310301_var_Buf1, 0);
    end

    return varCanPlay
end

function x310301_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x310301_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x310301_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310301_ProcDeplete( varMap, varPlayer )
	return 0
end

function x310301_ProcActivateOnce( varMap, varPlayer )
end

function x310301_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
