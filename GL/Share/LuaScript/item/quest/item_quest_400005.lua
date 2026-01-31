
x400005_var_FileId = 400005 
x400005_var_Buf1 = 3001 

function x400005_ProcEventEntry( varMap, varPlayer, varBagIdx )

	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400005_var_Buf1 )
end

function x400005_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400005_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400005_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400005_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400005_ProcActivateOnce( varMap, varPlayer )
end

function x400005_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
