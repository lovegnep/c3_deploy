





x400214_var_FileId = 400214 

x400214_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x400214_var_doing =0

function x400214_ProcEventEntry( varMap, varPlayer, varBagIdx )
			local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, -1 )
    
    if varCanPlay == 1 then
    LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 4 )
    LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 5 )
    	
      
    	
			
			
    	
			
    	
			
    end

    return varCanPlay
		
	

end































function x400214_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400214_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400214_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400214_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400214_ProcActivateOnce( varMap, varPlayer )
end

function x400214_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
