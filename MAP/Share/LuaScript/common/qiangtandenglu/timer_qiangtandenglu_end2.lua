

x310404_var_FileId = 310404

function x310404_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	 if varMap == 0 then
		QT_LOULAN_HUMAN_NUM = 0
	
		QT_LAIYIN_HUMAN_NUM = 0
	
		QT_KUNLUN_HUMAN_NUM = 0
	
		QT_DUNHUANG_HUMAN_NUM = 0	
	end
end

function x310404_KickHuman( varMap, varAct, varTime )
	local varHumanCount = GetScenePlayerCount( varMap )

    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nCountryId = GetCurCountry( varMap,varObj )
			local PosX = 150
			local PosZ = 180
			NewWorld(varMap, varObj,15,PosX,PosZ, 310404)
        end
    end
	
	LuaCallNoclosure( 310403, "KickMonster", varMap, varAct, varTime)
end

function x310404_ProcMapTimerTick( varMap, varAct, varTime )

end
