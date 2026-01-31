
x400106_var_FileId = 400106
x400106_var_Buf1 = 3001 

function x400106_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400106_var_Buf1 )
end

function x400106_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400106_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400106_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400106_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400106_ProcActivateOnce( varMap, varPlayer )
end

function x400106_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
