





x400205_var_FileId = 400205 
x400205_var_Buf1 = 3001 

function x400205_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure( 270003, "useitem", varMap, varPlayer)
	

end

function x400205_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400205_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400205_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400205_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400205_ProcActivateOnce( varMap, varPlayer )
end

function x400205_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
