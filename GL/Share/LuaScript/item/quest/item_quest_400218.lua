





x400218_var_FileId = 400218 
x400218_var_Buf1 = 3001 

function x400218_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure( 203311, "useitem", varMap, varPlayer)
	

end

function x400218_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400218_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400218_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400218_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400218_ProcActivateOnce( varMap, varPlayer )
end

function x400218_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
