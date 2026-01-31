
x300574_var_FileId = 300574

x300574_var_QuestScriptId 		= 	300573 

function x300574_ProcEventEntry( varMap, varPlayer, varBagIdx )
		local varCanPlay =  LuaCallNoclosure( x300574_var_QuestScriptId, "PositionUseItem", varMap, varPlayer, varBagIdx )
    
    
end

function x300574_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x300574_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x300574_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300574_ProcDeplete( varMap, varPlayer )
	return 0
end

function x300574_ProcActivateOnce( varMap, varPlayer )
end

function x300574_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
