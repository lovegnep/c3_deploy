
x300579_var_FileId = 300579

x300579_var_QuestScriptId 		= 	300576 

function x300579_ProcEventEntry( varMap, varPlayer, varBagIdx )
		local varCanPlay =  LuaCallNoclosure( x300579_var_QuestScriptId, "PositionUseItem", varMap, varPlayer, varBagIdx )
    
    
end

function x300579_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x300579_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x300579_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300579_ProcDeplete( varMap, varPlayer )
	return 0
end

function x300579_ProcActivateOnce( varMap, varPlayer )
end

function x300579_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
