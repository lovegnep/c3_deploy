x802005_var_FileId = 802005

--活跃度礼包

--{对应等级，礼包1，礼包2，礼包3，礼包4}
x802005_GIFTDAILY = {{1,12500355,12500356,12500357,12500358},
										 {60,12500359,12500360,12500361,12500362},
										 {80,12500363,12500364,12500365,12500366}}
										 
x802005_GIFTWEEKLY = {{1,12500367,12500368,12500369,12500370}}

--礼包需要的活跃点数
x802005_GiftNEEDDAILY = {25,50,75,100}
x802005_GIFTNEEDWEEKLY = {200,400,800,1000}

--{{任务1需要完成的次数,完成该任务后给与得活跃点数},{}。。。。}
x802005_QUESTDAILY = {{2,10},{10,10},{1,10},{2,10},{6,20},{1,5},{1,10},{1,10},{3,5},{1,10}}
x802005_QUESTWEEKLY = {{5,80},{10,40},{1,30},{5,80},{2,40},{1,30}}

--礼包个数
x802005_MAX_GIFT_NUM_DAILY = 4
x802005_Max_GiftIndex_Weekly = 4

--礼包领取情况开始序号
x802005_GIFTINFO_STARTINDEX = 16 

x802005_QUEST_NUM_DAILY = 10
x802005_QUEST_NUM_WEEKLY = 6
x802005_ACTIVITY_NEED_LEVEL = 45

--持续在线一小时任务的序号
x802005_ONLINETIME_QUEST_INDEX = 10


--MD相关数据
x802005_ACTIVITY_MD_DAILYQUEST = {{MD_ACTIVITY_QUEST_DAILY_1[1], MD_ACTIVITY_QUEST_DAILY_1[2], MD_ACTIVITY_QUEST_DAILY_1[3]},
																	{MD_ACTIVITY_QUEST_DAILY_2[1], MD_ACTIVITY_QUEST_DAILY_2[2], MD_ACTIVITY_QUEST_DAILY_2[3]},
																	{MD_ACTIVITY_QUEST_DAILY_3[1], MD_ACTIVITY_QUEST_DAILY_3[2], MD_ACTIVITY_QUEST_DAILY_3[3]},
																	{MD_ACTIVITY_QUEST_DAILY_4[1], MD_ACTIVITY_QUEST_DAILY_4[2], MD_ACTIVITY_QUEST_DAILY_4[3]},
																	{MD_ACTIVITY_QUEST_DAILY_5[1], MD_ACTIVITY_QUEST_DAILY_5[2], MD_ACTIVITY_QUEST_DAILY_5[3]},
																	{MD_ACTIVITY_QUEST_DAILY_6[1], MD_ACTIVITY_QUEST_DAILY_6[2], MD_ACTIVITY_QUEST_DAILY_6[3]},
																	{MD_ACTIVITY_QUEST_DAILY_7[1], MD_ACTIVITY_QUEST_DAILY_7[2], MD_ACTIVITY_QUEST_DAILY_7[3]},
																	{MD_ACTIVITY_QUEST_DAILY_8[1], MD_ACTIVITY_QUEST_DAILY_8[2], MD_ACTIVITY_QUEST_DAILY_8[3]},
																	{MD_ACTIVITY_QUEST_DAILY_9[1], MD_ACTIVITY_QUEST_DAILY_9[2], MD_ACTIVITY_QUEST_DAILY_9[3]},
																	{MD_ACTIVITY_QUEST_DAILY_10[1], MD_ACTIVITY_QUEST_DAILY_10[2], MD_ACTIVITY_QUEST_DAILY_10[3]},
}

x802005_ACTIVITY_MD_DAILYGIFT = {{MD_ACTIVITY_GIFT_DAILY_1[1], MD_ACTIVITY_GIFT_DAILY_1[2], MD_ACTIVITY_GIFT_DAILY_1[3]},
																	{MD_ACTIVITY_GIFT_DAILY_2[1], MD_ACTIVITY_GIFT_DAILY_2[2], MD_ACTIVITY_GIFT_DAILY_2[3]},
																	{MD_ACTIVITY_GIFT_DAILY_3[1], MD_ACTIVITY_GIFT_DAILY_3[2], MD_ACTIVITY_GIFT_DAILY_3[3]},
																	{MD_ACTIVITY_GIFT_DAILY_4[1], MD_ACTIVITY_GIFT_DAILY_4[2], MD_ACTIVITY_GIFT_DAILY_4[3]},
}

x802005_ACTIVITY_MD_WEEKLYQUEST = {{MD_ACTIVITY_QUEST_WEEKLY_1[1], MD_ACTIVITY_QUEST_WEEKLY_1[2], MD_ACTIVITY_QUEST_WEEKLY_1[3]},
																	{MD_ACTIVITY_QUEST_WEEKLY_2[1], MD_ACTIVITY_QUEST_WEEKLY_2[2], MD_ACTIVITY_QUEST_WEEKLY_2[3]},
																	{MD_ACTIVITY_QUEST_WEEKLY_3[1], MD_ACTIVITY_QUEST_WEEKLY_3[2], MD_ACTIVITY_QUEST_WEEKLY_3[3]},
																	{MD_ACTIVITY_QUEST_WEEKLY_4[1], MD_ACTIVITY_QUEST_WEEKLY_4[2], MD_ACTIVITY_QUEST_WEEKLY_4[3]},
																	{MD_ACTIVITY_QUEST_WEEKLY_5[1], MD_ACTIVITY_QUEST_WEEKLY_5[2], MD_ACTIVITY_QUEST_WEEKLY_5[3]},
																	{MD_ACTIVITY_QUEST_WEEKLY_6[1], MD_ACTIVITY_QUEST_WEEKLY_6[2], MD_ACTIVITY_QUEST_WEEKLY_6[3]},
}



--varGiftIndex从0开始
function x802005_ActivityGetGift(varMap, varPlayer, varGiftType, varGiftIndex)
	local playerLv = GetLevel(varMap, varPlayer)
	if varGiftType == 2 then
		if varGiftIndex < 0 or varGiftIndex >= x802005_MAX_GIFT_NUM_DAILY then
			return 0
		end
		 
		for i, item in x802005_GIFTDAILY do
			if (x802005_GIFTDAILY[i + 1] == nil) or (playerLv < x802005_GIFTDAILY[i + 1][1]) then
				x802005_ActivityGiveGift(varMap, varPlayer, item[varGiftIndex + 2], 1, varGiftType, varGiftIndex)
				break
			end
		end
		
			
	elseif varGiftType == 3 then
		if varGiftIndex < 0 or varGiftIndex >= x802005_Max_GiftIndex_Weekly then
			return 0
		end
			
		for i, item in x802005_GIFTWEEKLY do
			if (x802005_GIFTWEEKLY[i+1]) == nil or (playerLv < x802005_GIFTWEEKLY[i+1][1]) then
				x802005_ActivityGiveGift(varMap, varPlayer, item[varGiftIndex + 2], 1, varGiftType, varGiftIndex)
				break
			end 
		end
		
		
	end
	
	return 1
end

function x802005_ActivityGiveGift(varMap,varPlayer,varItemID, varItemNum, varGiftType, varGiftIndex)
	
	StartItemTask(varMap)
	ItemAppendBind(varMap, varItemID, varItemNum) 

	local ret = StopItemTask(varMap,varPlayer)
	if ret <= 0 then
		WriteLog(1, format("获取活跃度礼包出错!! playerID=%d,giftID=%d,Num=%d",varPlayer, varItemID, varItemNum));
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 0
	end

	if varGiftType == 2 then
		--local giftInfo = GetPlayerActivityValue(varMap,varPlayer,x802005_GIFTINFO_STARTINDEX + varGiftIndex)
		local giftInfo = GetPlayerGameData(varMap,varPlayer,x802005_ACTIVITY_MD_DAILYGIFT[varGiftIndex + 1][1], x802005_ACTIVITY_MD_DAILYGIFT[varGiftIndex + 1][2], x802005_ACTIVITY_MD_DAILYGIFT[varGiftIndex + 1][3])
		if giftInfo ~= 0 then
			Msg2Player(varMap, varPlayer, "已经领取过该礼包了", 8, 3)	
			WriteLog(1, format("试图重复领取第%d个每日礼包！ playerID=%d, giftID=%d, value=%d",varGiftIndex+1, varPlayer, varItemID, giftInfo))
			return 0
		end
		
		--SetPlayerActivityValue(varMap,varPlayer,x802005_GIFTINFO_STARTINDEX + varGiftIndex, 1)
		SetActivityPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYGIFT[varGiftIndex + 1][1], x802005_ACTIVITY_MD_DAILYGIFT[varGiftIndex + 1][2], x802005_ACTIVITY_MD_DAILYGIFT[varGiftIndex + 1][3], 1, x802005_QUEST_NUM_DAILY + x802005_QUEST_NUM_WEEKLY + varGiftIndex )
		
		
	elseif varGiftType == 3 then
		local activityWeekly = GetPlayerActivityWeekly(varMap, varPlayer)
		if activityWeekly < x802005_GIFTNEEDWEEKLY[varGiftIndex + 1] then
			Msg2Player(varMap, varPlayer, "当前每周活跃点数不足", 8, 3)	
			WriteLog(1, format("当前每周活跃度积分不足！ playerID=%d,giftID=%d,Num=%d，activity=%d",varPlayer, varItemID, varItemNum, activityWeekly))
			return 0
		end
		
		SetPlayerActivityWeekly(varMap, varPlayer, activityWeekly - x802005_GIFTNEEDWEEKLY[varGiftIndex + 1])
		
		
	end
	
	DeliverItemListSendToPlayer(varMap, varPlayer)
	Msg2Player(varMap, varPlayer, "#Y您获得了活跃度礼品：#G#{_ITEM"..varItemID.."}" .. varItemNum .. "个", 8, 3)	
	WriteLog(1, format("获得活跃度礼包!! playerID=%d,giftID=%d,Num=%d",varPlayer, varItemID, varItemNum))	
	
	return 1
end


function x802005_ActivityGetMaxValue(varMap,varPlayer, varType, varIndex)
	local value = -1
		
	if varType == 0 then
		if x802005_QUESTDAILY[varIndex+1][1] ~= nil then
			value = x802005_QUESTDAILY[varIndex+1][1]
		end
	elseif varType == 1 then
		if x802005_QUESTWEEKLY[varIndex+1][1] ~= nil then
			value = x802005_QUESTWEEKLY[varIndex+1][1]
		end
	end
	return value
end

function x802005_ActivityGetPrice(varMap,varPlayer, varType, varIndex)
	local value = -1
	
	if varType == 0 then
		if x802005_QUESTDAILY[varIndex+1][2] ~= nil then
			value = x802005_QUESTDAILY[varIndex+1][2]
		end
	elseif varType == 1 then
		if x802005_QUESTWEEKLY[varIndex+1][2] ~= nil then
			value = x802005_QUESTWEEKLY[varIndex+1][2]
		end
	end
	
	return value
end

--varQuestIndex 从0开始
function x802005_AddActivityQuest(varMap, varPlayer, varQuestType, varQuestIndex)
	local maxValue = 0
	local price = 0
	GamePlayScriptLog( varMap, varPlayer, 11276)
	local pLevel = GetLevel(varMap, varPlayer)
	
	WriteLog(1,format("--ActivityDebugLog--AddValue--1-- playerID=%d, mapID=%d, playerLevel=%d, type=%d, index=%d", GetPlayerGUID(varMap, varPlayer), varMap, pLevel, varQuestType, varQuestIndex))
	
	if pLevel < x802005_ACTIVITY_NEED_LEVEL then
		return
	end
	GamePlayScriptLog( varMap, varPlayer, 11277)
	if varQuestType == 0 then -- daily
		if varQuestIndex >= x802005_QUEST_NUM_DAILY or varQuestIndex < 0 then
			return
		end
		maxValue = x802005_QUESTDAILY[varQuestIndex + 1][1]
		price = x802005_QUESTDAILY[varQuestIndex + 1][2]
		
		WriteLog(1,format("--ActivityDebugLog--AddValue--2-- playerID=%d, index=%d, maxValue=%d, price=%d", GetPlayerGUID(varMap, varPlayer), varQuestIndex, maxValue, price))
			
	elseif varQuestType == 1 then --weekly
		if varQuestIndex >= x802005_QUEST_NUM_WEEKLY or varQuestIndex < 0 then
			return
		end
		maxValue = x802005_QUESTWEEKLY[varQuestIndex + 1][1]
		price = x802005_QUESTWEEKLY[varQuestIndex + 1][2]
		
		
	end
	GamePlayScriptLog( varMap, varPlayer, 11278)
	--AddPlayerActivityQuest(varMap, varPlayer, varQuestType, varQuestIndex + 1, maxValue, price)
	x802005_ActivityAddValue(varMap, varPlayer, varQuestType, varQuestIndex + 1, maxValue, price)
end


--通用接口，处理日期切换需要处理的事件
function x802005_ActivityUpdateNewDay(varMap, varPlayer)
	WriteLog(1, format("playerID=%d, mapID=%d 新的一天，开始自动调用脚本... ", varPlayer, varMap))
	LuaCallNoclosure( 888888,"OnDaySwitch",varMap, varPlayer)
end


--通用接口，处理周切换时需要处理的事件
function x802005_ActivityUpdateNewWeek(varMap, varPlayer)
	WriteLog(1, format("playerID=%d, mapID=%d 新的一周，开始自动调用脚本... ", varPlayer, varMap))
	LuaCallNoclosure( 888888,"OnWeekSwitch",varMap, varPlayer)
end

function x802005_ActivityOnlineTime(varMap, varPlayer)
	x802005_AddActivityQuest(varMap, varPlayer,0,9)
end


function x802005_ActivityCheckTime(varMap, varPlayer)
	
	local oldDays = GetPlayerGameData(varMap, varPlayer, MD_ACTIVITY_TIMESTAMP[1], MD_ACTIVITY_TIMESTAMP[2], MD_ACTIVITY_TIMESTAMP[3])
	local timeInfo, curDays = CompareActivityTime(varMap, varPlayer, oldDays)
	
	--如果是同一天，不做处理
	
	if timeInfo == 1 then --不是同一天，但是是同一周
		x802005_ActivityClearValue(varMap, varPlayer, 1)
		x802005_ActivityUpdateStr(varMap, varPlayer, 2)
		x802005_ActivityUpdateStr(varMap, varPlayer, 3)
	
		--更新时间戳
		SetPlayerGameData(varMap, varPlayer, MD_ACTIVITY_TIMESTAMP[1], MD_ACTIVITY_TIMESTAMP[2], MD_ACTIVITY_TIMESTAMP[3], curDays)
		x802005_ActivityUpdateNewDay(varMap, varPlayer)
		
		
	elseif timeInfo == 2 then --不是同一周
		x802005_ActivityClearValue(varMap, varPlayer, 1)
		x802005_ActivityClearValue(varMap, varPlayer, 2)
		x802005_ActivityUpdateStr(varMap, varPlayer, 3)
	
		--更新时间戳
		SetPlayerGameData(varMap, varPlayer, MD_ACTIVITY_TIMESTAMP[1], MD_ACTIVITY_TIMESTAMP[2], MD_ACTIVITY_TIMESTAMP[3], curDays)
		x802005_ActivityUpdateNewWeek(varMap, varPlayer)
		x802005_ActivityUpdateNewDay(varMap, varPlayer)
		
	else
		x802005_ActivityUpdateStr(varMap, varPlayer, 1)
		x802005_ActivityUpdateStr(varMap, varPlayer, 2)
		x802005_ActivityUpdateStr(varMap, varPlayer, 3)
		
		
	end
	
	UpdateOnlineTime(varMap, varPlayer)
	x802005_ActivityInitOnlineTimeMD(varMap, varPlayer)	
end

function x802005_ActivityInitOnlineTimeMD(varMap, varPlayer)
	InitOnlineTimeMD(varMap, varPlayer, MD_ACTIVITY_QUEST_DAILY_10[1], MD_ACTIVITY_QUEST_DAILY_10[2], MD_ACTIVITY_QUEST_DAILY_10[3])
end


function x802005_ActivityClearValue(varMap, varPlayer, varType)
	if varType == 1 then
		for i = 1, x802005_QUEST_NUM_DAILY do
		
			WriteLog(1,format("--ActivityDebugLog--Clear--1-- playerID=%d, mapID=%d, index=%d", GetPlayerGUID(varMap, varPlayer), varMap, i))
		
			SetActivityPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYQUEST[i][1], x802005_ACTIVITY_MD_DAILYQUEST[i][2], x802005_ACTIVITY_MD_DAILYQUEST[i][3], 0, i-1)
		end
		
		for i = 1, x802005_MAX_GIFT_NUM_DAILY do
			SetActivityPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYGIFT[i][1], x802005_ACTIVITY_MD_DAILYGIFT[i][2], x802005_ACTIVITY_MD_DAILYGIFT[i][3], 0, x802005_QUEST_NUM_DAILY + x802005_QUEST_NUM_WEEKLY + i - 1)
		end
		
		
	elseif varType ==2 then
		for i = 1, x802005_QUEST_NUM_WEEKLY do
			SetActivityPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_WEEKLYQUEST[i][1], x802005_ACTIVITY_MD_WEEKLYQUEST[i][2], x802005_ACTIVITY_MD_WEEKLYQUEST[i][3], 0, x802005_QUEST_NUM_DAILY + i -1)
		end
			
		SetPlayerActivityWeekly(varMap, varPlayer, 0)
		
		
	end


end


function x802005_ActivityAddValue(varMap, varPlayer, varQuestType, varQuestIndex, maxValue, price)
	
	local curValue
	
	if varQuestType == 0 then
		curValue = GetPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYQUEST[varQuestIndex][1], x802005_ACTIVITY_MD_DAILYQUEST[varQuestIndex][2], x802005_ACTIVITY_MD_DAILYQUEST[varQuestIndex][3])
		
		if (curValue >= 0) and (curValue < maxValue) then
			SetActivityPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYQUEST[varQuestIndex][1], x802005_ACTIVITY_MD_DAILYQUEST[varQuestIndex][2], x802005_ACTIVITY_MD_DAILYQUEST[varQuestIndex][3], curValue + 1, varQuestIndex -1)
		end
		
		if curValue == nil then
			WriteLog(1,format("--ActivityDebugLog--AddValue--3-- playerID=%d, index=%d, maxValue=%d, price=%d, curValue=nil", GetPlayerGUID(varMap, varPlayer), varQuestIndex, maxValue, price))
		else
			WriteLog(1,format("--ActivityDebugLog--AddValue--3-- playerID=%d, index=%d, maxValue=%d, price=%d, curValue=%d", GetPlayerGUID(varMap, varPlayer), varQuestIndex, maxValue, price, curValue))
		end	
		
	elseif varQuestType == 1 then
		curValue = GetPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_WEEKLYQUEST[varQuestIndex][1], x802005_ACTIVITY_MD_WEEKLYQUEST[varQuestIndex][2], x802005_ACTIVITY_MD_WEEKLYQUEST[varQuestIndex][3])
		
		if (curValue >= 0) and (curValue < maxValue) then
			SetActivityPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_WEEKLYQUEST[varQuestIndex][1], x802005_ACTIVITY_MD_WEEKLYQUEST[varQuestIndex][2], x802005_ACTIVITY_MD_WEEKLYQUEST[varQuestIndex][3], curValue + 1, x802005_QUEST_NUM_DAILY + varQuestIndex - 1)
		end
		
	end
	
	if curValue + 1 == maxValue then
		if price == -1 then
			return
		end
		
		local oldValue = GetPlayerActivityWeekly(varMap, varPlayer)
		SetPlayerActivityWeekly(varMap, varPlayer, price + oldValue)
		GamePlayScriptLog( varMap, varPlayer, 11279)
		
		WriteLog(1,format("--ActivityDebugLog--AddValue--4-- playerID=%d, index=%d, maxValue=%d, price=%d, oldValue=%d", GetPlayerGUID(varMap, varPlayer), varQuestIndex, maxValue, price, oldValue))
	end
	
	
end


function x802005_ActivityUpdateStr(varMap, varPlayer, varType)
	
	if varType == 1 then
		for i = 1, x802005_QUEST_NUM_DAILY do
			local curValue = GetPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYQUEST[i][1], x802005_ACTIVITY_MD_DAILYQUEST[i][2], x802005_ACTIVITY_MD_DAILYQUEST[i][3])
			ActivityUpdateStr(varMap, varPlayer, curValue, i - 1)
		end
		
		
	elseif varType == 2 then	
		for i = 1, x802005_QUEST_NUM_WEEKLY do
			local curValue = GetPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_WEEKLYQUEST[i][1], x802005_ACTIVITY_MD_WEEKLYQUEST[i][2], x802005_ACTIVITY_MD_WEEKLYQUEST[i][3])
			ActivityUpdateStr(varMap, varPlayer, curValue, x802005_QUEST_NUM_DAILY + i - 1)
		end
		
		
	elseif varType == 3 then
		for i = 1, x802005_MAX_GIFT_NUM_DAILY do
			local curValue = GetPlayerGameData(varMap, varPlayer, x802005_ACTIVITY_MD_DAILYGIFT[i][1], x802005_ACTIVITY_MD_DAILYGIFT[i][2], x802005_ACTIVITY_MD_DAILYGIFT[i][3])
			ActivityUpdateStr(varMap, varPlayer, curValue, x802005_QUEST_NUM_DAILY + x802005_QUEST_NUM_WEEKLY + i - 1)
		end
		
		
	end
end



