





x400213_var_FileId = 400213 
x400213_var_Buf1 = 3001 

function x400213_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400213_var_Buf1 )
	

end

function x400213_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400213_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400213_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400213_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400213_ProcActivateOnce( varMap, varPlayer )
end

function x400213_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
