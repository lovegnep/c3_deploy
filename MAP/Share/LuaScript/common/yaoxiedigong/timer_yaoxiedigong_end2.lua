

x310032_var_FileId = 310032

x310032_var_SceneId = { 50, 150, 250, 350 }

function x310032_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
		YX_LOULAN_HUMAN_NUM1 = 0
		YX_LOULAN_HUMAN_NUM2 = 0
		YX_LOULAN_HUMAN_NUM3 = 0
		YX_LOULAN_HUMAN_NUM4 = 0
		YX_LOULAN_HUMAN_NUM5 = 0
		YX_LOULAN_HUMAN_NUM6 = 0
		YX_LOULAN_HUMAN_NUM7 = 0
		YX_LOULAN_HUMAN_NUM8 = 0
		YX_LOULAN_HUMAN_NUM9 = 0
		YX_LOULAN_HUMAN_NUM10 = 0
		YX_LOULAN_HUMAN_NUM11 = 0
		YX_LOULAN_HUMAN_NUM12 = 0
	
		YX_LAIYIN_HUMAN_NUM1 = 0
		YX_LAIYIN_HUMAN_NUM2 = 0
		YX_LAIYIN_HUMAN_NUM3 = 0
		YX_LAIYIN_HUMAN_NUM4 = 0
		YX_LAIYIN_HUMAN_NUM5 = 0
		YX_LAIYIN_HUMAN_NUM6 = 0
		YX_LAIYIN_HUMAN_NUM7 = 0
		YX_LAIYIN_HUMAN_NUM8 = 0
		YX_LAIYIN_HUMAN_NUM9 = 0
		YX_LAIYIN_HUMAN_NUM10 = 0
		YX_LAIYIN_HUMAN_NUM11 = 0
		YX_LAIYIN_HUMAN_NUM12 = 0
				
		YX_KUNLUN_HUMAN_NUM1 = 0
		YX_KUNLUN_HUMAN_NUM2 = 0
		YX_KUNLUN_HUMAN_NUM3 = 0
		YX_KUNLUN_HUMAN_NUM4 = 0
		YX_KUNLUN_HUMAN_NUM5 = 0
		YX_KUNLUN_HUMAN_NUM6 = 0
		YX_KUNLUN_HUMAN_NUM7 = 0
		YX_KUNLUN_HUMAN_NUM8 = 0
		YX_KUNLUN_HUMAN_NUM9 = 0
		YX_KUNLUN_HUMAN_NUM10 = 0
		YX_KUNLUN_HUMAN_NUM11 = 0
		YX_KUNLUN_HUMAN_NUM12 = 0
			
		YX_DUNHUANG_HUMAN_NUM1 = 0
		YX_DUNHUANG_HUMAN_NUM2 = 0
		YX_DUNHUANG_HUMAN_NUM3 = 0
		YX_DUNHUANG_HUMAN_NUM4 = 0
		YX_DUNHUANG_HUMAN_NUM5 = 0
		YX_DUNHUANG_HUMAN_NUM6 = 0
		YX_DUNHUANG_HUMAN_NUM7 = 0
		YX_DUNHUANG_HUMAN_NUM8 = 0
		YX_DUNHUANG_HUMAN_NUM9 = 0
		YX_DUNHUANG_HUMAN_NUM10 = 0
		YX_DUNHUANG_HUMAN_NUM11 = 0
		YX_DUNHUANG_HUMAN_NUM12 = 0
end

function x310032_ReliveHuman(varMap,varPlayer)

	if GetHp(varMap,varPlayer) > 0  then
		return
	end
	
	ClearRageRecoverTick(varMap, varPlayer)
	RestoreHp(varMap, varPlayer,100)
	RestoreRage(varMap, varPlayer,100)
	ClearMutexState(varMap, varPlayer, 6)
	SendReliveResult(varMap, varPlayer,1)	
	if usehorse==1 then
		LastMount(varMap, varPlayer )
		RestoreHp(varMap, varPlayer,0)
	end
end

function x310032_KickHuman( varMap, varAct, varTime )
	
    



















   local PosX={ 454,454,454,454}
   local PosZ={ 322,322,322,322}     
         
	local varHumanCount = GetScenePlayerCount( varMap )

    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 and IsPlayerStateNormal(varMap,varObj) == 1 then
        
            local nCountryId = GetCurCountry( varMap,varObj )
		    local NewSceneId = x310032_var_SceneId[nCountryId+1]
		    local Posx = PosX[nCountryId+1]
		    local Posz = PosZ[nCountryId+1]
		    
		    x310032_ReliveHuman(varMap,varObj)
		    NewWorld(varMap, varObj,NewSceneId,Posx+random( 0, 3),Posz+random( 0, 3), 310032)
        
        end
    end
	
	LuaCallNoclosure( 310031, "KickMonster", varMap, varAct, varTime)
end

function x310032_ProcMapTimerTick( varMap, varAct, varTime )

end
