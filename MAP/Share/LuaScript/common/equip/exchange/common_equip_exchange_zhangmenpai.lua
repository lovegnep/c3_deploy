
--DECLARE_QUEST_INFO_START--

x570095_var_FileId = 570095   

x570095_var_SelectIndex = {}

-- 兑换目标道具名称
x570095_var_TargetName = "#R掌门牌"

-- 兑换目标道具ID
x570095_var_ExcObjID = {
{index = 1 ,targetID = 10310056, targetName = "圣·青龙腾空(永不磨损)"},
{index = 2 ,targetID = 10310057, targetName = "圣·白虎啸风(永不磨损)"},
{index = 3 ,targetID = 10310058, targetName = "圣·朱雀焚天(永不磨损)"},
{index = 4 ,targetID = 10310059, targetName = "圣·玄武震月(永不磨损)"},
{index = 5 ,targetID = 10310060, targetName = "圣·麒麟灭日(永不磨损)"},
}
-- 兑换道具名称
x570095_var_ExcItemName = "龙之谷晶石"
-- 兑换道具ID
x570095_var_ExcItemID = 11000325
-- 兑换道具需要数量
x570095_var_ExcItemNum = 500

x570095_var_QuestName = "【兑换】%s"
x570095_var_QuestName1 = "【新版掌门牌说明】"
x570095_var_Questintro = "\t你可以用珍贵的龙之谷晶石在我这里兑换新版的#G永不磨损#W的掌门牌，500个龙之谷晶石就可以兑换任意一个新版掌门牌。"
x570095_var_Questintro1 ="\n\t你可以用#G掌门牌：平胡(永不磨损)、掌门牌：碰碰胡(永不磨损)、掌门牌：清一色(永不磨损)#W在神兵大师处升级为更高等级的#G掌门牌"
x570095_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x570095_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x570095_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x570095_var_QuestName,x570095_var_TargetName))
			TalkAppendString(varMap,x570095_var_Questintro)
			for varI, item in x570095_var_ExcObjID  do
				TalkAppendButton( varMap, x570095_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
			TalkAppendButton(varMap, x570095_var_FileId, x570095_var_QuestName1,0,6)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	
	if seleteId >= 1 and seleteId <= getn(x570095_var_ExcObjID) then
		Msg2Player(varMap, varPlayer,"暂停兑换，请通过神兵升级获得",8,2)
		Msg2Player(varMap, varPlayer,"暂停兑换，请通过神兵升级获得",8,3)
		if 1== 1 then
			return
		end

		x570095_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x570095_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570095_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x570095_var_QuestName,x570095_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x570095_var_QuestInfo,x570095_var_ExcItemName,x570095_var_ExcObjID[seleteId].targetName,x570095_var_ExcItemNum,x570095_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x570095_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570095_var_FileId, -1);
	end
	if seleteId == 6 then 		
			x570095_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570095_var_QuestName1)
			TalkAppendString(varMap,x570095_var_Questintro1)
			StopTalkTask()
			--DeliverTalkInfo(varMap, varPlayer, varTalknpc, -1, -1);
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			end 

end


function x570095_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570095_var_FileId,format(x570095_var_QuestName,x570095_var_TargetName),3,-1);
	
end

function x570095_ProcAccept( varMap, varPlayer )

	x570095_Accept( varMap, varPlayer )
	
end

function x570095_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x570095_var_ExcItemID )

	if Num < x570095_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x570095_var_QuestError,x570095_var_ExcItemName,x570095_var_ExcObjID[x570095_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x570095_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570095_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x570095_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x570095_var_ExcObjID[x570095_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
				GamePlayScriptLog( varMap, varPlayer, 2686)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end
		
function x570095_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570095_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570095_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570095_CheckSubmit( varMap, varPlayer )

end




function x570095_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570095_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570095_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570095_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
