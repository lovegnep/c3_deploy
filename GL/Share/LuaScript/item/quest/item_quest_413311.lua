x413311_var_FileId = 413311 
x413311_var_Buf1 = 3001 

function x413311_ProcEventEntry( varMap, varPlayer, varBagIdx )

 
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx,x413311_var_Buf1  )
		if GetItemCount(varMap,varPlayer,13040030) == 0 then
		NewWorld(varMap,varPlayer,2,213,137,413311)
		LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 15 )
    LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 16 )
    LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 17 )
		end
	

end

function x413311_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413311_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413311_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413311_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413311_ProcActivateOnce( varMap, varPlayer )
end

function x413311_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
