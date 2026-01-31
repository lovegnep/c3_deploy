
x413302_var_FileId = 413302
x413302_var_Buf1 = 7524 


function x413302_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413302_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413302_var_Buf1, 0);
    end

    return varCanPlay
end

function x413302_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413302_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413302_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413302_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413302_ProcActivateOnce( varMap, varPlayer )
end

function x413302_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
