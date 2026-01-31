
x413321_var_FileId  = 413321
x413321_var_Buf1   = 7520
x413321_var_QuestId = 770
x413321_var_doing =0
x413321_var_xueliewu =0
x413321_var_mengguwushi1= 0
x413321_var_mengguwushi2=	0
x413321_var_mengguwushi3=	0
x413321_var_mengguwushi4=	0
x413321_var_mengguwushi5=	0



function x413321_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413321_var_Buf1 )
  		
    if varCanPlay == 1 then
    	if GetItemCount(varMap,varPlayer,13060033) == 0 then
        x413321_var_xuliewu=CreateMonster(varMap, 931,204,219,0,1,-1,-1,24,90000)
        x413321_var_mengguwushi1=CreateMonster(varMap, 937,205,216,0,1,-1,-1,24,90000)
        x413321_var_mengguwushi2=CreateMonster(varMap, 937,204,217,0,1,-1,-1,24,90000)
        x413321_var_mengguwushi3=CreateMonster(varMap, 937,205,218,0,1,-1,-1,24,90000)
        x413321_var_mengguwushi4=CreateMonster(varMap, 937,205,219,0,1,-1,-1,24,90000)
        x413321_var_mengguwushi5=CreateMonster(varMap, 937,204,218,0,1,-1,-1,24,90000)
        LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 19 )
    	end
    end

    return varCanPlay



end


function x413321_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413321_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413321_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413321_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413321_ProcActivateOnce( varMap, varPlayer )
end

function x413321_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
