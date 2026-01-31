
x400104_var_FileId = 400104
x400104_var_Buf1 = 3001 

function x400104_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400104_var_Buf1 )
end

function x400104_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400104_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400104_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400104_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400104_ProcActivateOnce( varMap, varPlayer )
end

function x400104_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
