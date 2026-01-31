
--DECLARE_QUEST_INFO_START--

x588021_var_FileId = 588021   

x588021_var_SelectIndex = {}

-- 兑换目标道具名称
x588021_var_TargetName = "#R坐骑图鉴"
-- 兑换目标道具ID
x588021_var_ExcObjID = {
{index = 1 ,targetID = 12041327, targetName = "图鉴·七彩凤凰"},
{index = 2 ,targetID = 12041328, targetName = "图鉴·银焰独角兽"},
{index = 3 ,targetID = 12041329, targetName = "图鉴·巨型幽纹梦魇"},
{index = 4 ,targetID = 12041330, targetName = "图鉴·幽纹梦魇"},
{index = 5 ,targetID = 12041331, targetName = "图鉴·塔布羊"},
{index = 6 ,targetID = 12041332, targetName = "图鉴·迷你塔布羊"},
{index = 7 ,targetID = 12041333, targetName = "图鉴·迷你独角兽(黄)"},
{index = 8 ,targetID = 12041334, targetName = "图鉴·迷你独角兽(蓝)"},
{index = 9 ,targetID = 12041335, targetName = "图鉴·迷你黄金麒麟(黄)"},
{index = 10 ,targetID = 12041336, targetName = "图鉴·迷你黄金麒麟(蓝)"},
}
-- 兑换道具名称
x588021_var_ExcItemName = "战神王牌兑换券"
-- 兑换道具ID
x588021_var_ExcItemID = 11000333
-- 兑换道具需要数量
x588021_var_ExcItemNum = 150

x588021_var_QuestName = "#R【兑换图鉴】%s"
x588021_var_Questintro = "\t你可以用珍贵的战神王牌兑换券在我这里兑换#W坐骑图鉴，150个战神王牌兑换券就可以兑换任意一张坐骑图鉴。"
x588021_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x588021_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x588021_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x588021_var_QuestName,x588021_var_TargetName))
			TalkAppendString(varMap,x588021_var_Questintro)
			for varI, item in x588021_var_ExcObjID  do
				TalkAppendButton( varMap, x588021_var_FileId, "【兑换】兑换"..item.targetName, 3, varI )
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end
	
	if seleteId >= 1 and seleteId <= getn(x588021_var_ExcObjID) then
		x588021_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x588021_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x588021_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x588021_var_QuestName,x588021_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x588021_var_QuestInfo,x588021_var_ExcItemName,x588021_var_ExcObjID[seleteId].targetName,x588021_var_ExcItemNum,x588021_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x588021_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588021_var_FileId, -1);
	end

end


function x588021_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x588021_var_FileId,format(x588021_var_QuestName,x588021_var_TargetName),3,-1);
	
end

function x588021_ProcAccept( varMap, varPlayer )

	x588021_Accept( varMap, varPlayer )
	
end

function x588021_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x588021_var_ExcItemID )

	if Num < x588021_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x588021_var_QuestError,x588021_var_ExcItemName,x588021_var_ExcObjID[x588021_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x588021_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x588021_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x588021_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x588021_var_ExcObjID[x588021_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
		
function x588021_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588021_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588021_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588021_CheckSubmit( varMap, varPlayer )

end




function x588021_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588021_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588021_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588021_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
