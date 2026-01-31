
--DECLARE_QUEST_INFO_START--

x588019_var_FileId = 588019   

x588019_var_SelectIndex = {}

-- 兑换目标道具名称
x588019_var_TargetName = "#R玄甲马装（远攻）"
-- 兑换目标道具ID
x588019_var_ExcObjID = {
{index = 1 ,targetID = 30001106, targetName = "玄甲·大宛追风缰绳"},
{index = 2 ,targetID = 30011106, targetName = "玄甲·大宛追风马鞭"},
{index = 3 ,targetID = 30021106, targetName = "玄甲·大宛追风马蹬"},
{index = 4 ,targetID = 30031106, targetName = "玄甲·大宛追风马刺"},
{index = 5 ,targetID = 30061121, targetName = "玄甲·大宛追风眼罩"},
{index = 6 ,targetID = 30071121, targetName = "玄甲·大宛追风辔头"},
{index = 7 ,targetID = 30081106, targetName = "玄甲·大宛追风衔铁"},
{index = 8 ,targetID = 30091106, targetName = "玄甲·大宛追风马铃"},
{index = 9 ,targetID = 30101041, targetName = "玄甲·大宛追风马甲"},
{index = 10 ,targetID = 30111041, targetName = "玄甲·大宛追风马鞍"},
{index = 11 ,targetID = 30121101, targetName = "玄甲·大宛追风马掌（左前）"},
{index = 12 ,targetID = 30131101, targetName = "玄甲·大宛追风马掌（右前）"},
{index = 13 ,targetID = 30141101, targetName = "玄甲·大宛追风马掌（左后）"},
{index = 14 ,targetID = 30151101, targetName = "玄甲·大宛追风马掌（右后）"},
}
-- 兑换道具名称
x588019_var_ExcItemName = "战神令"
-- 兑换道具ID
x588019_var_ExcItemID = 11000334
-- 兑换道具需要数量
x588019_var_ExcItemNum = 500

x588019_var_QuestName = "【兑换】%s"
x588019_var_Questintro = "\t你可以用珍贵的战神令在我这里兑换新版的#W玄甲马装，500个战神令就可以兑换任意一件新版玄甲马装。"
x588019_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588019_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588019_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588019_var_QuestName,x588019_var_TargetName))
			TalkAppendString(varMap,x588019_var_Questintro)
			for varI, item in x588019_var_ExcObjID  do
				TalkAppendButton( varMap, x588019_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x588019_var_ExcObjID) then
		x588019_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588019_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588019_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588019_var_QuestName,x588019_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588019_var_QuestInfo,x588019_var_ExcItemName,x588019_var_ExcObjID[seleteId].targetName,x588019_var_ExcItemNum,x588019_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x588019_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588019_var_FileId, -1);
	end

end


function x588019_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588019_var_FileId,format(x588019_var_QuestName,x588019_var_TargetName),3,-1);
	
end

function x588019_ProcAccept( varMap, varPlayer )

	x588019_Accept( varMap, varPlayer )
	
end

function x588019_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x588019_var_ExcItemID )

	if Num < x588019_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588019_var_QuestError,x588019_var_ExcItemName,x588019_var_ExcObjID[x588019_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588019_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588019_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588019_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x588019_var_ExcObjID[x588019_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x588019_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588019_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588019_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588019_CheckSubmit( varMap, varPlayer )

end




function x588019_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588019_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588019_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588019_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
