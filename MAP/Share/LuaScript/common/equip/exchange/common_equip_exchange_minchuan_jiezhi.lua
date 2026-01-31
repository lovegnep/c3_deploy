
--DECLARE_QUEST_INFO_START--

x570097_var_FileId = 570097   


-- 兑换目标道具名称
x570097_var_ExcObjName = "冥传君主戒指"
-- 兑换目标道具ID
x570097_var_ExcObjID = {
10288100,
10288101,
10288102,
10288103,
10288104,
10288105,
10288106,
10288107,
10288108,
10288109,
10288110,
10288111,
}
-- 兑换道具名称
x570097_var_ExcItemName = "冥传戒指手镯碎片"
-- 兑换道具ID
x570097_var_ExcItemID = 12030789
-- 兑换道具需要数量
x570097_var_ExcItemNum = 10

x570097_var_QuestName = format("【兑换】兑换%s",x570097_var_ExcObjName)
x570097_var_QuestInfo = format("\t您确定要使用#G%s兑换#W%s吗？\n\t将需要#R%d个#W#G%s#W。",x570097_var_ExcItemName,x570097_var_ExcObjName,x570097_var_ExcItemNum,x570097_var_ExcItemName)
x570097_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x570097_var_ExcItemName, x570097_var_ExcObjName)


--DECLARE_QUEST_INFO_STOP--



function x570097_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 888 then
		x570097_Accept( varMap, varPlayer )
	end
	local varItemNum = GetItemCount(varMap, varPlayer, x570097_var_ExcItemID)
	local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570097_var_ExcItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570097_var_QuestName)
			TalkAppendString(varMap,x570097_var_QuestInfo)
			TalkAppendString(varMap,varText)
			TalkAppendButton( varMap, x570097_var_FileId, "确定", 1, 888 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end


function x570097_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570097_var_FileId,x570097_var_QuestName,3);
	
end

function x570097_ProcAccept( varMap, varPlayer )
end

function x570097_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x570097_var_ExcItemID )

	if Num < x570097_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,x570097_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x570097_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570097_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x570097_var_ExcItemID,1) ~= 1 then return end
		end
		
		StartItemTask(varMap)
		
		if bind == 1 then
			ItemAppendBind( varMap, x570097_var_ExcObjID[GetZhiye( varMap , varPlayer ) + 1], 1)
		elseif bind == 0 then
			ItemAppendBind( varMap, x570097_var_ExcObjID[GetZhiye( varMap , varPlayer ) + 1], 1)
		end
		local varRet = StopItemTask(varMap,varPlayer)
		
		if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				Msg2Player(varMap, varPlayer,"兑换完成",8,3)
				GamePlayScriptLog( varMap, varPlayer, 3010)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end
		
function x570097_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570097_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570097_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570097_CheckSubmit( varMap, varPlayer )

end




function x570097_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570097_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570097_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570097_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
