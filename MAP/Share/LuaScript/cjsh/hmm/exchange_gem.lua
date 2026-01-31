
--DECLARE_QUEST_INFO_START--

x930147_var_FileId = 930147

x930147_var_SelectIndex = {}

-- 兑换目标道具名称
x930147_var_TargetName = "#R宝石"
-- 暴击闪避石头
x930147_var_baojitable = {
	{index = 101 ,targetID = 14011456, targetName = "钻石级红晶石", need = {--暴击
		{id = 14010044, name = "神话级红龙晶", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 102 ,targetID = 14020397, targetName = "钻石级绿晶石", need = {--暴击
		{id = 14020044, name = "神话级绿龙晶", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 103 ,targetID = 14011633, targetName = "钻石级红釉玉", need = {--暴击减免
		{id = 14020040, name = "传说级绿碧玺", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 104 ,targetID = 14041454, targetName = "钻石级蓝耀石", need = {--闪避
		{id = 14040015, name = "神话级金光石", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
}
-- 攻击石头
x930147_var_gjtable = {
	{index = 201 ,targetID = 14010925, targetName = "黄金级炽焰石", need = {--近攻
		{id = 14010033, name = "神话级红变石", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 202 ,targetID = 14010926, targetName = "黄金级血焰石", need = {--远攻
		{id = 14010037, name = "神话级红琥珀", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 203 ,targetID = 14010927, targetName = "黄金级爆焰石", need = {--魔攻
		{id = 14010041, name = "神话级红锆石", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
}
-- 属性石头
x930147_var_sxtable = {
	{index = 301 ,targetID = 14031279, targetName = "钻石级天星石", need = {--力量
		{id = 14030033, name = "神话级黄刚玉", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 302 ,targetID = 14031810, targetName = "钻石级天星石", need = {--力量
		{id = 14030033, name = "神话级黄刚玉", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 303 ,targetID = 14032341, targetName = "钻石级天星石", need = {--力量
		{id = 14030033, name = "神话级黄刚玉", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},

	{index = 304 ,targetID = 14031456, targetName = "钻石级天魂石", need = {--智力
		{id = 14030041, name = "神话级黄琉璃", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 305 ,targetID = 14031987, targetName = "钻石级天魂石", need = {--智力
		{id = 14030041, name = "神话级黄琉璃", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 306 ,targetID = 14032518, targetName = "钻石级天魂石", need = {--智力
		{id = 14030041, name = "神话级黄琉璃", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},

	{index = 307 ,targetID = 14031633, targetName = "钻石级天命石", need = {--敏捷
		{id = 14030037, name = "神话级黄锆石", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14032164, targetName = "钻石级天命石", need = {--敏捷
		{id = 14030037, name = "神话级黄锆石", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14032695, targetName = "钻石级天命石", need = {--敏捷
		{id = 14030037, name = "神话级黄锆石", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},


}

-- 6级丸子
x930147_var_ljtable = {
	{index = 1 ,targetID = 14050006, targetName = "六合混沌天珠", need = {--力量
		{id = 14050005, name = "五行混沌天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050106, targetName = "六合铭昭天珠", need = {--力量
		{id = 14050105, name = "五行铭昭天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050206, targetName = "六合风雷天珠", need = {--力量
		{id = 14050205, name = "五行风雷天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050306, targetName = "六合宝相天珠", need = {--力量
		{id = 14050305, name = "五行宝相天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050406, targetName = "六合万相天珠", need = {--力量
		{id = 14050405, name = "五行万相天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050506, targetName = "六合法相天珠", need = {--力量
		{id = 14050505, name = "五行法相天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050606, targetName = "六合如意天珠", need = {--力量
		{id = 14050605, name = "五行如意天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050706, targetName = "六合多宝天珠", need = {--力量
		{id = 14050705, name = "五行多宝天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},
	{index = 1 ,targetID = 14050806, targetName = "六合碧海天珠", need = {--力量
		{id = 14050805, name = "五行碧海天珠", num=2},
		{id = 11000907, name = "神话级洗石剂", num=2},
	}},



}

x930147_var_table = {
	{index=1,name="暴击闪避石头", list=x930147_var_baojitable},
	{index=2,name="攻击石头", list=x930147_var_gjtable},
	{index=3,name="属性石头", list=x930147_var_sxtable},
	{index=4,name="6级丸子", list=x930147_var_ljtable},
}


x930147_var_QuestName = "【兑换】%s"
x930147_var_Questintro = "\t你可以用生活技能制造的宝石在我这里兑换#W更高级的宝石。"
x930147_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"





function x930147_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)

	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930147_var_QuestName,x930147_var_TargetName))
		TalkAppendString(varMap,x930147_var_Questintro)
		for varI, item in x930147_var_table  do
			TalkAppendButton( varMap, x930147_var_FileId, "【兑换】"..item.name, 3, item.index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930147_var_table) then
		--说明用户点击的是2级菜单，需要展示3级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930147_var_QuestName,x930147_var_table[seleteId].name))
		TalkAppendString(varMap,x930147_var_Questintro)
		for varI, item in x930147_var_table[seleteId].list  do
			local index = seleteId * 100 + varI
			TalkAppendButton( varMap, x930147_var_FileId, "【兑换】"..item.targetName, 3, index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 101 then
		--说明用户点击的是3级菜单，需要展示最终兑换的道具
		x930147_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		--对应石头的数组内的索引
		local sindex = mod(seleteId,100)
		local tindex = floor(seleteId/100) --类别

		local targetItem = x930147_var_table[tindex].list[sindex]
		local targetName = targetItem.targetName
		local targetID = targetItem.targetID

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930147_var_QuestName,targetName))
		TalkAppendString(varMap,"需要的道具如下")
		for varI, item in targetItem.need  do
			local curCount = GetItemCount(varMap, varPlayer, item.id)
			TalkAppendString(varMap,format("#R%d#W个#G%s#W，您当前有#R%d#W个", item.num, item.name,curCount))
		end
		AddQuestItemBonus(varMap, targetID, 1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930147_var_FileId, -1);



	end

end


function x930147_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930147_var_FileId,format(x930147_var_QuestName,x930147_var_TargetName),3,-1);

end

function x930147_ProcAccept( varMap, varPlayer )

	x930147_Accept( varMap, varPlayer )

end

function x930147_Accept( varMap, varPlayer )
	local seleteId = x930147_var_SelectIndex[GetGUID(varMap, varPlayer)]
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end

	--对应石头的数组内的索引
	local sindex = mod(seleteId,100)
	local tindex = floor(seleteId/100) --类别

	local targetItem = x930147_var_table[tindex].list[sindex]
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

function x930147_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930147_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930147_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930147_CheckSubmit( varMap, varPlayer )

end




function x930147_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930147_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930147_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930147_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
