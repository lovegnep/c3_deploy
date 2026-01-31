





x280000_var_FileId = 280000 

x280000_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}


function x280000_ProcEventEntry( varMap, varPlayer, varBagIdx )
			local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, -1 )
    
    if varCanPlay == 1 then
   
    LuaScenceM2Near(varMap,  varPlayer, "重汉法，劝农桑，世祖当立为国策。", 5, -1)

			
    end

    return varCanPlay
		
	

end




function x280000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x280000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x280000_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x280000_ProcDeplete( varMap, varPlayer )

	return 0
end

function x280000_ProcActivateOnce( varMap, varPlayer )
end

function x280000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
