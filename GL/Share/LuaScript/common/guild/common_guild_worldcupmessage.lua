--DECLARE_QUEST_INFO_START-- 
x300837_var_FileId 					= 	300837
--DECLARE_QUEST_INFO_STOP--


                                        
                                        
                                        
                                        
                                        
                                        

x300837_var_BroadCastTable            = {
                                        { minute = 930, clocktime = 1530, message = "世界杯战场将于16：00开启，请参赛帮会做好准备！" }, 
                                        { minute = 955, clocktime = 1555, message = "世界杯战场将在5分钟后开始！" }, 
                                        { minute = 960, clocktime = 1600, message = "世界杯战场火热进行中" }, 
                                        { minute = 975, clocktime = 1615, message = "世界杯战场火热进行中" }, 
                                        { minute = 985, clocktime = 1625, message = "世界杯战场结束还有5分钟！" }, 
                                        { minute = 990, clocktime = 1630, message = "世界杯战场已经结束！" }, 
}

function x300837_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    
    local week, YearIndex = GetWeek()
    if week ~= 0 then
        return
    end

    
    local varState = GetWorldCupState( varMap)
    if varState == STATE_GUILD_WORLDCUP_DISABLESIGNUP then
        return
    end

    local switch = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_SWITCH)
    
    if switch == 1 then
        SetSystemTimerTick( varMap, 300837, "BroadCast", varAct, 60000)
    end
end

function x300837_BroadCast( varMap, varAct, varTime)
    local curTime = GetMinOfDay()

    local broadcast = 0
    for varI, item in x300837_var_BroadCastTable do
        if curTime == item.minute then
            broadcast = varI
            break
        end
    end

    if broadcast ~= 0 then
        LuaAllScenceM2Wrold( varMap, x300837_var_BroadCastTable[ broadcast].message, CHAT_PLANE_SCROLL, 1)
        LuaAllScenceM2Wrold( varMap, x300837_var_BroadCastTable[ broadcast].message, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold( varMap, x300837_var_BroadCastTable[ broadcast].message, CHAT_MAIN_RIGHTDOWN, 1)
        if broadcast == getn( x300837_var_BroadCastTable) then
            
            return
        end
    end
    SetSystemTimerTick( varMap, 300837, "BroadCast", varAct, 60000)
end

