x305031_var_FileId = 305031

x305031_var_CreateTimeSet1        = { 15, 195, 375 }
x305031_var_CreateTimeSet2        = { 495, 555, 615, 675, 735, 795, 855, 915, 975, 1035, 1095, 1155, 1215, 1275, 1335, 1395 }

x305031_var_Timers                = { 
                                    { minofDay =   15,  timerId =  92 },
                                    { minofDay =  255,  timerId = 109 },
                                    { minofDay =  495,  timerId = 110 },
                                    { minofDay =  735,  timerId = 111 },
                                    { minofDay =  975,  timerId = 112 },
                                    { minofDay = 1215,  timerId = 113 },
}

x305031_var_BossTable             = { 
                                    { bossId = 9722, posX = 96, posZ = 82, ai = 0, aiscript = 255, objGuid = -1, campId = 21, liveTime = -1, bossName = "怒炎力士" }, 
                                    { bossId = 9568, posX = 96, posZ = 31, ai = 0, aiscript = 255, objGuid = -1, campId = 21, liveTime = -1, bossName = "怒炎力士" }, 
                                    { bossId = 9569, posX = 33, posZ = 35, ai = 0, aiscript = 255, objGuid = -1, campId = 21, liveTime = -1, bossName = "怒炎力士" }, 
                                    { bossId = 9570, posX = 29, posZ = 99, ai = 0, aiscript = 255, objGuid = -1, campId = 21, liveTime = -1, bossName = "怒炎力士" }, 
                                    { bossId = 9571, posX = 64, posZ = 52, ai = 0, aiscript = 255, objGuid = -1, campId = 21, liveTime = -1, bossName = "怒炎力士" }, 
                                    { bossId = 9563, posX = 53, posZ = 59, ai = 0, aiscript = 255, objGuid = -1, campId = 21, liveTime = -1, bossName = "怒炎力士" }, 
}

x305031_var_BossAlive                = 0

function x305031_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    if x305031_var_BossAlive == 0 then
        x305031_ProcMapInit( varMap, varAct)
    end
end


function x305031_ProcMapInit( varMap, varAct)
    local timeSet = {}
    local setCount = 0

    
    local curTime = GetMinOfDay()
    if curTime >= 0 and curTime < 480 then
        
        if curTime >= 375 then
            
            timeSet[ 1] = x305031_var_CreateTimeSet2[ 1]
            timeSet[ 2] = x305031_var_CreateTimeSet2[ 2]
            timeSet[ 3] = x305031_var_CreateTimeSet2[ 3]
            timeSet[ 4] = x305031_var_CreateTimeSet2[ 4]
        else
            for varI, item in x305031_var_CreateTimeSet1 do
                if curTime <= item then
                    timeSet[ 1 + setCount] = item
                    setCount = 1 + setCount
                end
            end
        end
    else
        
        if curTime >= 1395 then
            
            timeSet[ 1] = x305031_var_CreateTimeSet1[ 1]
            timeSet[ 2] = x305031_var_CreateTimeSet1[ 2]
            timeSet[ 3] = x305031_var_CreateTimeSet1[ 3]
        else
            for varI, item in x305031_var_CreateTimeSet2 do
                if curTime <= item then
                    timeSet[ 1 + setCount] = item
                    setCount = 1 + setCount
                    if setCount >= 4 then
                        break
                    end
                end
            end
        end
    end

    
    local createTime = timeSet[ random( 1, getn( timeSet) ) ]
    
    local interval = 0
    if createTime < curTime then
        interval = createTime + 1440 - curTime
    else
        interval = createTime - curTime
    end
    
    SetSystemTimerTick( varMap, x305031_var_FileId, "ProcCreateMonster", varAct, interval * 60000)
    
end

function x305031_ProcCreateMonster( varMap, varAct, varTime)
    
    local boss = x305031_var_BossTable[ 1]
    local varStr = ""

    boss = x305031_var_BossTable[ random( 1, 6) ]
    varStr = "怒炎力士出现在仙人谷一层！"
    CreateMonster( varMap, boss.bossId, boss.posX, boss.posZ, boss.ai, boss.aiscript, x305031_var_FileId, boss.objGuid, boss.campId, -1, 0, boss.bossName)
    x305031_var_BossAlive = 1
    

    
    LuaAllScenceM2Wrold( varMap, varStr, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold( varMap, varStr, 5, 1)
end


function x305031_ProcDie( varMap, varPlayer, varKiller)
    LuaAllScenceM2Wrold( varMap, "怒炎力士已被"..GetName( varMap, varKiller).."击败！", 5, 1)
    
    x305031_var_BossAlive = 0
    local minute = GetMinOfDay()
    local varIndex = 1
    for varI, item in x305031_var_Timers do
        if varI == getn( x305031_var_Timers) then
            varIndex = item.timerId
        else
            if minute >= item.minofDay and minute < x305031_var_Timers[ varI + 1].minofDay then
                varIndex = item.timerId
                break
            end
        end
    end
    x305031_ProcMapInit( varMap, varIndex)
end

