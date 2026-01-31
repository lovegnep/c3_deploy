





x400211_var_FileId = 400211 
x400211_var_Buf1 = 7528 

function x400211_ProcEventEntry( varMap, varPlayer, varBagIdx )
			local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, -1 )
    
    if varCanPlay == 1 then
    		if GetItemCount(varMap,varPlayer,13030086) == 0 then
					StartItemTask(varMap)                                                    
					ItemAppend( varMap,13030087, 1 )   
					StopItemTask(varMap,varPlayer)
					DeliverItemListSendToPlayer(varMap,varPlayer) 
					LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 1 )
					LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 2 )
					LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 3 )
				end
    end

    return varCanPlay
		
	

end

function x400211_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400211_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400211_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400211_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400211_ProcActivateOnce( varMap, varPlayer )
end

function x400211_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
