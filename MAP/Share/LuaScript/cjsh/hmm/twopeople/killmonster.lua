--DECLARE_QUEST_INFO_START--

x930187_var_FileId 					= 	930187
x930187_var_QuestId 				= 	8120
x930187_var_mapid=94
x930187_var_QuestKind 				= 	1
x930187_var_LevelLess					= 	0

x930187_var_QuestName				= 	"【个人】清理战场"
x930187_var_QuestTarget				= 	"  击败%s @npc_%d(%d/%d)"
x930187_var_QuestInfo				= 	""
x930187_var_ContinueInfo				= 	"\t怎么？你对付不了那些可恶的怪物么？看来我们要另外物色人选了。"
x930187_var_QuestCompleted			= 	"\t啊，没想到你这么快就击败怪物，真是太好了！"
x930187_var_QuestHelp				=	"\t#G据说在清缴他们的过程中，你很有可能会获得战神或者征伐录经验。#W"





x930187_var_ExpBonus					= 	0
x930187_var_BonusItem					=	{}

x930187_var_BonusMoney1               = 	0
x930187_var_BonusMoney2               =   0
x930187_var_BonusMoney3               =   0
x930187_var_BonusMoney4               =   0
x930187_var_BonusMoney5               =   0
x930187_var_BonusMoney6               =   0

x930187_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x930187_MP_TARGET1					= 1--记录需要杀的怪物id
x930187_MP_TARGET2					= 2--记录需要击杀的怪物数量
x930187_MP_TARGET4					= 4--记录已经击杀的数量
x930187_MP_FINISH                   = 7
x930187_MP_ISCOMPLETE				= 0


x930187_var_strAcceptQuest          = "您接受了任务：【个人】清理战场"

x930187_var_strAbandonQuest         = "您放弃了任务：【个人】清理战场"

x930187_var_strFinishQuest          = "您完成了任务：【个人】清理战场"




x930187_var_PlayerMinLevel            = 40

x930187_var_PlayerMaxLevel            = 200

x930187_SubmitNPCGUID				= 600205


x930187_ItemID_Table                ={
    {varIndex = 1, varItem = 12272440,num=10,name="万族征伐录经验体验包"},
    {varIndex = 2, varItem = 12272441,num=10,name="战神经验体验包"},
    {varIndex = 3, varItem = 12274039,num=1,name="肝帝的证明大礼包"},
    {varIndex = 4, varItem = 12274009,num=1,name="大荣誉包"},
    {varIndex = 5, varItem = 12266664,num=3,name="王者勋章"},
}



x930187_var_QuestTips               = "\t#G据说在清缴他们的过程中，你很有可能会获得战神或者征伐录经验。#W"

x930187_var_QuestDescription        = "\t清缴战场吧\n#G注：\n接取任务次数与vip等级挂钩。#W"

x930187_var_QuestBook               = "\t找到并消灭那些怪物，完成任务后，你将得到相应的回报。"


x930187_var_KillTargetCountmin           = 1
x930187_var_KillTargetCountmax           = 3
x930187_var_MaxTimes                  = 1
x930187_var_MaxTimes40                = 2
x930187_var_MaxTimes50                = 5
x930187_var_strOverMaxTimes           = format( "每天只能接#R%d#cffcf00次这个任务", x930187_var_MaxTimes)
x930187_var_strOverMaxTimes40         = format( "每天只能接#R%d#cffcf00次这个任务", x930187_var_MaxTimes40)
x930187_var_strOverMaxTimes50         = format( "每天只能接#R%d#cffcf00次这个任务", x930187_var_MaxTimes50)




function x930187_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    local bossCnt = x930187_getmonstercnt(varMap, varPlayer)
    local bid,bname,bpos = x930187_getmonsterinfo(varMap, varPlayer)
    --Msg2Player( varMap, varPlayer, format("成功获取到%d个怪物信息 %d,%s,%d",bossCnt, bid,bname,bpos), 8, 3)
    --Msg2Player( varMap, varPlayer, format("成功获取到%d个怪物信息 %d,%s,%d",bossCnt, bid,bname,bpos), 8, 2)



    local varLevel = GetLevel( varMap, varPlayer)
    if( varLevel < x930187_var_PlayerMinLevel) then
        return 1
    end

    local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x930187_var_QuestId)
    if( varHaveQuest <= 0 and varLevel >= x930187_var_PlayerMinLevel) then
        local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x930187_var_QuestId)
        TalkAppendButton( varMap, x930187_var_QuestId, x930187_var_QuestName, varState)
    end
end




function x930187_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varExtIdx)
    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930187_var_QuestId)
    if( varHaveQuest > 0) then
        local varDone = x930187_CheckSubmit(varMap, varPlayer, varTalknpc)
        if( varDone > 0) then
            if varExtIdx ~= -1 then
                x930187_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
            end
        else
            if varExtIdx ~= -1 then
                x930187_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
            end
        end
    else
        x930187_DeliverTalkInfo( varMap, varPlayer, varTalknpc )
    end
end




function x930187_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930187_var_QuestId);
    if(varHaveQuest > 0) then
        return 0;
    else
        return 1;
    end
end





















function x930187_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsHaveQuestNM(varMap, varPlayer, x930187_var_QuestId) > 0 then
    else





        local varToday = GetDayOfYear()

        if x930187_GetDate( varMap, varPlayer) == varToday then
            local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
            local maxtimes = x930187_var_MaxTimes+floor(nLevelPre/5)

            if x930187_GetTimes( varMap, varPlayer) >= maxtimes then
                Msg2Player( varMap, varPlayer, format("每天只能接#R%d#cffcf00次这个任务",maxtimes), 8, 3)
                Msg2Player( varMap, varPlayer, format("每天只能接#R%d#cffcf00次这个任务",maxtimes), 8, 2)
                return
            end
        else

            x930187_SetTimes( varMap, varPlayer, 0)
            x930187_SetDate( varMap, varPlayer, varToday)

        end
        local varRet	= AddQuest( varMap, varPlayer, x930187_var_QuestId, x930187_var_FileId, 1, 0, 0, 1)
        if( varRet == 0) then
            StartTalkTask( varMap)
            TalkAppendString( varMap, "任务已满，任务接受失败！" )
            StopTalkTask( varMap)
            DeliverTalkTips( varMap, varPlayer)
            return 0;
        end


        local monsterId,varName, posid = x930187_getmonsterinfo(varMap, varPlayer)

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930187_var_QuestId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET1, monsterId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4, 0)

        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930187_MP_ISCOMPLETE, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930187_MP_FINISH, 0)

        local needKillCnt = random(x930187_var_KillTargetCountmin,x930187_var_KillTargetCountmax)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2, needKillCnt)

        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x930187_var_QuestName)
        TalkAppendString( varMap, "#r" )
        TalkAppendString( varMap, "#Y任务目标:" )
        TalkAppendString( varMap, format( "消灭%d名%s。", needKillCnt,varName) )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)


        StartTalkTask( varMap)
        TalkAppendString( varMap, x930187_var_strAcceptQuest)
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)

        Msg2Player( varMap, varPlayer, x930187_var_strAcceptQuest, 8, 2)

        x930187_QuestLogRefresh( varMap, varPlayer, x930187_var_QuestId )


        x930187_ShowQuestInfo( varMap, varPlayer, varTalknpc)


        GamePlayScriptLog( varMap, varPlayer, 731)
    end
end




function x930187_ProcQuestAbandon( varMap, varPlayer, varQuest)
    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930187_var_QuestId);
    if varHaveQuest > 0 then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930187_var_QuestId);
        DelQuest(varMap, varPlayer, x930187_var_QuestId);

        StartTalkTask( varMap)
        TalkAppendString( varMap, x930187_var_strAbandonQuest)
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, x930187_var_strAbandonQuest, 8, 2)





        x930187_SetTimes( varMap, varPlayer, x930187_GetTimes( varMap, varPlayer) + 1)
    end
end




function x930187_CheckSubmit( varMap, varPlayer, varTalknpc)
    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930187_var_QuestId);
    return GetQuestParam(varMap, varPlayer, varQuestIdx, x930187_MP_ISCOMPLETE);
end




function x930187_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick )
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930187_var_QuestId)













    if x930187_var_BonusMoney1 > 0 then
        AddMoney( varMap, varPlayer, 1, x930187_var_BonusMoney1 )
        Msg2Player(varMap,varPlayer,format("获得#R银卡#{_MONEY%d}#W的奖励。", x930187_var_BonusMoney1),4,2)
    end


    if x930187_var_BonusMoney2 > 0 then
        AddMoney( varMap, varPlayer, 0, x930187_var_BonusMoney2 )
        Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x930187_var_BonusMoney2),4,2)
    end


    if x930187_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x930187_var_BonusMoney3 )
        Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x930187_var_BonusMoney3),4,2)
    end


    if x930187_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x930187_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
        Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x930187_var_BonusMoney4),4,2)
    end


    if x930187_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer )
        varShengWang = varShengWang + x930187_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
        Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x930187_var_BonusMoney5),4,2)
    end


    if x930187_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x930187_var_BonusMoney6)
        Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x930187_var_BonusMoney6),4,2)
    end


    for varI, item in x930187_var_BonusItem do
        StartItemTask(varMap)
        ItemAppend( varMap, item.item, item.n )
        local varRet = StopItemTask(varMap,varPlayer)
        if varRet > 0 then
            DeliverItemListSendToPlayer(varMap,varPlayer)
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
        end
    end


    for varI, item in x930187_var_BonusChoiceItem do
        if item.item == varButtonClick then
            StartItemTask(varMap)
            ItemAppend( varMap, item.item, item.n )
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet > 0 then
                DeliverItemListSendToPlayer(varMap,varPlayer)
            else
                StartTalkTask(varMap)
                TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
                StopTalkTask(varMap)
                DeliverTalkTips(varMap,varPlayer)
            end


            return
        end
    end
end




function x930187_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

    local a = 0
    for k,v in x930187_ItemID_Table do
        if v.varItem==varRadioSelected then
            a = k
            break
        end
    end
    if a ==0 then
        return
    end
    local jlitem = x930187_ItemID_Table[a]
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930187_var_QuestId);
    if varHaveQuest > 0 then
        local varToday = GetDayOfYear()


        if x930187_GetDate( varMap, varPlayer) == varToday then
            local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
            local maxtimes = x930187_var_MaxTimes+floor(nLevelPre/5)

            if x930187_GetTimes( varMap, varPlayer) >= maxtimes then
                Msg2Player( varMap, varPlayer, format("每天只能接#R%d#cffcf00次这个任务",maxtimes), 8, 3)
                Msg2Player( varMap, varPlayer, format("每天只能接#R%d#cffcf00次这个任务",maxtimes), 8, 2)
                return
            end
        end


        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930187_var_QuestId)
        local completed = GetQuestParam(varMap, varPlayer, varQuestIdx, x930187_MP_ISCOMPLETE)

        if completed == 1 then
            StartItemTask( varMap)
            ItemAppendBind( varMap, varRadioSelected, jlitem.num)
            local varRet = StopItemTask( varMap, varPlayer)
            if varRet > 0 then
                DelQuest( varMap, varPlayer, x930187_var_QuestId)

                local varToday = GetDayOfYear()
                if x930187_GetDate( varMap, varPlayer) == varToday then

                    x930187_SetTimes( varMap, varPlayer, x930187_GetTimes( varMap, varPlayer) + 1)
                else

                    x930187_SetDate( varMap, varPlayer, varToday)

                    x930187_SetTimes( varMap, varPlayer, 1)
                end



                StartTalkTask( varMap)
                TalkAppendString( varMap, x930187_var_strFinishQuest)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
                Msg2Player( varMap, varPlayer, x930187_var_strFinishQuest, 8, 2)

                x930187_GetBonus( varMap, varPlayer, varTalknpc, varRadioSelected)



                DeliverItemListSendToPlayer( varMap, varPlayer)
                local varStr = format( "你获得了@item_%d", varRadioSelected)
                StartTalkTask( varMap)
                TalkAppendString( varMap, varStr)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
            else
                StartTalkTask( varMap)
                TalkAppendString( varMap, "背包已满，无法得到物品！" )
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
            end

            GamePlayScriptLog( varMap, varPlayer, 732)
        else
            StartTalkTask( varMap )
            TalkAppendString( varMap,"任务没有完成！")
            StopTalkTask()
            DeliverTalkTips(varMap, varPlayer);
        end
    else
        StartTalkTask( varMap )
        TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
        StopTalkTask()
        DeliverTalkTips(varMap, varPlayer);
        return
    end
end




function x930187_CheckPlayerBagFull( varMap ,varPlayer)
    local result = 1

    local j = 0

    local bAdd = 0


    StartItemTask(varMap)
    for j, item in x930187_var_BonusItem do
        ItemAppend( varMap, item.item, item.n )
    end


    for j, item in x930187_var_BonusChoiceItem do
        ItemAppend( varMap, item.item, item.n )
    end

    local varRet = StopItemTask(varMap,varPlayer)
    if(varRet > 0) then
        result = 1;
    else
        result = 0;
    end

    return result
end


function x930187_ShowQuestInfo( varMap, varPlayer, varTalknpc)
    StartTalkTask( varMap)

    TalkAppendString( varMap, "#Y"..x930187_var_QuestName)
    TalkAppendString( varMap, x930187_var_QuestBook)
    TalkAppendString( varMap, " " )


    TalkAppendString( varMap, "#Y任务目标：")
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930187_var_QuestId)
    local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET1)
    local needKillCnt   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)

    local monid,monname,Pos1 = x930187_getmonsterbyid(varMap, varPlayer,mon1)
    TalkAppendString( varMap, format( x930187_var_QuestTarget, monname,Pos1, m1Kill,needKillCnt) )
    TalkAppendString( varMap, " " )


    if x930187_var_QuestTips ~= "" then
        TalkAppendString( varMap, "#Y任务提示：" )
        TalkAppendString( varMap, x930187_var_QuestTips)
        TalkAppendString( varMap, " ")
    end
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end




function x930187_DeliverTalkInfo( varMap, varPlayer, varTalknpc)
    local varLevel = GetLevel( varMap, varPlayer)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930187_var_QuestId)
    local Pos1 = 0
    local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET1)
    local needKillCnt   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)
    StartTalkTask( varMap)

    TalkAppendString( varMap, "#Y"..x930187_var_QuestName)
    TalkAppendString( varMap, x930187_var_QuestDescription)










    for vari, item in x930187_ItemID_Table do
        AddQuestRadioItemBonus( varMap, item.varItem, item.num)
    end

    if x930187_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1( varMap, x930187_var_BonusMoney1 )
    end


    if x930187_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2( varMap, x930187_var_BonusMoney2 )
    end

    if x930187_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3( varMap, x930187_var_BonusMoney3 )
    end


    if x930187_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4( varMap, x930187_var_BonusMoney4 )
    end


    if x930187_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5( varMap, x930187_var_BonusMoney5 )
    end


    if x930187_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6( varMap, x930187_var_BonusMoney6 )
    end


    for varI, item in x930187_var_BonusItem do
        AddQuestItemBonus( varMap, item.item, item.n)
    end


    for varI, item in x930187_var_BonusChoiceItem do
        AddQuestRadioItemBonus( varMap, item.item, item.n)
    end
    StopTalkTask()
    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x930187_var_FileId, x930187_var_QuestId)
    --LuaCallNoclosure( 203794, "FinishDaobaoke", varMap, varPlayer)
end




function x930187_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930187_var_QuestId)
    local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET1)
    local needKillCnt   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)

    local monid,monname,Pos1 = x930187_getmonsterbyid(varMap, varPlayer,mon1)


    StartTalkTask( varMap)

    TalkAppendString( varMap, "#Y"..x930187_var_QuestName)
    TalkAppendString( varMap, format( x930187_var_ContinueInfo, Pos1) )
    TalkAppendString( varMap, " ")


    TalkAppendString( varMap,"#Y完成情况：")

    TalkAppendString( varMap, format( x930187_var_QuestTarget, monname,Pos1, m1Kill,needKillCnt) )











    if x930187_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x930187_var_BonusMoney1 )
    end


    if x930187_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x930187_var_BonusMoney2 )
    end

    if x930187_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x930187_var_BonusMoney3 )
    end


    if x930187_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x930187_var_BonusMoney4 )
    end


    if x930187_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x930187_var_BonusMoney5 )
    end


    if x930187_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x930187_var_BonusMoney6 )
    end



    for varI, item in x930187_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end


    for varI, item in x930187_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end


    StopTalkTask()
    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x930187_var_FileId, x930187_var_QuestId)
end




function x930187_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
    StartTalkTask(varMap)

    TalkAppendString(varMap,"#Y"..x930187_var_QuestName)
    TalkAppendString(varMap,x930187_var_QuestCompleted)
    TalkAppendString(varMap," ")














    if x930187_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x930187_var_BonusMoney1 )
    end


    if x930187_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x930187_var_BonusMoney2 )
    end

    if x930187_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x930187_var_BonusMoney3 )
    end


    if x930187_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x930187_var_BonusMoney4 )
    end


    if x930187_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x930187_var_BonusMoney5 )
    end


    if x930187_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x930187_var_BonusMoney6 )
    end



    for varI, item in x930187_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end


    for varI, item in x930187_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end

    local needKillCnt   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)

    for vari, item in x930187_ItemID_Table do
        AddQuestRadioItemBonus( varMap, item.varItem, item.num*needKillCnt)
    end
    StopTalkTask()
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x930187_var_FileId, x930187_var_QuestId);
end




function x930187_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
     if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
    end

    local varQuestIdx = 0
    local varTeamSize = GetNearTeamCount( varMap, varPlayer)
    if varMap ~= x930187_var_mapid then
        return
    end

    if varTeamSize <= 1 then
        if IsHaveQuest( varMap, varPlayer, x930187_var_QuestId) <= 0 then
            return
        end
        varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930187_var_QuestId)
        if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
            --任务已经完成
            return
        end
        local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET1)
        local needKillCnt   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2)
        local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)

        if varObjData == mon1 and m1Kill < needKillCnt then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4, m1Kill + 1)
        else
            return
        end

        x930187_QuestLogRefresh( varMap, varPlayer, x930187_var_QuestId)


        m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)
        if m1Kill >= needKillCnt then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        end
    else
        for varI = 0, varTeamSize - 1 do
            local memberId = GetNearTeamMember( varMap, varPlayer, varI)
            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                if IsHaveQuest( varMap, memberId, x930187_var_QuestId) > 0 then
                    varQuestIdx = GetQuestIndexByID( varMap, memberId, x930187_var_QuestId)
                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then
                        local mon1   = GetQuestParam( varMap, memberId, varQuestIdx, x930187_MP_TARGET1)
                        local m1Kill = GetQuestParam( varMap, memberId, varQuestIdx, x930187_MP_TARGET4)

                        local questMonster = 1
                        if varObjData == mon1 and m1Kill < x930187_var_KillTargetCount then
                            SetQuestByIndex( varMap, memberId, varQuestIdx, x930187_MP_TARGET4, m1Kill + 1)
                        else
                            questMonster = 0
                        end

                        if questMonster == 1 then
                            x930187_QuestLogRefresh( varMap, memberId, x930187_var_QuestId)


                            local randnum = random( 1, 100)
                            local varItem = 0
                            if randnum >= 1 and randnum < 26 then
                                varItem = x930187_ItemID_Table[ 1].varItem
                            elseif randnum >= 26 and randnum < 51 then
                                varItem = x930187_ItemID_Table[ 2].varItem
                            elseif randnum >= 51 and randnum < 76 then
                                varItem = x930187_ItemID_Table[ 3].varItem
                            elseif randnum >= 76 and randnum < 101 then
                                varItem = x930187_ItemID_Table[ 4].varItem
                            else
                                varItem = 0
                            end

                            if( varItem > 0) then
                                StartItemTask( varMap)
                                if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
                                    ItemAppend( varMap, varItem, 1)
                                else
                                    ItemAppendBind( varMap, varItem, 1)
                                end
                                local varRet = StopItemTask( varMap, memberId)
                                if varRet > 0 then
                                    DeliverItemListSendToPlayer( varMap, memberId)
                                    local varStr = format( "你获得了@item_%d", varItem)
                                    StartTalkTask( varMap)
                                    TalkAppendString( varMap, varStr)
                                    StopTalkTask( varMap)
                                    DeliverTalkTips( varMap, memberId)
                                else
                                    StartTalkTask( varMap)
                                    TalkAppendString( varMap, "物品栏已满，无法得到物品！" )
                                    StopTalkTask( varMap)
                                    DeliverTalkTips( varMap, memberId)
                                end
                            end


                            m1Kill = GetQuestParam( varMap, memberId, varQuestIdx, x930187_MP_TARGET4)
                            if m1Kill >= x930187_var_KillTargetCount then
                                SetQuestByIndex( varMap, memberId, varQuestIdx, 0, 1)
                                SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
                            end
                        end
                    end
                end
            end
        end
    end
end




function x930187_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x930187_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

    if varTalkNpcGUID == x930187_SubmitNPCGUID then
        local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930187_var_QuestId);
        if(varHaveQuest > 0) then
            local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x930187_var_QuestId)
            TalkAppendButton(varMap, x930187_var_QuestId, x930187_var_QuestName,varState,32);
        end
    end
end




function x930187_QuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    local times = x930187_GetTimes( varMap, varPlayer)+1
    local mon1   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET1)
    local needKillCnt   = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET2)
    local m1Kill = GetQuestParam( varMap, varPlayer, varQuestIdx, x930187_MP_TARGET4)

    local monid,monname,Pos1 = x930187_getmonsterbyid(varMap, varPlayer,mon1)


    local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);

    local maxTimes = x930187_var_MaxTimes+floor(nLevelPre/5)
    local level = GetLevel(varMap, varPlayer)




    StartTalkTask(varMap)
    AddQuestLogCustomText( varMap,
            "",
            "【个人】清理战场（"..times.."/"..maxTimes.."）",
            format( x930187_var_QuestTarget, monname,Pos1, m1Kill,needKillCnt),
            "",
            x930187_var_QuestBook,
            x930187_var_QuestDescription,
            x930187_var_QuestTips
    )

    for vari, item in x930187_ItemID_Table do
        AddQuestRadioItemBonus( varMap, item.varItem, item.num*needKillCnt)
    end

    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x930187_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    x930187_QuestLogRefresh( varMap, varPlayer, varQuest)
end




function x930187_ProcForceAddQuest( varMap, varPlayer, varTalknpc, varQuest)
end


function x930187_GetTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ITEM_OTHER_320_DATE[ 1], MD_ITEM_OTHER_320_DATE[ 2], MD_ITEM_OTHER_320_DATE[ 3] )
end


function x930187_SetTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ITEM_OTHER_320_DATE[ 1], MD_ITEM_OTHER_320_DATE[ 2], MD_ITEM_OTHER_320_DATE[ 3], value)
end


function x930187_GetDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ITEM_OTHER_319_DATE[ 1], MD_ITEM_OTHER_319_DATE[ 2], MD_ITEM_OTHER_319_DATE[ 3] )
end


function x930187_SetDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ITEM_OTHER_319_DATE[ 1], MD_ITEM_OTHER_319_DATE[ 2], MD_ITEM_OTHER_319_DATE[ 3], value)
end


function x930187_getmonsterinfo(varMap, varPlayer)
    local id, name, posId = LuaCallNoclosure( 930175, "Getmonsterinfo", varMap, varPlayer)
    return id,name,posId
end
function x930187_getmonsterbyid(varMap, varPlayer,objid)
    local id, name, posId = LuaCallNoclosure( 930175, "Getmonsterbyid", varMap, varPlayer,objid)
    return id,name,posId
end
function x930187_getmonstercnt(varMap, varPlayer)
    local bossCnt = LuaCallNoclosure( 930175, "Getmonstercnt", varMap, varPlayer)
    return bossCnt
end
