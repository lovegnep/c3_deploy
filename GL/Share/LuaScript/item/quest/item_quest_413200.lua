
x413200_var_FileId = 413200 
x413200_var_Buf1 = 8310 

function x413200_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413200_var_Buf1 )
end

function x413200_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413200_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413200_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413200_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413200_ProcActivateOnce( varMap, varPlayer )
end

function x413200_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
