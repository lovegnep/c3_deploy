
x400221_var_FileId = 400221 
x400221_var_Buf1 = 3001 

function x400221_ProcEventEntry( varMap, varPlayer, varBagIdx )

	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400221_var_Buf1 )
end

function x400221_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400221_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400221_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400221_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400221_ProcActivateOnce( varMap, varPlayer )
end

function x400221_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
