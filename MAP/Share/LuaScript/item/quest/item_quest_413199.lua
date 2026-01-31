
x413199_var_FileId = 413199 
x413199_var_Buf1 = 3001 

function x413199_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413199_var_Buf1 )
end

function x413199_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413199_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413199_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413199_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413199_ProcActivateOnce( varMap, varPlayer )
end

function x413199_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
