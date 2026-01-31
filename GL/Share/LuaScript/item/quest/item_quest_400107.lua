
x400107_var_FileId = 400107
x400107_var_Buf1 = 7519 

function x400107_ProcEventEntry( varMap, varPlayer, varBagIdx )
local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400107_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x400107_var_Buf1, 0);
    end

    return varCanPlay
end

function x400107_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400107_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400107_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400107_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400107_ProcActivateOnce( varMap, varPlayer )
end

function x400107_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
