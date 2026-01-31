

x350008_var_FileId 					= 350008

x350008_var_ItemTable                 = {
                                        { { 12030019, 1, 1}, { 12031033, 1, 1}, { 12031034, 1, 1}, { 11010015, 1, 1}, { 12030066, 1, 2}, },
                                        { { 12030067, 1, 1}, { 12041201, 1, 1}, { 12041106, 1, 1}, { 11010015, 1, 1}, { 12031033, 1, 1}, { 12031034, 1, 1} },
                                        { { 12030067, 1, 1}, { 12041201, 1, 1}, { 12041106, 1, 1}, { 11010017, 1, 1}, { 12031033, 1, 1}, { 12031034, 1, 1} },
                                        { { 12030019, 1, 1}, { 12041106, 1, 1}, { 11010015, 1, 1}, { 12030066, 1, 2}, },
}

x350008_var_GiftTable                 = {
                                        { tstart = 720,  tend = 730,  }, 
                                        { tstart = 900,  tend = 910,  }, 
                                        { tstart = 1080, tend = 1090,  }, 
                                        { tstart = 1260, tend = 1270,  }, 
}

x350008_var_ChristmasPet              = 12050247

x350008_var_ChristmasItem             = 10300141




function x350008_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) < 30 then
        return
    end

    
    local day = GetDayOfYear()
    local varY, m, d = GetYearMonthDay()
    if mod( varY, 4) == 0 then
        day = day - 1
    end
    if day > 356 or day < 350 then
        return
    end

    TalkAppendButton( varMap, x350008_var_FileId, "圣诞上线送礼", 3)
end




function x350008_ProcEventEntry( varMap, varPlayer, varTalknpc, varState, btnindex)
    local curTime = GetMinOfDay()
    local varIndex = 0

    local day = GetDayOfYear()
    if day ~= GetPlayerGameData( varMap, varPlayer, MD_GETGIFT_DAY[ 1], MD_GETGIFT_DAY[ 2], MD_GETGIFT_DAY[ 3] ) then
        SetPlayerGameData( varMap, varPlayer, MD_GETGIFT1[ 1], MD_GETGIFT1[ 2], MD_GETGIFT1[ 3], 0)
        SetPlayerGameData( varMap, varPlayer, MD_GETGIFT2[ 1], MD_GETGIFT2[ 2], MD_GETGIFT2[ 3], 0)
        SetPlayerGameData( varMap, varPlayer, MD_GETGIFT3[ 1], MD_GETGIFT3[ 2], MD_GETGIFT3[ 3], 0)
        SetPlayerGameData( varMap, varPlayer, MD_GETGIFT4[ 1], MD_GETGIFT4[ 2], MD_GETGIFT4[ 3], 0)
        SetPlayerGameData( varMap, varPlayer, MD_GETGIFT_DAY[ 1], MD_GETGIFT_DAY[ 2], MD_GETGIFT_DAY[ 3], day)
    end

    for varI, iter in x350008_var_GiftTable do
        if curTime >= iter.tstart and curTime < iter.tend then
            varIndex = varI
            break
        end
    end

    if varIndex == 0 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y圣诞上线送礼" )
            TalkAppendString( varMap, "\n\t现在还不是领取时间，无法领取。#r" )
            TalkAppendString( varMap, "\t从#G12月17日起至12月23日#W，每天的#G12：00—12：10、15：00—15：10、18：00—18：10和21：00—21：10，#W各位玩家可以在这里领取圣诞礼物。\n\t#G许愿种子#W和#G祈福种子#W就包含在这些圣诞礼物中，你可以使用许愿种子或祈福种子去圣诞树处许愿祈福。" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
        return
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y圣诞上线送礼" )
        TalkAppendString( varMap, "\n\t您是否要领取这个时段的圣诞礼品？#r" )
        TalkAppendString( varMap, "\t从#G12月17日起至12月23日#W，每天的#G12：00—12：10、15：00—15：10、18：00—18：10和21：00—21：10，#W各位玩家可以在这里领取圣诞礼物。\n\t#G许愿种子#W和#G祈福种子#W就包含在这些圣诞礼物中，你可以使用许愿种子或祈福种子去圣诞树处许愿祈福。" )
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350008_var_FileId, -1)
end




function x350008_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local curTime = GetMinOfDay()
    local varIndex = 0
    for varI, iter in x350008_var_GiftTable do
        if curTime >= iter.tstart and curTime < iter.tend then
            varIndex = varI
            break
        end
    end
    if varIndex == 0 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y圣诞上线送礼" )
            TalkAppendString( varMap, "\t现在还不是领取时间，无法领取。#r" )
            TalkAppendString( varMap, "\t从#G12月22日起至1月4日#W，每天的#G12：00—12：10、15：00—15：10、18：00—18：10和21：00—21：10，#W各位玩家可以在这里领取圣诞礼物。\n\t#G许愿种子#W和#G祈福种子#W就包含在这些圣诞礼物中，你可以使用许愿种子或祈福种子去圣诞树处许愿祈福。" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
        return
    end

    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    if varIndex == 1 then
        if GetPlayerGameData( varMap, varPlayer, MD_GETGIFT1[ 1], MD_GETGIFT1[ 2], MD_GETGIFT1[ 3] ) == 1 then
            Msg2Player( varMap, varPlayer, "这个时间的奖品你已经领取了", 8, 3)
            return
        else
            SetPlayerGameData( varMap, varPlayer, MD_GETGIFT1[ 1], MD_GETGIFT1[ 2], MD_GETGIFT1[ 3], 1)
        end
    elseif varIndex == 2 then
        if GetPlayerGameData( varMap, varPlayer, MD_GETGIFT2[ 1], MD_GETGIFT2[ 2], MD_GETGIFT2[ 3] ) == 1 then
            Msg2Player( varMap, varPlayer, "这个时间的奖品你已经领取了", 8, 3)
            return
        else
            SetPlayerGameData( varMap, varPlayer, MD_GETGIFT2[ 1], MD_GETGIFT2[ 2], MD_GETGIFT2[ 3], 1)
        end
    elseif varIndex == 3 then
        if GetPlayerGameData( varMap, varPlayer, MD_GETGIFT3[ 1], MD_GETGIFT3[ 2], MD_GETGIFT3[ 3] ) == 1 then
            Msg2Player( varMap, varPlayer, "这个时间的奖品你已经领取了", 8, 3)
            return
        else
            SetPlayerGameData( varMap, varPlayer, MD_GETGIFT3[ 1], MD_GETGIFT3[ 2], MD_GETGIFT3[ 3], 1)
        end
    elseif varIndex == 4 then
        if GetPlayerGameData( varMap, varPlayer, MD_GETGIFT4[ 1], MD_GETGIFT4[ 2], MD_GETGIFT4[ 3] ) == 1 then
            Msg2Player( varMap, varPlayer, "这个时间的奖品你已经领取了", 8, 3)
            return
        else
            SetPlayerGameData( varMap, varPlayer, MD_GETGIFT4[ 1], MD_GETGIFT4[ 2], MD_GETGIFT4[ 3], 1)
        end
    end

    for varI, iter in x350008_var_ItemTable[ varIndex] do
        StartItemTask( varMap)
        ItemAppend( varMap, iter[ 1], random( iter[ 2], iter[ 3] ) )
        if StopItemTask( varMap, varPlayer) > 0 then
            DeliverItemListSendToPlayer( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, format( "你获得了@item_%d#cffcc00。", iter[ 1] ), 8, 2)
            Msg2Player( varMap, varPlayer, format( "获得圣诞礼品@item_%d", iter[ 1] ), 8, 3)
        else
            Msg2Player( varMap, varPlayer, "无法获得物品，请整理道具栏", 8, 3)
        end
    end

    if varIndex == 3 and random( 1, 100) == 50 then
        StartItemTask( varMap)
        ItemAppend( varMap, x350008_var_ChristmasPet, 1)
        if StopItemTask( varMap, varPlayer) > 0 then
            DeliverItemListSendToPlayer( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, format( "你获得了@item_%d#cffcc00。", x350008_var_ChristmasPet), 8, 2)
            Msg2Player( varMap, varPlayer, format( "获得圣诞礼品@item_%d", x350008_var_ChristmasPet), 8, 3)
        else
            Msg2Player( varMap, varPlayer, "无法获得物品，请整理道具栏", 8, 3)
        end
    end

    if varIndex == 4 and random( 1, 100) == 50 then
        StartItemTask( varMap)
        ItemAppend( varMap, x350008_var_ChristmasItem, 1)
        if StopItemTask( varMap, varPlayer) > 0 then
            DeliverItemListSendToPlayer( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, format( "你获得了@item_%d#cffcc00。", x350008_var_ChristmasItem), 8, 2)
            Msg2Player( varMap, varPlayer, format( "获得圣诞礼品@item_%d", x350008_var_ChristmasItem), 8, 3)
        else
            Msg2Player( varMap, varPlayer, "无法获得物品，请整理道具栏", 8, 3)
        end
    end

    local xp = GetLevel( varMap, varPlayer) * 2000
    AddExp( varMap, varPlayer, xp)
    Msg2Player( varMap, varPlayer, format( "你获得了#R%d#cffcc00点经验。", xp), 8, 2)

    StartTalkTask( varMap)
        TalkAppendString( varMap, "你领取了这个时间段的奖品。" )
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)

    
    GamePlayScriptLog( varMap, varPlayer, 1362)
end




function x350008_ProcAccept( varMap, varPlayer)
end




function x350008_ProcQuestAbandon( varMap, varPlayer, varQuest)

end




function x350008_ProcContinue( varMap, varPlayer, varTalknpc)

end




function x350008_CheckSubmit( varMap, varPlayer)

end




function x350008_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varIndex, varQuest)

end




function x350008_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)

end




function x350008_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
end

