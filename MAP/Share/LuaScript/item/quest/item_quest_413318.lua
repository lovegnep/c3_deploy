
x413318_var_FileId  = 413318
x413318_var_Buf1   = -1
x413318_var_QuestId = 705
x413318_var_doing =0
x413318_var_shashe =0



function x413318_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413318_var_Buf1 )
  		
    if varCanPlay == 1 then
    	if GetItemCount(varMap,varPlayer,13060022) == 0 then
        x413318_var_shashe=CreateMonster(varMap, 907,210,94,5,1,-1,-1,21,60000)
        LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 19 )
    	end
    end

    return varCanPlay



end


function x413318_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413318_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413318_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413318_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413318_ProcActivateOnce( varMap, varPlayer )
end

function x413318_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
