





x400212_var_FileId = 400212 
x400212_var_Buf1 = 3001 

function x400212_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400212_var_Buf1 )
			if GetItemCount(varMap,varPlayer,13020206) == 0 then
					StartItemTask(varMap)                                                    
					ItemAppend( varMap,13020214, 1 )   
					StopItemTask(varMap,varPlayer)
					DeliverItemListSendToPlayer(varMap,varPlayer) 
		end

end

function x400212_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400212_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400212_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400212_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400212_ProcActivateOnce( varMap, varPlayer )
end

function x400212_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
