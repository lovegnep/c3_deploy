





x400210_var_FileId = 400210 
x400210_var_Buf1 = 3001 

function x400210_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure( 270015, "useitem", varMap, varPlayer,1)
	

end

function x400210_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400210_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400210_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400210_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400210_ProcActivateOnce( varMap, varPlayer )
end

function x400210_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
