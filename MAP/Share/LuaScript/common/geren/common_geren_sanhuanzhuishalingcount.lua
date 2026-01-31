x270355_var_FileId 	  = 270355

function x270355_CountCheck( varMap, varPlayer)
    
    
    local week = GetWeekIndex()
    local varToday = GetDayOfYear()
    
    if week == GetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_DATE[1], MD_FUBEN_QIULONGDAO_DATE[2], MD_FUBEN_QIULONGDAO_DATE[3] ) then
        if GetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3] ) >= 21 then
            return 0, "你本周已经不能再领取此任务了"
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_DATE[1], MD_FUBEN_QIULONGDAO_DATE[2], MD_FUBEN_QIULONGDAO_DATE[3], week)
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAY[1], MD_FUBEN_QIULONGDAO_TODAY[2], MD_FUBEN_QIULONGDAO_TODAY[3], varToday)
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3], 0)
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3], 0)
        x270355_SetTimes( varMap, varPlayer, 0)
    end

    
    if varToday == GetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAY[1], MD_FUBEN_QIULONGDAO_TODAY[2], MD_FUBEN_QIULONGDAO_TODAY[3] ) then
    	local varDaycount = GetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3] )
    	
    	local Times = x270355_GetTimes( varMap, varPlayer)
    	
    	if (varDaycount == 6 and Times == 0 ) or (varDaycount >= 6 and Times >= 10 ) or (varDaycount > 6) then
	        return 0, "你今天已经不能再领取此任务了"
	    end
    else
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAY[1], MD_FUBEN_QIULONGDAO_TODAY[2], MD_FUBEN_QIULONGDAO_TODAY[3], varToday)
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3], 0)
    end

    return 1
end

function x270355_UpdateCount( varMap, varPlayer, varCircle)
    local varWeekCount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3] )
    local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3] )
    
    if x270355_GetTimes( varMap, varPlayer) >= 10 then
        x270355_SetTimes( varMap, varPlayer, 0)
    end
    
    
    
    if x270355_GetTimes( varMap, varPlayer) == 0 then
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3], varWeekCount + 1)
        SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3], varDaycount + 1)
    end
    
    
    if x270355_GetTimes( varMap, varPlayer) + varCircle > 10 then
        if varWeekCount < 21 then
        	SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_DAYCOUNT[1], MD_FUBEN_QIULONGDAO_DAYCOUNT[2], MD_FUBEN_QIULONGDAO_DAYCOUNT[3], varWeekCount + 1)
        end
        if varDaycount < 6 then
        	SetPlayerGameData( varMap, varPlayer, MD_FUBEN_QIULONGDAO_TODAYCOUNT[1], MD_FUBEN_QIULONGDAO_TODAYCOUNT[2], MD_FUBEN_QIULONGDAO_TODAYCOUNT[3], varDaycount + 1)
        end
        x270355_SetTimes( varMap, varPlayer, x270355_GetTimes( varMap, varPlayer) + varCircle - 10)
    else








        x270355_SetTimes( varMap, varPlayer, x270355_GetTimes( varMap, varPlayer) + varCircle)
    end
end

function x270355_GetTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHUISHA_CIRCLE[ 1], MD_ZHUISHA_CIRCLE[ 2], MD_ZHUISHA_CIRCLE[ 3] )
end

function x270355_SetTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHUISHA_CIRCLE[ 1], MD_ZHUISHA_CIRCLE[ 2], MD_ZHUISHA_CIRCLE[ 3], value)
end

