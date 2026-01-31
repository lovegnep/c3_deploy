x400206_var_FileId  = 400206
x400206_var_Buf1   = 7520
x400206_var_Buf2   = -1 



function x400206_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( 270010, "useitem", varMap, varPlayer)
end


function x400206_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x400206_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400206_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400206_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400206_ProcActivateOnce( varMap, varPlayer )
end

function x400206_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
