
x413201_var_FileId = 413201 
x413201_var_Buf1 = 8311 

function x413201_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413201_var_Buf1 )
end

function x413201_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x413201_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x413201_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413201_ProcDeplete( varMap, varPlayer )
	return 0
end

function x413201_ProcActivateOnce( varMap, varPlayer )
end

function x413201_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
