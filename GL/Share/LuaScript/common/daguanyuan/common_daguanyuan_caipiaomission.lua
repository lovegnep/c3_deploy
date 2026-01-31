
x310362_var_FileId              = 310362

x310362_var_LuckyTicket           = 12035040

x310362_var_TargetSceneId         = 40

x310362_var_IsEnableId            = 1043

function x310362_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
end

function x310362_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
end

function x310362_GiveItem( varMap, varPlayer)
    if HaveItemInBag( varMap, varPlayer, x310362_var_LuckyTicket) <= 0 then
        StartItemTask( varMap)	
        ItemAppendBind( varMap, x310362_var_LuckyTicket, 1)
        if StopItemTask( varMap, varPlayer) > 0 then
            DeliverItemListSendToPlayer( varMap, varPlayer)
        else	
            local varMsg = format( "#Y±³°ü¿Õ¼ä²»×ã£¬ÎÞ·¨µÃµ½#{_ITEM%d}£¡", x310362_var_LuckyTicket)			
            Msg2Player( varMap, varPlayer, varMsg, 8, 3)
            return
        end
    end

    local varBagIdx = FindFirstBagIndexOfItem( varMap, varPlayer, x310362_var_LuckyTicket)
    if varBagIdx >= 0 then
        local caipiao = GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO1)
        if caipiao < 0 then
            caipiao = 0
        end
        local day, week = GetWeek()
        if GetCountryParam( varMap, 2, CD_INDEX_RUOGUO_START_FLAG) ~= week then
            SetCountryParam( varMap, 2, CD_INDEX_RUOGUO_START_FLAG, week)
            SetCountryParam( varMap, 3, CD_INDEX_RUOGUO_START_FLAG, day)
            SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO1, -1)
            SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1, -1)
            SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1, -1)
            SetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2, -1)
            SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2, -1)
            SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2, -1)
            SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2, -1)
            caipiao = 0
        else
            if GetCountryParam( varMap, 3, CD_INDEX_RUOGUO_START_FLAG) ~= day then
                SetCountryParam( varMap, 3, CD_INDEX_RUOGUO_START_FLAG, day)
                SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO1, -1)
                SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1, -1)
                SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1, -1)
                SetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2, -1)
                SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2, -1)
                SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2, -1)
                SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2, -1)
                caipiao = 0
            end
        end
        GamePlayScriptLog(varMap, varPlayer, 1651)
        local first = floor( caipiao / 80)
        local second = mod( caipiao, 80)
        SetItemParam( varMap, varPlayer, varBagIdx, 8, 1, first)
        SetItemParam( varMap, varPlayer, varBagIdx, 10, 1, second)
        
        SetItemParam( varMap, varPlayer, varBagIdx, 4, 2, GetDayOfYear() )

        second = second + 1
        if second >= 80 then
            second = 0
            first = first + 1
        end
        SetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO1, first * 80 + second)
    end
end

function x310362_GetReward( varMap)
    local caipiao = GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO1)
    if caipiao <= 0 then
        return -1, -1, -1
    end
    local first = floor( caipiao / 80)
    local second = mod( caipiao, 80)
    if second > 0 then
        second = second - 1
    end
    local a = random( 0, first)
    local b = random( 0, second)

    return a * 80 + b, a, b
end

function x310362_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    if GetGameOpenById( x310362_var_IsEnableId) <= 0 then
        return
    end

    if varMap ~= x310362_var_TargetSceneId then
        return
    end

    local day, week = GetWeek()
    if day ~= 6 and day ~= 0 then
        return
    end

    SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO1, -1)
    SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1, -1)
    SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1, -1)
    SetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2, -1)
    SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2, -1)
    SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2, -1)
    SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2, -1)

    local curTime = GetMinOfDay()
    local r, a, b = x310362_GetReward( varMap)
    SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO1, r)
    if r ~= -1 then
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)
    end

    SetSystemTimerTick( varMap, x310362_var_FileId, "CheckTime", varAct, 30000)
end

function x310362_CheckTime( varMap, varAct, varTime)
    if GetGameOpenById( x310362_var_IsEnableId) <= 0 then
        return
    end

    local curTime = GetMinOfDay()
    local r, a, b = x310362_GetReward( varMap)
    if curTime == 750 and GetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1) == -1 then
        SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1, r)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)        
    elseif curTime == 870 and GetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1) == -1 then
        SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1, r)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)
    elseif curTime == 990 and GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2) == -1 then
        SetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2, r)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)
    elseif curTime == 1110 and GetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2) == -1 then
        SetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2, r)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)
    elseif curTime == 1230 and GetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2) == -1 then
        SetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2, r)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)
    elseif curTime == 1350 and GetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2) == -1 then
        SetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2, r)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 5, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d¡£", a, b), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "ÃÎÁÄÀÖÍ¸¿ª½±£¬ÖÐ½±ºÅÂëÊÇ%dºÍ%d", a, b), 2, 1)
    end

    if curTime < 1350 then
        SetSystemTimerTick( varMap, x310362_var_FileId, "CheckTime", varAct, 30000)
    end
end


