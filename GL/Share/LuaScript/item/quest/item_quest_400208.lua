





x400208_var_FileId = 400208 
x400208_var_Buf1 = 3001 

function x400208_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure( 270012, "useitem", varMap, varPlayer)
	

end

function x400208_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400208_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400208_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400208_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400208_ProcActivateOnce( varMap, varPlayer )
end

function x400208_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
