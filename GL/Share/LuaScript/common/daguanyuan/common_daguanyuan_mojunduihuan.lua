
x310392_var_FileId              = 310392

x310392_var_QuestId             = 9060

x310392_var_QuestName           = "金龙印兑换"

x310392_var_ItemID                = 11000597

x310392_var_CostMoney             = 3000

function x310392_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x310392_var_FileId, x310392_var_QuestName, 3, 1)
end

function x310392_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    if idExt == 1 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x310392_var_QuestName)
            TalkAppendString( varMap, format( "\t@item_%d#W是时装纹龙的必备道具。只要本周进行过天降魔君，就能在我这里兑换一个@item_%d。\n\t#W是否花费#R3#W两金卡/现金换取一个@item_%d#W？", x310392_var_ItemID, x310392_var_ItemID, x310392_var_ItemID) )
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310392_var_FileId, -1)
    end
end

function x310392_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local day, week = GetWeek()
    local weekIndex = GetWeekIndex()
    if GetDayOfYear() ~= x310392_GetMD( varMap, varPlayer, MD_TJMJ_DATE) then
        Msg2Player( varMap, varPlayer, "你今天还没有参加天降魔君活动，不能兑换", 8, 3)
        return 0
    else
        if x310392_GetMD( varMap, varPlayer, MD_MOJUN_WEEK) == weekIndex and x310392_GetMD( varMap, varPlayer, MD_MOJUN_DUIHUAN) == 1 then
            Msg2Player( varMap, varPlayer, "你本周已经兑换过一次，不能再次兑换", 8, 3)
            return 0
        end

        if x310392_GetMD( varMap, varPlayer, MD_TJMJ_TIMES) == 0 then
            Msg2Player( varMap, varPlayer, "你今天还没有参加天降魔君活动，不能兑换", 8, 3)
            return 0
        end
    end

    StartItemTask( varMap)
    ItemAppendBind( varMap, x310392_var_ItemID, 1)
    if StopItemTask( varMap, varPlayer) == 0 then
        Msg2Player( varMap, varPlayer, "背包空间不足，无法兑换", 8, 3)
        return 0
    end

    if GetGoldMode( varMap, varPlayer) == 1 then
        if CostMoney( varMap, varPlayer, 2, x310392_var_CostMoney,311) ~= 1 then
            if CostMoney(varMap, varPlayer, 3, x310392_var_CostMoney) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310392_var_CostMoney), 8, 3)
                return 0
            end
        end
    else
        if CostMoney( varMap, varPlayer, 3, x310392_var_CostMoney) ~= 1 then
            if CostMoney(varMap, varPlayer, 2, x310392_var_CostMoney,311) ~= 1 then
                Msg2Player( varMap, varPlayer, format( "你身上的金卡/现金不足#R%d#cffcc00文", x310392_var_CostMoney), 8, 3)
                return 0
            end
        end
    end

    DeliverItemListSendToPlayer( varMap, varPlayer)

    x310392_SetMD( varMap, varPlayer, MD_MOJUN_DUIHUAN, 1)
    x310392_SetMD( varMap, varPlayer, MD_MOJUN_WEEK, weekIndex)

    return 1
end

function x310392_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310392_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x310392_ProcAccept( varMap, varPlayer, varTalknpc)
end
