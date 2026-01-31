
x413130_var_FileId = 413130 
x413130_var_FarScriptId	= 300230

function x413130_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( x413130_var_FarScriptId, "ProcUseItem", varMap, varPlayer, varBagIdx )
end

function x413130_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413130_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413130_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413130_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413130_ProcActivateOnce( varMap, varPlayer )
end

function x413130_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
