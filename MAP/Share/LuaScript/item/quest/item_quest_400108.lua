
x400108_var_FileId = 400108
x400108_var_Buf1 = -1 

function x400108_ProcEventEntry( varMap, varPlayer, varBagIdx )

	return LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400108_var_Buf1 )
end

function x400108_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400108_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x400108_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400108_ProcDeplete( varMap, varPlayer )
	return 0
end

function x400108_ProcActivateOnce( varMap, varPlayer )
end

function x400108_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
