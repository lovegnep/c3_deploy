
--DECLARE_QUEST_INFO_START--

x930164_var_FileId = 930164

x930164_var_SelectIndex = {}

-- 兑换目标道具名称
x930164_var_TargetName = "#R战神藏宝图"
x930164_var_TargetID = 12274091
x930164_var_Targetnum = 50
-- 兑换目标道具ID
x930164_var_ExcObjID = {
	{index = 1 ,targetID = 12274092, targetName = "战神寻宝图碎片上", num = 50},
	{index = 1 ,targetID = 12274093, targetName = "战神寻宝图碎片中", num = 50},
	{index = 1 ,targetID = 12274094, targetName = "战神寻宝图碎片下", num = 50},
}


x930164_var_QuestName = "【兑换】%s"
x930164_var_Questintro = "\t你可以用珍贵的战神令在我这里兑换#W九代坐骑，1500个战神令+珍稀道具就可以兑换任意一个九代坐骑。"
x930164_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。\n\t将需要#R%d个#W#G%s#W。\n\t将需要#R%d个#W#G%s#W。\n\t将需要#R1个#W#G%s#W。"
x930164_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"




function x930164_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)


	if seleteId == -1 then


		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930164_var_QuestName,x930164_var_TargetName))

        local str = format("\t您确定要兑换#G%s#W吗？将需要以下道具",x930164_var_TargetName)
        for varI, item in x930164_var_ExcObjID do
            str = str..format("\n#R%d#W个#G%s#W", item.num, item.targetName)
        end

		TalkAppendString(varMap,str)
		AddQuestItemBonus(varMap, x930164_var_TargetID, x930164_var_Targetnum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930164_var_FileId, -1);
	end

end


function x930164_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930164_var_FileId,format(x930164_var_QuestName,x930164_var_TargetName),3,-1);

end

function x930164_ProcAccept( varMap, varPlayer )

	x930164_Accept( varMap, varPlayer )

end

function x930164_Accept( varMap, varPlayer )
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
    for varI, item in x930164_var_ExcObjID do
        local count = GetItemCount(varMap, varPlayer, item.targetID)
        if count < item.num then
            Msg2Player(varMap, varPlayer,format("%s数量不足", item.targetName),8,2)
            Msg2Player(varMap, varPlayer,format("%s数量不足", item.targetName),8,3)
            return 0
        end
    end

    --开始扣减
    for varI, item in x930164_var_ExcObjID do
        local count = GetItemCount(varMap, varPlayer, item.targetID)
        if count < item.num then
            Msg2Player(varMap, varPlayer,format("%s数量不足", item.targetName),8,2)
            Msg2Player(varMap, varPlayer,format("%s数量不足", item.targetName),8,3)
            return 0
        end

        if DelItem(varMap,varPlayer,item.targetID,item.num) ~= 1 then
            return
        end
    end

    --扣减成功
    StartItemTask(varMap)

    ItemAppendBind( varMap, x930164_var_TargetID, x930164_var_Targetnum)
    local varRet = StopItemTask(varMap,varPlayer)

    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap,varPlayer)
        Msg2Player(varMap, varPlayer,"兑换完成",8,3)
        GamePlayScriptLog( varMap, varPlayer, 2670)
    else
        StartTalkTask(varMap)
        TalkAppendString(varMap,"物品栏已满，无法获得物品！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
    end
end

function x930164_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930164_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930164_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930164_CheckSubmit( varMap, varPlayer )

end




function x930164_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930164_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930164_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930164_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
