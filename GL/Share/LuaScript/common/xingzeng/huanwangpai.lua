
--DECLARE_QUEST_INFO_START--

x588035_var_FileId = 588035   

x588035_var_SelectIndex = {}

-- 兑换目标道具名称
x588035_var_TargetName = "王牌"

-- 兑换目标道具ID
x588035_var_ExcObjID = {
{index = 1 ,targetID = 12041126, targetName = "天·荆轲"},
{index = 2 ,targetID = 12041127, targetName = "冥·李师师"},
{index = 3 ,targetID = 12041128, targetName = "玄·芙蓉"},
}

x588035_var_ExcObjID1 = {
{index = 1 ,targetID = 12041129, targetName = "圣·美美"},
{index = 2 ,targetID = 12041130, targetName = "星·苍老师"},
{index = 3 ,targetID = 12041131, targetName = "魔·陈老师"},
}

-- 兑换道具ID
x588035_var_ExcItemID = {
{targetID = 11000333, targetName = "战神王牌兑换券", excItemNum = 80, questInfo = "\n\t#G战神王牌兑换券#W在大都活动大使#G现金商城购买#W获得。"},
{targetID = 11000333, targetName = "战神王牌兑换券", excItemNum = 80, questInfo = "\n\t#G战神王牌兑换券#W在大都活动大使#G现金商城购买#W获得。"},
{targetID = 11000333, targetName = "战神王牌兑换券", excItemNum = 100, questInfo = "\n\t#G战神王牌兑换券#W在大都活动大使#G现金商城购买#W获得。"},
{targetID = 11000333, targetName = "战神王牌兑换券", excItemNum = 150, questInfo = "\n\t#G战神王牌兑换券#W在大都活动大使#G现金商城购买#W获得。"},
{targetID = 11000333, targetName = "战神王牌兑换券", excItemNum = 200, questInfo = "\n\t#G战神王牌兑换券#W在大都活动大使#G现金商城购买#W获得。"},
{targetID = 11000333, targetName = "战神王牌兑换券", excItemNum = 350, questInfo = "\n\t#G战神王牌兑换券#W在大都活动大使#G现金商城购买#W获得。"},
}

x588035_var_QuestName  = "#R【兑换王牌】使用战神王牌兑换券"
x588035_var_QuestName1 = "#R【兑换王牌】使用战神王牌兑换券"
x588035_var_Questintro =  "\t你可以用珍贵的#G战神王牌兑换券#W在我处兑换王牌：#G天·荆轲#W，王牌：#G冥·李师师#W和王牌：#G玄·芙蓉#W。"
x588035_var_Questintro1 =  "\t你可以用珍贵的#G战神王牌兑换券#W在我处兑换王牌：#G圣·美美#W，王牌：#G星·苍老师#W，王牌：#G魔·陈老师#W。"
x588035_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588035_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588035_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 881209 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588035_var_QuestName,x588035_var_TargetName))
			TalkAppendString(varMap,x588035_var_Questintro)
			for varI, item in x588035_var_ExcObjID  do
				TalkAppendButton( varMap, x588035_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif seleteId == 881210 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588035_var_QuestName1,x588035_var_TargetName))
			TalkAppendString(varMap,x588035_var_Questintro1)
			for varI,item in x588035_var_ExcObjID1  do
				TalkAppendButton( varMap, x588035_var_FileId, "【兑换】"..item.targetName, 3, 3+varI )
	end	
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	if seleteId >= 1 and seleteId <= 3 then
		x588035_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588035_var_ExcItemID[seleteId].targetID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588035_var_ExcItemID[seleteId].targetName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588035_var_QuestName,x588035_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588035_var_QuestInfo,x588035_var_ExcItemID[seleteId].targetName,x588035_var_ExcObjID[seleteId].targetName,x588035_var_ExcItemID[seleteId].excItemNum,x588035_var_ExcItemID[seleteId].targetName))
				TalkAppendString(varMap,varText)
				TalkAppendString(varMap,x588035_var_ExcItemID[seleteId].questInfo)
				AddQuestItemBonus(varMap, x588035_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588035_var_FileId, -1);
	elseif seleteId >= 4 and seleteId <= 6 then
		x588035_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588035_var_ExcItemID[seleteId].targetID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588035_var_ExcItemID[seleteId].targetName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588035_var_QuestName,x588035_var_ExcObjID1[seleteId-3].targetName))
				TalkAppendString(varMap,format(x588035_var_QuestInfo,x588035_var_ExcItemID[seleteId].targetName,x588035_var_ExcObjID1[seleteId-3].targetName,x588035_var_ExcItemID[seleteId].excItemNum,x588035_var_ExcItemID[seleteId].targetName))
				TalkAppendString(varMap,varText)
				TalkAppendString(varMap,x588035_var_ExcItemID[seleteId].questInfo)
				AddQuestItemBonus(varMap, x588035_var_ExcObjID1[seleteId-3].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588035_var_FileId, -1);		
	end

end


function x588035_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588035_var_FileId,format(x588035_var_QuestName ,x588035_var_TargetName),3,881209);
		TalkAppendButton(varMap,x588035_var_FileId,format(x588035_var_QuestName1,x588035_var_TargetName),3,881210);
	
end

function x588035_ProcAccept( varMap, varPlayer )

	x588035_Accept( varMap, varPlayer )
	
end

function x588035_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
		local SelectedInfo ={}
	if x588035_var_SelectIndex[GetGUID(varMap, varPlayer)] >=1 and x588035_var_SelectIndex[GetGUID(varMap, varPlayer)] <= 3 then
		SelectedInfo = x588035_var_ExcObjID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]]
	elseif x588035_var_SelectIndex[GetGUID(varMap, varPlayer)] >=4 and x588035_var_SelectIndex[GetGUID(varMap, varPlayer)] <= 6 then
		SelectedInfo = x588035_var_ExcObjID1[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]-3]
	end
	
	local Num = GetItemCount( varMap, varPlayer, x588035_var_ExcItemID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID )

	if Num < x588035_var_ExcItemID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]].excItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588035_var_QuestError,x588035_var_ExcItemID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName,SelectedInfo.targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588035_var_ExcItemID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]].excItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588035_var_ExcItemID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588035_var_ExcItemID[x588035_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID,1) ~= 1 then return end
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
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end
		
function x588035_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588035_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588035_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588035_CheckSubmit( varMap, varPlayer )

end




function x588035_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588035_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588035_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588035_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
