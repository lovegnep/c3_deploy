
--DECLARE_QUEST_INFO_START--

x930186_var_FileId = 930186   

x930186_var_SelectIndex = {}

-- 兑换目标道具ID
x930186_var_ExcObjID = {
    {index=1, level=100,buffID=9300,buffDesc="万族征伐录 Lv.1 (草原试猎)：全属性+50"},
    {index=2, level=300,buffID=9301,buffDesc="万族征伐录 Lv.2 (草原试猎)：全属性+100"},
    {index=3, level=600,buffID=9302,buffDesc="万族征伐录 Lv.3 (草原试猎)：全属性+150"},
    {index=4, level=1000,buffID=9303,buffDesc="万族征伐录 Lv.4 (草原试猎)：全属性+200"},
    {index=5, level=1500,buffID=9304,buffDesc="万族征伐录 Lv.5 (草原试猎)：全属性+250"},
    {index=6, level=2100,buffID=9305,buffDesc="万族征伐录 Lv.6 (草原试猎)：全属性+300"},
    {index=7, level=2800,buffID=9306,buffDesc="万族征伐录 Lv.7 (草原试猎)：全属性+350"},
    {index=8, level=3600,buffID=9307,buffDesc="万族征伐录 Lv.8 (草原试猎)：全属性+400"},
    {index=9, level=4500,buffID=9308,buffDesc="万族征伐录 Lv.9 (草原试猎)：全属性+450"},
    {index=10, level=5500,buffID=9309,buffDesc="万族征伐录 Lv.10 (草原试猎)：全属性+500"},
    {index=11, level=6600,buffID=9310,buffDesc="万族征伐录 Lv.11 (铁骑初征)：全属性+550"},
    {index=12, level=7800,buffID=9311,buffDesc="万族征伐录 Lv.12 (铁骑初征)：全属性+600"},
    {index=13, level=9100,buffID=9312,buffDesc="万族征伐录 Lv.13 (铁骑初征)：全属性+650"},
    {index=14, level=10500,buffID=9313,buffDesc="万族征伐录 Lv.14 (铁骑初征)：全属性+700"},
    {index=15, level=12000,buffID=9314,buffDesc="万族征伐录 Lv.15 (铁骑初征)：全属性+750"},
    {index=16, level=13600,buffID=9315,buffDesc="万族征伐录 Lv.16 (铁骑初征)：全属性+800"},
    {index=17, level=15300,buffID=9316,buffDesc="万族征伐录 Lv.17 (铁骑初征)：全属性+850"},
    {index=18, level=17100,buffID=9317,buffDesc="万族征伐录 Lv.18 (铁骑初征)：全属性+900"},
    {index=19, level=19000,buffID=9318,buffDesc="万族征伐录 Lv.19 (铁骑初征)：全属性+950"},
    {index=20, level=21000,buffID=9319,buffDesc="万族征伐录 Lv.20 (铁骑初征)：全属性+1000"},
    {index=21, level=23100,buffID=9320,buffDesc="万族征伐录 Lv.21 (血战百族)：全属性+1050"},
    {index=22, level=25300,buffID=9321,buffDesc="万族征伐录 Lv.22 (血战百族)：全属性+1100"},
    {index=23, level=27600,buffID=9322,buffDesc="万族征伐录 Lv.23 (血战百族)：全属性+1150"},
    {index=24, level=30000,buffID=9323,buffDesc="万族征伐录 Lv.24 (血战百族)：全属性+1200"},
    {index=25, level=32500,buffID=9324,buffDesc="万族征伐录 Lv.25 (血战百族)：全属性+1250"},
    {index=26, level=35100,buffID=9325,buffDesc="万族征伐录 Lv.26 (血战百族)：全属性+1300"},
    {index=27, level=37800,buffID=9326,buffDesc="万族征伐录 Lv.27 (血战百族)：全属性+1350"},
    {index=28, level=40600,buffID=9327,buffDesc="万族征伐录 Lv.28 (血战百族)：全属性+1400"},
    {index=29, level=43500,buffID=9328,buffDesc="万族征伐录 Lv.29 (血战百族)：全属性+1450"},
    {index=30, level=46500,buffID=9329,buffDesc="万族征伐录 Lv.30 (血战百族)：全属性+1500"},
    {index=31, level=49600,buffID=9330,buffDesc="万族征伐录 Lv.31 (血战百族)：全属性+1550"},
    {index=32, level=52800,buffID=9331,buffDesc="万族征伐录 Lv.32 (血战百族)：全属性+1600"},
    {index=33, level=56100,buffID=9332,buffDesc="万族征伐录 Lv.33 (血战百族)：全属性+1650"},
    {index=34, level=59500,buffID=9333,buffDesc="万族征伐录 Lv.34 (血战百族)：全属性+1700"},
    {index=35, level=63000,buffID=9334,buffDesc="万族征伐录 Lv.35 (血战百族)：全属性+1750"},
    {index=36, level=66600,buffID=9335,buffDesc="万族征伐录 Lv.36 (血战百族)：全属性+1800"},
    {index=37, level=70300,buffID=9336,buffDesc="万族征伐录 Lv.37 (血战百族)：全属性+1850"},
    {index=38, level=74100,buffID=9337,buffDesc="万族征伐录 Lv.38 (血战百族)：全属性+1900"},
    {index=39, level=78000,buffID=9338,buffDesc="万族征伐录 Lv.39 (血战百族)：全属性+1950"},
    {index=40, level=82000,buffID=9339,buffDesc="万族征伐录 Lv.40 (血战百族)：全属性+2000"},
    {index=41, level=86100,buffID=9340,buffDesc="万族征伐录 Lv.41 (血战百族)：全属性+2050"},
    {index=42, level=90300,buffID=9341,buffDesc="万族征伐录 Lv.42 (血战百族)：全属性+2100"},
    {index=43, level=94600,buffID=9342,buffDesc="万族征伐录 Lv.43 (血战百族)：全属性+2150"},
    {index=44, level=99000,buffID=9343,buffDesc="万族征伐录 Lv.44 (血战百族)：全属性+2200"},
    {index=45, level=103500,buffID=9344,buffDesc="万族征伐录 Lv.45 (血战百族)：全属性+2250"},
    {index=46, level=108100,buffID=9345,buffDesc="万族征伐录 Lv.46 (血战百族)：全属性+2300"},
    {index=47, level=112800,buffID=9346,buffDesc="万族征伐录 Lv.47 (血战百族)：全属性+2350"},
    {index=48, level=117600,buffID=9347,buffDesc="万族征伐录 Lv.48 (血战百族)：全属性+2400"},
    {index=49, level=122500,buffID=9348,buffDesc="万族征伐录 Lv.49 (血战百族)：全属性+2450"},
    {index=50, level=127500,buffID=9349,buffDesc="万族征伐录 Lv.50 (血战百族)：全属性+2500"},
    {index=51, level=132600,buffID=9350,buffDesc="万族征伐录 Lv.51 (万族克星)：全属性+2550"},
    {index=52, level=137800,buffID=9351,buffDesc="万族征伐录 Lv.52 (万族克星)：全属性+2600"},
    {index=53, level=143100,buffID=9352,buffDesc="万族征伐录 Lv.53 (万族克星)：全属性+2650"},
    {index=54, level=148500,buffID=9353,buffDesc="万族征伐录 Lv.54 (万族克星)：全属性+2700"},
    {index=55, level=154000,buffID=9354,buffDesc="万族征伐录 Lv.55 (万族克星)：全属性+2750"},
    {index=56, level=159600,buffID=9355,buffDesc="万族征伐录 Lv.56 (万族克星)：全属性+2800"},
    {index=57, level=165300,buffID=9356,buffDesc="万族征伐录 Lv.57 (万族克星)：全属性+2850"},
    {index=58, level=171100,buffID=9357,buffDesc="万族征伐录 Lv.58 (万族克星)：全属性+2900"},
    {index=59, level=177000,buffID=9358,buffDesc="万族征伐录 Lv.59 (万族克星)：全属性+2950"},
    {index=60, level=183000,buffID=9359,buffDesc="万族征伐录 Lv.60 (万族克星)：全属性+3000"},
    {index=61, level=189100,buffID=9360,buffDesc="万族征伐录 Lv.61 (天命征服者)：全属性+3050"},
    {index=62, level=195300,buffID=9361,buffDesc="万族征伐录 Lv.62 (天命征服者)：全属性+3100"},
    {index=63, level=201600,buffID=9362,buffDesc="万族征伐录 Lv.63 (天命征服者)：全属性+3150"},
    {index=64, level=208000,buffID=9363,buffDesc="万族征伐录 Lv.64 (天命征服者)：全属性+3200"},
    {index=65, level=214500,buffID=9364,buffDesc="万族征伐录 Lv.65 (天命征服者)：全属性+3250"},
    {index=66, level=221100,buffID=9365,buffDesc="万族征伐录 Lv.66 (天命征服者)：全属性+3300"},
    {index=67, level=227800,buffID=9366,buffDesc="万族征伐录 Lv.67 (天命征服者)：全属性+3350"},
    {index=68, level=234600,buffID=9367,buffDesc="万族征伐录 Lv.68 (天命征服者)：全属性+3400"},
    {index=69, level=241500,buffID=9368,buffDesc="万族征伐录 Lv.69 (天命征服者)：全属性+3450"},
    {index=70, level=248500,buffID=9369,buffDesc="万族征伐录 Lv.70 (天命征服者)：全属性+3500"},
    {index=71, level=255600,buffID=9370,buffDesc="万族征伐录 Lv.71 (万族噩梦)：全属性+3550"},
    {index=72, level=262800,buffID=9371,buffDesc="万族征伐录 Lv.72 (万族噩梦)：全属性+3600"},
    {index=73, level=270100,buffID=9372,buffDesc="万族征伐录 Lv.73 (万族噩梦)：全属性+3650"},
    {index=74, level=277500,buffID=9373,buffDesc="万族征伐录 Lv.74 (万族噩梦)：全属性+3700"},
    {index=75, level=285000,buffID=9374,buffDesc="万族征伐录 Lv.75 (万族噩梦)：全属性+3750"},
    {index=76, level=292600,buffID=9375,buffDesc="万族征伐录 Lv.76 (万族噩梦)：全属性+3800"},
    {index=77, level=300300,buffID=9376,buffDesc="万族征伐录 Lv.77 (万族噩梦)：全属性+3850"},
    {index=78, level=308100,buffID=9377,buffDesc="万族征伐录 Lv.78 (万族噩梦)：全属性+3900"},
    {index=79, level=316000,buffID=9378,buffDesc="万族征伐录 Lv.79 (万族噩梦)：全属性+3950"},
    {index=80, level=324000,buffID=9379,buffDesc="万族征伐录 Lv.80 (万族噩梦)：全属性+4000"},
    {index=81, level=332100,buffID=9380,buffDesc="万族征伐录 Lv.81 (万族噩梦)：全属性+4050"},
    {index=82, level=340300,buffID=9381,buffDesc="万族征伐录 Lv.82 (万族噩梦)：全属性+4100"},
    {index=83, level=348600,buffID=9382,buffDesc="万族征伐录 Lv.83 (万族噩梦)：全属性+4150"},
    {index=84, level=357000,buffID=9383,buffDesc="万族征伐录 Lv.84 (万族噩梦)：全属性+4200"},
    {index=85, level=365500,buffID=9384,buffDesc="万族征伐录 Lv.85 (万族噩梦)：全属性+4250"},
    {index=86, level=374100,buffID=9385,buffDesc="万族征伐录 Lv.86 (万族噩梦)：全属性+4300"},
    {index=87, level=382800,buffID=9386,buffDesc="万族征伐录 Lv.87 (万族噩梦)：全属性+4350"},
    {index=88, level=391600,buffID=9387,buffDesc="万族征伐录 Lv.88 (万族噩梦)：全属性+4400"},
    {index=89, level=400500,buffID=9388,buffDesc="万族征伐录 Lv.89 (万族噩梦)：全属性+4450"},
    {index=90, level=409500,buffID=9389,buffDesc="万族征伐录 Lv.90 (万族噩梦)：全属性+4500"},
    {index=91, level=418600,buffID=9390,buffDesc="万族征伐录 Lv.91 (万族噩梦)：全属性+4550"},
    {index=92, level=427800,buffID=9391,buffDesc="万族征伐录 Lv.92 (万族噩梦)：全属性+4600"},
    {index=93, level=437100,buffID=9392,buffDesc="万族征伐录 Lv.93 (万族噩梦)：全属性+4650"},
    {index=94, level=446500,buffID=9393,buffDesc="万族征伐录 Lv.94 (万族噩梦)：全属性+4700"},
    {index=95, level=456000,buffID=9394,buffDesc="万族征伐录 Lv.95 (万族噩梦)：全属性+4750"},
    {index=96, level=465600,buffID=9395,buffDesc="万族征伐录 Lv.96 (万族噩梦)：全属性+4800"},
    {index=97, level=475300,buffID=9396,buffDesc="万族征伐录 Lv.97 (万族噩梦)：全属性+4850"},
    {index=98, level=485100,buffID=9397,buffDesc="万族征伐录 Lv.98 (万族噩梦)：全属性+4900"},
    {index=99, level=495000,buffID=9398,buffDesc="万族征伐录 Lv.99 (万族噩梦)：全属性+4950"},
    {index=100, level=505000,buffID=9399,buffDesc="万族征伐录 Lv.100 (大汗之威 满级)：全属性+5000"},

}


x930186_var_QuestName  = "【升级】#R万族征伐录"
--最小等级限制
x930186_var_minlevel = 60





function x930186_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
    local level = GetLevel(varMap, varPlayer)
    if level < x930186_var_minlevel then
        Msg2Player(varMap, varPlayer,format("等级不足%d！",x930186_var_minlevel),8,3)
        Msg2Player(varMap, varPlayer,format("等级不足%d！",x930186_var_minlevel),8,2)
        return
    end
    if seleteId == 880 then

        --查询当前buffid
        local curIndex = 0
        for varI, item in x930186_var_ExcObjID do
            local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
            if haveImpact > 0 then
                curIndex = varI
            end
        end

        local nextIndex = curIndex + 1
        if nextIndex > getn(x930186_var_ExcObjID) then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y您已经达到最大效果了")
            TalkAppendString(varMap,"\n")
            TalkAppendString(varMap,format("当前buff效果：#R%s#W",x930186_var_ExcObjID[curIndex].buffDesc))
            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930186_var_FileId, -1);
            return
        end

        local curJY = GetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3])


        StartTalkTask(varMap)
        TalkAppendString(varMap,format("#Y您当前是#G%d#W级\n您当前经验#G%d#W，升级到下级需要万族征伐录经验#G%d#W！\n下一级效果是：#R%s#W\n\n",curIndex,curJY,x930186_var_ExcObjID[nextIndex].level,x930186_var_ExcObjID[nextIndex].buffDesc))
        TalkAppendString(varMap,"下10级需要的经验如下\n")
        local strs = x930186_getnext10desc(varMap, varPlayer,nextIndex)
        local sss = ""
        for varI, ss in strs do
            sss = sss .. ss
        end
        TalkAppendString(varMap,sss)

        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930186_var_FileId, -1);

    end

end

function x930186_getnext10desc( varMap, varPlayer, nextIndex )



    local str = {}
    local ii = 1
    for varI, item in x930186_var_ExcObjID do
        if varI >= nextIndex and varI - nextIndex <= 10 then
            str[ii] = format("#G%d#W级需要#G%d#W经验\t效果#G%s#W\n\n", varI, item.level,item.buffDesc)
            ii = ii+1
        end
    end



    return str
end

function x930186_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

    StartTalkTask( varMap)
    TalkAppendString( varMap, "\t草原不需要怜悯，只记住胜者的名字。\n\t铁骑所至，万族皆俯首\n\t以血为墨，书写征服。" )
    TalkAppendButton(varMap,x930186_var_FileId,x930186_var_QuestName,3,880);
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x930186_ProcAccept( varMap, varPlayer )

	x930186_Accept( varMap, varPlayer )
	
end

function x930186_Accept( varMap, varPlayer )


    --查询当前buffid
    local curIndex = 0
    for varI, item in x930186_var_ExcObjID do
        local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
        if haveImpact > 0 then
            curIndex = varI
        end
    end

    local nextIndex = curIndex + 1
    if nextIndex > getn(x930186_var_ExcObjID) then
        Msg2Player(varMap, varPlayer,"您已经达到最大效果了！",8,3)
        Msg2Player(varMap, varPlayer,"您已经达到最大效果了！",8,2)
        return
    end

    local levelLimit = x930186_var_minlevel+nextIndex
    if GetLevel( varMap, varPlayer) < levelLimit then
        Msg2Player(varMap, varPlayer,format("人物等级需要达到%d", levelLimit),8,3)
        Msg2Player(varMap, varPlayer,format("人物等级需要达到%d", levelLimit),8,2)
        return
    end

    local curJY = GetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3])
    if curJY < x930186_var_ExcObjID[nextIndex].level then
        Msg2Player(varMap, varPlayer,format("万族征伐录经验不够，请继续肝吧"),8,3)
        Msg2Player(varMap, varPlayer,format("万族征伐录经验不够，请继续肝吧"),8,2)
        return
    end

    if curIndex > 0 then
        local varRet = CancelSpecificImpact( varMap, varPlayer, x930186_var_ExcObjID[curIndex].buffID)
        if varRet <= 0 then
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curIndex].buffID.."失败",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curIndex].buffID.."失败",8,2)
            return
        else
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curIndex].buffID.."成功",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curIndex].buffID.."成功",8,2)
        end
    end
    SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x930186_var_ExcObjID[nextIndex].buffID, 0);
    Msg2Player(varMap, varPlayer,"添加效果"..x930186_var_ExcObjID[nextIndex].buffID.."成功",8,3)
    Msg2Player(varMap, varPlayer,"添加效果"..x930186_var_ExcObjID[nextIndex].buffID.."成功",8,2)

    SetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3], 0)


    local name = GetName(varMap,varPlayer)
    local varMsg = format("恭喜玩家#R%s#W万族征伐录等级提升到#R%d#W级", name, nextIndex)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
end
		
function x930186_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x930186_ProcCommitPet( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, varIndex)

    --查询当前buffid
    local curIndex = 0
    for varI, item in x930186_var_ExcObjID do
        local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
        if haveImpact > 0 then
            curIndex = varI
        end
    end

    local nextIndex = curIndex + 1
    if nextIndex > getn(x930186_var_ExcObjID) then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y您已经达到最大效果了")
        TalkAppendString(varMap,"\n")
        TalkAppendString(varMap,format("当前buff效果：#R%s#W",x930186_var_ExcObjID[curIndex].buffDesc))
        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930186_var_FileId, -1);
        return
    end

    --判断需要哪个生命源龙
    local yldai = x930186_var_ExcObjID[nextIndex].dai + x930186_var_yuanlongadd
    if yldai > 7 then
        yldai = 7
    end
    local curYl = x930186_var_yuanlong[1]
    for varI, item in x930186_var_yuanlong do
        if item.dai == yldai then
            curYl = item
            break
        end
    end



    local ylid = -100
    local commonid = x930186_var_ExcObjID[nextIndex].targetID
    if x930186_var_ExcObjID[nextIndex].useyuan == 1 then
        ylid = curYl.id
    end



    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)
    local takeLevel = GetPet_TakeLevel( varMap, varPlayer, varIndex)


    if PetID == ylid or PetID == commonid then

        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【个人】图鉴升级" )
        TalkAppendString( varMap, "\t想将这匹战马交给我吗？放心，我不会亏待你的。" )
        StopTalkTask()

        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930186_var_FileId, -1)

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


function x930186_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930186_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930186_CheckSubmit( varMap, varPlayer )

end




function x930186_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930186_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930186_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930186_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


function x930186_Upwaronleveladd(varMap, varPlayer, change)
    if change <= 0 then
        return
    end
    local warlevel = GetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3])

    local curLevel = 0
    local nextLevel = 0
    for vari, item in x930186_var_ExcObjID do
        if item.level >= warlevel then
            curLevel = vari
        end
        if item.level >= warlevel+change then
            nextLevel = vari
        end
    end

    --保存最新
    SetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3],warlevel+change)


    if curLevel == nextLevel then
        --没有任何变化
        return
    end


    if curLevel > 0 then
        local varRet = CancelSpecificImpact( varMap, varPlayer, x930186_var_ExcObjID[curLevel].buffID)
        if varRet <= 0 then
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."失败",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."失败",8,2)
        else
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."成功",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."成功",8,2)
        end
    end
    SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x930186_var_ExcObjID[nextLevel].buffID, 0);
    Msg2Player(varMap, varPlayer,"添加效果"..x930186_var_ExcObjID[nextLevel].buffID.."成功",8,3)
    Msg2Player(varMap, varPlayer,"添加效果"..x930186_var_ExcObjID[nextLevel].buffID.."成功",8,2)

    local name = GetName(varMap,varPlayer)
    local varMsg = format("恭喜玩家#R%s#W万族征伐录buff等级升级到#R%d#W级", name, nextLevel)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)

end
function x930186_Upwaronleveldec(varMap, varPlayer, change)
    if change <= 0 then
        return
    end
    local warlevel = GetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3])

    local curLevel = 0
    local nextLevel = 0
    for vari, item in x930186_var_ExcObjID do
        if item.level >= warlevel then
            curLevel = vari
        end
        if item.level >= warlevel-change then
            nextLevel = vari
        end
    end

    local newval = warlevel-change
    if newval <= 0 then
        newval = 0
    end
    --保存最新
    SetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3],newval)


    if curLevel == nextLevel then
        --没有任何变化
        return
    end


    if curLevel > 0 then
        local varRet = CancelSpecificImpact( varMap, varPlayer, x930186_var_ExcObjID[curLevel].buffID)
        if varRet <= 0 then
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."失败",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."失败",8,2)
        else
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."成功",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930186_var_ExcObjID[curLevel].buffID.."成功",8,2)
        end
    end
    SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x930186_var_ExcObjID[nextLevel].buffID, 0);
    Msg2Player(varMap, varPlayer,"添加效果"..x930186_var_ExcObjID[nextLevel].buffID.."成功",8,3)
    Msg2Player(varMap, varPlayer,"添加效果"..x930186_var_ExcObjID[nextLevel].buffID.."成功",8,2)


    local name = GetName(varMap,varPlayer)
    local varMsg = format("很不幸，玩家#R%s#W万族征伐录buff等级下降到#R%d#W级", name, nextLevel)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
    LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
end
