
--DECLARE_QUEST_INFO_START--

x930167_var_FileId = 930167

x930167_var_SelectIndex = {}

-- 兑换目标道具名称
x930167_var_TargetName = "#R铭刻将星"
-- 暴击闪避石头
x930167_var_baojitable = {
	{index = 101 ,targetID = 45014601, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 102 ,targetID = 45014602, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 103 ,targetID = 45014603, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 104 ,targetID = 45014604, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 105 ,targetID = 45014605, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 106 ,targetID = 45014606, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 107 ,targetID = 45014607, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 108 ,targetID = 45014608, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 109 ,targetID = 45014609, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
	{index = 110 ,targetID = 45014610, targetName = "王牌朱雀", need = {--暴击
		{id = 12274106, name = "传说将星勋章", num=1000},
	}},
}
-- 攻击石头
x930167_var_gjtable = {
	{index = 201 ,targetID = 45014611, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 202 ,targetID = 45014612, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 203 ,targetID = 45014613, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 204 ,targetID = 45014614, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 205 ,targetID = 45014615, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 206 ,targetID = 45014616, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 207 ,targetID = 45014617, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 208 ,targetID = 45014618, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 209 ,targetID = 45014619, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
	{index = 210 ,targetID = 45014620, targetName = "王牌玄武", need = {--近攻
		{id = 12274106, name = "传说将星勋章", num=2000},
	}},
}


x930167_var_table = {
	{index=1,name="【购买】莉莉丝", shopid=1770},
	{index=2,name="【购买】青龙", shopid=1771},
	{index=3,name="【购买】白虎", shopid=1772},
	{index=4,name="【兑换】朱雀", list=x930167_var_baojitable},
	{index=5,name="【兑换】玄武", list=x930167_var_gjtable},
}


x930167_var_QuestName = "【兑换-购买】%s"
x930167_var_Questintro = "\t你可以用稀世奇珍兑换卷兑换#W高级王牌。"
x930167_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"





function x930167_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)

	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930167_var_QuestName,x930167_var_TargetName))
		TalkAppendString(varMap,x930167_var_Questintro)
		for varI, item in x930167_var_table  do
			TalkAppendButton( varMap, x930167_var_FileId, item.name, 3, item.index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x930167_var_table[seleteId].shopid )
		return
	end

	if seleteId >= 4 and seleteId <= getn(x930167_var_table) then
		--说明用户点击的是2级菜单，需要展示3级菜单

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930167_var_QuestName,x930167_var_table[seleteId].name))
		TalkAppendString(varMap,x930167_var_Questintro)
		for varI, item in x930167_var_table[seleteId].list  do
			local index = seleteId * 100 + varI
			TalkAppendButton( varMap, x930167_var_FileId, "【兑换】"..item.targetName, 3, index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 101 then
		--说明用户点击的是3级菜单，需要展示最终兑换的道具
		x930167_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		--对应石头的数组内的索引
		local sindex = mod(seleteId,100)
		local tindex = floor(seleteId/100) --类别

		local targetItem = x930167_var_table[tindex].list[sindex]
		local targetName = targetItem.targetName
		local targetID = targetItem.targetID

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930167_var_QuestName,targetName))
		TalkAppendString(varMap,"需要的道具如下")
		for varI, item in targetItem.need  do
			local curCount = GetItemCount(varMap, varPlayer, item.id)
			TalkAppendString(varMap,format("#R%d#W个#G%s#W，您当前有#R%d#W个", item.num, item.name,curCount))
		end
		AddQuestItemBonus(varMap, targetID, 1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930167_var_FileId, -1);



	end

end


function x930167_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930167_var_FileId,format(x930167_var_QuestName,x930167_var_TargetName),3,-1);

end

function x930167_ProcAccept( varMap, varPlayer )

	x930167_Accept( varMap, varPlayer )

end

function x930167_Accept( varMap, varPlayer )
	local seleteId = x930167_var_SelectIndex[GetGUID(varMap, varPlayer)]
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end

	--对应石头的数组内的索引
	local sindex = mod(seleteId,100)
	local tindex = floor(seleteId/100) --类别

	local targetItem = x930167_var_table[tindex].list[sindex]
	local targetName = targetItem.targetName
	local targetID = targetItem.targetID

	for varI, item in targetItem.need  do
		local curCount = GetItemCount(varMap, varPlayer, item.id)
		if curCount < item.num then
			Msg2Player(varMap, varPlayer,format("道具%s不足%d个",item.name, item.num),8,2)
			Msg2Player(varMap, varPlayer,format("道具%s不足%d个",item.name, item.num),8,3)
			return 0
		end
	end

	--开始扣除
	for varI, item in targetItem.need  do
		if DelItem(varMap,varPlayer,item.id,item.num) ~= 1 then
			Msg2Player(varMap, varPlayer,format("扣除道具%s %d个失败",item.name, item.num),8,2)
			Msg2Player(varMap, varPlayer,format("扣除道具%s %d个失败",item.name, item.num),8,3)
			return 0
		end
	end


	local bonusid = targetID
	StartItemTask(varMap)
	ItemAppendBind( varMap, bonusid, 1)
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

function x930167_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930167_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930167_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930167_CheckSubmit( varMap, varPlayer )

end




function x930167_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930167_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930167_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930167_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
