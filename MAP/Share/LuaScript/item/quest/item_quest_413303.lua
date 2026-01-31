x413303_var_FileId  = 413303
x413303_var_Buf1   = -1
x413303_var_QuestId = 474
x413303_var_doing =0
x413303_var_shashe =0



function x413303_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413303_var_Buf1 )
  
    if varCanPlay == 1 then
        x413303_var_shashe=CreateMonster(varMap, 816,186,200,5,1,-1,-1,21,120000)
        x413303_var_shashe=CreateMonster(varMap, 816,184,213,5,1,-1,-1,21,120000)
    end

    return varCanPlay



end


function x413303_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413303_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413303_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413303_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413303_ProcActivateOnce( varMap, varPlayer )
end

function x413303_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
