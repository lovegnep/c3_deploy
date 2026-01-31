
--DECLARE_QUEST_INFO_START--

x570087_var_FileId = 570087   

x570087_var_SelectIndex = {}

-- 兑换目标道具名称
x570087_var_TargetName = "传说级洗石剂"

-- 兑换目标道具ID
x570087_var_ExcObjID = {
{index = 1 ,targetID = 11000906, targetName = "传说级洗石剂-莲华"},
{index = 2 ,targetID = 11000934, targetName = "传说级洗石剂-雪魂"},
{index = 3 ,targetID = 11000935, targetName = "传说级洗石剂-冰魄"},
{index = 4 ,targetID = 11000907, targetName = "神话级洗石剂"},
}

x570087_var_ExcObjID1 = {
{index = 1 ,targetID = 11000906, targetName = "传说级洗石剂-莲华"},
{index = 2 ,targetID = 11000934, targetName = "传说级洗石剂-雪魂"},
{index = 3 ,targetID = 11000935, targetName = "传说级洗石剂-冰魄"},
}

-- 兑换道具ID
x570087_var_ExcItemID = {
{targetID = 11990018, targetName = "传说级洗石剂-莲华碎片", excItemNum = 10, questInfo = "\n\t#G传说级洗石剂-莲华碎片#W通过开启#G洗石剂礼包（莲华）#W获得。"},
{targetID = 12272600, targetName = "传说级洗石剂-雪魂碎片", excItemNum = 10, questInfo = "\n\t#G传说级洗石剂-雪魂碎片#W通过开启#G洗石剂礼包（雪魂）#W获得。"},
{targetID = 12272601, targetName = "传说级洗石剂-冰魄碎片", excItemNum = 10, questInfo = "\n\t#G传说级洗石剂-冰魄碎片#W通过开启#G洗石剂礼包（冰魄）#W获得。"},
{targetID = 11000966, targetName = "神话级洗石剂碎片", excItemNum = 10, questInfo = "\n\t#G神话级洗石剂碎片#W通过开启#G洗石剂礼包#W获得。"},
{targetID = 11000936, targetName = "雪山之星", excItemNum = 140, questInfo = "\n\t#G雪山之星#W通过#G宝石回收#W获得。"},
{targetID = 11000936, targetName = "雪山之星", excItemNum = 70, questInfo = "\n\t#G雪山之星#W通过#G宝石回收#W获得。"},
{targetID = 11000936, targetName = "雪山之星", excItemNum = 70, questInfo = "\n\t#G雪山之星#W通过#G宝石回收#W获得。"},
}

x570087_var_QuestName  = "【兑换】使用洗石剂碎片"
x570087_var_QuestName1 = "【兑换】使用雪山之星"
x570087_var_Questintro =  "\t你可以用珍贵的#G传说级洗石剂-莲华碎片#W、#G传说级洗石剂-雪魂碎片#W、#G传说级洗石剂-冰魄碎片#W在我处兑换#G传说级洗石剂-莲华#W，#G传说级洗石剂-雪魂#W和#G传说级洗石剂-冰魄#W。"
x570087_var_Questintro1 =  "\t你可以用珍贵的#G雪山之星#W在我处兑换#G传说级洗石剂-雪魂#W和#G传说级洗石剂-冰魄#W以及#G传说级洗石剂-莲华#W。"
x570087_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x570087_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x570087_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 881209 then--使用碎片
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x570087_var_QuestName,x570087_var_TargetName))
			TalkAppendString(varMap,x570087_var_Questintro)
			for varI, item in x570087_var_ExcObjID  do
				TalkAppendButton( varMap, x570087_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif seleteId == 881210 then--使用雪山之星
		StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..format(x570087_var_QuestName1,x570087_var_TargetName))
        TalkAppendString(varMap,x570087_var_Questintro1)
        for varI,item in x570087_var_ExcObjID1  do
            TalkAppendButton( varMap, x570087_var_FileId, "【兑换】"..item.targetName, 3, getn(x570087_var_ExcObjID)+varI )
        end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	if seleteId >= 1 and seleteId <= getn(x570087_var_ExcObjID) then
		x570087_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x570087_var_ExcItemID[seleteId].targetID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570087_var_ExcItemID[seleteId].targetName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x570087_var_QuestName,x570087_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x570087_var_QuestInfo,x570087_var_ExcItemID[seleteId].targetName,x570087_var_ExcObjID[seleteId].targetName,x570087_var_ExcItemID[seleteId].excItemNum,x570087_var_ExcItemID[seleteId].targetName))
				TalkAppendString(varMap,varText)
				TalkAppendString(varMap,x570087_var_ExcItemID[seleteId].questInfo)
				AddQuestItemBonus(varMap, x570087_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570087_var_FileId, -1);
	elseif seleteId >= getn(x570087_var_ExcObjID)+1 and seleteId <= getn(x570087_var_ExcObjID)+getn(x570087_var_ExcObjID1) then
		x570087_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x570087_var_ExcItemID[seleteId].targetID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570087_var_ExcItemID[seleteId].targetName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x570087_var_QuestName,x570087_var_ExcObjID1[seleteId-getn(x570087_var_ExcObjID)].targetName))
				TalkAppendString(varMap,format(x570087_var_QuestInfo,x570087_var_ExcItemID[seleteId].targetName,x570087_var_ExcObjID1[seleteId-getn(x570087_var_ExcObjID)].targetName,x570087_var_ExcItemID[seleteId].excItemNum,x570087_var_ExcItemID[seleteId].targetName))
				TalkAppendString(varMap,varText)
				TalkAppendString(varMap,x570087_var_ExcItemID[seleteId].questInfo)
				AddQuestItemBonus(varMap, x570087_var_ExcObjID1[seleteId-getn(x570087_var_ExcObjID)].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570087_var_FileId, -1);		
	end

end


function x570087_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570087_var_FileId,format(x570087_var_QuestName ,x570087_var_TargetName),3,881209);
		TalkAppendButton(varMap,x570087_var_FileId,format(x570087_var_QuestName1,x570087_var_TargetName),3,881210);
	
end

function x570087_ProcAccept( varMap, varPlayer )

    --批量兑换10次
    for i=1 , 10  do
        local result = x570087_Accept( varMap, varPlayer )
        if result == 0 then
            --说明兑换失败了，不要继续了
            return
        end
    end

	
end

function x570087_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
		local SelectedInfo ={}
	if x570087_var_SelectIndex[GetGUID(varMap, varPlayer)] >=1 and x570087_var_SelectIndex[GetGUID(varMap, varPlayer)] <= getn(x570087_var_ExcObjID) then
		SelectedInfo = x570087_var_ExcObjID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]]
	elseif x570087_var_SelectIndex[GetGUID(varMap, varPlayer)] >=getn(x570087_var_ExcObjID)+1 and x570087_var_SelectIndex[GetGUID(varMap, varPlayer)] <= getn(x570087_var_ExcObjID)+getn(x570087_var_ExcObjID1) then
		SelectedInfo = x570087_var_ExcObjID1[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]-getn(x570087_var_ExcObjID)]
	end
	
	local Num = GetItemCount( varMap, varPlayer, x570087_var_ExcItemID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID )

	if Num < x570087_var_ExcItemID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]].excItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x570087_var_QuestError,x570087_var_ExcItemID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName,SelectedInfo.targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		return 0
	else
	
		local Num = x570087_var_ExcItemID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]].excItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570087_var_ExcItemID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x570087_var_ExcItemID[x570087_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID,1) ~= 1 then
                return 0
            end
		end
		
		local bonusid = SelectedInfo.targetID
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
				GamePlayScriptLog( varMap, varPlayer, 2680)
            return 1
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
            return 0
		end
	end
end
		
function x570087_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570087_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570087_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570087_CheckSubmit( varMap, varPlayer )

end




function x570087_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570087_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570087_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570087_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
