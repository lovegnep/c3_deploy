
--DECLARE_QUEST_INFO_START--

x588020_var_FileId = 588020   

x588020_var_SelectIndex = {}

-- 兑换目标道具名称
x588020_var_TargetName = "#R玄甲马装（魔攻）"
-- 兑换目标道具ID
x588020_var_ExcObjID = {
{index = 1 ,targetID = 30001111, targetName = "玄甲·大宛慧心缰绳"},
{index = 2 ,targetID = 30011111, targetName = "玄甲·大宛慧心马鞭"},
{index = 3 ,targetID = 30021111, targetName = "玄甲·大宛慧心马蹬"},
{index = 4 ,targetID = 30031111, targetName = "玄甲·大宛慧心马刺"},
{index = 5 ,targetID = 30061126, targetName = "玄甲·大宛慧心眼罩"},
{index = 6 ,targetID = 30071126, targetName = "玄甲·大宛慧心辔头"},
{index = 7 ,targetID = 30081111, targetName = "玄甲·大宛慧心衔铁"},
{index = 8 ,targetID = 30091111, targetName = "玄甲·大宛慧心马铃"},
{index = 9 ,targetID = 30101046, targetName = "玄甲·大宛慧心马甲"},
{index = 10 ,targetID = 30111046, targetName = "玄甲·大宛慧心马鞍"},
{index = 11 ,targetID = 30121106, targetName = "玄甲·大宛慧心马掌（左前）"},
{index = 12 ,targetID = 30131106, targetName = "玄甲·大宛慧心马掌（右前）"},
{index = 13 ,targetID = 30141106, targetName = "玄甲·大宛慧心马掌（左后）"},
{index = 14 ,targetID = 30151106, targetName = "玄甲·大宛慧心马掌（右后）"},
}
-- 兑换道具名称
x588020_var_ExcItemName = "战神令"
-- 兑换道具ID
x588020_var_ExcItemID = 11000334
-- 兑换道具需要数量
x588020_var_ExcItemNum = 500

x588020_var_QuestName = "【兑换】%s"
x588020_var_Questintro = "\t你可以用珍贵的战神令在我这里兑换新版的#W玄甲马装，500个战神令就可以兑换任意一件新版玄甲马装。"
x588020_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588020_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588020_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588020_var_QuestName,x588020_var_TargetName))
			TalkAppendString(varMap,x588020_var_Questintro)
			for varI, item in x588020_var_ExcObjID  do
				TalkAppendButton( varMap, x588020_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x588020_var_ExcObjID) then
		x588020_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588020_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588020_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588020_var_QuestName,x588020_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588020_var_QuestInfo,x588020_var_ExcItemName,x588020_var_ExcObjID[seleteId].targetName,x588020_var_ExcItemNum,x588020_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x588020_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588020_var_FileId, -1);
	end

end


function x588020_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588020_var_FileId,format(x588020_var_QuestName,x588020_var_TargetName),3,-1);
	
end

function x588020_ProcAccept( varMap, varPlayer )

	x588020_Accept( varMap, varPlayer )
	
end

function x588020_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x588020_var_ExcItemID )

	if Num < x588020_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588020_var_QuestError,x588020_var_ExcItemName,x588020_var_ExcObjID[x588020_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588020_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588020_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588020_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x588020_var_ExcObjID[x588020_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x588020_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588020_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588020_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588020_CheckSubmit( varMap, varPlayer )

end




function x588020_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588020_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588020_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588020_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
