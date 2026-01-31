x413306_var_FileId  = 413306 
x413306_var_Buf1   = -1
x413306_var_QuestId = 672
x413306_var_doing =0
x413306_var_bailuotuo =0
x413306_var_luotuo1 =0
x413306_var_luotuo2 =0
x413306_var_tujueqibing =0



function x413306_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local varCanPlay =  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x413306_var_Buf1 )
  
    if varCanPlay == 1 then
    
        x413306_var_bailuotuo=CreateMonster(varMap, 849,161,113,1,1,-1,-1,20,9000)
        x413306_var_luotuo1=CreateMonster(varMap, 861,157,111,1,1,-1,-1,20,9000)
        x413306_var_luotuo2=CreateMonster(varMap, 861,163,115,1,1,-1,-1,20,9000)
        x413306_var_tujueqibing=CreateMonster(varMap, 841,159,119,1,1,-1,-1,20,2000)
        SetPatrolId(varMap, x413306_var_bailuotuo, 3)
        SetPatrolId(varMap, x413306_var_luotuo1, 4)
        SetPatrolId(varMap, x413306_var_luotuo2, 5)
        NpcTalk(varMap, x413306_var_tujueqibing, "啊！快看，白骆驼！神的使者出现了！", -1)
    end

    return varCanPlay



end


function x413306_ProcIsSpellLikeScript( varMap, varPlayer)
 
	return 0;     
	
	
end

function x413306_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413306_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413306_ProcDeplete( varMap, varPlayer )

	return 1
end

function x413306_ProcActivateOnce( varMap, varPlayer )
end

function x413306_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
