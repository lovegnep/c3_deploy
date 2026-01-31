x305030_var_FileId = 305030

x305030_var_CreateTimeSet1        = { 15, 195, 375 }
x305030_var_CreateTimeSet2        = { 495, 555, 615, 675, 735, 795, 855, 915, 975, 1035, 1095, 1155, 1215, 1275, 1335, 1395 }

x305030_var_Timers                = { 0, 240, 480, 720, 960, 1200 }

x305030_var_BossTable             = { 
                                    { bossId = 9721, posX =  84, posZ =  46, ai = 0, aiscript = 256, objGuid = -1, campId = 21, liveTime = -1, bossName = "¾ç¶¾ÖëÍõ" }, 
                                    { bossId = 9564, posX =  87, posZ = 138, ai = 0, aiscript = 256, objGuid = -1, campId = 21, liveTime = -1, bossName = "¾ç¶¾ÖëÍõ" }, 
                                    { bossId = 9565, posX =  78, posZ = 216, ai = 0, aiscript = 256, objGuid = -1, campId = 21, liveTime = -1, bossName = "¾ç¶¾ÖëÍõ" }, 
                                    { bossId = 9566, posX = 137, posZ = 198, ai = 0, aiscript = 256, objGuid = -1, campId = 21, liveTime = -1, bossName = "¾ç¶¾ÖëÍõ" }, 
                                    { bossId = 9567, posX = 199, posZ = 141, ai = 0, aiscript = 256, objGuid = -1, campId = 21, liveTime = -1, bossName = "¾ç¶¾ÖëÍõ" }, 
                                    { bossId = 9577, posX = 180, posZ =  64, ai = 0, aiscript = 256, objGuid = -1, campId = 21, liveTime = -1, bossName = "¾ç¶¾ÖëÍõ" }, 
}
x305030_var_LiveTime              = 0
x305030_var_BossAlive             = 0

function x305030_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    if x305030_var_BossAlive == 0 then
        x305030_ProcMapInit( varMap, varAct)
    end
end


function x305030_ProcMapInit( varMap, varAct)
    local timeSet = {}
    local setCount = 0

    
    local curTime = GetMinOfDay()
    if curTime >= 0 and curTime < 480 then
        
        if curTime >= 375 then
            
            timeSet[ 1] = x305030_var_CreateTimeSet2[ 1]
            timeSet[ 2] = x305030_var_CreateTimeSet2[ 2]
            timeSet[ 3] = x305030_var_CreateTimeSet2[ 3]
            timeSet[ 4] = x305030_var_CreateTimeSet2[ 4]
        else
            for varI, item in x305030_var_CreateTimeSet1 do
                if curTime <= item then
                    timeSet[ 1 + setCount] = item
                    setCount = 1 + setCount
                end
            end
        end
    else
        
        if curTime >= 1395 then
            
            timeSet[ 1] = x305030_var_CreateTimeSet1[ 1]
            timeSet[ 2] = x305030_var_CreateTimeSet1[ 2]
            timeSet[ 3] = x305030_var_CreateTimeSet1[ 3]
        else
            for varI, item in x305030_var_CreateTimeSet2 do
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
    
    SetSystemTimerTick( varMap, x305030_var_FileId, "ProcCreateMonster", varAct, interval * 60000)
    
end

function x305030_ProcCreateMonster( varMap, varAct, varTime)
    
    local boss = x305030_var_BossTable[ 1]
    local varStr = ""

    local countryName = ""
    if varMap >= 50 and varMap < 150 then
        countryName = "Â¥À¼"
    elseif varMap >= 150 and varMap < 250 then
        countryName = "ÌìÉ½"
    elseif varMap >= 250 and varMap < 350 then
        countryName = "À¥ÂØ"
    elseif varMap >= 350 and varMap < 450 then
        countryName = "¶Ø»Í"
    end
    boss = x305030_var_BossTable[ random( 1, 6) ]
    varStr = "¾ç¶¾ÖëÍõ³öÏÖÔÚ"..countryName.."ÎÚËï¹ÅµÀ£¡"

    CreateMonster( varMap, boss.bossId, boss.posX, boss.posZ, boss.ai, boss.aiscript, x305030_var_FileId, boss.objGuid, boss.campId, -1, 0, boss.bossName)
    x305030_var_BossAlive = 1
    
    

    
    LuaAllScenceM2Wrold( varMap, varStr, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold( varMap, varStr, 5, 1)
end


function x305030_ProcDie( varMap, varPlayer, varKiller)
    local countryName = ""
    if varMap >= 50 and varMap < 150 then
        countryName = "Â¥À¼"
    elseif varMap >= 150 and varMap < 250 then
        countryName = "ÌìÉ½"
    elseif varMap >= 250 and varMap < 350 then
        countryName = "À¥ÂØ"
    elseif varMap >= 350 and varMap < 450 then
        countryName = "¶Ø»Í"
    end
    LuaAllScenceM2Wrold( varMap, countryName.."ÎÚËï¹ÅµÀµÄ¾ç¶¾ÖëÍõÒÑ±»"..GetName( varMap, varKiller).."»÷°Ü£¡", 5, 1)
    x305030_var_BossAlive = 0
end

