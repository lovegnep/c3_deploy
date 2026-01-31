
x413312_var_FileId  = 413312
x413312_var_Buf1   = -1
x413312_var_QuestId = 710
x413312_var_doing =0
x413312_var_shashe =0



function x413312_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413312_var_Buf1 )
  		
    if varCanPlay == 1 then
    	if GetItemCount(varMap,varPlayer,13060025) == 0 then
        x413312_var_shashe=CreateMonster(varMap, 908,86,155,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,85,154,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,85,165,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,86,160,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,85,160,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,84,160,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,86,165,5,1,-1,-1,21,60000)
        x413312_var_shashe=CreateMonster(varMap, 908,86,150,5,1,-1,-1,21,60000)
        LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 15 )
    	end
    end

    return varCanPlay



end


function x413312_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413312_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413312_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413312_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413312_ProcActivateOnce( varMap, varPlayer )
end

function x413312_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
