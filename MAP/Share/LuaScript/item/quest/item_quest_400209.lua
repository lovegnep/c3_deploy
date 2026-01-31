





x400209_var_FileId = 400209 
x400209_var_Buf1 = 3001 

function x400209_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure( 270015, "useitem", varMap, varPlayer,0)
	

end

function x400209_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400209_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400209_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400209_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400209_ProcActivateOnce( varMap, varPlayer )
end

function x400209_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
