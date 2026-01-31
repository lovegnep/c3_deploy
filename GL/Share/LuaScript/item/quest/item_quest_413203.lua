
x413203_var_FileId = 413203 
x413203_var_Buf1 = 8313 

function x413203_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413203_var_Buf1 )
end

function x413203_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413203_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413203_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413203_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413203_ProcActivateOnce( varMap, varPlayer )
end

function x413203_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
