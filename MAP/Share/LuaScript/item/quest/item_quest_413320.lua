
x413320_var_FileId  = 413320
x413320_var_Buf1   = -1
x413320_var_QuestId = 765
x413320_var_doing =0
x413320_var_jianling =0



function x413320_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413320_var_Buf1 )
  		
    if varCanPlay == 1 then
    	if GetItemCount(varMap,varPlayer,13060032) == 0 then
        x413320_var_jianling=CreateMonster(varMap, 930,119,224,5,1,-1,-1,21,60000)
        LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 19 )
    	end
    end

    return varCanPlay



end


function x413320_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413320_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413320_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413320_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413320_ProcActivateOnce( varMap, varPlayer )
end

function x413320_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
