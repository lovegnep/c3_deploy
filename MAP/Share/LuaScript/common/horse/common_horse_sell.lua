--DECLARE_QUEST_INFO_START--

x920006_var_FileId = 920006



x920006_var_QuestName       = "【个人】收集战马"

x920006_var_strCollectHorse   = "\t国家需要更多的战马！去#G王国马场#W带回蒙古马，在我这里可换取银卡一百文。如果你能捕捉到更好的蒙古马，则可以换取8倍的报酬。"

x920006_CountrySceneList	= { 50, 150, 250, 350}
--DECLARE_QUEST_INFO_STOP--


x920006_var_GoodHorseTable    = {  2,  3,  4,  5, 
                                12, 13, 14, 15, 
                                22, 23, 24, 25, 
                                32, 33, 34, 35, 
                                42, 43, 44, 45, 
                                52, 53, 54, 55 
}

x920006_var_CommonHorseTable  = { 1, 11, 21, 31, 41, 51 }

x920006_var_MaxTimes          = 10
x920006_var_strOverMaxTimes   = "你本日已经交过十匹战马，不能再交了"




function x920006_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
    
    
    
    if GetHorseCount( varMap, varPlayer) > 0 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【个人】收集战马" )
            TalkAppendString( varMap, "\t国家需要更多的战马！去#G王国马场#W带回一匹马来，在我这里可换取银卡奖励。\n\t如果你能捕捉到良品马来，则可以换取8倍的报酬。\n\t当然，战马的携带等级越高，我所给的薪偿也就更高。" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x920006_var_FileId, x920006_var_QuestName)

        
        StartGCDTask( varMap);
            GCDAppendInt( varMap, x920006_var_FileId);
            GCDAppendInt( varMap, 0);	
            GCDAppendInt( varMap, varTalknpc);
            DeliverGCDInfo( varMap, varPlayer, 101);
        StopGCDTask( varMap)
    else
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【个人】收集战马" )
            TalkAppendString( varMap, "\t你自己都无马可骑，怎么能贡献战马给国家呢？" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x920006_var_FileId, x920006_var_QuestName)
    end
end




function x920006_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, 0)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, 0)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 0)

    
    if x920006_CountrySceneList[ GetCurCountry( varMap, varPlayer) + 1] == varMap then
        TalkAppendButton( varMap, x920006_var_FileId, x920006_var_QuestName, 3)
        StartGCDTask( varMap)
            DeliverGCDInfo( varMap, varPlayer, 102)
        StopGCDTask( varMap)
    end
end





function x920006_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    
    local high = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH)
    local low = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW)
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)
    local takeLevel = GetPet_TakeLevel( varMap, varPlayer, varIndex)
    local varId = 0
    if PetID < 2000 and PetID >=100 then
        varId = mod( PetID, 100)
    end

    
    if IsHaveHorse( varMap, varPlayer, PetID) == 0 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【个人】收集战马" )
            TalkAppendString( varMap, "\t找不到你要卖的马！" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x920006_var_FileId, x920006_var_QuestName)
        return
    end

    
    local bFindGood = 0
    for varI, item in x920006_var_GoodHorseTable do
        if varId == item then
            bFindGood = 1
            break
        end
    end
    local bFindCommon = 0
    if bFindGood == 0 then
        for varI, item in x920006_var_CommonHorseTable do
            if varId == item then
                bFindCommon = 1
                break
            end
        end
    end
    
    if bFindCommon ~= 1 and bFindGood ~= 1 then
        Msg2Player( varMap, varPlayer, "我这里只收集普通马和良品马", 8, 3)
        return
    end

    
    local varToday = GetDayOfYear()
    if x920006_GetQuestDate( varMap, varPlayer) == varToday then
        local times = x920006_GetQuestTimes( varMap, varPlayer)
        if times >= x920006_var_MaxTimes then
            Msg2Player( varMap, varPlayer, x920006_var_strOverMaxTimes, 8, 3)
            Msg2Player( varMap, varPlayer, x920006_var_strOverMaxTimes, 8, 2)
            return
        end
    end

    
    if FreeHorse( varMap, varPlayer, high, low) ~= 1 then
        Msg2Player( varMap, varPlayer, "收集战马失败", 8, 3)
        return
    end

    local varToday = GetDayOfYear()
    if x920006_GetQuestDate( varMap, varPlayer) ~= varToday then
        
        x920006_SetQuestDate( varMap, varPlayer, varToday)
        x920006_SetQuestTimes( varMap, varPlayer, 1)
    else
        local times = x920006_GetQuestTimes( varMap, varPlayer)
        if times >= x920006_var_MaxTimes then
            Msg2Player( varMap, varPlayer, x920006_var_strOverMaxTimes, 8, 3)
            Msg2Player( varMap, varPlayer, x920006_var_strOverMaxTimes, 8, 2)
            return
        else
            
            x920006_SetQuestTimes( varMap, varPlayer, times + 1)
        end
    end

    
    if bFindGood == 1 then
        
        local money = takeLevel * 80
        AddMoney( varMap, varPlayer, 1, money)
        Msg2Player( varMap, varPlayer, format( "你获得了#R银卡#{_MONEY%d}#cffcf00的奖励", money), 8, 3)
        Msg2Player( varMap, varPlayer, format( "你获得了#R银卡#{_MONEY%d}#cffcf00的奖励", money), 8, 2)
    elseif bFindCommon == 1 then
        
        local money = takeLevel * 10
        AddMoney( varMap, varPlayer, 1, money)
        Msg2Player( varMap, varPlayer, format( "你获得了#R银卡#{_MONEY%d}#cffcf00的奖励", money), 8, 3)
        Msg2Player( varMap, varPlayer, format( "你获得了#R银卡#{_MONEY%d}#cffcf00的奖励", money), 8, 2)
    end

    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, -1)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, -1)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, -1)

    
    GamePlayScriptLog( varMap, varPlayer, 401)
end




function x920006_ProcAccept( varMap, varPlayer)
end




function x920006_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x920006_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x920006_CheckSubmit( varMap, varPlayer )

end




function x920006_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )

end




function x920006_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x920006_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x920006_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end










function x920006_ProcCommitPet( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, varIndex)
    
    local varId = 0
    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)
    if PetID < 2000 and PetID >=100 then
        varId = mod( PetID, 100)
    end
    local takeLevel = GetPet_TakeLevel( varMap, varPlayer, varIndex)
    
    local bFindGood = 0
    for varI, item in x920006_var_GoodHorseTable do
        if varId == item then
            bFindGood = 1
            break
        end
    end
    local bFindCommon = 0
    if bFindGood == 0 then
        for varI, item in x920006_var_CommonHorseTable do
            if varId == item then
                bFindCommon = 1
                break
            end
        end
    end
    if bFindGood == 1 or bFindCommon == 1 then
        
        if bFindGood == 1 then
            
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y【个人】收集战马" )
                TalkAppendString( varMap, "\t竟然是如此优秀的马匹！将它交给我，你会获得丰厚的回报。" )
                TalkAppendString( varMap, " " )
                TalkAppendString( varMap, "#Y奖励内容：" )
                TalkAppendString( varMap, format( "银卡：#{_MONEY%d}", takeLevel * 80) )
            StopTalkTask()
        else
            
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y【个人】收集战马" )
                TalkAppendString( varMap, "\t想将这匹战马交给我吗？放心，我不会亏待你的。" )
                TalkAppendString( varMap, " " )
                TalkAppendString( varMap, "#Y奖励内容：" )
                TalkAppendString( varMap, format( "银卡：#{_MONEY%d}", takeLevel * 10) )
            StopTalkTask()
        end
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x920006_var_FileId, -1)

        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, horseGUID_high)
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, horseGUID_low)
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)

        
        StartGCDTask( varMap)
            DeliverGCDInfo( varMap, varPlayer, 102)
        StopGCDTask( varMap)
    else
        
        StartTalkTask( varMap)
            TalkAppendString( varMap, "你提交的骑乘不符合需求" )
        StopTalkTask()
        DeliverTalkTips( varMap, varPlayer)
        
        Msg2Player( varMap, varPlayer, "你提交的骑乘不符合需求", 4, 2)
    end
end

function x920006_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    
end

function x920006_GetQuestDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_COLLECTHORSE_DATE[ 1], MD_COLLECTHORSE_DATE[ 2], MD_COLLECTHORSE_DATE[ 3] )
end

function x920006_SetQuestDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_COLLECTHORSE_DATE[ 1], MD_COLLECTHORSE_DATE[ 2], MD_COLLECTHORSE_DATE[ 3], value)
end

function x920006_GetQuestTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_COLLECTHORSE_TIMES[ 1], MD_COLLECTHORSE_TIMES[ 2], MD_COLLECTHORSE_TIMES[ 3] )
end

function x920006_SetQuestTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_COLLECTHORSE_TIMES[ 1], MD_COLLECTHORSE_TIMES[ 2], MD_COLLECTHORSE_TIMES[ 3], value)
end


