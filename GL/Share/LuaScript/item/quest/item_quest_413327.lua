





x413327_var_FileId = 413327 
x413327_var_Buf1 = 3001 

function x413327_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413327_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13810252) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13810253, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x413327_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413327_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413327_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413327_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413327_ProcActivateOnce( varMap, varPlayer )
end

function x413327_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
