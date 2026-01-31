
--DECLARE_QUEST_INFO_START--

x930155_var_FileId = 930155

x930155_var_SelectIndex = {}
x930155_var_used = {}
-- 兑换目标道具名称
x930155_var_TargetName = "#R一夜暴富"
-- 暴击闪避石头
x930155_var_baojitable = {
	{index = 101 ,targetID = 14011456, targetName = "钻石级红晶石", need = {--暴击
		{id = 14010044, name = "神话级红龙晶", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 102 ,targetID = 14020397, targetName = "钻石级绿晶石", need = {--暴击
		{id = 14020044, name = "神话级绿龙晶", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 103 ,targetID = 14011633, targetName = "钻石级红釉玉", need = {--暴击减免
		{id = 14020040, name = "传说级绿碧玺", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 104 ,targetID = 14041454, targetName = "钻石级蓝耀石", need = {--闪避
		{id = 14040015, name = "神话级金光石", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
}
-- 攻击石头
x930155_var_gjtable = {
	{index = 201 ,targetID = 14010925, targetName = "黄金级炽焰石", need = {--近攻
		{id = 14010033, name = "神话级红变石", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 202 ,targetID = 14010926, targetName = "黄金级血焰石", need = {--远攻
		{id = 14010037, name = "神话级红琥珀", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 203 ,targetID = 14010927, targetName = "黄金级爆焰石", need = {--魔攻
		{id = 14010041, name = "神话级红锆石", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
}
-- 属性石头
x930155_var_sxtable = {
	{index = 301 ,targetID = 14031279, targetName = "钻石级天星石", need = {--力量
		{id = 14030033, name = "神话级黄刚玉", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 302 ,targetID = 14031810, targetName = "钻石级天星石", need = {--力量
		{id = 14030033, name = "神话级黄刚玉", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 303 ,targetID = 14032341, targetName = "钻石级天星石", need = {--力量
		{id = 14030033, name = "神话级黄刚玉", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},

	{index = 304 ,targetID = 14031456, targetName = "钻石级天魂石", need = {--智力
		{id = 14030041, name = "神话级黄琉璃", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 305 ,targetID = 14031987, targetName = "钻石级天魂石", need = {--智力
		{id = 14030041, name = "神话级黄琉璃", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 306 ,targetID = 14032518, targetName = "钻石级天魂石", need = {--智力
		{id = 14030041, name = "神话级黄琉璃", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},

	{index = 307 ,targetID = 14031633, targetName = "钻石级天命石", need = {--敏捷
		{id = 14030037, name = "神话级黄锆石", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14032164, targetName = "钻石级天命石", need = {--敏捷
		{id = 14030037, name = "神话级黄锆石", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14032695, targetName = "钻石级天命石", need = {--敏捷
		{id = 14030037, name = "神话级黄锆石", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},


}

-- 6级丸子
x930155_var_ljtable = {
	{index = 1 ,targetID = 14050006, targetName = "六合混沌天珠", need = {--力量
		{id = 14050005, name = "五行混沌天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050106, targetName = "六合铭昭天珠", need = {--力量
		{id = 14050105, name = "五行铭昭天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050206, targetName = "六合风雷天珠", need = {--力量
		{id = 14050205, name = "五行风雷天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050306, targetName = "六合宝相天珠", need = {--力量
		{id = 14050305, name = "五行宝相天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050406, targetName = "六合万相天珠", need = {--力量
		{id = 14050405, name = "五行万相天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050506, targetName = "六合法相天珠", need = {--力量
		{id = 14050505, name = "五行法相天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050606, targetName = "六合如意天珠", need = {--力量
		{id = 14050605, name = "五行如意天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050706, targetName = "六合多宝天珠", need = {--力量
		{id = 14050705, name = "五行多宝天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},
	{index = 1 ,targetID = 14050806, targetName = "六合碧海天珠", need = {--力量
		{id = 14050805, name = "五行碧海天珠", num=1},
		{id = 11000907, name = "神话级洗石剂", num=1},
	}},



}

-- 购买珍贵道具
x930155_var_buytable = {--moneytype   0现银  1银卡   2现金  3金卡
	{index = 1 ,targetID = 12274039, targetName = "肝帝的证明大礼包", num = 1, moneytype=0,money=100000},
	{index = 1 ,targetID = 11000934, targetName = "传说级洗石剂·雪魂", num = 1, moneytype=0,money=100000},
	{index = 1 ,targetID = 11000935, targetName = "传说级洗石剂·冰魄", num = 1, moneytype=0,money=100000},
	{index = 1 ,targetID = 11000906, targetName = "传说级洗石剂·莲华", num = 1, moneytype=0,money=100000},
	{index = 1 ,targetID = 11000936, targetName = "雪山之星", num = 100, moneytype=0,money=500000},
	{index = 1 ,targetID = 11010018, targetName = "黄金祈福种子", num = 10, moneytype=0,money=100000},
	{index = 1 ,targetID = 11010016, targetName = "黄金许愿种子", num = 10, moneytype=0,money=100000},
	{index = 1 ,targetID = 11012639, targetName = "祈福玉佩", num = 50, moneytype=0,money=500000},
	{index = 1 ,targetID = 11000380, targetName = "稀世奇珍兑换卷", num = 5, moneytype=0,money=2000000},
	{index = 1 ,targetID = 11000381, targetName = "暗影四彩护身符碎片", num = 5, moneytype=0,money=2000000},
	{index = 1 ,targetID = 12274080, targetName = "神兵碎片大礼包", num = 5, moneytype=0,money=400000},
	{index = 1 ,targetID = 12031190, targetName = "魔法月饼", num = 10, moneytype=0,money=500000},
	{index = 1 ,targetID = 12274053, targetName = "贪婪地精勋章", num = 1, moneytype=0,money=100000},
	{index = 1 ,targetID = 12274091, targetName = "战神寻宝图", num = 30, moneytype=0,money=300000},
	{index = 1 ,targetID = 11000330, targetName = "马书残页", num = 10, moneytype=0,money=100000},
}

-- 我要代币
x930155_var_dbtable = {--moneytype   0现银  1银卡   2现金  3金卡
	{index = 1 ,targetID = 12030615, targetName = "大声望包", num = 1},
	{index = 1 ,targetID = 12030614, targetName = "大帮贡包", num = 1},
	{index = 1 ,targetID = 12030762, targetName = "战车荣誉礼包", num = 1},
	{index = 1 ,targetID = 12274009, targetName = "大荣誉包", num = 2},
	{index = 1 ,targetID = 12272432, targetName = "马币包", num = 10},
	{index = 1 ,targetID = 12272433, targetName = "征服包", num = 10},
	{index = 1 ,targetID = 12030100, targetName = "现金1锭", num = 5},
	{index = 1 ,targetID = 12030048, targetName = "百两金卡红包", num = 100},
	{index = 1 ,targetID = 12030142, targetName = "天之银卡包(10锭)", num = 1},
	{index = 1 ,targetID = 12250013, targetName = "天赋包", num = 5},
}

x930155_var_table = {
	{index=1,name="[兑换]#R暴击闪避石头", list=x930155_var_baojitable},
	{index=2,name="[兑换]#R攻击石头", list=x930155_var_gjtable},
	{index=3,name="[兑换]#R属性石头", list=x930155_var_sxtable},
	{index=4,name="[兑换]#R6级丸子", list=x930155_var_ljtable},
	{index=5,name="[购买]#R珍贵道具", list=x930155_var_buytable, buy=1},
	{index=6,name="[我要]#R代币", list=x930155_var_dbtable,give=1,},
}

x930155_var_xinyunplayer = {}
x930155_var_QuestName = "【我要】%s"
x930155_var_Questintro = "\t你想一夜暴富吗"
x930155_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"
x930155_var_interval = 5*3600--要间隔5小时   单位秒




function x930155_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < 65 then
		Msg2Player(varMap, varPlayer, format("人物等级不足%d",65), 8, 2)
		Msg2Player(varMap, varPlayer, format("人物等级不足%d",65), 8, 3)
		return
	end

	local lasttime = GetPlayerGameData(varMap,varPlayer,MD_RECRUIT_TOGOLD[1],MD_RECRUIT_TOGOLD[2],MD_RECRUIT_TOGOLD[3])
	if lasttime ~= nil and GetCurrentTime() - lasttime < x930155_var_interval then
		Msg2Player(varMap, varPlayer, format("距离上次遇见福星不足#R%d#W小时",floor(x930155_var_interval/3600)), 8, 2)
		Msg2Player(varMap, varPlayer, format("距离上次遇见福星不足#R%d#W小时",floor(x930155_var_interval/3600)), 8, 3)
		return
	end



	if seleteId == nil then
	seleteId = -1
	end

	if seleteId == -1 then  --兑换
	--说明用户点击的是1级菜单，需要展示2级菜单
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..format(x930155_var_QuestName,x930155_var_TargetName))
	TalkAppendString(varMap,x930155_var_Questintro)
	for varI, item in x930155_var_table  do
	TalkAppendButton( varMap, x930155_var_FileId, "【兑换】"..item.name, 3, item.index )
	end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930155_var_table) then  --兑换
	--说明用户点击的是2级菜单，需要展示3级菜单
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..format(x930155_var_QuestName,x930155_var_table[seleteId].name))
	TalkAppendString(varMap,x930155_var_Questintro)
	for varI, item in x930155_var_table[seleteId].list  do
	local index = seleteId * 100 + varI
	local button = ""
	if x930155_var_table[seleteId].buy ~= nil and x930155_var_table[seleteId].buy==1 then
	button = "【购买】"..item.targetName
	elseif x930155_var_table[seleteId].give ~= nil and x930155_var_table[seleteId].give==1 then
	button = "【我要】"..item.targetName
	else
	button = "【兑换】"..item.targetName
	end
	TalkAppendButton( varMap, x930155_var_FileId, button, 3, index )
	end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 101 then  --兑换
	--说明用户点击的是3级菜单，需要展示最终兑换的道具
	x930155_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
	--对应石头的数组内的索引
	local sindex = mod(seleteId,100)
	local tindex = floor(seleteId/100) --类别

	local targetItem = x930155_var_table[tindex].list[sindex]
	local targetName = targetItem.targetName
	local targetID = targetItem.targetID

	if x930155_var_table[tindex].buy ~= nil and x930155_var_table[tindex].buy==1 then
	--购买
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..format("【购买】%s",targetName))
	TalkAppendString(varMap,format("需要现金#R%d#W两",targetItem.money/1000))
	AddQuestItemBonus(varMap, targetID, targetItem.num)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930155_var_FileId, -1);
	elseif x930155_var_table[tindex].give ~= nil and x930155_var_table[tindex].give==1 then
	--我要
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..format(x930155_var_QuestName,targetName))
	AddQuestItemBonus(varMap, targetID, targetItem.num)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930155_var_FileId, -1);


	else
	--兑换

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..format(x930155_var_QuestName,targetName))
	TalkAppendString(varMap,"需要的道具如下")
	for varI, item in targetItem.need  do
	local curCount = GetItemCount(varMap, varPlayer, item.id)
	TalkAppendString(varMap,format("#R%d#W个#G%s#W，您当前有#R%d#W个", item.num, item.name,curCount))
	end
	AddQuestItemBonus(varMap, targetID, 1)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930155_var_FileId, -1);


	end




	end
	
end


function x930155_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local shi,fen,miao = GetHourMinSec()
	if x930155_var_used[varMap] ~= nil and x930155_var_used[varMap] == shi then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"对不起，我的幸运已经送出去了！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	StartTalkTask(varMap)
	TalkAppendString(varMap,"恭喜你找到我，抓住机会，一夜暴富。")
	TalkAppendString(varMap,"\t在这里你可以以极低的价格购买珍贵道具！")
	TalkAppendString(varMap,"\t在这里你可以以极少的成本兑换珍贵道具！")
	TalkAppendString(varMap,"\t在这里你可以直接获得随机代币！")
	TalkAppendButton(varMap,x930155_var_FileId,format(x930155_var_QuestName,x930155_var_TargetName),3,-1);
	--TalkAppendButton(varMap,x930155_var_FileId,"我要#R购买",3,-2);
	--TalkAppendButton(varMap,x930155_var_FileId,"我要#R代币",3,-3);

	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)



end

function x930155_ProcAccept( varMap, varPlayer , varTalknpc)

	x930155_Accept( varMap, varPlayer , varTalknpc)

end

function x930155_Accept( varMap, varPlayer , varTalknpc)
	local shi,fen,miao = GetHourMinSec()
	if x930155_var_used[varMap] ~= nil and x930155_var_used[varMap] == shi then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"对不起，我的幸运已经送出去了！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local seleteId = x930155_var_SelectIndex[GetGUID(varMap, varPlayer)]
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end

	--对应石头的数组内的索引
	local sindex = mod(seleteId,100)
	local tindex = floor(seleteId/100) --类别

	local targetItem = x930155_var_table[tindex].list[sindex]
	local targetName = targetItem.targetName
	local targetID = targetItem.targetID
    local targetNum = 1
    if targetItem.num ~= nil then
        targetNum = targetItem.num
    end

    if x930155_var_table[tindex].buy ~= nil and x930155_var_table[tindex].buy==1 then
        --购买
        if CostMoney(varMap, varPlayer, 2, targetItem.money, 307) == 1 then
            --成功
        else
            StartTalkTask(varMap,varPlayer)
            TalkAppendString(varMap,"对不起，您所携带的现金不足！")
            StopTalkTask()
            DeliverTalkTips(varMap,varPlayer)
            return
        end

    elseif x930155_var_table[tindex].give ~= nil and x930155_var_table[tindex].give==1 then
        --我要


    else
        --兑换


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


    end



    local bonusid = targetID
    StartItemTask(varMap)
    ItemAppendBind( varMap, bonusid, targetNum)
    local varRet = StopItemTask(varMap,varPlayer)
    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap,varPlayer)
        Msg2Player(varMap, varPlayer,format("恭喜你获得%d个%s", targetNum, targetName),8,3)
        Msg2Player(varMap, varPlayer,format("恭喜你获得%d个%s", targetNum, targetName),8,2)
        GamePlayScriptLog( varMap, varPlayer, 2670)
		local shi1,fen1,miao1 = GetHourMinSec()
		x930155_var_used[varMap] = shi1

		local mm = format("恭喜！%s遇见了福星，获得了%d个%s", GetName(varMap, varPlayer),targetNum,targetName )
		LuaAllScenceM2Wrold(varMap, mm, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, mm, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, mm, CHAT_MAIN_RIGHTDOWN, 1)

        x930155_var_xinyunplayer[GetName(varMap, varPlayer)] = 1

		SetPlayerGameData( varMap, varPlayer, MD_RECRUIT_TOGOLD[ 1], MD_RECRUIT_TOGOLD[ 2], MD_RECRUIT_TOGOLD[ 3], GetCurrentTime())


	else
        StartTalkTask(varMap)
        TalkAppendString(varMap,"物品栏已满，无法获得物品！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
    end

    --删除福星
    DeleteMonster( varMap, varTalknpc)

end

function x930155_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930155_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930155_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930155_CheckSubmit( varMap, varPlayer )

end




function x930155_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930155_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930155_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930155_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

function x930155_Procshoppingend(varMap, varAct, varTime)

    if getn(x930155_var_xinyunplayer) > 0 then
        local varMsg = ""
        for pname, vari in x930155_var_xinyunplayer do
            varMsg = varMsg..pname.." "
        end
        local msg = format("福星消失了，恭喜本轮的幸运玩家 %s", varMsg)
        LuaAllScenceM2Wrold(varMap, msg, CHAT_LEFTDOWN, 1)
        x930155_var_xinyunplayer = {}

        return
    end

    x930155_var_xinyunplayer = {}
    LuaAllScenceM2Wrold(varMap, "福星消失了，很遗憾本轮没有幸运玩家", CHAT_LEFTDOWN, 1)
end
