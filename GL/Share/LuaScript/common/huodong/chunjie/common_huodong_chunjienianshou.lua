


x310801_var_FileId = 310801						

function x310801_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    
    if varMap ~= 88 and varMap ~= 188 and varMap ~= 288 and varMap ~= 388 then
        return
    end

    local day = GetDayOfYear()
    local rx = random( 3, 5)
    local rz = random( 3, 5)
    
    if day >= 44 and day <= 52  then
        CreateMonster( varMap, 9752, 84 + rx, 164 + rz, 1, 1006, x310801_var_FileId, -1, 21, 3600000, 0)
        LuaAllScenceM2Wrold( varMap, "“年”突然出现在铁骑牧场，大肆掠夺钱物，破坏春节喜庆。望各国勇士勇于前往保护家园！！击败年兽可获得大量宝物哦～！", CHAT_PLANE_SCROLL, 1)
    end
end

function x310801_ProcDie( varMap, varPlayer, varKiller)
    LuaAllScenceM2Wrold( varMap, "经过各国勇士的奋勇抵抗，“年”已被消灭！", CHAT_PLANE_SCROLL, 1)
end

