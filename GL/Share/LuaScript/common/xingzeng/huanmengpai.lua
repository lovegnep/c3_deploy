
--DECLARE_QUEST_INFO_START--

x588028_var_FileId = 588028   

x588028_var_SelectIndex = {}

-- 兑换目标道具名称
x588028_var_TargetName = "#R兑换掌门牌"
-- 兑换目标道具ID
x588028_var_ExcObjID = {
{index = 1 ,targetID = 10310056, targetName = "圣·青龙腾空(永不磨损)"},
{index = 2 ,targetID = 10310057, targetName = "圣·白虎啸风(永不磨损)"},
{index = 3 ,targetID = 10310058, targetName = "圣·朱雀焚天(永不磨损)"},
{index = 4 ,targetID = 10310059, targetName = "圣·玄武震月(永不磨损)"},
{index = 5 ,targetID = 10310060, targetName = "圣·麒麟灭日(永不磨损)"},
}
-- 兑换道具名称
x588028_var_ExcItemName = "龙之谷晶石"
-- 兑换道具ID
x588028_var_ExcItemID = 11000325
-- 兑换道具需要数量
x588028_var_ExcItemNum = 300

x588028_var_QuestName = "【兑换】%s"
x588028_var_Questintro = "\t你可以用龙之谷晶石在我处兑换圣·青龙腾空(永不磨损)、圣·白虎啸风(永不磨损)、圣·朱雀焚天(永不磨损)、圣·玄武震月(永不磨损)、圣·麒麟灭日(永不磨损)，300个龙之谷晶石就可以兑换一个掌门牌。"
x588028_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588028_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588028_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588028_var_QuestName,x588028_var_TargetName))
			TalkAppendString(varMap,x588028_var_Questintro)
			for varI, item in x588028_var_ExcObjID  do
				TalkAppendButton( varMap, x588028_var_FileId, "【兑换】兑换"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x588028_var_ExcObjID) then
		x588028_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588028_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588028_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588028_var_QuestName,x588028_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588028_var_QuestInfo,x588028_var_ExcItemName,x588028_var_ExcObjID[seleteId].targetName,x588028_var_ExcItemNum,x588028_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x588028_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588028_var_FileId, -1);
	end

end


function x588028_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588028_var_FileId,format(x588028_var_QuestName,x588028_var_TargetName),3,-1);
	
end

function x588028_ProcAccept( varMap, varPlayer )

	x588028_Accept( varMap, varPlayer )
	
end

function x588028_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x588028_var_ExcItemID )

	if Num < x588028_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588028_var_QuestError,x588028_var_ExcItemName,x588028_var_ExcObjID[x588028_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588028_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588028_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588028_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x588028_var_ExcObjID[x588028_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x588028_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588028_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588028_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588028_CheckSubmit( varMap, varPlayer )

end




function x588028_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588028_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588028_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588028_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
