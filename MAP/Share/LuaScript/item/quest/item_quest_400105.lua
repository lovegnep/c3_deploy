
x400105_var_FileId = 400105
x400105_var_Buf1 = 7522 

function x400105_ProcEventEntry( varMap, varPlayer, varBagIdx )
local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400105_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x400105_var_Buf1, 0);
    end

    return varCanPlay
end

function x400105_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400105_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400105_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400105_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400105_ProcActivateOnce( varMap, varPlayer )
end

function x400105_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
