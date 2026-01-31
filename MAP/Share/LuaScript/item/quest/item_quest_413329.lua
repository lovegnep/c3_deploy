
x413329_var_FileId  = 413329
x413329_var_Buf1   = -1
x413329_var_QuestId = 2262
x413329_var_doing =0
x413329_var_shashe =0



function x413329_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413329_var_Buf1 )
  		
    if varCanPlay == 1 then
    	if GetItemCount(varMap,varPlayer,13040044) == 0 then
        x413329_var_shashe=CreateMonster(varMap, 3904,66,81,0,1,-1,-1,21,60000*10, 0, "Èø¶ûº±", "Ç±·üµÐ½«")
        LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 19 )
    	end
    end

    return varCanPlay



end


function x413329_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413329_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413329_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413329_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413329_ProcActivateOnce( varMap, varPlayer )
end

function x413329_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
