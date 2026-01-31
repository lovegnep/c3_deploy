x256236_var_FileId = 256236 

x256236_var_Target_FileId =	256233

function x256236_ProcEventEntry( varMap, varPlayer, varBagIdx )

	LuaCallNoclosure( x256236_var_Target_FileId, "ProcUseItem", varMap, varPlayer, varBagIdx, -1 )
    
end

function x256236_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x256236_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x256236_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x256236_ProcDeplete( varMap, varPlayer )

	return 0
end

function x256236_ProcActivateOnce( varMap, varPlayer )
end

function x256236_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
