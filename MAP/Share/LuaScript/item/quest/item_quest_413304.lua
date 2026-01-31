x413304_var_FileId = 413304 
x413304_var_Buf1 = 3001 

function x413304_ProcEventEntry( varMap, varPlayer, varBagIdx )

 
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413304_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13030113) == 0 then
		LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 12 )
    LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 13 )
		SetPos(varMap,varPlayer,33,73)
		end
	

end

function x413304_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413304_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413304_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413304_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413304_ProcActivateOnce( varMap, varPlayer )
end

function x413304_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
