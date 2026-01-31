
x310363_var_FileId              = 310363

x310363_var_NPCList               = {}

x310363_var_MinLevel      				= 85

x310363_var_LessThanMinLevel  = format( "本活动只对#G%d#cffcc00级以上玩家开放", x310363_var_MinLevel)

x310363_var_PosList               = {
                                    { varX = 104, z =  97, varIndex = 1  }, 
                                    { varX = 104, z = 104, varIndex = 2  }, 
                                    { varX = 120, z = 103, varIndex = 3  }, 
                                    { varX = 120, z =  97, varIndex = 4  }, 
                                    { varX = 134, z =  97, varIndex = 5  }, 
                                    { varX = 133, z = 105, varIndex = 6  }, 
                                    { varX = 151, z = 106, varIndex = 7  }, 
                                    { varX = 151, z = 98 , varIndex = 8  }, 
                                    { varX = 132, z = 101, varIndex = 9  }, 
                                    { varX = 125, z = 100, varIndex = 10 }, 
}

x310363_var_Created               = {}

x310363_var_Available             = {}

x310363_var_IsEnableId            = 1044

function x310363_ProcMapCreate( varMap)
    if varMap ~= 40 then
        return
    end

    
end

function x310363_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
	SetSystemTimerTick( varMap, x310363_var_FileId, "DaguanyunTimer", varAct, 10000)

    local strLog = format( "Timer %d active varScript %d. ", varAct, x310363_var_FileId)
    WriteLog( 1, strLog)
end

function x310363_DaguanyunTimer( varMap, varAct, varTime)
    if GetGameOpenById( x310363_var_IsEnableId) <= 0 then
        return
    end

    local day, week = GetWeek()
    if day == 6 or day == 0 then
        if getn( x310363_var_NPCList) == 0 then
            
            x310363_var_Available = x310363_var_PosList
            local empty = {}
            local varIndex = 1
            for varI = 1, 5 do
                varIndex = x310363_var_Available[ random( 1, getn( x310363_var_Available) ) ].varIndex
                x310363_var_NPCList[ getn( x310363_var_NPCList) + 1] = { p = varIndex, varObj = -1, guid = -1, varCount = 0 }
                for j, item in x310363_var_Available do
                    if varIndex ~= item.varIndex then
                        empty[ getn( empty) + 1] = item
                    end
                end
                x310363_var_Created[ getn( x310363_var_Created) + 1] = varIndex
                x310363_var_Available = empty
                empty = {}
            end
            
            for varI, item in x310363_var_NPCList do
                local pos = x310363_var_PosList[ item.p]
                x310363_var_NPCList[ varI].varObj, x310363_var_NPCList[ varI].guid = CreateMonster( varMap, 4804, pos.varX, pos.z, 3, -1, -1, 145142, 5)
            end
            local strLog = format( "Script %d create 5 NPC. ", x310363_var_FileId)
            WriteLog( 1, strLog)
        else
            for varI, item in x310363_var_NPCList do
                if item.varObj == -1 then
                    if item.varCount == 5 then
                        
                        local varIndex = x310363_var_Available[ random( 1, getn( x310363_var_Available) ) ].varIndex
                        item.varObj, item.guid = CreateMonster( varMap, 4804, x310363_var_PosList[ varIndex].varX, x310363_var_PosList[ varIndex].z, 3, -1, -1, 145142, 5)
                        item.p = varIndex
                        item.varCount = 0
                        x310363_var_Created[ getn( x310363_var_Created) + 1] = varIndex
                        local strLog = format( "Script %d create a NPC. ", x310363_var_FileId)
                        WriteLog( 1, strLog)
                        
                        local tblTemp = {}
                        for j, iter in x310363_var_Available do
                            if varIndex ~= iter.varIndex then
                                tblTemp[ getn( tblTemp) + 1] = iter
                            end
                        end
                        x310363_var_Available = tblTemp
                    else
                        item.varCount = item.varCount + 1
                    end
                end
            end
        end

        if GetMinOfDay() < 1370 then
            SetSystemTimerTick( varMap, x310363_var_FileId, "DaguanyunTimer", varAct, 10000)
        end
    end
end

function x310363_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x310363_var_IsEnableId) <= 0 then
        return
    end

    
    local day, week = GetWeek()
    local minute = GetMinOfDay()
      if day == 0 or day == 6 then
          if minute >= 540 and minute <= 1439 then
              StartTalkTask( varMap)
                  TalkAppendString( varMap, "#Y福神赐福" )
                  TalkAppendString( varMap, "\t相见既有缘，有缘再相见。" )
                  TalkAppendButton( varMap, x310363_var_FileId, "我找到你了", 3, 1)
              StopTalkTask()
              DeliverTalkMenu( varMap, varPlayer, varTalknpc)
          end  
      end
end

function x310363_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    if GetGameOpenById( x310363_var_IsEnableId) <= 0 then
        return
    end
    
    if GetLevel( varMap, varPlayer) < x310363_var_MinLevel then
        Msg2Player( varMap, varPlayer, x310363_var_LessThanMinLevel, 8, 3)
        return 
    end
    local  WorldID = GetWorldID(varMap,varPlayer)
		local  guid,Level20 = GetToplistInfo(varMap,0,19)
	--	if Level20 <85 then
	--		 Msg2Player(varMap, varPlayer, format("很抱歉，等级排行榜上第20名玩家不足85级，请下次再来"), 0, 3)
	--		return
	--	end

    local day, week = GetWeek()
    local minute = GetMinOfDay()

    if day == 0 or day == 6 then
        if minute >= 540 and minute <= 1439 then
            for varI, item in x310363_var_NPCList do
                if item.varObj == varTalknpc then
                    DeleteMonster( varMap, varTalknpc)
                    item.varObj = -1
                    item.guid = -1
                    
                    local tblTemp = {}
                    for j, iter in x310363_var_Created do
                        if iter ~= item.p then
                            tblTemp[ getn( tblTemp) + 1] = iter
                        else
                            x310363_var_Available[ getn( x310363_var_Available) + 1] = x310363_var_PosList[ iter]
                        end
                    end
                    x310363_var_Created = tblTemp
                    GamePlayScriptLog(varMap, varPlayer, 1661)  
                    local xp = GetLevel( varMap, varPlayer) * 900

                    AddExp( varMap, varPlayer, xp)
                    Msg2Player(varMap, varPlayer, format("有缘与福神相见，获得%d点经验奖励",xp), 0, 2)
                    Msg2Player(varMap, varPlayer, format("有缘与福神相见，获得%d点经验奖励",xp), 0, 3)

                    local varHumanCount = GetScenePlayerCount( varMap)
                    for varI = 0, varHumanCount - 1 do
                        local varObj = GetScenePlayerObjId( varMap, varI)
                        if varObj ~= varPlayer then
                            local xp1 = GetLevel( varMap, varObj) * 180
                            AddExp( varMap, varObj, xp1)
                            Msg2Player(varMap, varObj, format("福神赐福，获得%d点经验奖励",xp1), 0, 2)
                            Msg2Player(varMap, varObj, format("福神赐福，获得%d点经验奖励",xp1), 0, 3)
                        end	
                    end
                end
            end
        end
    end
end




























