x413317_var_FileId  = 413317
x413317_var_Buf1   = 7520
x413317_var_Buf2   = -1 



function x413317_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( 203315, "useitem", varMap, varPlayer)
end


function x413317_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413317_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413317_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413317_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413317_ProcActivateOnce( varMap, varPlayer )
end

function x413317_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
