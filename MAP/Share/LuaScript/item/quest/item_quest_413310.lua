





x413310_var_FileId = 413310 
x413310_var_Buf1 = 3001 

function x413310_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413310_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13060010) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13060012, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x413310_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413310_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413310_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413310_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413310_ProcActivateOnce( varMap, varPlayer )
end

function x413310_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
