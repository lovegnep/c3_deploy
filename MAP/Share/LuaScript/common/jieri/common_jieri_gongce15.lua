
--DECLARE_QUEST_INFO_START--

x350014_var_FileId = 350014   

x350014_var_SelectIndex = {}

-- 兑换目标道具名称
x350014_var_TargetName = "#R圣四彩护身符"
-- 兑换目标道具ID
x350014_var_ExcObjID = {
{index = 1 ,targetID = 10340035, targetName = "四彩护身符·圣战神"},
{index = 2 ,targetID = 10340036, targetName = "四彩护身符·圣剑魔"},
{index = 3 ,targetID = 10340037, targetName = "四彩护身符·圣追风"},
{index = 4 ,targetID = 10340038, targetName = "四彩护身符·圣灭神"},
{index = 5 ,targetID = 10340039, targetName = "四彩护身符·圣狂魔"},
{index = 6 ,targetID = 10340040, targetName = "四彩护身符·圣医仙"},
}
-- 兑换道具名称
x350014_var_ExcItemName = "暗影四彩护身符碎片"
-- 兑换道具ID
x350014_var_ExcItemID = 11000381
-- 兑换道具需要数量
x350014_var_ExcItemNum = 500

x350014_var_QuestName = "【兑换】%s"
x350014_var_Questintro = "\t你可以用四彩护身符碎片在我这里兑换四彩护身符·圣战神、四彩护身符·圣剑魔、四彩护身符·圣追风、四彩护身符·圣灭神、四彩护身符·圣狂魔和四彩护身符·圣医仙，500个暗影四彩护身符碎片就可以兑换一个传奇护身符。"
x350014_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x350014_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x350014_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
	Msg2Player(varMap, varPlayer,"暂停兑换，请通过神兵升级获得",8,2)
	Msg2Player(varMap, varPlayer,"暂停兑换，请通过神兵升级获得",8,3)
	if 1== 1 then
		return
	end
	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x350014_var_QuestName,x350014_var_TargetName))
			TalkAppendString(varMap,x350014_var_Questintro)
			for varI, item in x350014_var_ExcObjID  do
				TalkAppendButton( varMap, x350014_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x350014_var_ExcObjID) then
		x350014_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x350014_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x350014_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x350014_var_QuestName,x350014_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x350014_var_QuestInfo,x350014_var_ExcItemName,x350014_var_ExcObjID[seleteId].targetName,x350014_var_ExcItemNum,x350014_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x350014_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x350014_var_FileId, -1);
	end

end


function x350014_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x350014_var_FileId,format(x350014_var_QuestName,x350014_var_TargetName),3,-1);
	
end

function x350014_ProcAccept( varMap, varPlayer )

	x350014_Accept( varMap, varPlayer )
	
end

function x350014_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x350014_var_ExcItemID )

	if Num < x350014_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x350014_var_QuestError,x350014_var_ExcItemName,x350014_var_ExcObjID[x350014_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x350014_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x350014_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x350014_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x350014_var_ExcObjID[x350014_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x350014_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x350014_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x350014_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x350014_CheckSubmit( varMap, varPlayer )

end




function x350014_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x350014_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x350014_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x350014_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
