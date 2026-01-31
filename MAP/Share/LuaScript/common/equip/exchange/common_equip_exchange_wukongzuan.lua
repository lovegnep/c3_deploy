
--DECLARE_QUEST_INFO_START--

x570089_var_FileId = 570089   

x570089_var_SelectIndex = {}

-- 兑换目标道具名称
x570089_var_TargetName = "五孔钻"
x570089_var_ExcObjName = "奥钻·黄金藏宝图"
-- 兑换目标道具ID
x570089_var_ExcObjID = {
{index = 1 ,targetID = 11000134, targetName = "炼金钻·主武器"},
{index = 2 ,targetID = 11000138, targetName = "铭金钻·手镯"},
{index = 3 ,targetID = 11000141, targetName = "庚金钻·项链"},
{index = 4 ,targetID = 11000142, targetName = "昊金钻·副武器"},
{index = 5 ,targetID = 11000143, targetName = "干金钻·衣服"},
{index = 6 ,targetID = 11000144, targetName = "辉金钻·腰带"},
{index = 7 ,targetID = 11000145, targetName = "恪金钻·徽章"},
}
-- 兑换道具名称
x570089_var_ExcItemName = "钻头碎片"
-- 兑换道具ID
x570089_var_ExcItemID = 11000155
-- 兑换道具需要数量
x570089_var_ExcItemNum = 1

x570089_var_QuestName = "【兑换】%s"
x570089_var_Questintro = "\t你可以用珍贵的钻头碎片在我处兑换主武器、副武器、衣服、项炼、腰带、手镯、徽章的五孔钻，一个钻头碎片就可以兑换兑换一个五孔钻。"
x570089_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x570089_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x570089_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x570089_var_QuestName,x570089_var_TargetName))
			TalkAppendString(varMap,x570089_var_Questintro)
			for varI, item in x570089_var_ExcObjID  do
				TalkAppendButton( varMap, x570089_var_FileId, "【兑换】兑换"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x570089_var_ExcObjID) then
		x570089_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x570089_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570089_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x570089_var_QuestName,x570089_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x570089_var_QuestInfo,x570089_var_ExcItemName,x570089_var_ExcObjID[seleteId].targetName,x570089_var_ExcItemNum,x570089_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x570089_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570089_var_FileId, -1);
	end

end


function x570089_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570089_var_FileId,format(x570089_var_QuestName,x570089_var_TargetName),3,-1);
	
end

function x570089_ProcAccept( varMap, varPlayer )

	x570089_Accept( varMap, varPlayer )
	
end

function x570089_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x570089_var_ExcItemID )

	if Num < x570089_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x570089_var_QuestError,x570089_var_ExcItemName,x570089_var_ExcObjID[x570089_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x570089_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570089_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x570089_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x570089_var_ExcObjID[x570089_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x570089_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570089_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570089_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570089_CheckSubmit( varMap, varPlayer )

end




function x570089_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570089_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570089_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570089_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
