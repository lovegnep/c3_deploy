


x300562_var_FileId = 300562
x300562_var_KillScriptId = 300561
x300562_money = 500000
x300562_var_SceneMonsterCount = 30
x300562_var_MsgFightFail = ""
x300562_var_MsgFightBossFail = ""

function x300562_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
	
	local varCount = getn( HZ_MONSTER_OBJ )
    
    if varCount == 0 then
  	    return
    end
    
    if varMap == 19 then
        
  	    if HZ_KILL_MONSTERBOSS < 1 then
			
			local IsHavecommonMonster = 0
			
			for varI=1,varCount do
    			if HZ_MONSTER_OBJ[varI] >= 0 then
    				DeleteMonster(varMap, HZ_MONSTER_OBJ[varI])
					HZ_MONSTER_OBJ[varI] = -1
					IsHavecommonMonster = 1
    			end
            end
            
    	    if HZ_MONSTER_BOSSOBJ >= 0 then
    	    		DeleteMonster(varMap, HZ_MONSTER_BOSSOBJ)
    				HZ_MONSTER_BOSSOBJ = -1
    	    end
    	    
    	    if IsHavecommonMonster > 0 then
				
				
    		else
				
				
    	    end
    	    
		end
		
    end
end



function x300562_ProcMapTimerTick( varMap, varAct, varTime )
end
