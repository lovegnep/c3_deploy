





x400219_var_FileId = 400219 
x400219_var_Buf1 = 3001 

function x400219_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400219_var_Buf1 )
		if GetItemCount(varMap,varPlayer,13810252) == 0 then
		StartItemTask(varMap)                                                    
		ItemAppend( varMap,13810253, 1 )   
		StopItemTask(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	

end

function x400219_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400219_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400219_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400219_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400219_ProcActivateOnce( varMap, varPlayer )
end

function x400219_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
