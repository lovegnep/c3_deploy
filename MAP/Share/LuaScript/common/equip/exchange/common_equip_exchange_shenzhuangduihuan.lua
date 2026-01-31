
--DECLARE_QUEST_INFO_START--

x570103_var_FileId = 570103   

x570103_var_SelectIndex = {}

-- 兑换目标道具名称
x570103_var_TargetName = "#R稀世异宝"

-- 兑换目标道具ID
x570103_var_ExcObjID = {
{index = 1 ,targetID = 12050431, targetName = "近攻型成年独角兽（流星火雨）降世符"},
{index = 2 ,targetID = 12050432, targetName = "远攻型成年独角兽（流星火雨）降世符"},
{index = 3 ,targetID = 12050433, targetName = "魔攻型成年独角兽（流星火雨）降世符"},
{index = 4 ,targetID = 10306148, targetName = "决战八方（永久）"},
{index = 5 ,targetID = 10306149, targetName = "狩魔猎人（永久）"},
}
-- 兑换道具名称
x570103_var_ExcItemName = "稀世奇珍兑换卷"
-- 兑换道具ID
x570103_var_ExcItemID = 11000380
-- 兑换道具需要数量
x570103_var_ExcItemNum = 500

x570103_var_QuestName = "【兑换】%s"
x570103_var_QuestName1 = "【稀世异宝说明】"
x570103_var_Questintro = "\t你可以在我这里兑换#G稀世奇有#W的时装和坐骑，500个稀世奇珍兑换卷就可以兑换其中任意一件时装或者任意一个坐骑降世符。"
x570103_var_Questintro1 ="\n\t#G稀世异宝：成年独角兽（流星火雨）降世符#W：自带元素技能流星火雨。\n\t#G稀世异宝：成年独角兽（流星火雨）降世符#W：自带元素技能流星火雨。\n\t#G稀世异宝：成年独角兽（流星火雨）降世符#W：自带元素技能流星火雨。\n\t#G稀世异宝：决战八方（永久）#W：永久时装，时装穿上去看着就很拉风。\n\t#G稀世异宝：狩魔猎人（永久）#W：永久时装，一样的威武，穿上去看着就很拉风。"
x570103_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x570103_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x570103_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..format(x570103_var_QuestName,x570103_var_TargetName))
			TalkAppendString(varMap,x570103_var_Questintro)
			for varI, item in x570103_var_ExcObjID  do
				TalkAppendButton( varMap, x570103_var_FileId, "【兑换】"..item.targetName, 3, varI )
			end
			TalkAppendButton(varMap, x570103_var_FileId, x570103_var_QuestName1,0,6)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	
	if seleteId >= 1 and seleteId <= getn(x570103_var_ExcObjID) then
		x570103_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		local varItemNum = GetItemCount(varMap, varPlayer, x570103_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570103_var_ExcItemName)
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..format(x570103_var_QuestName,x570103_var_ExcObjID[seleteId].targetName))
				TalkAppendString(varMap,format(x570103_var_QuestInfo,x570103_var_ExcItemName,x570103_var_ExcObjID[seleteId].targetName,x570103_var_ExcItemNum,x570103_var_ExcItemName))
				TalkAppendString(varMap,varText)
				AddQuestItemBonus(varMap, x570103_var_ExcObjID[seleteId].targetID, 1)
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570103_var_FileId, -1);
	end
	if seleteId == 6 then 		
			x570103_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570103_var_QuestName1)
			TalkAppendString(varMap,x570103_var_Questintro1)
			StopTalkTask()
			--DeliverTalkInfo(varMap, varPlayer, varTalknpc, -1, -1);
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			end 

end


function x570103_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570103_var_FileId,format(x570103_var_QuestName,x570103_var_TargetName),3,-1);
	
end

function x570103_ProcAccept( varMap, varPlayer )

	x570103_Accept( varMap, varPlayer )
	
end

function x570103_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x570103_var_ExcItemID )

	if Num < x570103_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,format(x570103_var_QuestError,x570103_var_ExcItemName,x570103_var_ExcObjID[x570103_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetName))
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
	else
	
		local Num = x570103_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570103_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x570103_var_ExcItemID,1) ~= 1 then return end
		end
		
		local bonusid = x570103_var_ExcObjID[x570103_var_SelectIndex[GetGUID(varMap, varPlayer)]].targetID
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
				GamePlayScriptLog( varMap, varPlayer, 3870)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end
		
function x570103_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570103_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570103_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570103_CheckSubmit( varMap, varPlayer )

end




function x570103_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570103_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570103_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570103_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
