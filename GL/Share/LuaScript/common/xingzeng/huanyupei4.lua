
--DECLARE_QUEST_INFO_START--

x588033_var_FileId = 588033   

x588033_var_SelectIndex = {}

-- 兑换目标道具名称
x588033_var_TargetName = "#R兑换四级神器玉佩"
-- 兑换目标道具ID
x588033_var_ExcObjID = {
{index = 1 ,targetID = 10330099, targetName = "神·四级赤血玉佩"},
{index = 2 ,targetID = 10330100, targetName = "神·四级赤金玉佩"},
{index = 3 ,targetID = 10330101, targetName = "神·四级龙象玉佩"},
{index = 4 ,targetID = 10330102, targetName = "神·四级般若玉佩"},
{index = 5 ,targetID = 10330103, targetName = "神·四级兽面玉佩"},
}
-- 兑换道具名称
x588033_var_ExcItemName = "破碎的和田暖玉"
-- 兑换道具ID
x588033_var_ExcItemID = 11000316
-- 兑换道具需要数量
x588033_var_ExcItemNum = 70

x588033_var_QuestName = "【兑换】%s"
x588033_var_Questintro = "\t你可以用破碎的和田暖玉在我处兑换神·四级赤血玉佩、神·四级赤金玉佩、神·四级龙象玉佩、神·四级般若玉佩、神·四级兽面玉佩，70个破碎的和田暖玉就可以兑换一件四级神器玉佩。"
x588033_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588033_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588033_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588033_var_QuestName,x588033_var_TargetName))
			TalkAppendString(varMap,x588033_var_Questintro)
			for varI, item in x588033_var_ExcObjID  do
				TalkAppendButton( varMap, x588033_var_FileId, "【兑换】兑换"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x588033_var_ExcObjID) then
		x588033_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588033_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588033_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588033_var_QuestName,x588033_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588033_var_QuestInfo,x588033_var_ExcItemName,x588033_var_ExcObjID[seleteId].targetName,x588033_var_ExcItemNum,x588033_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x588033_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588033_var_FileId, -1);
	end

end


function x588033_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588033_var_FileId,format(x588033_var_QuestName,x588033_var_TargetName),3,-1);
	
end

function x588033_ProcAccept( varMap, varPlayer )

	x588033_Accept( varMap, varPlayer )
	
end

function x588033_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x588033_var_ExcItemID )

	if Num < x588033_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588033_var_QuestError,x588033_var_ExcItemName,x588033_var_ExcObjID[x588033_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588033_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588033_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588033_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x588033_var_ExcObjID[x588033_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x588033_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588033_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588033_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588033_CheckSubmit( varMap, varPlayer )

end




function x588033_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588033_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588033_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588033_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
