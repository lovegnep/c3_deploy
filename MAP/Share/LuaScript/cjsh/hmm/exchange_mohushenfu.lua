
--DECLARE_QUEST_INFO_START--

x930188_var_FileId = 930188

x930188_var_SelectIndex = {}

-- 兑换目标道具名称
x930188_var_TargetName = "#R魔四彩护身符"
-- 暴击闪避石头
x930188_var_baojitable = {
	{index = 101 ,targetID = 10340023, targetName = "四彩护身符·魔战神", need = {--暴击
		{id = 10340035, name = "四彩护身符·圣战神", num=2},
		{id = 11000380, name = "稀世奇珍兑换卷", num=100},
	}},
}
-- 攻击石头
x930188_var_gjtable = {
	{index = 101 ,targetID = 10340024, targetName = "四彩护身符·魔剑魔", need = {--暴击
		{id = 10340036, name = "四彩护身符·圣剑魔", num=2},
		{id = 11000380, name = "稀世奇珍兑换卷", num=100},
	}},
}
-- 属性石头
x930188_var_sxtable = {
	{index = 101 ,targetID = 10340025, targetName = "四彩护身符·魔追风", need = {--暴击
		{id = 10340037, name = "四彩护身符·圣追风", num=2},
		{id = 11000380, name = "稀世奇珍兑换卷", num=100},
	}},
}

-- 6级丸子
x930188_var_ljtable = {
	{index = 101 ,targetID = 10340026, targetName = "四彩护身符·魔灭神", need = {--暴击
		{id = 10340038, name = "四彩护身符·圣灭神", num=2},
		{id = 11000380, name = "稀世奇珍兑换卷", num=100},
	}},
}
x930188_var_lj2table = {
	{index = 101 ,targetID = 10340027, targetName = "四彩护身符·魔狂魔", need = {--暴击
		{id = 10340039, name = "四彩护身符·圣狂魔", num=2},
		{id = 11000380, name = "稀世奇珍兑换卷", num=100},
	}},
}
x930188_var_lj3table = {
	{index = 101 ,targetID = 10340028, targetName = "四彩护身符·魔医仙", need = {--暴击
		{id = 10340040, name = "四彩护身符·圣医仙", num=2},
		{id = 11000380, name = "稀世奇珍兑换卷", num=100},
	}},
}

x930188_var_table = {
	{index=1,name="四彩护身符·魔战神", list=x930188_var_baojitable},
	{index=2,name="四彩护身符·魔剑魔", list=x930188_var_gjtable},
	{index=3,name="四彩护身符·魔追风", list=x930188_var_sxtable},
	{index=4,name="四彩护身符·魔灭神", list=x930188_var_ljtable},
	{index=5,name="四彩护身符·魔狂魔", list=x930188_var_lj2table},
	{index=6,name="四彩护身符·魔医仙", list=x930188_var_lj3table},
}


x930188_var_QuestName = "【兑换】%s"
x930188_var_Questintro = "\t你可以用圣护身符在我这里兑换#W更高级的魔护身符。"
x930188_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"





function x930188_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
	Msg2Player(varMap, varPlayer,"暂停兑换，请通过神兵升级获得",8,2)
	Msg2Player(varMap, varPlayer,"暂停兑换，请通过神兵升级获得",8,3)
	if 1== 1 then
		return
	end
	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930188_var_QuestName,x930188_var_TargetName))
		TalkAppendString(varMap,x930188_var_Questintro)
		for varI, item in x930188_var_table  do
			TalkAppendButton( varMap, x930188_var_FileId, "【兑换】"..item.name, 3, item.index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930188_var_table) then
		--说明用户点击的是2级菜单，需要展示3级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930188_var_QuestName,x930188_var_table[seleteId].name))
		TalkAppendString(varMap,x930188_var_Questintro)
		for varI, item in x930188_var_table[seleteId].list  do
			local index = seleteId * 100 + varI
			TalkAppendButton( varMap, x930188_var_FileId, "【兑换】"..item.targetName, 3, index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 101 then
		--说明用户点击的是3级菜单，需要展示最终兑换的道具
		x930188_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		--对应石头的数组内的索引
		local sindex = mod(seleteId,100)
		local tindex = floor(seleteId/100) --类别

		local targetItem = x930188_var_table[tindex].list[sindex]
		local targetName = targetItem.targetName
		local targetID = targetItem.targetID

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930188_var_QuestName,targetName))
		TalkAppendString(varMap,"需要的道具如下")
		for varI, item in targetItem.need  do
			local curCount = GetItemCount(varMap, varPlayer, item.id)
			TalkAppendString(varMap,format("#R%d#W个#G%s#W，您当前有#R%d#W个", item.num, item.name,curCount))
		end
		AddQuestItemBonus(varMap, targetID, 1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930188_var_FileId, -1);



	end

end


function x930188_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930188_var_FileId,format(x930188_var_QuestName,x930188_var_TargetName),3,-1);

end

function x930188_ProcAccept( varMap, varPlayer )

	x930188_Accept( varMap, varPlayer )

end

function x930188_Accept( varMap, varPlayer )
	local seleteId = x930188_var_SelectIndex[GetGUID(varMap, varPlayer)]
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end

	--对应石头的数组内的索引
	local sindex = mod(seleteId,100)
	local tindex = floor(seleteId/100) --类别

	local targetItem = x930188_var_table[tindex].list[sindex]
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

function x930188_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930188_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930188_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930188_CheckSubmit( varMap, varPlayer )

end




function x930188_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930188_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930188_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930188_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
