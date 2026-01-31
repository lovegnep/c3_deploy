


x413330_var_FileId = 413330
x413330_var_Buf1 = 3001 

function x413330_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413330_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13050018) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13050019, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x413330_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413330_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413330_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413330_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413330_ProcActivateOnce( varMap, varPlayer )
end

function x413330_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
