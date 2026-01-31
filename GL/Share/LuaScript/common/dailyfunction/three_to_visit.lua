--三顾茅庐服务器功能脚本
				

x802006_MaxCardCount  = 9;		--最大牌数
x802006_MaxDaiylCount = 10;     --每日没大轮数
x802006_MaxVisitCount = 3;		--最大顾数
x802006_IsOver = 10;			--当天顾数轮数都用完,不能刷新物品
x802006_MoneyType ={
								[0] ="现银",
								[1] ="银卡",
								[2] ="现金",
								[3] ="金卡",
								}
x802006_LevelLimit = 40
				
--跨天检查
function x802006_ProcSwitchDayCheck(varMap, varPlayer)
	local Today = GetDayOfYear();
	local oldDay = x802006_GetDayMD(varMap, varPlayer)
	local ToWeek = GetWeekIndex(varMap, varPlayer)
	local oldWeek = x802006_GetWeekMD(varMap, varPlayer)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer)
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer)
	
	local nStart = 0;
	
	if (Today > oldDay) then
		x802006_SetDayMD(varMap, varPlayer, Today)
		if x802006_GetGameOverMD(varMap, varPlayer) == 1 or nVisitCount == x802006_IsOver and nDaiylCount + 1 > x802006_MaxDaiylCount then
			x802006_SetDailyCountMD(varMap, varPlayer, 0)
			x802006_SetVisitCountMD(varMap, varPlayer, 0)
			x802006_SetGameOverMD(varMap, varPlayer, 0)
		end
		nStart = 1
	end
	
	if (ToWeek > oldWeek) then
		x802006_SetWeekMD(varMap, varPlayer, ToWeek)
		x802006_SetDailyCountMD(varMap, varPlayer, 0)
		x802006_SetVisitCountMD(varMap, varPlayer, 0)
		x802006_SetGameOverMD(varMap, varPlayer, 0)
		--刷新物品
		nStart = 2;
	end
	
	return nStart
end

--进入地图检测,发送数据
function x802006_EnterMap(varMap, varPlayer)
	x802006_ProcSwitchDayCheck(varMap, varPlayer)
end

--点击牌
function x802006_Consume(varMap, varPlayer, CardCount)
	local nDaiylyCount = x802006_GetDailyCountMD(varMap, varPlayer) - 1
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer) - 1
	local nClick = x802006_GetClickMD(varMap, varPlayer) + 1
	local nCardIndex = x802006_GetCardCountMD(varMap, varPlayer, nClick)
	local nEndGame = x802006_GetGameOverMD(varMap, varPlayer)
	
	if nEndGame == 1 then
		Msg2Player(varMap,varPlayer,"今天已经结束",8,2)
		Msg2Player(varMap,varPlayer,"今天已经结束",8,3)
		return
	end
	
	if (x802006_GetTrapMD(varMap, varPlayer) == 1) then
		Msg2Player(varMap,varPlayer,"很不幸，你中陷阱了,请先解除陷阱",8,2)
		Msg2Player(varMap,varPlayer,"很不幸，你中陷阱了,请先解除陷阱",8,3)
		return
	end

	if (x802006_GetCardTempMD(varMap, varPlayer, CardCount + 1) ~= 0) then
		Msg2Player(varMap,varPlayer,"你已经选过这张牌了",8,2)
		Msg2Player(varMap,varPlayer,"你已经选过这张牌了",8,3)
		return
	end
	
	if (nCardIndex == nil or nCardIndex == 0) then
		return
	end
	
	--检查背包是否有空位
	local nBagSize0 = GetBagSpace(varMap, varPlayer, 0)
	local nBagSize1 = GetBagSpace(varMap, varPlayer, 1)
	if (nBagSize0 == 0 or nBagSize1 == 0) then
		Msg2Player(varMap,varPlayer,"物品背包或卡牌背包已满，请整理后再试",8,2)
		Msg2Player(varMap,varPlayer,"物品背包或卡牌背包已满，请整理后再试",8,3)
		return
	end
	
	local click = 0
	for i = 1, x802006_MaxCardCount do
		if x802006_GetCardTempMD(varMap, varPlayer, i) > 0 then
			click = click + 1
		end
	end
	
	if (click >= x802006_MaxCardCount) then
		return
	end
	
	--计算消耗
	local cMoneyType1,cMoneyType2,cMoney,cRMoneyType1,cRMoneyType2,cRMoney = ThreeToVisitConsume(varMap,varPlayer,nDaiylyCount,nVisitCount,click)
	if (cMoneyType1 == -1 or cMoney == -1 or cRMoneyType1 == -1 or cRMoney == -1) then
		return
	end
	
	--具体扣除那种货币
	local MonType = -1;
	local firstGold	= GetGoldMode(varMap,varPlayer)
	local firstSiller = GetSillerMode(varMap,varPlayer)
	local firstType = 0;
	if (firstSiller == 0) then
		firstSiller = 1
	else
		firstSiller = 0
	end
	if (firstGold == 0) then
		firstGold = 3
	else
		firstGold = 2
	end
	
	if (cMoneyType1 == -1 or cMoneyType2 == -1) then
		if (cMoneyType1 ~= -1) then
			MonType = cMoneyType1
		end
		if (cMoneyType2 ~= -1) then
			MonType = cMoneyType2
		end
	end
	
	if (cMoneyType1 ~= -1 and cMoneyType2 ~= -1) then
		if (cMoneyType1 == 0 or cMoneyType1 == 1 and cMoneyType2 == 0 or cMoneyType2 == 1) then
			MonType = firstSiller;
			firstType = 1;
		end
		if (cMoneyType1 == 2 or cMoneyType1 == 3 and cMoneyType2 == 2 or cMoneyType2 == 3) then
			MonType = firstGold;
			firstType = 2;
		end
	end
	
	if (MonType < 0 or MonType > 3) then
		return
	end
	
	--优先扣除的货币不够再扣除其他货币
	local money = GetMoney(varMap, varPlayer, MonType)
	if (money < cMoney) then
		if (firstType == 1) then
			MonType = 1;
		end
		if (firstType == 2) then
			MonType = 3;
		end
	end
	
	if (MonType < 0 or MonType > 3) then
		return
	end
	
	local moneyLogType = 0
	if MonType == 0 then
		moneyLogType = 520
	elseif MonType == 1 then
		moneyLogType = 519
	elseif MonType == 2 then
		moneyLogType = 515
	elseif MonType == 1 then
		moneyLogType = 521
	end
	
	--扣钱
	local bIsOk = CostMoney(varMap, varPlayer, MonType, cMoney, moneyLogType)
	if (bIsOk == -1) then
		Msg2Player(varMap,varPlayer,format("您身上的"..x802006_MoneyType[MonType].."不足#R#{_MONEY%d}#cffcc00，无法进行翻牌",cMoney),8,2)
		Msg2Player(varMap,varPlayer,format("您身上的"..x802006_MoneyType[MonType].."不足#R#{_MONEY%d}#cffcc00，无法进行翻牌",cMoney),8,3)
		return
	end
	
	--记录点过的牌
	x802006_SetCardTempMD(varMap, varPlayer, CardCount + 1, nCardIndex)
	--增加点击次数
	x802006_SetClickMD(varMap, varPlayer, nClick)
	
	--生成奖励
	local hType, hValue, cType = x802006_Hortation(varMap, varPlayer, nCardIndex, CardCount)
	local str = nil
	
	if (cType ~= 0) then
		if (hType == 0) then
			--str = "获得现银:"..tostring(hValue)
		elseif (hType == 1) then
			--str = "获得银卡:"..tostring(hValue)
		elseif (hType == 2) then
			--str = "获得现金:"..tostring(hValue)
		elseif (hType == 3) then
			--str = "获得金卡:"..tostring(hValue)
		elseif (hType == 4) then
			--str = "获得声望:"..tostring(hValue)
		elseif (hType == 5) then
			--str = "获得荣誉:"..tostring(hValue)
		elseif (hType == 6) then
			--str = "获得帮贡:"..tostring(hValue)
		elseif (hType == 10) then
			--str = "获得战场积分:"..tostring(hValue)
		elseif (hType == 15) then
			--str = "获得战车荣誉:"..tostring(hValue)
		elseif (hType == 17) then
			--str = "获得征服点数:"..tostring(hValue)
		elseif (hType == 101) then
			--str = "获得天赋:"..tostring(hValue)
		elseif (hType == 102) then
			--str = "获得经验:"..tostring(hValue)
		elseif (hType == 103) then
			x802006_SetTrapMD(varMap, varPlayer, 1)
		elseif (hType == 104) then
			--清空数据
			x802006_ClearInfo(varMap, varPlayer, 1)
			--记录当天轮顾用完不能刷新物品
			if(nVisitCount + 1 == x802006_MaxVisitCount) then
				x802006_ClearInfo(varMap, varPlayer, 0)
				if (nDaiylyCount + 1 == x802006_MaxDaiylCount) then
					x802006_SetVisitCountMD(varMap, varPlayer, x802006_IsOver)
				end
			end
		end
		if (str ~= nil) then
			Msg2Player(varMap,varPlayer,str,8,2)
			Msg2Player(varMap,varPlayer,str,8,3)
		end
	end

end

--生成奖励
function x802006_Hortation(varMap, varPlayer, nCardIndex, CardCount)
	local hLevel,hGuild,hType,hValue,hCount = ThreeToVisitHortation(varMap, varPlayer, nCardIndex)
	if (hLevel == -1 or hGuild == -1 or hType == -1 or hValue == -1) then
		return
	end
		
	local nType = 1;
	local str = ""
	
	--等级检测
	if (hLevel > GetLevel(varMap, varPlayer)) then
		nType = 0;
		str = "等级不够,不能获得奖励"
	end
	
	--帮会检测
	if (hGuild > 0) then
		if (GetGuildID(varMap, varPlayer) == -1) then
			nType = 0;
			str = "没有帮会,不能获得奖励"
		end
	end
	
	if (nType == 0) then
		Msg2Player(varMap,varPlayer,str,8,2)
		Msg2Player(varMap,varPlayer,str,8,3)
	end
	
	--发送奖励
	MakeThreeToVisitHortation(varMap, varPlayer, hType, hValue, hCount, nCardIndex, CardCount, nType)
	--生成物品
	if (hType == 104) then
		StartItemTask(varMap);
		--ItemAppend(varMap, hValue, hCount);
		ItemAppendBind(varMap, hValue, hCount);
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StopItemTask(varMap,varPlayer)
	end
	
	--返回奖励类型
	return hType,hValue,nType
end

--开始新一轮
function x802006_CkeckStart(varMap, varPlayer, nType)
	local nWeekStart = x802006_ProcSwitchDayCheck(varMap, varPlayer)
	local nDaiylyCount = x802006_GetDailyCountMD(varMap, varPlayer) + 1
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer) + 1
	local nEndGame = x802006_GetGameOverMD(varMap, varPlayer)
	
	if (nDaiylyCount > x802006_MaxDaiylCount or nEndGame == 1) then
		Msg2Player(varMap,varPlayer,"当天轮数已用完",8,2)
		Msg2Player(varMap,varPlayer,"当天轮数已用完",8,3)
		return
	end

	--3顾结束后重开一轮,看顾数是否满足重开一轮的标准
	if (nType ~= nil) then
		if (nVisitCount < x802006_MaxVisitCount and nVisitCount ~= 1) then
			return
		else
			x802006_SetVisitCountMD(varMap, varPlayer , 1)
		end
	else
		--直接开一轮
		x802006_SetVisitCountMD(varMap, varPlayer , 1)
	end
	
	--清空数据
	x802006_ClearInfo(varMap, varPlayer, 0)
	x802006_ClearInfo(varMap, varPlayer, 1)
	x802006_SetTrapMD(varMap, varPlayer, 0)
	x802006_SetClickMD(varMap, varPlayer, 0)
	x802006_SetAllShow(varMap, varPlayer, 0)
	
	x802006_SetDailyCountMD(varMap, varPlayer , nDaiylyCount)

	
	--随即奖励
	x802006_RandomItem(varMap, varPlayer)
	x802006_RandomCard(varMap, varPlayer)
	
	--向客户端发送数据
	x802006_SendInfo(varMap, varPlayer)
end

--开始新一顾
function x802006_NewVisit(varMap, varPlayer, nMsgType)
	local nWeekStart = x802006_ProcSwitchDayCheck(varMap, varPlayer)
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer)
	nVisitCount = nVisitCount + 1
	--清空数据
	x802006_ClearInfo(varMap, varPlayer, 1)
	
	if (nVisitCount > x802006_MaxVisitCount) then
		--开始新一轮
		x802006_CkeckStart(varMap, varPlayer)
		return
	end
	
	--每周刷新一次物品
	if (nWeekStart ~= 0) then
		--开始新一轮
		x802006_CkeckStart(varMap, varPlayer, 1)
		return
	end
	
	x802006_SetVisitCountMD(varMap, varPlayer, nVisitCount)
	x802006_SetClickMD(varMap, varPlayer, 0)
	x802006_RandomCard(varMap, varPlayer)
	
	local nItem_1, nItemArrIndex_1 = x802006_GetItemMD(varMap, varPlayer, 1)
	local nItem_2, nItemArrIndex_2 = x802006_GetItemMD(varMap, varPlayer, 2)
	local nItem_3, nItemArrIndex_3 = x802006_GetItemMD(varMap, varPlayer, 3)
	
	SendThreeToVisitItem(varMap,varPlayer,nDaiylCount,nVisitCount,nItem_1,nItem_2,nItem_3,nMsgType)
end

--清除当轮或顾数据
function x802006_ClearInfo(varMap, varPlayer, nType)
	--清除MD
	if (nType == 1) then
		for i = 1, x802006_MaxCardCount do
			x802006_SetCardCountMD(varMap, varPlayer, i, 0)
			x802006_SetCardTempMD(varMap, varPlayer, i, 0)
		end
	elseif (nType == 0) then
		for i = 1, x802006_MaxVisitCount do
			x802006_SetItemMD(varMap, varPlayer, i , 0, 0)
		end
	end
end

--随即物品奖励
function x802006_RandomItem(varMap, varPlayer)
	--随即牌索引
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer) - 1
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer) - 1
	

	local nIndex_1,nItem_1,nIndex_2,nItem_2,nIndex_3,nItem_3 = RandThreeToVisitItemIndex(varMap, varPlayer, nDaiylCount, nVisitCount);
	if (nItem_1 == -1 or nItem_2 == -1 or nItem_3 == -1) then
		return
	end
	
	x802006_SetItemMD(varMap, varPlayer, 1, nItem_1, nIndex_1)
	x802006_SetItemMD(varMap, varPlayer, 2, nItem_2, nIndex_2)
	x802006_SetItemMD(varMap, varPlayer, 3, nItem_3, nIndex_3)
	
end

--随即牌奖励
function x802006_RandomCard(varMap, varPlayer)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer) - 1
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer) - 1

	local nItemIndex, nItemArrIndex = x802006_GetItemMD(varMap, varPlayer, nVisitCount + 1)
	if (nItemArrIndex == nil or nItemIndex == nil) then
		return
	end

	--随即其他奖励
	local nCardMD_1,nCardMD_2,nCardMD_3,nCardMD_4,nCardMD_5,nCardMD_6,nCardMD_7,nCardMD_8,nCardMD_9 = RandThreeToVisitCardIndex(varMap,varPlayer,nDaiylCount,nVisitCount,nItemArrIndex, nItemIndex)
	if (nCardMD_1 == -1 or nCardMD_2 ==-1 or nCardMD_3 ==-1) then
		return
	end

	x802006_SetCardCountMD(varMap, varPlayer, 1, nCardMD_1)
	x802006_SetCardCountMD(varMap, varPlayer, 2, nCardMD_2)
	x802006_SetCardCountMD(varMap, varPlayer, 3, nCardMD_3)
	x802006_SetCardCountMD(varMap, varPlayer, 4, nCardMD_4)
	x802006_SetCardCountMD(varMap, varPlayer, 5, nCardMD_5)
	x802006_SetCardCountMD(varMap, varPlayer, 6, nCardMD_6)
	x802006_SetCardCountMD(varMap, varPlayer, 7, nCardMD_7)
	x802006_SetCardCountMD(varMap, varPlayer, 8, nCardMD_8)
	x802006_SetCardCountMD(varMap, varPlayer, 9, nCardMD_9)
	
	--清空点击次数
	x802006_SetClickMD(varMap, varPlayer, 0)
end

--刷新物品奖励
function x802006_RefreshItem(varMap, varPlayer, nMsgType)
	
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer) - 1
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer) - 1
	local nEndGame = x802006_GetGameOverMD(varMap, varPlayer)
	
	if (nVisitCount + 1 == x802006_IsOver or nEndGame == 1) then
		Msg2Player(varMap,varPlayer,"当天轮数已用完",8,2)
		Msg2Player(varMap,varPlayer,"当天轮数已用完",8,3)
		return
	end
	
	local nIndex_1,nItem_1,nIndex_2,nItem_2,nIndex_3,nItem_3 = RandThreeToVisitItemIndex(varMap, varPlayer, nDaiylCount, nVisitCount);
	if (nItem_1 == -1 or nItem_2 == -1 or nItem_3 == -1) then
		return
	end
	
	--扣钱
	local bIsOk = CostMoney(varMap, varPlayer, 3, 8000, 521)
	if (bIsOk == -1) then
		Msg2Player(varMap,varPlayer,format("您身上的"..x802006_MoneyType[3].."不足#R#{_MONEY%d}#cffcc00，无法刷新宝物",8000),8,2)
		Msg2Player(varMap,varPlayer,format("您身上的"..x802006_MoneyType[3].."不足#R#{_MONEY%d}#cffcc00，无法刷新宝物",8000),8,3)
		return
	end
	
	local nOldItem_1, nItemArrIndex_1 = x802006_GetItemMD(varMap, varPlayer, 1)
	local nOldItem_2, nItemArrIndex_2 = x802006_GetItemMD(varMap, varPlayer, 2)
	local nOldItem_3, nItemArrIndex_3 = x802006_GetItemMD(varMap, varPlayer, 3)
	
	local nNewItem_1, nNewItem_2, nNewItem_3
	
	--物品在牌中的位置
	nVisitCount = nVisitCount + 1
	if (nVisitCount == 1) then
		x802006_SetCardCountMD(varMap, varPlayer, nItemArrIndex_1 + 1, nItem_1)
		
		x802006_SetItemMD(varMap, varPlayer, 1, nItem_1, nItemArrIndex_1)
		x802006_SetItemMD(varMap, varPlayer, 2, nItem_2, nItemArrIndex_2)
		x802006_SetItemMD(varMap, varPlayer, 3, nItem_3, nItemArrIndex_3)
		
		nNewItem_1 = nItem_1
		nNewItem_2 = nItem_2
		nNewItem_3 = nItem_3
	end
	if (nVisitCount == 2) then
		x802006_SetCardCountMD(varMap, varPlayer, nItemArrIndex_2 + 1, nItem_2)
		
		x802006_SetItemMD(varMap, varPlayer, 2, nItem_2, nItemArrIndex_2)
		x802006_SetItemMD(varMap, varPlayer, 3, nItem_3, nItemArrIndex_3)
		
		nNewItem_1 = nOldItem_1
		nNewItem_2 = nItem_2
		nNewItem_3 = nItem_3

	end
	if (nVisitCount == 3) then
		x802006_SetCardCountMD(varMap, varPlayer, nItemArrIndex_3 + 1, nItem_3)
		
		x802006_SetItemMD(varMap, varPlayer, 3, nItem_3, nItemArrIndex_3)
		
		nNewItem_1 = nOldItem_1
		nNewItem_2 = nOldItem_2
		nNewItem_3 = nItem_3
	end
	
	if (nNewItem_1 == nil or nNewItem_2 == nil or nNewItem_3 ==nil) then
		return
	end
	
	SendThreeToVisitItem(varMap,varPlayer,nDaiylCount+1,nVisitCount,nNewItem_1,nNewItem_2,nNewItem_3,nMsgType)
end

--解除陷阱(复活)
function x802006_RefreshTrap(varMap, varPlayer)
	if (x802006_GetTrapMD(varMap, varPlayer) ~= 1) then
		return 0
	end
	
	local CardCount = 0
	for i = 1, x802006_MaxCardCount do
		if x802006_GetCardTempMD(varMap, varPlayer, i) > 0 then
			CardCount = CardCount + 1
		end
	end
	
	if (CardCount >= x802006_MaxCardCount) then
		return
	end
	
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer) - 1
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer) - 1
	
	--计算消耗
	local cMoneyType1,cMoneyType2,cMoney,cRMoneyType1,cRMoneyType2,cRMoney = ThreeToVisitConsume(varMap,varPlayer,nDaiylCount,nVisitCount,CardCount)
	if (cMoneyType1 == -1 or cMoney == -1 or cRMoneyType1 == -1 or cRMoney == -1) then
		return
	end
	
	--具体扣除那种货币
	local MonType = -1;
	local firstGold	= GetGoldMode(varMap,varPlayer)
	local firstSiller = GetSillerMode(varMap,varPlayer)
	if (firstSiller == 0) then
		firstSiller = 1
	else
		firstSiller = 0
	end
	if (firstGold == 0) then
		firstGold = 3
	else
		firstGold = 2
	end
	
	local firstType = 0;
	
	if (cRMoneyType1 == -1 or cRMoneyType2 == -1) then
		if (cRMoneyType1 ~= -1) then
			MonType = cRMoneyType1
		end
		if (cRMoneyType2 ~= -1) then
			MonType = cRMoneyType2
		end
	end
	
	if (cRMoneyType1 ~= -1 and cRMoneyType2 ~= -1) then
		if (cRMoneyType1 == 0 or cRMoneyType1 == 1 and cRMoneyType2 == 0 or cRMoneyType2 == 1) then
			MonType = firstSiller;
			firstType = 1;
		end
		if (cRMoneyType1 == 2 or cRMoneyType1 == 3 and cRMoneyType2 == 2 or cRMoneyType2 == 3) then
			MonType = firstGold;
			firstType = 2;
		end
	end
	
	if (MonType < 0 or MonType > 3) then
		return
	end
	
	--优先扣除的货币不够再扣除其他货币
	local money = GetMoney(varMap, varPlayer, MonType)
	if (money < cRMoney) then
		if (firstType == 1) then
			MonType = 1;
		end
		if (firstType == 2) then
			MonType = 3;
		end
	end
	
	if (MonType < 0 or MonType > 3) then
		return
	end
	
	local moneyLogType = 0
	if MonType == 0 then
		moneyLogType = 520
	elseif MonType == 1 then
		moneyLogType = 519
	elseif MonType == 2 then
		moneyLogType = 515
	elseif MonType == 1 then
		moneyLogType = 521
	end
	
	--扣钱
	local bIsOk = CostMoney(varMap, varPlayer, MonType, cRMoney, moneyLogType)
	if (bIsOk == -1) then
		Msg2Player(varMap,varPlayer,format("您身上的"..x802006_MoneyType[MonType].."不足#R#{_MONEY%d}#cffcc00，解除陷阱失败",cRMoney),8,2)
		Msg2Player(varMap,varPlayer,format("您身上的"..x802006_MoneyType[MonType].."不足#R#{_MONEY%d}#cffcc00，解除陷阱失败",cRMoney),8,3)
		return 0
	end
	
	x802006_SetTrapMD(varMap, varPlayer, 0);
	
	return 1
end

--向客户端发送数据
function x802006_SendInfo(varMap, varPlayer)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer)
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer)
	
	local nItem_1, nItemArrIndex_1 = x802006_GetItemMD(varMap, varPlayer, 1)
	local nItem_2, nItemArrIndex_2 = x802006_GetItemMD(varMap, varPlayer, 2)
	local nItem_3, nItemArrIndex_3 = x802006_GetItemMD(varMap, varPlayer, 3)
	
	local nTrap = x802006_GetTrapMD(varMap, varPlayer);
	
	local nCard_1,nCard_2,nCard_3,nCard_4,nCard_5,nCard_6,nCard_7,nCard_8,nCard_9
	
	--新一轮发送全部数据
	nCard_1 = x802006_GetCardCountMD(varMap, varPlayer, 1)
	nCard_2 = x802006_GetCardCountMD(varMap, varPlayer, 2)
	nCard_3 = x802006_GetCardCountMD(varMap, varPlayer, 3)
	nCard_4 = x802006_GetCardCountMD(varMap, varPlayer, 4)
	nCard_5 = x802006_GetCardCountMD(varMap, varPlayer, 5)
	nCard_6 = x802006_GetCardCountMD(varMap, varPlayer, 6)
	nCard_7 = x802006_GetCardCountMD(varMap, varPlayer, 7)
	nCard_8 = x802006_GetCardCountMD(varMap, varPlayer, 8)
	nCard_9 = x802006_GetCardCountMD(varMap, varPlayer, 9)
	
	if (nCard_1 == nil or nCard_2 == nil or nCard_3 == nil) then
		return
	end
	
	SendThreeToVisitInfo(varMap,varPlayer,nItem_1,nItem_2,nItem_3,nCard_1,nCard_2,nCard_3,nCard_4,nCard_5,nCard_6,nCard_7,nCard_8,nCard_9,nTrap,nDaiylCount,nVisitCount)
end

--发送旧数据
function x802006_SendOldInfo(varMap, varPlayer)
	if GetLevel( varMap, varPlayer) <	x802006_LevelLimit then
		Msg2Player(varMap,varPlayer,"请"..x802006_LevelLimit.."级之后，再来参与草原三宝",8,2)
		Msg2Player(varMap,varPlayer,"请"..x802006_LevelLimit.."级之后，再来参与草原三宝",8,3)
		return
	end

	local oldDay = x802006_GetDayMD(varMap, varPlayer)
	local oldWeek = x802006_GetWeekMD(varMap, varPlayer)
	if (oldDay == 0 and oldWeek == 0) then
		--第一次玩发送新一轮数据
		x802006_CkeckStart(varMap, varPlayer)
		return
	end
	
	local nWeekStart = x802006_ProcSwitchDayCheck(varMap, varPlayer)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer)
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer)
	local nEndGame = x802006_GetGameOverMD(varMap, varPlayer)
	local nCard = x802006_CheckMD(varMap, varPlayer, 1)
	local nItem = x802006_CheckMD(varMap, varPlayer, 2)
	local nItem_1, nItemArrIndex_1 = x802006_GetItemMD(varMap, varPlayer, 1)
	local nItem_2, nItemArrIndex_2 = x802006_GetItemMD(varMap, varPlayer, 2)
	local nItem_3, nItemArrIndex_3 = x802006_GetItemMD(varMap, varPlayer, 3)

	if (nVisitCount == x802006_IsOver and nDaiylCount + 1 > x802006_MaxDaiylCount or nEndGame == 1) then
		Msg2Player(varMap,varPlayer,"当天轮数已用完",8,2)
		Msg2Player(varMap,varPlayer,"当天轮数已用完",8,3)
		return
	end
	
	if (nCard == 1 and nItem == 1 and nEndGame ~= 1) then
		x802006_CkeckStart(varMap, varPlayer)
		return
	end

	--牌没数据重新开一轮或一顾
	if (nCard == 1) then
		if (nVisitCount + 1 > x802006_MaxVisitCount) then
			x802006_CkeckStart(varMap, varPlayer)
		else
			x802006_NewVisit(varMap, varPlayer, 5)
			SendThreeToVisitItem(varMap,varPlayer,nDaiylCount,nVisitCount,nItem_1,nItem_2,nItem_3,1)
		end
		
		return 
	end
	
	if (nDaiylCount == 0 and nVisitCount == 0) then
		x802006_SetDailyCountMD(varMap, varPlayer, 0)
		x802006_SetVisitCountMD(varMap, varPlayer, 1)
		x802006_CkeckStart(varMap, varPlayer)
		return
	end
	
	if nWeekStart == 1 then
		local nIndexItem = nil;
		if (nVisitCount == 1) then
			nIndexItem = nItemArrIndex_1 + 1;
		end
		if (nVisitCount == 2) then
			nIndexItem = nItemArrIndex_2 + 1;
		end
		if (nVisitCount == 3) then
			nIndexItem = nItemArrIndex_3 + 1;
		end
		
		if nIndexItem == nil then
			return
		end
		
		x802006_SetCardCountMD(varMap, varPlayer, nIndexItem, nItem_1)
	end
	
	local IsShow = x802006_GetAllShow(varMap, varPlayer)
	local nTrap = x802006_GetTrapMD(varMap, varPlayer);
	local nCard_1,nCard_2,nCard_3,nCard_4,nCard_5,nCard_6,nCard_7,nCard_8,nCard_9

	if (IsShow == 0) then
		nCard_1 = x802006_GetCardCountMD(varMap, varPlayer, 1)
		nCard_2 = x802006_GetCardCountMD(varMap, varPlayer, 2)
		nCard_3 = x802006_GetCardCountMD(varMap, varPlayer, 3)
		nCard_4 = x802006_GetCardCountMD(varMap, varPlayer, 4)
		nCard_5 = x802006_GetCardCountMD(varMap, varPlayer, 5)
		nCard_6 = x802006_GetCardCountMD(varMap, varPlayer, 6)
		nCard_7 = x802006_GetCardCountMD(varMap, varPlayer, 7)
		nCard_8 = x802006_GetCardCountMD(varMap, varPlayer, 8)
		nCard_9 = x802006_GetCardCountMD(varMap, varPlayer, 9)
	else
		nCard_1 = x802006_GetCardTempMD(varMap, varPlayer, 1)
		nCard_2 = x802006_GetCardTempMD(varMap, varPlayer, 2)
		nCard_3 = x802006_GetCardTempMD(varMap, varPlayer, 3)
		nCard_4 = x802006_GetCardTempMD(varMap, varPlayer, 4)
		nCard_5 = x802006_GetCardTempMD(varMap, varPlayer, 5)
		nCard_6 = x802006_GetCardTempMD(varMap, varPlayer, 6)
		nCard_7 = x802006_GetCardTempMD(varMap, varPlayer, 7)
		nCard_8 = x802006_GetCardTempMD(varMap, varPlayer, 8)
		nCard_9 = x802006_GetCardTempMD(varMap, varPlayer, 9)
		nTrap = nTrap + x802006_MaxDaiylCount
	end
	
	if (nCard_1 == nil or nCard_2 == nil or nCard_3 == nil) then
		return
	end
	
	if (nCard_1 == 0 and nCard_2 == 0 and nCard_3 == 0 and nCard_4 == 0 and nCard_5 == 0 and nCard_6 == 0 and nCard_7 == 0 and nCard_8 == 0 and nCard_9 == 0) then
		if (IsShow == 1) then
			SendThreeToVisitItem(varMap,varPlayer,nDaiylCount,nVisitCount,nItem_1,nItem_2,nItem_3,5)
			SendThreeToVisitItem(varMap,varPlayer,nDaiylCount,nVisitCount,nItem_1,nItem_2,nItem_3,1)
			return
		end
	end
	
	SendThreeToVisitInfo(varMap,varPlayer,nItem_1,nItem_2,nItem_3,nCard_1,nCard_2,nCard_3,nCard_4,nCard_5,nCard_6,nCard_7,nCard_8,nCard_9,nTrap,nDaiylCount,nVisitCount)
end

--点击结束按钮
function x802006_EndGame(varMap, varPlayer)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer)
	--local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer)
	--local nEndGame = x802006_GetGameOverMD(varMap, varPlayer)

	if nDaiylCount == x802006_MaxDaiylCount then
		x802006_SetGameOverMD(varMap, varPlayer, 1)
		return 1
	end
	
	return 0
end

function x802006_SetCardCountMD(varMap, varPlayer, nIndex, value)
	if (nIndex == 1) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_1[1], MD_ThreeToVisi_CardCount_1[2], MD_ThreeToVisi_CardCount_1[3], value)
	elseif (nIndex == 2) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_2[1], MD_ThreeToVisi_CardCount_2[2], MD_ThreeToVisi_CardCount_2[3], value)
	elseif (nIndex == 3) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_3[1], MD_ThreeToVisi_CardCount_3[2], MD_ThreeToVisi_CardCount_3[3], value)
	elseif (nIndex == 4) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_4[1], MD_ThreeToVisi_CardCount_4[2], MD_ThreeToVisi_CardCount_4[3], value)
	elseif (nIndex == 5) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_5[1], MD_ThreeToVisi_CardCount_5[2], MD_ThreeToVisi_CardCount_5[3], value)
	elseif (nIndex == 6) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_6[1], MD_ThreeToVisi_CardCount_6[2], MD_ThreeToVisi_CardCount_6[3], value)
	elseif (nIndex == 7) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_7[1], MD_ThreeToVisi_CardCount_7[2], MD_ThreeToVisi_CardCount_7[3], value)
	elseif (nIndex == 8) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_8[1], MD_ThreeToVisi_CardCount_8[2], MD_ThreeToVisi_CardCount_8[3], value)
	elseif (nIndex == 9) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_9[1], MD_ThreeToVisi_CardCount_9[2], MD_ThreeToVisi_CardCount_9[3], value)
	end

end

function x802006_GetCardCountMD(varMap, varPlayer, nIndex)
	if (nIndex == 1) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_1[1], MD_ThreeToVisi_CardCount_1[2], MD_ThreeToVisi_CardCount_1[3])
	elseif (nIndex == 2) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_2[1], MD_ThreeToVisi_CardCount_2[2], MD_ThreeToVisi_CardCount_2[3])
	elseif (nIndex == 3) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_3[1], MD_ThreeToVisi_CardCount_3[2], MD_ThreeToVisi_CardCount_3[3])
	elseif (nIndex == 4) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_4[1], MD_ThreeToVisi_CardCount_4[2], MD_ThreeToVisi_CardCount_4[3])
	elseif (nIndex == 5) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_5[1], MD_ThreeToVisi_CardCount_5[2], MD_ThreeToVisi_CardCount_5[3])
	elseif (nIndex == 6) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_6[1], MD_ThreeToVisi_CardCount_6[2], MD_ThreeToVisi_CardCount_6[3])
	elseif (nIndex == 7) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_7[1], MD_ThreeToVisi_CardCount_7[2], MD_ThreeToVisi_CardCount_7[3])
	elseif (nIndex == 8) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_8[1], MD_ThreeToVisi_CardCount_8[2], MD_ThreeToVisi_CardCount_8[3])
	elseif (nIndex == 9) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardCount_9[1], MD_ThreeToVisi_CardCount_9[2], MD_ThreeToVisi_CardCount_9[3])
	end
end

--记录哪张牌点过了
function x802006_SetCardTempMD(varMap, varPlayer, nIndex, value)
	if (nIndex == 1) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_1[1], MD_ThreeToVisi_CardTemp_1[2], MD_ThreeToVisi_CardTemp_1[3], value)
	elseif (nIndex == 2) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_2[1], MD_ThreeToVisi_CardTemp_2[2], MD_ThreeToVisi_CardTemp_2[3], value)
	elseif (nIndex == 3) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_3[1], MD_ThreeToVisi_CardTemp_3[2], MD_ThreeToVisi_CardTemp_3[3], value)
	elseif (nIndex == 4) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_4[1], MD_ThreeToVisi_CardTemp_4[2], MD_ThreeToVisi_CardTemp_4[3], value)
	elseif (nIndex == 5) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_5[1], MD_ThreeToVisi_CardTemp_5[2], MD_ThreeToVisi_CardTemp_5[3], value)
	elseif (nIndex == 6) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_6[1], MD_ThreeToVisi_CardTemp_6[2], MD_ThreeToVisi_CardTemp_6[3], value)
	elseif (nIndex == 7) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_7[1], MD_ThreeToVisi_CardTemp_7[2], MD_ThreeToVisi_CardTemp_7[3], value)
	elseif (nIndex == 8) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_8[1], MD_ThreeToVisi_CardTemp_8[2], MD_ThreeToVisi_CardTemp_8[3], value)
	elseif (nIndex == 9) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_9[1], MD_ThreeToVisi_CardTemp_9[2], MD_ThreeToVisi_CardTemp_9[3], value)
	end
end

function x802006_GetCardTempMD(varMap, varPlayer, nIndex)
	if (nIndex == 1) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_1[1], MD_ThreeToVisi_CardTemp_1[2], MD_ThreeToVisi_CardTemp_1[3])
	elseif (nIndex == 2) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_2[1], MD_ThreeToVisi_CardTemp_2[2], MD_ThreeToVisi_CardTemp_2[3])
	elseif (nIndex == 3) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_3[1], MD_ThreeToVisi_CardTemp_3[2], MD_ThreeToVisi_CardTemp_3[3])
	elseif (nIndex == 4) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_4[1], MD_ThreeToVisi_CardTemp_4[2], MD_ThreeToVisi_CardTemp_4[3])
	elseif (nIndex == 5) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_5[1], MD_ThreeToVisi_CardTemp_5[2], MD_ThreeToVisi_CardTemp_5[3])
	elseif (nIndex == 6) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_6[1], MD_ThreeToVisi_CardTemp_6[2], MD_ThreeToVisi_CardTemp_6[3])
	elseif (nIndex == 7) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_7[1], MD_ThreeToVisi_CardTemp_7[2], MD_ThreeToVisi_CardTemp_7[3])
	elseif (nIndex == 8) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_8[1], MD_ThreeToVisi_CardTemp_8[2], MD_ThreeToVisi_CardTemp_8[3])
	elseif (nIndex == 9) then
		return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_CardTemp_9[1], MD_ThreeToVisi_CardTemp_9[2], MD_ThreeToVisi_CardTemp_9[3])
	end
end

--当天
function x802006_SetDayMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Day[1], MD_ThreeToVisi_Day[2], MD_ThreeToVisi_Day[3], value)
end

function x802006_GetDayMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Day[1], MD_ThreeToVisi_Day[2], MD_ThreeToVisi_Day[3])
end

--当周
function x802006_SetWeekMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Week[1], MD_ThreeToVisi_Week[2], MD_ThreeToVisi_Week[3], value)
end

function x802006_GetWeekMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Week[1], MD_ThreeToVisi_Week[2], MD_ThreeToVisi_Week[3])
end

--陷阱MD
function x802006_SetTrapMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Trap[1], MD_ThreeToVisi_Trap[2], MD_ThreeToVisi_Trap[3], value)
end

function x802006_GetTrapMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Trap[1], MD_ThreeToVisi_Trap[2], MD_ThreeToVisi_Trap[3])
end

--每日轮数
function x802006_SetDailyCountMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_DailyCount[1], MD_ThreeToVisi_DailyCount[2], MD_ThreeToVisi_DailyCount[3], value)
end

function x802006_GetDailyCountMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_DailyCount[1], MD_ThreeToVisi_DailyCount[2], MD_ThreeToVisi_DailyCount[3])
end

--顾数
function x802006_SetVisitCountMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_VisitCount[1], MD_ThreeToVisi_VisitCount[2], MD_ThreeToVisi_VisitCount[3], value)
end

function x802006_GetVisitCountMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_VisitCount[1], MD_ThreeToVisi_VisitCount[2], MD_ThreeToVisi_VisitCount[3])
end

--每顾的物品
function x802006_SetItemMD(varMap, varPlayer, nIndex, value, value1)
	if (nIndex == 1) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEM_1[1], MD_ThreeToVisi_ITEM_1[2], MD_ThreeToVisi_ITEM_1[3], value)
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEMIndex_1[1], MD_ThreeToVisi_ITEMIndex_1[2], MD_ThreeToVisi_ITEMIndex_1[3], value1)
	elseif (nIndex == 2) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEM_2[1], MD_ThreeToVisi_ITEM_2[2], MD_ThreeToVisi_ITEM_2[3], value)
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEMIndex_2[1], MD_ThreeToVisi_ITEMIndex_2[2], MD_ThreeToVisi_ITEMIndex_2[3], value1)
	elseif (nIndex == 3) then
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEM_3[1], MD_ThreeToVisi_ITEM_3[2], MD_ThreeToVisi_ITEM_3[3], value)
		SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEMIndex_3[1], MD_ThreeToVisi_ITEMIndex_3[2], MD_ThreeToVisi_ITEMIndex_3[3], value1)
	end
end	

function x802006_GetItemMD(varMap, varPlayer, nIndex)
	if (nIndex == 1) then
		local itemIndex = GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEM_1[1], MD_ThreeToVisi_ITEM_1[2], MD_ThreeToVisi_ITEM_1[3])
		local arrIndex  = GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEMIndex_1[1], MD_ThreeToVisi_ITEMIndex_1[2], MD_ThreeToVisi_ITEMIndex_1[3])
		return itemIndex,arrIndex
	elseif (nIndex == 2) then
		local itemIndex = GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEM_2[1], MD_ThreeToVisi_ITEM_2[2], MD_ThreeToVisi_ITEM_2[3])
		local arrIndex  = GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEMIndex_2[1], MD_ThreeToVisi_ITEMIndex_2[2], MD_ThreeToVisi_ITEMIndex_2[3])
		return itemIndex,arrIndex
	elseif (nIndex == 3) then
		local itemIndex = GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEM_3[1], MD_ThreeToVisi_ITEM_3[2], MD_ThreeToVisi_ITEM_3[3])
		local arrIndex  = GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ITEMIndex_3[1], MD_ThreeToVisi_ITEMIndex_3[2], MD_ThreeToVisi_ITEMIndex_3[3])
		return itemIndex,arrIndex
	end
end	

--是否需要全部显示
function x802006_SetAllShow(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ALLSHOW[1], MD_ThreeToVisi_ALLSHOW[2], MD_ThreeToVisi_ALLSHOW[3], value)
end

function x802006_GetAllShow(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_ALLSHOW[1], MD_ThreeToVisi_ALLSHOW[2], MD_ThreeToVisi_ALLSHOW[3])
end

function x802006_CheckMD(varMap, varPlayer, nType)
	local nDaiylCount = x802006_GetDailyCountMD(varMap, varPlayer)
	local nVisitCount = x802006_GetVisitCountMD(varMap, varPlayer)
	
	if (nDaiylCount ~= 0 or nVisitCount ~= 0) then
		--return 0
	end
	
	if (nType == 1) then
		for i = 1, x802006_MaxCardCount do
			local nCard = x802006_GetCardCountMD(varMap, varPlayer, i)
			local nTemp = x802006_GetCardTempMD(varMap, varPlayer, i)
			if (nCard > 0 or nTemp > 0) then
				return 0
			end
		end
	end
	
	if (nType == 2) then
		for i = 1, x802006_MaxVisitCount do
			local nItem, nIndex = x802006_GetItemMD(varMap, varPlayer, i)
			if (nItem > 0 and nIndex > 0) then
				return 0
			end
		end
	end
	
	return 1
end

--每顾点击次数
function x802006_SetClickMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Click[1], MD_ThreeToVisi_Click[2], MD_ThreeToVisi_Click[3], value)
end

function x802006_GetClickMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_Click[1], MD_ThreeToVisi_Click[2], MD_ThreeToVisi_Click[3])
end

--点击结束此轮
function x802006_SetGameOverMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_GameOver[1], MD_ThreeToVisi_GameOver[2], MD_ThreeToVisi_GameOver[3], value)
end

function x802006_GetGameOverMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ThreeToVisi_GameOver[1], MD_ThreeToVisi_GameOver[2], MD_ThreeToVisi_GameOver[3])
end
