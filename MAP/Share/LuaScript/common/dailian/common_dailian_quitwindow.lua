x310405_var_FileId 			            = 310405

x310405_var_BuffTable         = {
                                { buffId = 7647, xp = 4,   credit = 0, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 45, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "经验" }, 
                                { buffId = 7648, xp = 8,   credit = 0, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 45, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "经验" }, 
                                { buffId = 7649, xp = 0,   credit = 4, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "声望" }, 
                                { buffId = 7650, xp = 0,   credit = 8, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "声望" }, 
                                { buffId = 7645, xp = 0,   credit = 0, mana = 8, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "威望" }, 
                                { buffId = 7667, xp = 8,   credit = 0, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 45, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "经验" }, 
                                { buffId = 7666, xp = 0,   credit = 8, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "声望" }, 
                                { buffId = 7665, xp = 0,   credit = 0, mana = 8, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "威望" }, 
                                { buffId = 7668, xp = 4,   credit = 0, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 45, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "经验" }, 
                                { buffId = 7669, xp = 0,   credit = 4, mana = 0, coffs = { { xpCoff = 12.5, creCoff = 1, manaCoff = 1, minLevel = 40, maxLevel = 70 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 70, maxLevel = 80 },
                                                                                             { xpCoff = 22.5, creCoff = 1, manaCoff = 1, minLevel = 80, maxLevel = 1000 },
                                                                                           }, varName = "声望" }, 
}


x310405_var_Type_Train                    = 0

x310405_var_Type_Management               = 1

x310405_var_Type_Precontract              = 2

x310405_var_CloseTime                     = 540

x310405_var_OpenTime                      = 1380

x310405_var_strNotEnoughMoney = "您身上的现银（银卡）不足，不能使用此模块"

x310405_var_MaxTrainTime   		        = 10080

function x310405_ProcOfflineRequest( varMap, varPlayer, reqType)
    if reqType == x310405_var_Type_Train then
        x310405_Train( varMap, varPlayer)
    elseif reqType == x310405_var_Type_Management then
        x310405_Management( varMap, varPlayer)
    elseif reqType == x310405_var_Type_Precontract then
        x310405_Precontract( varMap, varPlayer)
    else
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID, 0)
    end
end

function x310405_Train( varMap, varPlayer)
    if GetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID) == 1 then
        return
    end

    if GetLevel( varMap, varPlayer) < 40 then
        Msg2Player( varMap, varPlayer, "您的等级不足#R40级#o，无法离线代练", 8, 3)
        return
    end

	local selfTrainTime = GetPlayerGameData( varMap, varPlayer, MD_OFFLINE_TRAIN_MIN[1], MD_OFFLINE_TRAIN_MIN[2], MD_OFFLINE_TRAIN_MIN[3] )
    if selfTrainTime >= x310405_var_MaxTrainTime then
        Msg2Player( varMap, varPlayer, "您的累积时间已到达上限，请领取离线经验后再开启离线代练", 8, 3)
        return
    end

    
    SetPlayerGameData( varMap, varPlayer, MD_OFFLINE_TRAIN_FLAG[1], MD_OFFLINE_TRAIN_FLAG[2], MD_OFFLINE_TRAIN_FLAG[3], 1)
    KickPlayer( varMap, varPlayer, 1)

    
    WriteLog( 1, format( "OfflineTrain ProcEventEntry Offline OK: Name(%s) GUID(%d) by QuitWindow. ", GetName( varMap, varPlayer), GetGUID( varMap, varPlayer) ) )

    SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID, 1)
end

function x310405_Management( varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < 40 then
        Msg2Player( varMap, varPlayer, "#R40#cffcc00级以下不能使用此模块", 8, 3)
        return
    end

    if GetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID) == 1 then
        return
    end

    
    local minute = GetMinOfDay()
    if minute >= x310405_var_CloseTime and minute < x310405_var_OpenTime then
        Msg2Player( varMap, varPlayer, "很抱歉，美丽会关闭期间不接受托管", 8, 3)
        return
    end

    
    if varMap ~= 14 then
        Msg2Player( varMap, varPlayer, "很抱歉，离线托管只能在美丽会进行", 8, 3)
        return
    end

    if minute < x310405_var_CloseTime and minute >= x310405_var_CloseTime - 1 then
        Msg2Player( varMap, varPlayer, "美丽会关闭前1分钟不能进行离线托管", 8, 3)
        return
    end

    
	local money = varLevel * 200
    if GetGoldMode( varMap, varPlayer ) == 1 then
        if CostMoney( varMap, varPlayer, 0, money, 306) ~= 1 then
            if CostMoney(varMap, varPlayer, 1, money, 306) ~= 1 then
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney.."。", 8, 2)
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney, 8, 3)
                return
            end
        end
    else
        if CostMoney( varMap, varPlayer, 1, money, 306) ~= 1 then
            if CostMoney(varMap, varPlayer, 0, money, 306) ~= 1 then
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney.."。", 8, 2)
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney, 8, 3)
                return
            end
        end
    end

    
    local strLog = format( "WTL: Player %s use offline management with sw(%d), ww(%d), xp=", GetName( varMap, varPlayer), GetShengWang( varMap, varPlayer), GetPlayerGoodBadValue( varMap, varPlayer) )
    strLog = strLog..GetExp( varMap, varPlayer)..". By QuitWindow. "
    WriteLog( 1, strLog)

    for varI, item in x310405_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, item.buffId)
            if amountTime > 0 then
                local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, item.buffId)
                strLog = format( "WTL: With Buff %d remain buff time %d second. ", item.buffId, floor( remainTime / 1000) )
                WriteLog( 1, strLog)
            end
        end
    end
    if IsHaveSpecificImpact( varMap, varPlayer, x310405_var_BaseBuffId) == 1 then
        local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, x310405_var_BaseBuffId)
        if amountTime > 0 then
            local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, x310405_var_BaseBuffId)
            strLog = format( "WTL: With Base Buff remain buff time %d second. ", floor( remainTime / 1000) )
            WriteLog( 1, strLog)
        end
    end

    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_OFFLINE_DATE[ 1], MD_WUTING_OFFLINE_DATE[ 2], MD_WUTING_OFFLINE_DATE[ 3], GetDayOfYear() )
    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_OFFLINE_TIME[ 1], MD_WUTING_OFFLINE_TIME[ 2], MD_WUTING_OFFLINE_TIME[ 3], GetMinOfDay() )
    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_OFFLINE_FLAG[ 1], MD_WUTING_OFFLINE_FLAG[ 2], MD_WUTING_OFFLINE_FLAG[ 3], 1)
    
    KickPlayer( varMap, varPlayer, 1)
    
    SetKickTime( varMap, varPlayer, 11000)

    SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID, 1)
end

function x310405_Precontract( varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < 40 then
        Msg2Player( varMap, varPlayer, "#R40ffcc00级以下不能使用此模块", 8, 3)
        return
    end

    if GetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID) == 1 then
        return
    end

    local minute = GetMinOfDay()
    if minute < x310405_var_CloseTime or minute >= x310405_var_OpenTime then
        Msg2Player( varMap, varPlayer, "很抱歉，美丽会开放期间不接受预约", 8, 3)
        return
    end

    local haveBuff = 0
    local varIndex = 1
    for varI, item in x310405_var_BuffTable[ 1].coffs do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varIndex = varI
        end
    end

    
    for varI, item in x310405_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            haveBuff = 1
            break
        end
    end
    if haveBuff == 0 then
        Msg2Player( varMap, varPlayer, "很抱歉，您身上必须有酒或雪茄才能预约托管", 8, 3)
        return
    end

    
	local money = varLevel * 200
    if GetGoldMode( varMap, varPlayer ) == 1 then
        if CostMoney( varMap, varPlayer, 0, money,306) ~= 1 then
            if CostMoney(varMap, varPlayer, 1, money,306) ~= 1 then
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney.."。", 8, 2)
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney, 8, 3)
                return
            end
        end
    else
        if CostMoney( varMap, varPlayer, 1, money,306) ~= 1 then
            if CostMoney(varMap, varPlayer, 0, money,306) ~= 1 then
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney.."。", 8, 2)
                Msg2Player( varMap, varPlayer, x310405_var_strNotEnoughMoney, 8, 3)
                return
            end
        end
    end

    
    local strLog = format( "WTL: Player %s use precontract management with sw(%d), ww(%d), xp=", GetName( varMap, varPlayer), GetShengWang( varMap, varPlayer), GetPlayerGoodBadValue( varMap, varPlayer) )
    strLog = strLog..GetExp( varMap, varPlayer)..". By QuitWindow. "
    WriteLog( 1, strLog)

    for varI, item in x310405_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, item.buffId)
            if amountTime > 0 then
                local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, item.buffId)
                strLog = format( "WTL: With Buff %d remain buff time %d second. ", item.buffId, floor( remainTime / 1000) )
                WriteLog( 1, strLog)
            end
        end
    end

    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_DATE[ 1], MD_WUTING_PRECONTRACT_DATE[ 2], MD_WUTING_PRECONTRACT_DATE[ 3], GetDayOfYear() )
    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_TIME[ 1], MD_WUTING_PRECONTRACT_TIME[ 2], MD_WUTING_PRECONTRACT_TIME[ 3], GetMinOfDay() )
    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_FLAG[ 1], MD_WUTING_PRECONTRACT_FLAG[ 2], MD_WUTING_PRECONTRACT_FLAG[ 3], 1)
    
    KickPlayer( varMap, varPlayer, 1)
    
    SetKickTime( varMap, varPlayer, 11000)

    SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID, 1)
end


