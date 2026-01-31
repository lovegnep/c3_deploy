
x413202_var_FileId = 413202 
x413202_var_Buf1 = 8312 

function x413202_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413202_var_Buf1 )
end

function x413202_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413202_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413202_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413202_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413202_ProcActivateOnce( varMap, varPlayer )
end

function x413202_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
