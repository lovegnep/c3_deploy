





x400003_var_FileId = 400003 
x400003_var_Buf1 = 3001 

function x400003_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400003_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13020002) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13010038, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x400003_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400003_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400003_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400003_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400003_ProcActivateOnce( varMap, varPlayer )
end

function x400003_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
