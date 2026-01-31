
--DECLARE_QUEST_INFO_START--

x588025_var_FileId = 588025   

x588025_var_SelectIndex = {}

-- 兑换目标道具名称
x588025_var_TargetName = "神器·首饰"

-- 兑换目标道具ID
x588025_var_ExcObjID = {
{index = 1 ,targetID = 10298277, targetName = "天·暴焱"},
{index = 2 ,targetID = 10298280, targetName = "天·覆霜"},
{index = 3 ,targetID = 10298286, targetName = "天·赤炼"},
}

x588025_var_ExcObjID1 = {
{index = 1 ,targetID = 10249759, targetName = "天·焱阳炽珠"},
{index = 2 ,targetID = 10249765, targetName = "天·妖月银钩"},
{index = 3 ,targetID = 10249771, targetName = "天·极夜寒星"},
}

-- 兑换道具ID
x588025_var_ExcItemID = {
{targetID = 11000306, targetName = "烈焱碎片", excItemNum = 10, questInfo = "\n\t#G烈焱碎片#W在大都活动大使#G现金材料商城购买#W获得。"},
{targetID = 11000306, targetName = "烈焱碎片", excItemNum = 10, questInfo = "\n\t#G烈焱碎片#W在大都活动大使#G现金材料商城购买#W获得。"},
{targetID = 11000306, targetName = "烈焱碎片", excItemNum = 10, questInfo = "\n\t#G烈焱碎片#W在大都活动大使#G现金材料商城购买#W获得。"},
{targetID = 11000309, targetName = "沧月泪珠", excItemNum = 10, questInfo = "\n\t#G沧月泪珠#W在大都活动大使#G现金材料商城购买#W获得。"},
{targetID = 11000309, targetName = "沧月泪珠", excItemNum = 10, questInfo = "\n\t#G沧月泪珠#W在大都活动大使#G现金材料商城购买#W获得。"},
{targetID = 11000309, targetName = "沧月泪珠", excItemNum = 10, questInfo = "\n\t#G沧月泪珠#W在大都活动大使#G现金材料商城购买#W获得。"},
}

x588025_var_QuestName  = "#R【兑换手镯】使用烈焱碎片"
x588025_var_QuestName1 = "#R【兑换项链】使用沧月泪珠"
x588025_var_Questintro =  "\t你可以用珍贵的#G烈焱碎片#W在我处兑换#G天·暴焱#W，#G天·覆霜#W和#G天·赤炼#W。"
x588025_var_Questintro1 =  "\t你可以用珍贵的#G沧月泪珠#W在我处兑换#G天·焱阳炽珠#W和#G天·妖月银钩#W以及#G天·极夜寒星#W。"
x588025_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588025_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588025_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 881209 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588025_var_QuestName,x588025_var_TargetName))
			TalkAppendString(varMap,x588025_var_Questintro)
			for varI, item in x588025_var_ExcObjID  do
				TalkAppendButton( varMap, x588025_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif seleteId == 881210 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588025_var_QuestName1,x588025_var_TargetName))
			TalkAppendString(varMap,x588025_var_Questintro1)
			for varI,item in x588025_var_ExcObjID1  do
				TalkAppendButton( varMap, x588025_var_FileId, "【兑换】"..item.targetName, 3, 3+varI )
	end	
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	if seleteId >= 1 and seleteId <= 3 then
		x588025_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588025_var_ExcItemID[seleteId].targetID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588025_var_ExcItemID[seleteId].targetName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588025_var_QuestName,x588025_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588025_var_QuestInfo,x588025_var_ExcItemID[seleteId].targetName,x588025_var_ExcObjID[seleteId].targetName,x588025_var_ExcItemID[seleteId].excItemNum,x588025_var_ExcItemID[seleteId].targetName))
				TalkAppendString(varMap,varText)
				TalkAppendString(varMap,x588025_var_ExcItemID[seleteId].questInfo)
				AddQuestItemBonus(varMap, x588025_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588025_var_FileId, -1);
	elseif seleteId >= 4 and seleteId <= 6 then
		x588025_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588025_var_ExcItemID[seleteId].targetID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588025_var_ExcItemID[seleteId].targetName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588025_var_QuestName,x588025_var_ExcObjID1[seleteId-3].targetName))
				TalkAppendString(varMap,format(x588025_var_QuestInfo,x588025_var_ExcItemID[seleteId].targetName,x588025_var_ExcObjID1[seleteId-3].targetName,x588025_var_ExcItemID[seleteId].excItemNum,x588025_var_ExcItemID[seleteId].targetName))
				TalkAppendString(varMap,varText)
				TalkAppendString(varMap,x588025_var_ExcItemID[seleteId].questInfo)
				AddQuestItemBonus(varMap, x588025_var_ExcObjID1[seleteId-3].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588025_var_FileId, -1);		
	end

end


function x588025_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588025_var_FileId,format(x588025_var_QuestName ,x588025_var_TargetName),3,881209);
		TalkAppendButton(varMap,x588025_var_FileId,format(x588025_var_QuestName1,x588025_var_TargetName),3,881210);
	
end

function x588025_ProcAccept( varMap, varPlayer )

	x588025_Accept( varMap, varPlayer )
	
end

function x588025_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
		local SelectedInfo ={}
	if x588025_var_SelectIndex[GetGUID(varMap, varPlayer)] >=1 and x588025_var_SelectIndex[GetGUID(varMap, varPlayer)] <= 3 then
		SelectedInfo = x588025_var_ExcObjID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]]
	elseif x588025_var_SelectIndex[GetGUID(varMap, varPlayer)] >=4 and x588025_var_SelectIndex[GetGUID(varMap, varPlayer)] <= 6 then
		SelectedInfo = x588025_var_ExcObjID1[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]-3]
	end
	
	local Num = GetItemCount( varMap, varPlayer, x588025_var_ExcItemID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID )

	if Num < x588025_var_ExcItemID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]].excItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588025_var_QuestError,x588025_var_ExcItemID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName,SelectedInfo.targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588025_var_ExcItemID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]].excItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588025_var_ExcItemID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588025_var_ExcItemID[x588025_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID,1) ~= 1 then return end
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
		
function x588025_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588025_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588025_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588025_CheckSubmit( varMap, varPlayer )

end




function x588025_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588025_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588025_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588025_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
