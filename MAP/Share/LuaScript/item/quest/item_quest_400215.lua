





x400215_var_FileId = 400215 
x400215_var_Buf1 = 3001 

function x400215_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400215_var_Buf1 )
	

end

function x400215_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400215_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400215_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400215_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400215_ProcActivateOnce( varMap, varPlayer )
end

function x400215_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
