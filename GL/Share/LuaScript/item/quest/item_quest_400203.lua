





x400203_var_FileId = 400203 
x400203_var_Buf1 = 3001 

function x400203_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400203_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13020301) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13020302, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x400203_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400203_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400203_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400203_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400203_ProcActivateOnce( varMap, varPlayer )
end

function x400203_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
