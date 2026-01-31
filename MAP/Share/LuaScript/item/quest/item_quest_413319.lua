
x413319_var_FileId = 413319 
x413319_var_Buf1 = 7520 

function x413319_ProcEventEntry( varMap, varPlayer, varBagIdx )

	local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413319_var_Buf1 )
    
    if varCanPlay == 1 then
        SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x413319_var_Buf1, 0);
    end

    return varCanPlay
  end

function x413319_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413319_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413319_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413319_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413319_ProcActivateOnce( varMap, varPlayer )
end

function x413319_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
