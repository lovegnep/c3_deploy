
--DECLARE_QUEST_INFO_START--

x570101_var_FileId = 570101   


-- 兑换目标道具名称
x570101_var_ExcObjName = "优质地中海尖凿"
-- 兑换目标道具ID
x570101_var_ExcObjID = 11000949
-- 兑换道具名称
x570101_var_ExcItemName = "普通地中海尖凿"
-- 兑换道具ID
x570101_var_ExcItemID = 11000948
-- 兑换道具需要数量
x570101_var_ExcItemNum = 2

x570101_var_QuestName = format("【兑换】%s",x570101_var_ExcObjName)
x570101_var_QuestInfo = format("\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t兑换#R1个#G%s#W将需要#R%d个#G%s#W。",x570101_var_ExcItemName,x570101_var_ExcObjName,x570101_var_ExcObjName,x570101_var_ExcItemNum,x570101_var_ExcItemName)
x570101_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x570101_var_ExcItemName, x570101_var_ExcObjName)


--DECLARE_QUEST_INFO_STOP--



function x570101_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 888 then
		x570101_Accept( varMap, varPlayer, 1 )
	elseif seleteId == 999 then
		x570101_Accept( varMap, varPlayer, 10 )
	end

	local varItemNum = GetItemCount(varMap, varPlayer, x570101_var_ExcItemID)
	local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570101_var_ExcItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570101_var_QuestName)
			TalkAppendString(varMap,x570101_var_QuestInfo)
			TalkAppendString(varMap,varText)
			TalkAppendButton( varMap, x570101_var_FileId, format("兑换一个%s",x570101_var_ExcObjName), 1, 888 )
			TalkAppendButton( varMap, x570101_var_FileId, format("兑换十个%s",x570101_var_ExcObjName), 1, 999 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end


function x570101_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570101_var_FileId,x570101_var_QuestName,3);
	
end

function x570101_ProcAccept( varMap, varPlayer )
end

function x570101_Accept( varMap, varPlayer, index )
	
	if ( index ~= 1 and index ~= 10 ) then
		return 0
	end

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x570101_var_ExcItemID )

	if Num < x570101_var_ExcItemNum*index then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,x570101_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x570101_var_ExcItemNum*index
		for i=1 , Num  do 
			local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570101_var_ExcItemID)
			 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
			 	bind = 1
			 end
			if DelItem(varMap,varPlayer,x570101_var_ExcItemID,1) ~= 1 then return end
		end
		
		StartItemTask(varMap)
		
		if bind == 1 then
			ItemAppendBind( varMap, x570101_var_ExcObjID, index)
		elseif bind == 0 then
			ItemAppendBind( varMap, x570101_var_ExcObjID, index)
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
		
function x570101_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570101_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570101_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570101_CheckSubmit( varMap, varPlayer )

end




function x570101_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570101_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570101_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570101_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
