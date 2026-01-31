
x400220_var_FileId = 400220 
x400220_var_Buf1 = 3001 

function x400220_ProcEventEntry( varMap, varPlayer, varBagIdx )

	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400220_var_Buf1 )
end

function x400220_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400220_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400220_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400220_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400220_ProcActivateOnce( varMap, varPlayer )
end

function x400220_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
