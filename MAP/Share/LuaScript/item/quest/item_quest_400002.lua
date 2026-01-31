x400002_var_FileId  = 400002
x400002_var_Buf1   = 7520
x400002_var_Buf2   = -1 



function x400002_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( 200501, "useitem", varMap, varPlayer)
end


function x400002_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x400002_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400002_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400002_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400002_ProcActivateOnce( varMap, varPlayer )
end

function x400002_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
