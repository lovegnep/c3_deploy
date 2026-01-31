
--DECLARE_QUEST_INFO_START--

x930178_var_FileId = 930178

x930178_var_SelectIndex = {}

-- 兑换目标道具名称
x930178_var_TargetName = "#Rvip道具"
-- 暴击闪避石头
x930178_var_baojitable = {
    {index = 101 ,targetID = 11000906, targetName = "传说级洗石剂·莲华", need = {
        {moneytype=2, num=5000000},
    }},
    {index = 101 ,targetID = 14010044, targetName = "神话级红龙晶", need = {
        {moneytype=2, num=1000000},
    }},
    {index = 101 ,targetID = 14020044, targetName = "神话级绿龙晶", need = {
        {moneytype=2, num=1000000},
    }},
    {index = 101 ,targetID = 14020040, targetName = "传说级绿碧玺", need = {
        {moneytype=2, num=1000000},
    }},
    {index = 101 ,targetID = 14040015, targetName = "神话级金光石", need = {
        {moneytype=2, num=1000000},
    }},
}
-- 攻击石头
x930178_var_gjtable = {
    {index = 101 ,targetID = 11000934, targetName = "传说级洗石剂·雪魂", need = {
        {moneytype=2, num=5000000},
    }},
    {index = 101 ,targetID = 14010033, targetName = "神话级红变石", need = {
        {moneytype=2, num=1000000},
    }},
    {index = 101 ,targetID = 14010037, targetName = "神话级红琥珀", need = {
        {moneytype=2, num=1000000},
    }},
   {index = 101 ,targetID = 14010041, targetName = "神话级红锆石", need = {
        {moneytype=2, num=1000000},
    }},
}
-- 属性石头
x930178_var_sxtable = {
    {index = 101 ,targetID = 11000935, targetName = "传说级洗石剂·冰魄", need = {
        {moneytype=2, num=5000000},
    }},
    {index = 101 ,targetID = 14030033, targetName = "神话级黄刚玉", need = {
        {moneytype=2, num=1000000},
    }},
    {index = 101 ,targetID = 14030041, targetName = "神话级黄琉璃", need = {
        {moneytype=2, num=1000000},
    }},
    {index = 101 ,targetID = 14030037, targetName = "神话级黄锆石", need = {
        {moneytype=2, num=1000000},
    }},
}

-- 6级丸子
x930178_var_ljtable = {
    {index = 101 ,targetID = 11000907, targetName = "神话级洗石剂", need = {
        {moneytype=2, num=10000000},
    }},
    {index = 101 ,targetID = 11000370, targetName = "神话级打磨剂", need = {
        {moneytype=2, num=15000000},
    }},
    --{index = 101 ,targetID = 14050005, targetName = "五行混沌天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050105, targetName = "五行铭昭天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050205, targetName = "五行风雷天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050305, targetName = "五行宝相天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050405, targetName = "五行万相天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050505, targetName = "五行法相天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050605, targetName = "五行如意天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050705, targetName = "五行多宝天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    --{index = 101 ,targetID = 14050805, targetName = "五行碧海天珠", need = {
    --    {moneytype=2, num=8000000},
    --}},
    {index = 101 ,targetID = 12274053, targetName = "贪婪地精勋章", need = {
        {moneytype=2, num=50000000},
    }},
    {index = 101 ,targetID = 12050085, targetName = "一级强身丹", num=10, need = {
        {moneytype=2, num=13900000},
    }},
    {index = 101 ,targetID = 12050075, targetName = "一级心智丹", num=10, need = {
        {moneytype=2, num=13900000},
    }},
    {index = 101 ,targetID = 12050065, targetName = "一级追影丹", num=10, need = {
        {moneytype=2, num=13900000},
    }},
    {index = 101 ,targetID = 12050055, targetName = "一级勇力丹", num=10, need = {
        {moneytype=2, num=13900000},
    }},
}

x930178_var_table = {
	{index=1,level=7,name="vip7商店", list=x930178_var_baojitable},
	{index=2,level=8,name="vip8商店", list=x930178_var_gjtable},
	{index=3,level=9,name="vip9商店", list=x930178_var_sxtable},
	{index=4,level=10,name="vip10商店", list=x930178_var_ljtable},
}


x930178_var_QuestName = "【购买】%s"
x930178_var_Questintro = "\t你可以用现金在我这里购买#WVIP道具。"
x930178_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"





function x930178_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
    local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930178_var_QuestName,x930178_var_TargetName))
        TalkAppendString(varMap,"#Y"..format("您当前贵族等级是#R%d#W级",nLevelPre))
		TalkAppendString(varMap,x930178_var_Questintro)
		for varI, item in x930178_var_table  do
			TalkAppendButton( varMap, x930178_var_FileId, "【打开】"..item.name, 3, item.index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930178_var_table) then
		--说明用户点击的是2级菜单，需要展示3级菜单
        local item = x930178_var_table[seleteId]
        if nLevelPre < item.level then
            Msg2Player(varMap, varPlayer,"贵族等级不足！",8,2)
            Msg2Player(varMap, varPlayer,"贵族等级不足！",8,3)
            return
        end

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930178_var_QuestName,x930178_var_table[seleteId].name))
		TalkAppendString(varMap,x930178_var_Questintro)
		for varI, item in x930178_var_table[seleteId].list  do
			local index = seleteId * 100 + varI
			TalkAppendButton( varMap, x930178_var_FileId, "【购买】"..item.targetName, 3, index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 101 then
		--说明用户点击的是3级菜单，需要展示最终兑换的道具
		x930178_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		--对应石头的数组内的索引
		local sindex = mod(seleteId,100)
		local tindex = floor(seleteId/100) --类别

		local targetItem = x930178_var_table[tindex].list[sindex]
		local targetName = targetItem.targetName
		local targetID = targetItem.targetID

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format(x930178_var_QuestName,targetName))
		TalkAppendString(varMap,"需要的道具如下")
		for varI, item in targetItem.need  do
			TalkAppendString(varMap,format("#{_MONEY%d}现金", item.num))
		end

        local targetnum = 1
        if targetItem.num ~= nil and targetItem.num >0 then
            targetnum = targetItem.num
        end
		AddQuestItemBonus(varMap, targetID, targetnum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930178_var_FileId, -1);



	end

end


function x930178_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930178_var_FileId,format(x930178_var_QuestName,x930178_var_TargetName),3,-1);

end

function x930178_ProcAccept( varMap, varPlayer )

	x930178_Accept( varMap, varPlayer )

end

function x930178_Accept( varMap, varPlayer )
	local seleteId = x930178_var_SelectIndex[GetGUID(varMap, varPlayer)]
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end

	--对应石头的数组内的索引
	local sindex = mod(seleteId,100)
	local tindex = floor(seleteId/100) --类别

	local targetItem = x930178_var_table[tindex].list[sindex]
	local targetName = targetItem.targetName
	local targetID = targetItem.targetID
	local targetnum = 1
    if targetItem.num ~= nil and targetItem.num >0 then
        targetnum = targetItem.num
    end

	for varI, item in targetItem.need  do

        if GetMoney(varMap, varPlayer, 2) < item.num then
            Msg2Player( varMap, varPlayer, "你没有足够的#R现金", 8, 2)
            Msg2Player( varMap, varPlayer, "你没有足够的#R现金", 8, 3)
            return
        end
    end

	--开始扣除
	for varI, item in targetItem.need  do
        if CostMoney(varMap, varPlayer, 2, item.num)   ~= 1 then
            Msg2Player( varMap, varPlayer, "你没有足够的#R现金", 8, 2)
            Msg2Player( varMap, varPlayer, "你没有足够的#R现金", 8, 3)
            return
        end
	end


	local bonusid = targetID
	StartItemTask(varMap)
	ItemAppendBind( varMap, bonusid, targetnum)
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		Msg2Player(varMap, varPlayer,"购买完成",8,3)
		GamePlayScriptLog( varMap, varPlayer, 2670)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法获得物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end

function x930178_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930178_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930178_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930178_CheckSubmit( varMap, varPlayer )

end




function x930178_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930178_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930178_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930178_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
