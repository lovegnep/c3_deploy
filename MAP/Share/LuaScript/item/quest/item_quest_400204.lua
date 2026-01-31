





x400204_var_FileId = 400204 
x400204_var_Buf1 = 7520 

function x400204_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400204_var_Buf1 )
	

end

function x400204_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400204_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400204_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400204_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400204_ProcActivateOnce( varMap, varPlayer )
end

function x400204_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
