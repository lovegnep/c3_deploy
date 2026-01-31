
x400102_var_FileId = 400102 
x400102_var_Buf1 = 7518 

function x400102_ProcEventEntry( varMap, varPlayer, varBagIdx )

	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400102_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x400102_var_Buf1, 0);
    end

    return varCanPlay
  end

function x400102_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400102_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400102_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400102_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400102_ProcActivateOnce( varMap, varPlayer )
end

function x400102_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
