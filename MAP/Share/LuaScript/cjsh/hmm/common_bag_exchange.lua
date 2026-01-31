
--DECLARE_QUEST_INFO_START--

x570106_var_FileId = 570106   

x570106_var_SelectIndex = {}

-- 兑换目标道具名称
x570106_var_TargetName = "#R包治百病"

-- 兑换目标道具ID
x570106_var_ExcObjID = {
{index = 1 ,targetID = 19010011, targetName = "雕翎锦线包【36格】", needName = "金丝锦绣包", needID = 19010033, needItemNum = 2},
{index = 2 ,targetID = 19010034, targetName = "巨无霸【36格】", needName = "金丝锦绣包", needID = 19010033, needItemNum = 2},
{index = 3 ,targetID = 19010033, targetName = "金丝锦绣包【35格】", needName = "银边锦绣包", needID = 19010032, needItemNum = 2},
{index = 4 ,targetID = 19010032, targetName = "银边锦绣包【34格】", needName = "星纹缎包", needID = 19010031, needItemNum = 2},
{index = 5 ,targetID = 19010031, targetName = "星纹缎包【33格】", needName = "特染缎包", needID = 19010030, needItemNum = 2},
{index = 6 ,targetID = 19010030, targetName = "特染缎包【32格】", needName = "双面缎包", needID = 19010029, needItemNum = 2},
{index = 7 ,targetID = 19010029, targetName = "双面缎包【31格】", needName = "闪色绸包", needID = 19010028, needItemNum = 2},
{index = 8 ,targetID = 19010028, targetName = "闪色绸包【30格】", needName = "印花绸包", needID = 19010027, needItemNum = 2},
{index = 9 ,targetID = 19010027, targetName = "印花绸包【29格】", needName = "素色绸包", needID = 19010026, needItemNum = 2},
{index = 10 ,targetID = 19010026, targetName = "素色绸包【28格】", needName = "羊皮包", needID = 19010003, needItemNum = 2},
}
-- 兑换道具名称
x570106_var_ExcItemName = "素色绸包"
-- 兑换道具ID
x570106_var_ExcItemID = 19010026
-- 兑换道具需要数量
x570106_var_ExcItemNum = 10

--除了需要包外，还需要图样
x570106_var_tuyang = {
    {id=11000809,name="完整的碎布包图样",num=1},
    {id=11000810,name="残破的背包图样",num=3},
    {id=11000811,name="完整的粗布包图样",num=1},
    {id=11000812,name="完整的棉布包图样",num=1},
    {id=11000813,name="完整的硝制皮包图样",num=1},
    {id=11000814,name="完整的翻毛皮包图样",num=1},
    {id=11000815,name="完整的绒面皮包图样",num=1},
    {id=11000816,name="完整的素色绸包图样",num=1},
}

--奖励10D金卡
x570106_var_jinka = 10000000

x570106_var_QuestName = "【兑换】%s"
x570106_var_QuestName1 = "【包治百病说明】"
x570106_var_Questintro = "\t你可以在我这里兑换#G稀世奇有#W的包，10个素色绸包就可以兑换36格包。"
x570106_var_Questintro1 ="\n\t#G素色绸包#W：大都仓库npc处合成，也可由羊皮包兑换或者印度河随机boss掉落。羊皮包18魔君和印度河随机boss掉落。\n\t#G加油，慢慢肝#W"
x570106_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x570106_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x570106_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..format(x570106_var_QuestName,x570106_var_TargetName))
        TalkAppendString(varMap,x570106_var_Questintro)

        TalkAppendButton( varMap, x570106_var_FileId, "【兑换】一键自动", 3, 1000 )

        for varI, item in x570106_var_ExcObjID  do
            TalkAppendButton( varMap, x570106_var_FileId, "【兑换】"..item.targetName, 3, varI )
        end
        TalkAppendButton(varMap, x570106_var_FileId, x570106_var_QuestName1,0,getn(x570106_var_ExcObjID)+1)
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	
	if seleteId >= 1 and seleteId <= getn(x570106_var_ExcObjID) then
		x570106_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x570106_var_ExcObjID[seleteId].needID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570106_var_ExcObjID[seleteId].needName)
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..format(x570106_var_QuestName,x570106_var_ExcObjID[seleteId].targetName))
        TalkAppendString(varMap,format(x570106_var_QuestInfo,x570106_var_ExcObjID[seleteId].needName,x570106_var_ExcObjID[seleteId].targetName,x570106_var_ExcObjID[seleteId].needItemNum,x570106_var_ExcObjID[seleteId].needName))
        TalkAppendString(varMap,varText)
        AddQuestItemBonus(varMap, x570106_var_ExcObjID[seleteId].targetID, 1)
        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570106_var_FileId, -1);
	end
	if seleteId == getn(x570106_var_ExcObjID) + 1 then
        x570106_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x570106_var_QuestName1)
        TalkAppendString(varMap,x570106_var_Questintro1)
        StopTalkTask()
        --DeliverTalkInfo(varMap, varPlayer, varTalknpc, -1, -1);
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    end

    if seleteId == 1000 then--一键自动
        x570106_Autoexchange(varMap, varPlayer)
    end

end


function x570106_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570106_var_FileId,format(x570106_var_QuestName,x570106_var_TargetName),3,-1);
	
end

function x570106_ProcAccept( varMap, varPlayer )

	x570106_Accept( varMap, varPlayer )
	
end

function x570106_Accept( varMap, varPlayer )

    for ii=1 , 100  do--兑换10次

        if GetBagSpace(varMap, varPlayer) < 1 then
            Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
            Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
            return 0
        end
        local bind = 0

        local selectItem = x570106_var_ExcObjID[x570106_var_SelectIndex[GetGUID(varMap, varPlayer)]]
        local Num = GetItemCount( varMap, varPlayer, selectItem.needID )

        if Num < selectItem.needItemNum then -- 道具数量不足
            StartTalkTask(varMap)
            TalkAppendString(varMap,format(x570106_var_QuestError,selectItem.needName,x570106_var_ExcObjID[x570106_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
            StopTalkTask()
            DeliverTalkTips(varMap, varPlayer)
            return
        end

        --只有最初级的包才需要再判断图样是否足够
        if selectItem.index == 10 then
            for tyindex,tyitem in x570106_var_tuyang do
                local curNum=GetItemCount( varMap, varPlayer, tyitem.id )
                if curNum < tyitem.num then
                    local str = format("需要%d个%s来兑换%s，您当前有%d个",tyitem.num,tyitem.name,selectItem.targetName,curNum)
                    Msg2Player(varMap, varPlayer,str,8,2)
                    Msg2Player(varMap, varPlayer,str,8,3)
                    return 0
                end
            end


            --都足够，开始扣除材料
            for tyindex,tyitem in x570106_var_tuyang do
                if DelItem(varMap,varPlayer,tyitem.id,tyitem.num) ~= 1 then
                    local str = format("扣除%d个%s失败", tyitem.num, tyitem.name)
                    Msg2Player(varMap, varPlayer,str,8,2)
                    Msg2Player(varMap, varPlayer,str,8,3)
                    return 0
                end
            end
        end




        if DelItem(varMap,varPlayer,selectItem.needID,selectItem.needItemNum) ~= 1 then
            local str = format("扣除%d个%s失败", selectItem.needItemNum, selectItem.needName)
            Msg2Player(varMap, varPlayer,str,8,2)
            Msg2Player(varMap, varPlayer,str,8,3)
            return 0
        end

        local bonusid = x570106_var_ExcObjID[x570106_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
        StartItemTask(varMap)

        if bind == 1 then
            ItemAppendBind( varMap, bonusid, 1)
        elseif bind == 0 then
            ItemAppendBind( varMap, bonusid, 1)
        end
        local varRet = StopItemTask(varMap,varPlayer)

        if varRet > 0 then
            DeliverItemListSendToPlayer(varMap,varPlayer)
            Msg2Player(varMap, varPlayer,"兑换完成",8,3)
            GamePlayScriptLog( varMap, varPlayer, 3870)

            if selectItem.index <= 2 then
                --兑换了36格，发10D金卡，并上电视
                AddMoney(varMap, varPlayer, 3, x570106_var_jinka)

                local mesage = format("恭喜#R%s#cffcc00牛逼坏了，兑换了逆天的#R%s#cffcc00。系统奖励10D金卡", GetName(varMap, varPlayer),selectItem.targetName )
                LuaAllScenceM2Wrold(varMap, mesage, CHAT_PLANE_SCROLL, 1)
                LuaAllScenceM2Wrold(varMap, mesage, CHAT_LEFTDOWN, 1)
                LuaAllScenceM2Wrold(varMap, mesage, CHAT_MAIN_RIGHTDOWN, 1)

            end

        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"物品栏已满，无法获得物品！")
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
        end


    end

end
function x570106_Autoexchange( varMap, varPlayer )

    for mm=1 , getn(x570106_var_ExcObjID)  do
        local seleteId = getn(x570106_var_ExcObjID)+1-mm

        for ii=1 , 100  do--兑换10次

            if GetBagSpace(varMap, varPlayer) < 1 then
                Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
                Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
                return 0
            end
            local bind = 0

            local selectItem = x570106_var_ExcObjID[seleteId]
            local Num = GetItemCount( varMap, varPlayer, selectItem.needID )

            if Num < selectItem.needItemNum then -- 道具数量不足
                break
            else

                local Num = selectItem.needItemNum
                for i=1 , Num  do
                    local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, selectItem.needID)
                    if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
                        bind = 1
                    end
                    if DelItem(varMap,varPlayer,selectItem.needID,1) ~= 1 then return end
                end

                local bonusid = x570106_var_ExcObjID[seleteId].targetID
                StartItemTask(varMap)

                if bind == 1 then
                    ItemAppendBind( varMap, bonusid, 1)
                elseif bind == 0 then
                    ItemAppend( varMap, bonusid, 1)
                end
                local varRet = StopItemTask(varMap,varPlayer)

                if varRet > 0 then
                    DeliverItemListSendToPlayer(varMap,varPlayer)
                    Msg2Player(varMap, varPlayer,"兑换完成",8,3)
                    GamePlayScriptLog( varMap, varPlayer, 3870)

                    if x570106_var_ExcObjID[seleteId].index <= 2 then
                        --兑换了36格，发10D金卡，并上电视
                        AddMoney(varMap, varPlayer, 3, x570106_var_jinka)

                        local mesage = format("恭喜#R%s#cffcc00牛逼坏了，兑换了逆天的#R%s#cffcc00。系统奖励10D金卡", GetName(varMap, varPlayer),x570106_var_ExcObjID[seleteId].targetName )
                        LuaAllScenceM2Wrold(varMap, mesage, CHAT_PLANE_SCROLL, 1)
                        LuaAllScenceM2Wrold(varMap, mesage, CHAT_LEFTDOWN, 1)
                        LuaAllScenceM2Wrold(varMap, mesage, CHAT_MAIN_RIGHTDOWN, 1)

                    end

                else
                    StartTalkTask(varMap)
                    TalkAppendString(varMap,"物品栏已满，无法获得物品！")
                    StopTalkTask(varMap)
                    DeliverTalkTips(varMap,varPlayer)
                    return 0
                end
            end
        end

    end



end

function x570106_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570106_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570106_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570106_CheckSubmit( varMap, varPlayer )

end




function x570106_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570106_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570106_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570106_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
