
x300355_var_FileId = 300355
x300355_var_Buf1 = -1 

function x300355_ProcEventEntry( varMap, varPlayer, varBagIdx )
		local varExp =  1000
		AddExp(varMap, varPlayer, varExp);

    return 1
end

function x300355_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x300355_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x300355_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300355_ProcDeplete( varMap, varPlayer )
	return 0
end

function x300355_ProcActivateOnce( varMap, varPlayer )
end

function x300355_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
