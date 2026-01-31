
x413204_var_FileId = 413204 
x413204_var_Buf1 = 8314 

function x413204_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413204_var_Buf1 )
end

function x413204_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413204_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413204_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413204_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413204_ProcActivateOnce( varMap, varPlayer )
end

function x413204_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
