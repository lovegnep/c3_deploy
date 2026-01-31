
x400222_var_FileId = 400222 
x400222_var_Buf1 = 3001 

function x400222_ProcEventEntry( varMap, varPlayer, varBagIdx )

	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400222_var_Buf1 )
end

function x400222_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400222_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400222_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400222_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400222_ProcActivateOnce( varMap, varPlayer )
end

function x400222_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
