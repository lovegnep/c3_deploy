
x400103_var_FileId = 400103
x400103_var_Buf1 = 7519 

function x400103_ProcEventEntry( varMap, varPlayer, varBagIdx )

local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400103_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x400103_var_Buf1, 0);
    end

    return varCanPlay
end

function x400103_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

 end

function x400103_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x400103_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400103_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400103_ProcActivateOnce( varMap, varPlayer )
end

function x400103_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
