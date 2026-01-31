
--DECLARE_QUEST_INFO_START--

x588018_var_FileId = 588018   

x588018_var_SelectIndex = {}

-- 兑换目标道具名称
x588018_var_TargetName = "#R兑换玄甲马装（近战）"
-- 兑换目标道具ID
x588018_var_ExcObjID = {
{index = 1 ,targetID = 30001101, targetName = "玄甲·大宛开山缰绳"},
{index = 2 ,targetID = 30011101, targetName = "玄甲·大宛开山马鞭"},
{index = 3 ,targetID = 30021101, targetName = "玄甲·大宛开山马蹬"},
{index = 4 ,targetID = 30031101, targetName = "玄甲·大宛开山马刺"},
{index = 5 ,targetID = 30061116, targetName = "玄甲·大宛开山眼罩"},
{index = 6 ,targetID = 30071116, targetName = "玄甲·大宛开山辔头"},
{index = 7 ,targetID = 30081101, targetName = "玄甲·大宛开山衔铁"},
{index = 8 ,targetID = 30091101, targetName = "玄甲·大宛开山马铃"},
{index = 9 ,targetID = 30101036, targetName = "玄甲·大宛开山马甲"},
{index = 10 ,targetID = 30111036, targetName = "玄甲·大宛开山马鞍"},
{index = 11 ,targetID = 30121096, targetName = "玄甲·大宛开山马掌（左前）"},
{index = 12 ,targetID = 30131096, targetName = "玄甲·大宛开山马掌（右前）"},
{index = 13 ,targetID = 30141096, targetName = "玄甲·大宛开山马掌（左后）"},
{index = 14 ,targetID = 30151096, targetName = "玄甲·大宛开山马掌（右后）"},
}
-- 兑换道具名称
x588018_var_ExcItemName = "战神令"
-- 兑换道具ID
x588018_var_ExcItemID = 11000334
-- 兑换道具需要数量
x588018_var_ExcItemNum = 150

x588018_var_QuestName = "【兑换近战】%s"
x588018_var_Questintro = "\t你可以用珍贵的战神令在我这里兑换新版的#W玄甲马装，150个战神令就可以兑换任意一件新版玄甲马装。"
x588018_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588018_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588018_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588018_var_QuestName,x588018_var_TargetName))
			TalkAppendString(varMap,x588018_var_Questintro)
			for varI, item in x588018_var_ExcObjID  do
				TalkAppendButton( varMap, x588018_var_FileId, "【兑换】兑换"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x588018_var_ExcObjID) then
		x588018_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588018_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588018_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588018_var_QuestName,x588018_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588018_var_QuestInfo,x588018_var_ExcItemName,x588018_var_ExcObjID[seleteId].targetName,x588018_var_ExcItemNum,x588018_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x588018_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588018_var_FileId, -1);
	end

end


function x588018_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588018_var_FileId,format(x588018_var_QuestName,x588018_var_TargetName),3,-1);
	
end

function x588018_ProcAccept( varMap, varPlayer )

	x588018_Accept( varMap, varPlayer )
	
end

function x588018_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x588018_var_ExcItemID )

	if Num < x588018_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588018_var_QuestError,x588018_var_ExcItemName,x588018_var_ExcObjID[x588018_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588018_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588018_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588018_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x588018_var_ExcObjID[x588018_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x588018_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588018_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588018_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588018_CheckSubmit( varMap, varPlayer )

end




function x588018_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588018_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588018_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588018_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
