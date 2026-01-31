x414029_var_FileId = 414029 

function x414029_ProcEventEntry( varMap, varPlayer, varBagIdx )
	LuaCallNoclosure( 270300, "ItemProcEventEntry", varMap, varPlayer, varBagIdx )
end

function x414029_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x414029_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x414029_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x414029_ProcDeplete( varMap, varPlayer )

	return 0
end

function x414029_ProcActivateOnce( varMap, varPlayer )
end

function x414029_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
