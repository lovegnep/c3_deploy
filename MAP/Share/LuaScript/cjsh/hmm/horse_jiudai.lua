
--DECLARE_QUEST_INFO_START--

x930133_var_FileId = 930133

x930133_var_SelectIndex = {}

-- 兑换目标道具名称
x930133_var_TargetName = "#R九代坐骑"
-- 兑换目标道具ID
x930133_var_ExcObjID = {
	{index = 1 ,targetID = 12272500, targetName = "九代迷你塔布羊", needID = 1592, needName = "七代变异迷你塔布羊"},
	{index = 2 ,targetID = 12272501, targetName = "九代迷你独角兽", needID = 1436, needName = "七代变异迷你独角兽"},
	{index = 3 ,targetID = 12272502, targetName = "九代迷你玉兔", needID = 1330, needName = "七代变异迷你玉兔"},
	{index = 4 ,targetID = 12272503, targetName = "九代迷你天命猫妖", needID = 1580, needName = "七代变异迷你天命猫妖"},
	{index = 5 ,targetID = 12272504, targetName = "九代迷你黄金麒麟", needID = 1412, needName = "七代变异迷你黄金麒麟"},
	{index = 6 ,targetID = 12272505, targetName = "九代迷你雷芒雨工", needID = 1556, needName = "七代变异迷你雷芒雨工"},
}
-- 兑换道具名称
x930133_var_ExcItemName = "战神令"
-- 兑换道具ID
x930133_var_ExcItemID = 11000334
-- 兑换道具需要数量
x930133_var_ExcItemNum = 1000
-- 绝版骑乘兑换券
x930133_var_dhqNum = 1
x930133_var_dhqName = "绝版骑乘兑换券"
x930133_var_dhqID = 12030093
-- 九代骑乘繁殖丹
x930133_var_fzdNum = 10
x930133_var_fzdName = "九代骑乘繁殖丹"
x930133_var_fzdID = 12034006

x930133_var_QuestName = "【兑换】%s"
x930133_var_Questintro = "\t你可以用珍贵的战神令在我这里兑换#W九代坐骑，1500个战神令+珍稀道具就可以兑换任意一个九代坐骑。"
x930133_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。\n\t将需要#R%d个#W#G%s#W。\n\t将需要#R%d个#W#G%s#W。\n\t将需要#R1个#W#G%s#W。"
x930133_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x930133_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)

	if seleteId == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930133_var_QuestName,x930133_var_TargetName))
		TalkAppendString(varMap,x930133_var_Questintro)
		for varI, item in x930133_var_ExcObjID  do
			TalkAppendButton( varMap, x930133_var_FileId, "【兑换】"..item.targetName, 3, varI )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930133_var_ExcObjID) then
		x930133_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
        local targetItem = x930133_var_ExcObjID[seleteId]
		local varItemNum = GetItemCount(varMap, varPlayer, x930133_var_ExcItemID)
		local dhqNum = GetItemCount(varMap, varPlayer, x930133_var_dhqID)
		local fzdNum = GetItemCount(varMap, varPlayer, x930133_var_fzdID)
        local horseNum = 0
        if IsHaveHorse( varMap, varPlayer, targetItem.needID) == 0 then
            horseNum = 0
        else
            horseNum = 1
        end

		local varText = format("\t您现在有#R%d个#W#G%s#W！\t您现在有#R%d个#W#G%s#W！\t您现在有#R%d个#W#G%s#W！\t您现在有#R%d个#W#G%s#W！", varItemNum, x930133_var_ExcItemName, dhqNum, x930133_var_dhqName,fzdNum,x930133_var_fzdName, horseNum, targetItem.needName)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930133_var_QuestName,x930133_var_ExcObjID[seleteId].targetName))
		TalkAppendString(varMap,format(x930133_var_QuestInfo,x930133_var_ExcItemName,x930133_var_ExcObjID[seleteId].targetName,x930133_var_ExcItemNum,x930133_var_ExcItemName,x930133_var_dhqNum,x930133_var_dhqName,x930133_var_fzdNum,x930133_var_fzdName,targetItem.needName))
		TalkAppendString(varMap,varText)
		AddQuestItemBonus(varMap, x930133_var_ExcObjID[seleteId].targetID, 1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930133_var_FileId, -1);
	end

end


function x930133_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930133_var_FileId,format(x930133_var_QuestName,x930133_var_TargetName),3,-1);

end

function x930133_ProcAccept( varMap, varPlayer )

	x930133_Accept( varMap, varPlayer )

end

function x930133_Accept( varMap, varPlayer )
    local seleteId = x930133_var_SelectIndex[GetGUID(varMap, varPlayer)]
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0

    local targetItem = x930133_var_ExcObjID[seleteId]

	local Num = GetItemCount( varMap, varPlayer, x930133_var_ExcItemID )
	local dhqNum = GetItemCount(varMap, varPlayer, x930133_var_dhqID)
	local fzdNum = GetItemCount(varMap, varPlayer, x930133_var_fzdID)
    local horseNum = 0
    if IsHaveHorse( varMap, varPlayer, targetItem.needID) == 0 then
        horseNum = 0
    else
        horseNum = 1
    end

    if horseNum <= 0 then -- 道具数量不足
        StartTalkTask(varMap)
        TalkAppendString(varMap,format(x930133_var_QuestError,targetItem.needName,x930133_var_ExcObjID[x930133_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
        StopTalkTask()
        DeliverTalkTips(varMap, varPlayer)
        return
    end

	if dhqNum < x930133_var_dhqNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x930133_var_QuestError,x930133_var_dhqName,x930133_var_ExcObjID[x930133_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		return
	end
	if fzdNum < x930133_var_fzdNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x930133_var_QuestError,x930133_var_fzdName,x930133_var_ExcObjID[x930133_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		return
	end

	if Num < x930133_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x930133_var_QuestError,x930133_var_ExcItemName,x930133_var_ExcObjID[x930133_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)

	else

        FreeHorseByType(varMap, varPlayer,targetItem.needID)
        Msg2Player(varMap, varPlayer,"删除马"..targetItem.needID.."成功",8,3)

		local Num = x930133_var_ExcItemNum
		for i=1 , Num  do
			local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x930133_var_ExcItemID)
			if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
				bind = 1
			end
			if DelItem(varMap,varPlayer,x930133_var_ExcItemID,1) ~= 1 then return end
		end
		for i=1 , dhqNum  do
			local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x930133_var_dhqID)
			if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
				bind = 1
			end
			if DelItem(varMap,varPlayer,x930133_var_dhqID,1) ~= 1 then return end
		end
		for i=1 , fzdNum  do
			local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x930133_var_fzdID)
			if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
				bind = 1
			end
			if DelItem(varMap,varPlayer,x930133_var_fzdID,1) ~= 1 then return end
		end

		local bonusid = x930133_var_ExcObjID[x930133_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
			GamePlayScriptLog( varMap, varPlayer, 2670)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end

function x930133_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930133_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930133_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930133_CheckSubmit( varMap, varPlayer )

end




function x930133_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930133_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930133_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930133_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
