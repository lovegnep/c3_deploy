
--DECLARE_QUEST_INFO_START--

x310829_var_FileId = 310829   


-- 兑换目标道具名称
x310829_var_ExcObjName = "精准仪组件"
-- 兑换目标道具ID
x310829_var_ExcObjID = 12266904
-- 兑换道具名称
x310829_var_ExcItemName = "精准仪碎片"
-- 兑换道具ID
x310829_var_ExcItemID = 12030735
-- 兑换道具需要数量
x310829_var_ExcItemNum = 3

x310829_var_QuestName = format("【兑换】兑换%s",x310829_var_ExcObjName)
x310829_var_QuestInfo = format("\t您确定要使用#G%s兑换#W%s吗？\n\t将需要#R%d个#W#G%s#W。",x310829_var_ExcItemName,x310829_var_ExcObjName,x310829_var_ExcItemNum,x310829_var_ExcItemName)
x310829_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x310829_var_ExcItemName, x310829_var_ExcObjName)


--DECLARE_QUEST_INFO_STOP--



function x310829_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 888 then
		x310829_Accept( varMap, varPlayer )
	end
	local varItemNum = GetItemCount(varMap, varPlayer, x310829_var_ExcItemID)
	local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x310829_var_ExcItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310829_var_QuestName)
			TalkAppendString(varMap,x310829_var_QuestInfo)
			TalkAppendString(varMap,varText)
			TalkAppendButton( varMap, x310829_var_FileId, "确定", 1, 888 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end


function x310829_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x310829_var_FileId,x310829_var_QuestName,3);
	
end

function x310829_ProcAccept( varMap, varPlayer )
end

function x310829_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x310829_var_ExcItemID )

	if Num < x310829_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,x310829_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x310829_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x310829_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x310829_var_ExcItemID,1) ~= 1 then return end
		end
		
		StartItemTask(varMap)
		
		if bind == 1 then
			ItemAppend( varMap, x310829_var_ExcObjID, 1)
		elseif bind == 0 then
			ItemAppend( varMap, x310829_var_ExcObjID, 1)
		end
		local varRet = StopItemTask(varMap,varPlayer)
		
		if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				Msg2Player(varMap, varPlayer,"兑换完成",8,3)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end
		
function x310829_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x310829_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310829_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310829_CheckSubmit( varMap, varPlayer )

end




function x310829_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310829_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310829_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310829_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
