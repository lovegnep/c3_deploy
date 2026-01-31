x300179_var_FileId 			= 300179
x300179_var_Name              = "【美】大都美丽会"

x300179_var_BaseBuffId        = 7646
x300179_var_BuffTable         = {
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

x300179_var_strNotEnoughMoney = "您身上的现银（银卡）不足，不能使用预约托管模块"

x300179_var_Money             = 2000

x300179_var_CloseTime         = 540

x300179_var_OpenTime          = 1380

x300179_var_AdditionalLevel   = 90

function x300179_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    
    if GetLevel( varMap, varPlayer) < 40 then
        return
    end
    local minute = GetMinOfDay()
    if minute >= x300179_var_CloseTime and minute < x300179_var_OpenTime then
        TalkAppendButton( varMap, x300179_var_FileId, "【美丽会】预约托管", 3)
    end
    
    
    
end


function x300179_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    local haveBuff = 0
    local varLevel = GetLevel( varMap, varPlayer)
    local varIndex = 1
    for varI, item in x300179_var_BuffTable[ 1].coffs do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varIndex = varI
        end
    end

    
    for varI, item in x300179_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            haveBuff = 1
            break
        end
    end
    if haveBuff == 0 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300179_var_Name)
            TalkAppendString( varMap, "\t很抱歉，您身上必须有酒或雪茄才能预约托管。" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x300179_var_FileId, -1)
        return
    end

    local times = 0
    local xpAddition = 1
    if varLevel >= x300179_var_AdditionalLevel then
        xpAddition = 1.3
    end
    StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300179_var_Name)
    TalkAppendString( varMap, "\t欢迎您使用预约托管服务，从本次美丽会开始到关闭这10个小时之间最多可得的奖励如下：#r" )
    for varI, item in x300179_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, item.buffId)
            if amountTime > 0 then
                local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, item.buffId)
                times = remainTime / 10000
                local reward = item.xp * item.coffs[ varIndex].xpCoff * varLevel * xpAddition + item.credit + item.mana
                if reward > 0 then
                    TalkAppendString( varMap, format( "\t#Y%s：%d#r", item.varName, reward * times) )
                end
            end
        end
    end
	local ding=0
	local liang=0
	local wen=0
	local varLevel = GetLevel(varMap, varPlayer)
	local money = floor( varLevel*200)
	ding = floor( money / (1000*1000) )
	liang = floor( mod(money,1000*1000)/ 1000 )
	wen = mod(money,1000)
	local varReadme = format("\t#G当您选择使用#R预约托管#G模块，您需要花费#R%d锭%d两%d文#W现银（银卡）", ding,liang,wen);
	TalkAppendString( varMap,varReadme )
    TalkAppendString( varMap, "\t#G在美丽会开启前，如果您选择确定，您将会预约今天的美丽会收益，并立即离线。您的预约将在#R当天23：00开始生效#G，并且于#R次日9：00预约结束#G。在此期间，您可获得最多10个小时的收益，所以您必须在23：00后再次上线才能获得收益，如果您身上的跳舞奖励状态时间大于美丽会已开放时间，我们将会把剩余的跳舞奖励时间返还给您，您需要现在预约托管吗？#r" )
	TalkAppendString( varMap, "\t#G小提示：您离线后再上线时间必须在#R本次美丽会开启#G后，才能获得奖励。并且离线后再次上线时最好在#R次日9：00后#G，就可以获得最理想的收益。" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300179_var_FileId, -1)
end


function x300179_ProcMapPlayerNewConnectEnter( varMap, varPlayer)
    if IsInitBecauseReconnect( varMap, varPlayer) == 1 then
        if GetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_FLAG[ 1], MD_WUTING_PRECONTRACT_FLAG[ 2], MD_WUTING_PRECONTRACT_FLAG[ 3] ) == 1 then
            
            KickPlayer( varMap, varPlayer, 0)
        end
        return
    end

    if GetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_FLAG[ 1], MD_WUTING_PRECONTRACT_FLAG[ 2], MD_WUTING_PRECONTRACT_FLAG[ 3] ) == 0 then
        return
    end

    
    

    
    local olDate = GetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_DATE[ 1], MD_WUTING_PRECONTRACT_DATE[ 2], MD_WUTING_PRECONTRACT_DATE[ 3] )
    local olTime = GetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_TIME[ 1], MD_WUTING_PRECONTRACT_TIME[ 2], MD_WUTING_PRECONTRACT_TIME[ 3] )

    local varLevel = GetLevel( varMap, varPlayer)
    local xpAddition = 1
    if varLevel >= x300179_var_AdditionalLevel then
        xpAddition = 1.3
    end
    local lvCoff = 12.5
    if varLevel >= 70 then
        lvCoff = 22.5
    end

    local varIndex = 1
    for varI, item in x300179_var_BuffTable[ 1].coffs do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varIndex = varI
        end
    end

    
    local times = 3600
    local onDate = GetDayOfYear()
    local onTime = GetMinOfDay()
    
    if olDate == 500 then olDate = 0 end
    if onDate == 500 then onDate = 0 end
    
    if onDate == olDate then
        
        if onTime >= x300179_var_OpenTime then
            
            times = ( onTime - x300179_var_OpenTime) * 6
        else
            
            times = 0
        end
    else
        
        local days = onDate - olDate
        if olDate > onDate then
            
            local varY,m,d = GetYearMonthDay()
            if mod( varY, 4) == 0 then
                
                days = onDate + 366 - olDate
            else
                days = onDate + 365 - olDate
            end
        end
        if days == 1 and onTime < olTime then
            
            if onTime < x300179_var_CloseTime then
                
                times = 60 + onTime
                times = times * 6
            end
        end
    end

    
    local strLog = format( "WTL: Player %s who has precontract management enter game with %d offline times. ", GetName( varMap, varPlayer), times)
    WriteLog( 1, strLog)

    if times == 0 then
        
        SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_FLAG[ 1], MD_WUTING_PRECONTRACT_FLAG[ 2], MD_WUTING_PRECONTRACT_FLAG[ 3], 0)

        return
    end

    local xpAmount = 0
    local creditAmount = 0
    local manaAmount = 0
    local temp = GetImpactContinuanceByDataIndex( varMap, varPlayer, x300179_var_BaseBuffId)
    local baseRemain = 0
    if temp > 0 then
        baseRemain = temp - GetImpactContinuanceElapsed( varMap, varPlayer, x300179_var_BaseBuffId)
        baseRemain = baseRemain / 10000
    end
    for varI, item in x300179_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, item.buffId)
            if amountTime > 0 then
                local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, item.buffId)
                local buffTimes = remainTime / 10000
                local strLog = format( "WTL: Player %s remain buff( varId: %d, times: %d) when connection. ", GetName( varMap, varPlayer), item.buffId, buffTimes)
                WriteLog( 1, strLog)
                
                local reward = item.xp * item.coffs[ varIndex].xpCoff * varLevel * xpAddition + item.credit + item.mana
                local finalReward = 0
                local remainBuff = 0
                if buffTimes > times then   
                    
                    finalReward = times * reward
                    
                    remainBuff = ( buffTimes - times) * 10000
                else    
                    
                    finalReward = buffTimes * reward
                end
                if item.xp ~= 0 then
                    AddExp( varMap, varPlayer, finalReward)
                    WriteLog( 1, format( "WTL: Add %d varExp with buff %d. ", finalReward, item.buffId) )
                    xpAmount = xpAmount + finalReward
                elseif item.credit ~= 0 then
                    SetShengWang( varMap, varPlayer, GetShengWang( varMap, varPlayer) + finalReward)
                    WriteLog( 1, format( "WTL: Add %d ShengWang. ", finalReward) )
                    creditAmount = creditAmount + finalReward
                elseif item.mana ~= 0 then
                    SetPlayerGoodBadValue( varMap, varPlayer, GetPlayerGoodBadValue( varMap, varPlayer) + finalReward)
                    WriteLog( 1, format( "WTL: Add %d GoodBad. ", finalReward) )
                    manaAmount = manaAmount + finalReward
                end
                
                SetImpactContinuanceByDataIndex( varMap, varPlayer, item.buffId, remainBuff)
                WriteLog( 1, format( "WTL: Refresh Buff(varId:%d) time is %d ms. ", item.buffId, remainBuff) )
                ResetImpactContinuanceElapsed( varMap, varPlayer, item.buffId)
                RefreshImpactByDataIndex( varMap, varPlayer, item.buffId)
            end
        end
    end

    
    local strReward = "您在预约托管时间内获得的奖励如下：#G#r"
    local strDialog = "\t#G感谢您使用本店的预约托管服务，在您预约的这段时间您总共获得的奖励如下：#r #r"
    if xpAmount > 0 then
        strReward = strReward..format( "经验：%d点#r", xpAmount)
        strDialog = strDialog..format( "经验：%d点#r #r", xpAmount)
    end
    if creditAmount > 0 then
        strReward = strReward..format( "声望：%d点#r", creditAmount)
        strDialog = strDialog..format( "声望：%d点#r #r", creditAmount)
    end
    if manaAmount > 0 then
        strReward = strReward..format( "威望：%d点#r", manaAmount)
        strDialog = strDialog..format( "威望：%d点#r #r", manaAmount)
    end
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y".."【美丽会】预约托管" )
        TalkAppendString( varMap, strDialog)
    StopTalkTask( varMap)
    DeliverTalkMenu( varMap, varPlayer, 0)
    LuaScenceM2Player( varMap, varPlayer, strReward, GetName( varMap, varPlayer), 1, 1)

    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_FLAG[ 1], MD_WUTING_PRECONTRACT_FLAG[ 2], MD_WUTING_PRECONTRACT_FLAG[ 3], 0)
end


function x300179_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local minute = GetMinOfDay()
    if minute < x300179_var_CloseTime or minute >= x300179_var_OpenTime then
        Msg2Player( varMap, varPlayer, "很抱歉，美丽会开放期间我们不接受预约托管", 8, 3)
        return
    end

    
	local varLevel = GetLevel(varMap, varPlayer)
	local money = varLevel*200
    if GetGoldMode( varMap, varPlayer ) == 1 then
        if CostMoney( varMap, varPlayer, 0, money,306) ~= 1 then
            if CostMoney(varMap, varPlayer, 1, money,306) ~= 1 then
                Msg2Player( varMap, varPlayer, x300179_var_strNotEnoughMoney.."。", 8, 2)
                Msg2Player( varMap, varPlayer, x300179_var_strNotEnoughMoney, 8, 3)
                return
            end
        end
    else
        if CostMoney( varMap, varPlayer, 1, money,306) ~= 1 then
            if CostMoney(varMap, varPlayer, 0, money,306) ~= 1 then
                Msg2Player( varMap, varPlayer, x300179_var_strNotEnoughMoney.."。", 8, 2)
                Msg2Player( varMap, varPlayer, x300179_var_strNotEnoughMoney, 8, 3)
                return
            end
        end
    end

    
    local strLog = format( "WTL: Player %s use precontract management with sw(%d), ww(%d), xp=", GetName( varMap, varPlayer), GetShengWang( varMap, varPlayer), GetPlayerGoodBadValue( varMap, varPlayer) )
    strLog = strLog..GetExp( varMap, varPlayer)
    WriteLog( 1, strLog)

		
		LuaCallNoclosure( 203830, "Finishlixian", varMap, varPlayer)

    for varI, item in x300179_var_BuffTable do
        if IsHaveSpecificImpact( varMap, varPlayer, item.buffId) == 1 then
            local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, item.buffId)
            if amountTime > 0 then
                local remainTime = amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, item.buffId)
                strLog = format( "WTL: With Buff %d remain buff time %d second. ", item.buffId, floor( remainTime / 1000) )
                WriteLog( 1, strLog)
            end
        end
    end

    --春节补偿（预约托管）数值计算    
    local IsSameTime = LuaCallNoclosure( 300160, "IsSameTime", varMap, varPlayer)
	local wutingnum = x300179_GetMD( varMap, varPlayer, MD_2011CJBC_WUTING)
	local freenum = x300179_GetMD( varMap, varPlayer, MD_2011CJBC_WUTINGFREE)	
	local daytime = GetDayOfYear()
	local lastday = GetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_DATE[ 1], MD_WUTING_PRECONTRACT_DATE[ 2], MD_WUTING_PRECONTRACT_DATE[ 3])
	if daytime >= 24 and daytime < 45 and wutingnum < 22 then
		if IsSameTime == 0 and lastday ~= daytime then			
			x300179_SetMD( varMap, varPlayer, MD_2011CJBC_WUTING, wutingnum + 1)
			x300179_SetMD( varMap, varPlayer, MD_2011CJBC_WUTINGFREE, freenum + 1)						
		end
	end	
	    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_DATE[ 1], MD_WUTING_PRECONTRACT_DATE[ 2], MD_WUTING_PRECONTRACT_DATE[ 3], GetDayOfYear() )
    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_TIME[ 1], MD_WUTING_PRECONTRACT_TIME[ 2], MD_WUTING_PRECONTRACT_TIME[ 3], GetMinOfDay() )
    
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_PRECONTRACT_FLAG[ 1], MD_WUTING_PRECONTRACT_FLAG[ 2], MD_WUTING_PRECONTRACT_FLAG[ 3], 1)
    
    KickPlayer( varMap, varPlayer, 1)
    
    SetKickTime( varMap, varPlayer, 11000)

    SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID, 1)
end

function x300179_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300179_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
