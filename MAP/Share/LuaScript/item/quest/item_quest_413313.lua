
x413313_var_FileId = 413313 
x413313_var_Buf1 = 3001 

function x413313_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413313_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13060023) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13060024, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x413313_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413313_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413313_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413313_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413313_ProcActivateOnce( varMap, varPlayer )
end

function x413313_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
