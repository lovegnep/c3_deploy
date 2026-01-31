
--DECLARE_QUEST_INFO_START--

x930203_var_FileId = 930203   

x930203_var_SelectIndex = {}



-- 兑换目标道具ID
x930203_var_ExcObjID = {
    {index = 4,useyuan=1, dai=3 ,targetID = 2306, targetName = "三代变异凶豹", buffID = 22713, buffDesc = "三代变异凶豹图鉴激活：全攻击+400全防御+400"},
    {index = 5,useyuan=1, dai=3 ,targetID = 2316, targetName = "三代变异奔羚", buffID = 22714, buffDesc = "三代变异奔羚图鉴激活：全攻击+500全防御+500"},
    {index = 6,useyuan=1, dai=3 ,targetID = 2326, targetName = "三代变异天鹅", buffID = 22715, buffDesc = "三代变异天鹅图鉴激活：全攻击+600全防御+600"},
    {index = 7,useyuan=1, dai=3 ,targetID = 2336, targetName = "三代变异河马", buffID = 22716, buffDesc = "三代变异河马图鉴激活：全攻击+700全防御+700"},
    {index = 11,useyuan=1, dai=3 ,targetID = 2506, targetName = "三代变异烈狮", buffID = 22720, buffDesc = "三代变异烈狮图鉴激活：全攻击+1100全防御+1100"},
    {index = 12,useyuan=1, dai=3 ,targetID = 2516, targetName = "三代变异驯鹿", buffID = 22721, buffDesc = "三代变异驯鹿图鉴激活：全攻击+1200全防御+1200"},
    {index = 13,useyuan=1, dai=3 ,targetID = 2526, targetName = "三代变异瑞鹤", buffID = 22722, buffDesc = "三代变异瑞鹤图鉴激活：全攻击+1300全防御+1300"},
    {index = 14,useyuan=1, dai=3 ,targetID = 2536, targetName = "三代变异铁犀", buffID = 22723, buffDesc = "三代变异铁犀图鉴激活：全攻击+1400全防御+1400"},
    {index = 18,useyuan=1, dai=3 ,targetID = 2706, targetName = "三代变异剑齿虎", buffID = 22727, buffDesc = "三代变异剑齿虎图鉴激活：全攻击+1800全防御+1800"},
    {index = 19,useyuan=1, dai=3 ,targetID = 2716, targetName = "三代变异蛮牛", buffID = 22728, buffDesc = "三代变异蛮牛图鉴激活：全攻击+1900全防御+1900"},
    {index = 20,useyuan=1, dai=3 ,targetID = 2726, targetName = "三代变异凤凰", buffID = 22729, buffDesc = "三代变异凤凰图鉴激活：全攻击+2000全防御+2000"},
    {index = 21,useyuan=1, dai=3 ,targetID = 2736, targetName = "三代变异猛犸", buffID = 22730, buffDesc = "三代变异猛犸图鉴激活：全攻击+2100全防御+2100"},
    {index = 24,useyuan=1, dai=3 ,targetID = 3706, targetName = "三代变异赤磷奎龙", buffID = 22733, buffDesc = "三代变异赤磷奎龙图鉴激活：全攻击+2400全防御+2400"},
    {index = 25,useyuan=1, dai=3 ,targetID = 3716, targetName = "三代变异蛟尾虬龙", buffID = 22734, buffDesc = "三代变异蛟尾虬龙图鉴激活：全攻击+2500全防御+2500"},
    {index = 26,useyuan=1, dai=3 ,targetID = 3726, targetName = "三代变异钢髯应龙", buffID = 22735, buffDesc = "三代变异钢髯应龙图鉴激活：全攻击+2600全防御+2600"},
    {index = 27,useyuan=1, dai=3 ,targetID = 3736, targetName = "三代变异钢齿暴龙", buffID = 22736, buffDesc = "三代变异钢齿暴龙图鉴激活：全攻击+2700全防御+2700"},
    {index = 30,useyuan=1, dai=3 ,targetID = 4006, targetName = "三代变异赤鳞饕餮", buffID = 22739, buffDesc = "三代变异赤鳞饕餮图鉴激活：全攻击+3000全防御+3000"},
    {index = 31,useyuan=1, dai=3 ,targetID = 4026, targetName = "三代变异九色毕方", buffID = 22740, buffDesc = "三代变异九色毕方图鉴激活：全攻击+3100全防御+3100"},
    {index = 32,useyuan=1, dai=3 ,targetID = 4036, targetName = "三代变异银脊?杌", buffID = 22741, buffDesc = "三代变异银脊?杌图鉴激活：全攻击+3200全防御+3200"},
    {index = 33,useyuan=1, dai=3 ,targetID = 4046, targetName = "三代变异吞天烛龙", buffID = 22742, buffDesc = "三代变异吞天烛龙图鉴激活：全攻击+3300全防御+3300"},

}

x930203_var_targetid =12930106
x930203_var_targetname ="万能坐骑碎片"
x930203_var_3fhorse = {
    {min=2301,max=2340,name="30级副本坐骑",num=1},
    {min=2501,max=2540,name="50级副本坐骑",num=1},
    {min=2701,max=2740,name="70级副本坐骑",num=1},
    {min=3701,max=3740,name="80级副本坐骑",num=1},
    {min=4001,max=4040,name="100级副本坐骑",num=1},
}
x930203_var_QuestName  = "【回收】#R坐骑"


function x930203_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
    if seleteId == 880 then

        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y请选择您要回收的坐骑\n")

        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930203_var_FileId, -1);

        StartGCDTask( varMap);
        GCDAppendInt( varMap, x930203_var_FileId);
        GCDAppendInt( varMap, 0);
        GCDAppendInt( varMap, varTalknpc);
        DeliverGCDInfo( varMap, varPlayer, 101);
        StopGCDTask( varMap)

    end

end

function x930203_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, 0)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, 0)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 0)

    TalkAppendButton(varMap,x930203_var_FileId,x930203_var_QuestName,3,880);

    StartGCDTask( varMap)
    DeliverGCDInfo( varMap, varPlayer, 102)
    StopGCDTask( varMap)
end

function x930203_ProcAccept( varMap, varPlayer )

	x930203_Accept( varMap, varPlayer )
	
end

function x930203_Accept( varMap, varPlayer )
    if GetBagSpace(varMap, varPlayer) < 1 then
        Msg2Player(varMap, varPlayer,"需要至少1格空余背包位置才能兑换！",8,2)
        Msg2Player(varMap, varPlayer,"需要至少1格空余背包位置才能兑换！",8,3)
        return 0
    end

    local high = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH)
    local low = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW)
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)

    if IsHaveHorse( varMap, varPlayer, PetID) == 0 then
        Msg2Player(varMap, varPlayer,"找不到您提交的马！",8,3)
        Msg2Player(varMap, varPlayer,"找不到您提交的马！",8,2)
        return
    end

    local item = nil
    for k,v in x930203_var_3fhorse do
        if PetID >= v.min and PetID <= v.max then
            item = v
        end
    end


    if item == nil or FreeHorse( varMap, varPlayer, high, low) ~= 1 then
        Msg2Player( varMap, varPlayer, "回收战马失败", 8, 3)
        Msg2Player( varMap, varPlayer, "回收战马失败", 8, 2)
        return
    end

    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, -1)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, -1)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, -1)

    --扣减成功
    StartItemTask(varMap)

    ItemAppendBind( varMap, x930203_var_targetid, item.num)
    local varRet = StopItemTask(varMap,varPlayer)

    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap,varPlayer)
        Msg2Player(varMap, varPlayer,"回收完成",8,3)
        Msg2Player(varMap, varPlayer,"回收完成",8,2)
        GamePlayScriptLog( varMap, varPlayer, 2670)
    else
        StartTalkTask(varMap)
        TalkAppendString(varMap,"物品栏已满，无法获得物品！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
    end
end
		
function x930203_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x930203_ProcCommitPet( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, varIndex)



    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)
    local takeLevel = GetPet_TakeLevel( varMap, varPlayer, varIndex)


    local item = nil
    for k,v in x930203_var_3fhorse do
        if PetID >= v.min and PetID <= v.max then
            item = v
        end
    end


    if item ~= nil then

        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【回收】坐骑" )
        TalkAppendString( varMap, "\t想将这匹战马交给我吗？放心，我不会亏待你的。" )
        StopTalkTask()

        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930203_var_FileId, -1)

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


function x930203_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930203_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930203_CheckSubmit( varMap, varPlayer )

end




function x930203_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930203_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930203_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930203_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
