
x310941_var_FileId = 310941
x310941_var_QuestName1 = "【活动】抽选新年上上签"
x310941_var_QuestName2 = "兑换新年上上签"
x310941_var_QuestName3 = "新年上上签查询"
x310941_var_QuestName4 = "新年上上签活动说明"
x310941_g_CaiPiao_Num = {"我要选1号签","我要选2号签","我要选3号签","我要选4号签","我要选5号签","我要选6号签","我要选7号签","我要选8号签","我要选9号签","我要选10号签",}

x310941_g_InvalidTime = {2012110,2012111,2012112,2012113,2012114,2012115,2012116}
x310941_g_Max_CaiPiao = 10
x310941_g_CountryID_HaoMa = 0 --选择楼兰国存储国家彩票的大奖号码
x310941_g_CountryID_Total = 1 --用来存储国家彩票的总共购买次数
x310941_g_CountryID_Hit = 2	--用来存储国家彩票的命中的次数

x310941_g_Param = 1.5 --给与玩家奖励的金卡的系数
x310941_g_Random = 40000--随机物品奖励的随机数上限
x310941_g_AwardMoney = 1000--玩家购买的每注彩票固定返回的金卡数
x310941_g_AwardMoney7 = 3000--当为7的倍数的时候的金卡奖励
x310941_g_CostMoney = 800--购买一注彩票所需的现金数
x310941_g_charmStringTable = {"您的手气真是红得发紫","您的运气真不错","您的运气还可以","很遗憾"}
x310941_g_GamePlaylog = 3040--3040-3049

x310941_g_ItemAwardList = {
											{name="三番令", itemID=11990011, itemProbability=700, num=1},
											{name="修行草", itemID=12041101, itemProbability=680, num=1},
											{name="紫檀木炭", itemID=11000501, itemProbability=660, num=1},
											{name="黄金乱士符", itemID=11970023, itemProbability=640, num=1},
											{name="募集券", itemID=11990110, itemProbability=620, num=1},
											{name="明亮的彩钻", itemID=11990122, itemProbability=600, num=1},
											{name="完美星辰", itemID=11000552, itemProbability=580, num=1},
											{name="骑乘·黄金藏宝图", itemID=12035016, itemProbability=520, num=1},
											{name="秘钻·黄金藏宝图", itemID=12035041, itemProbability=520, num=1},
											{name="洗石·黄金藏宝图", itemID=12035042, itemProbability=520, num=1},
											{name="外装·黄金藏宝图", itemID=12035043, itemProbability=520, num=1},
											{name="奥钻·黄金藏宝图", itemID=12035044, itemProbability=520, num=1},
											{name="精品芝华士", itemID=12250002, itemProbability=380, num=1},
											{name="精品轩尼诗理查", itemID=12250003, itemProbability=370, num=1},
											{name="精品哈瓦那雪茄", itemID=12250004, itemProbability=360, num=1},
											{name="原生钻石矿", itemID=11990115, itemProbability=350, num=1},
											{name="雪山之星", itemID=11000936, itemProbability=340, num=7},
											{name="天枢镶玉钻", itemID=11000156, itemProbability=330, num=1},
											{name="残破的神兵之魂", itemID=11000304, itemProbability=320, num=1},
											{name="天璇镶玉钻", itemID=11000157, itemProbability=310, num=1},
											{name="钻头碎片", itemID=11000155, itemProbability=16, num=1},
											{name="掌门牌：大三元(永不磨损)", itemID=10310003, itemProbability=16, num=1},
											{name="四彩破军护身符", itemID=10340012, itemProbability=16, num=1},
											{name="四彩铁壁护身符", itemID=10340013, itemProbability=16, num=1},
											{name="四彩生命护身符", itemID=10340014, itemProbability=16, num=1},
											{name="燕山风情(永久)", itemID=10306067, itemProbability=16, num=1},
											{name="吻风雪翼(永久)", itemID=10306068, itemProbability=16, num=1},
											{name="冷羽无悯(永久)", itemID=10306074, itemProbability=16, num=1},
											{name="传说级洗石剂·莲华", itemID=11000906, itemProbability=16, num=2},
											{name="金鬃狂狮降世符", itemID=12050286, itemProbability=16, num=1}
													}



function x310941_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	--待添加活动的文本说明
		--TalkAppendButton(varMap,x310941_var_FileId,x310941_var_QuestName1,3,0)--购买彩票
			TalkAppendButton(varMap,x310941_var_FileId,x310941_var_QuestName2,3,-1)--兑签
			TalkAppendButton(varMap,x310941_var_FileId,x310941_var_QuestName3,3,-2)	
			TalkAppendButton(varMap,x310941_var_FileId,x310941_var_QuestName4,13,20)	
end




function x310941_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	x310941_Initialize(varMap, varPlayer)
		
	if varIndex == -1 then--兑签
		local today = x310941_CheckInvalidTime()
		if today < 8 then
			if x310941_GetCountryHaoma(x310941_g_InvalidTime[today]) == 0 then
				x310941_CountRandomHaoma(varMap, varPlayer,x310941_g_InvalidTime[today])
			end
		end
		
		if x310941_CheckGetAwardTime() == 0 then
			Msg2Player( varMap, varPlayer, "很抱歉，现在还不能兑签，每天的中午12点到晚上23:59点为兑签时间，可以领取当天之前所中的奖金。", 8, 3) 
			return
		end
		
		x310941_GivePlayerAward(varMap, varPlayer,varTalknpc, 1)
	elseif varIndex == -2 then
		StartTalkTask(varMap)	
		TalkAppendString( varMap, "#Y"..x310941_var_QuestName3 )
		TalkAppendString( varMap, "\t您可以查询今天已经选了多少签，也可以查询还有多少签未兑换。" )
		TalkAppendButton(varMap,x310941_var_FileId,"查询本日选签资讯",3,11)
		TalkAppendButton(varMap,x310941_var_FileId,"查询待兑换资讯",3,12)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310941_var_FileId, x310941_var_QuestName3)
	
	elseif varIndex == 0 then--购买彩票
		--检查活动是否过期
		today = x310941_CheckInvalidTime()
		if  today > 7 then	
			StartTalkTask( varMap)
			TalkAppendString( varMap, "\t抱歉，活动时间已过,现在只能兑签，不能选签。" )
			StopTalkTask()
			DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)
			return 
		end
		
		--检查玩家当天购买彩票次数是否超出上限	
		local count = x310941_GetPlayerTotalNum(varMap, varPlayer,x310941_g_InvalidTime[today])
		if count >= x310941_g_Max_CaiPiao then
			Msg2Player( varMap, varPlayer, "您今天已经抽取"..tostring(x310941_g_Max_CaiPiao).."次签了，请关注明天产生的上上签", 8, 3) 
			return 
		end
		
		--显示10个号码选择按钮	
		StartTalkTask(varMap)	
		TalkAppendString( varMap, "\t本服今日已选取"..x310941_GetCountryTotalNum(x310941_g_InvalidTime[today]).."个签。（选签时逢7的倍数会获得额外3两金卡）" )
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[1],13,1)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[2],13,2)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[3],13,3)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[4],13,4)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[5],13,5)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[6],13,6)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[7],13,7)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[8],13,8)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[9],13,9)
		TalkAppendButton(varMap,x310941_var_FileId,x310941_g_CaiPiao_Num[10],13,10)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310941_var_FileId, x310941_var_QuestName1)
	elseif varIndex == 1 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,1)
	elseif varIndex == 2 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,2)
	elseif varIndex == 3 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,3)
	elseif varIndex == 4 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,4)
	elseif varIndex == 5 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,5)
	elseif varIndex == 6 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,6)
	elseif varIndex == 7 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,7)
	elseif varIndex == 8 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,8)
	elseif varIndex == 9 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,9)
	elseif varIndex == 10 then
		x310941_HandlePlayerChoose( varMap, varPlayer,varTalknpc,10)
	elseif varIndex == 11 then
		x310941_QueryRecordToday(varMap, varPlayer, varTalknpc)
	elseif varIndex == 12 then
		x310941_QueryRecordBefore(varMap, varPlayer, varTalknpc)
	elseif varIndex == 20 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y"..x310941_var_QuestName4 )
		--TalkAppendString( varMap, "\t2011年12月27日至2012年1月2日期间，每位玩家可以参与新年上上签活动，选取自己的运势签，为新的一年讨个好彩头。\n#Y活动细则#W:\n\t1.玩家每次可从1到10号签中选择。\n\t2.每名玩家每天最多可以选择#R10次#W。\n\t3.在第二天系统会随机抽选一个签号作为前一天的上上签。\n\t4.每选择一个签需花费#R800文现金#W，选中越多上上签则会获得更多海量金卡奖励；每选中一个非上上签，则会获得#R1两金卡#W。所得金卡需第二天兑签。\n\t5.玩家在当天第7及7的倍数（14、21等）选签，则会立即额外获得#R500文金卡#W。\n\t6.兑签时，更有几率获得#R黄金藏宝图#W、#R永久时装#W、#R金鬃狂狮降世符#W等珍奇道具。" ) 
		TalkAppendString( varMap, "\t2012年01月10日至2012年1月16日期间，每位玩家可以参与新年上上签活动，选取自己的运势签，为新的一年讨个好彩头。\n#Y活动细则#W:\n\t1.系统第二天会随机抽选一个签号作为前一天的上上签。\n\t2.每选择一个签需花费#R800文现金#W，选中越多上上签则会获得更多海量金卡奖励；每选中一个非上上签，则会获得#R1两金卡#W。所得金卡需第二天兑签。\n\t3.兑签时，更有几率获得#R黄金藏宝图#W、#R永久时装#W、#R金鬃狂狮降世符#W等珍奇道具。\n\t4.每名玩家每天最多可以选择#R10次#W。\n\t5.玩家选的签恰好为本服当天第7或7的倍数（14、21等）个签时，会立即额外获得#R3两金卡#W。\n\t6.玩家每次可从1到10号签中选择。" )
		StopTalkTask()
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)	
	end

end


function x310941_EndOnce(varMap, varPlayer, varTalknpc)
	local playerTotal = x310941_GetPlayerTotalNum(varMap, varPlayer,x310941_g_InvalidTime[today])
	StartTalkTask( varMap)
	TalkAppendString( varMap, "\t选签完成，请关注明天产生的的上上签号码，祝您好运！" )
	if playerTotal < 10 then
		TalkAppendString( varMap, "\n\t您今天已经选取了"..tostring(playerTotal).."个号签".."还可以选取"..tostring(x310941_g_Max_CaiPiao - playerTotal).."个号签。" )
		--TalkAppendButton(varMap,x310941_var_FileId,"继续选签",13,0)--购买彩票	
	else
		TalkAppendString( varMap, "\n\t您今天已经选取了"..tostring(playerTotal).."个号签".."，感谢您的参与，祝您选取的号签为上上签。" )
	end	
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310941_var_FileId, x310941_var_QuestName1)
	--DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)
end

function x310941_ProcShowAwardInfo( varMap, varPlayer, awardNum, awardType )

	

end


function x310941_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	

	
end






function x310941_ProcAccept( varMap, varPlayer )

end



function x310941_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x310941_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x310941_CheckSubmit( varMap, varPlayer )
end



function x310941_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x310941_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x310941_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x310941_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


--检查是当前否为有效的活动时间,是：则返回是哪一天，否：则返回8
function x310941_CheckInvalidTime()
	local timeNow = x310941_GetTodayNum()
	
	if timeNow == -1 then
	end
	return x310941_GetIndex(timeNow)
end

function x310941_GetIndex(day)
	local index = 0
	local flag = 0
	for i ,item in x310941_g_InvalidTime do
			index = index + 1
			if day == item then
				flag = 1
				break
			end
	end

	if flag == 0 and index == 7 then
		index = 8
	end
	
	return index
end

function x310941_GetTodayNum()
	local year, month, day = GetYearMonthDay()
	local timeNow = tostring(year)..tostring(month)..tostring(day)
	local timeNum = tonumber(timeNow)
	
	if timeNum == nil then
		return -1
	end
	
	return timeNum
end


--获取玩家当天的总共购买彩票次数
function x310941_GetPlayerTotalNum(varMap, varPlayer, iDay)
	local totalNum
	
	if iDay == x310941_g_InvalidTime[1] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY1_TOTAL[1], MD_HUODONG_CAIPIAO_DAY1_TOTAL[2], MD_HUODONG_CAIPIAO_DAY1_TOTAL[3] )
	elseif iDay == x310941_g_InvalidTime[2] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY2_TOTAL[1], MD_HUODONG_CAIPIAO_DAY2_TOTAL[2], MD_HUODONG_CAIPIAO_DAY2_TOTAL[3])
	elseif iDay == x310941_g_InvalidTime[3] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY3_TOTAL[1], MD_HUODONG_CAIPIAO_DAY3_TOTAL[2], MD_HUODONG_CAIPIAO_DAY3_TOTAL[3])
	elseif iDay == x310941_g_InvalidTime[4] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY4_TOTAL[1], MD_HUODONG_CAIPIAO_DAY4_TOTAL[2], MD_HUODONG_CAIPIAO_DAY4_TOTAL[3])
	elseif iDay == x310941_g_InvalidTime[5] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY5_TOTAL[1], MD_HUODONG_CAIPIAO_DAY5_TOTAL[2], MD_HUODONG_CAIPIAO_DAY5_TOTAL[3])
	elseif iDay == x310941_g_InvalidTime[6] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY6_TOTAL[1], MD_HUODONG_CAIPIAO_DAY6_TOTAL[2], MD_HUODONG_CAIPIAO_DAY6_TOTAL[3] )
	elseif iDay == x310941_g_InvalidTime[7] then
		totalNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY7_TOTAL[1], MD_HUODONG_CAIPIAO_DAY7_TOTAL[2], MD_HUODONG_CAIPIAO_DAY7_TOTAL[3])	
	end
	return 	totalNum
end


function x310941_GetPlayerHitNum(varMap, varPlayer,iDay)
	local hitNum
	
	if iDay == x310941_g_InvalidTime[1] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY1_HIT[1], MD_HUODONG_CAIPIAO_DAY1_HIT[2], MD_HUODONG_CAIPIAO_DAY1_HIT[3])
	elseif iDay == x310941_g_InvalidTime[2] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY2_HIT[1], MD_HUODONG_CAIPIAO_DAY2_HIT[2], MD_HUODONG_CAIPIAO_DAY2_HIT[3])
	elseif iDay == x310941_g_InvalidTime[3] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY3_HIT[1], MD_HUODONG_CAIPIAO_DAY3_HIT[2], MD_HUODONG_CAIPIAO_DAY3_HIT[3])
	elseif iDay == x310941_g_InvalidTime[4] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY4_HIT[1], MD_HUODONG_CAIPIAO_DAY4_HIT[2], MD_HUODONG_CAIPIAO_DAY4_HIT[3])
	elseif iDay == x310941_g_InvalidTime[5] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY5_HIT[1], MD_HUODONG_CAIPIAO_DAY5_HIT[2], MD_HUODONG_CAIPIAO_DAY5_HIT[3])
	elseif iDay == x310941_g_InvalidTime[6] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY6_HIT[1], MD_HUODONG_CAIPIAO_DAY6_HIT[2], MD_HUODONG_CAIPIAO_DAY6_HIT[3])
	elseif iDay == x310941_g_InvalidTime[7] then
		hitNum = GetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY7_HIT[1], MD_HUODONG_CAIPIAO_DAY7_HIT[2], MD_HUODONG_CAIPIAO_DAY7_HIT[3])	
	end
	
	return hitNum
end

function x310941_SetPlayerTotalNum(varMap, varPlayer, totalNum, iDay)
	
	if iDay == x310941_g_InvalidTime[1] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY1_TOTAL[1], MD_HUODONG_CAIPIAO_DAY1_TOTAL[2], MD_HUODONG_CAIPIAO_DAY1_TOTAL[3] ,totalNum)
	elseif iDay == x310941_g_InvalidTime[2] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY2_TOTAL[1], MD_HUODONG_CAIPIAO_DAY2_TOTAL[2], MD_HUODONG_CAIPIAO_DAY2_TOTAL[3] ,totalNum)
	elseif iDay == x310941_g_InvalidTime[3] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY3_TOTAL[1], MD_HUODONG_CAIPIAO_DAY3_TOTAL[2], MD_HUODONG_CAIPIAO_DAY3_TOTAL[3] ,totalNum)
	elseif iDay == x310941_g_InvalidTime[4] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY4_TOTAL[1], MD_HUODONG_CAIPIAO_DAY4_TOTAL[2], MD_HUODONG_CAIPIAO_DAY4_TOTAL[3] ,totalNum)
	elseif iDay == x310941_g_InvalidTime[5] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY5_TOTAL[1], MD_HUODONG_CAIPIAO_DAY5_TOTAL[2], MD_HUODONG_CAIPIAO_DAY5_TOTAL[3] ,totalNum)
	elseif iDay == x310941_g_InvalidTime[6] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY6_TOTAL[1], MD_HUODONG_CAIPIAO_DAY6_TOTAL[2], MD_HUODONG_CAIPIAO_DAY6_TOTAL[3] ,totalNum)
	elseif iDay == x310941_g_InvalidTime[7] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY7_TOTAL[1], MD_HUODONG_CAIPIAO_DAY7_TOTAL[2], MD_HUODONG_CAIPIAO_DAY7_TOTAL[3] ,totalNum)	
	end
end


function x310941_SetPlayerHitNum(varMap, varPlayer, hitNum, iDay)
	
	if iDay == x310941_g_InvalidTime[1] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY1_HIT[1], MD_HUODONG_CAIPIAO_DAY1_HIT[2], MD_HUODONG_CAIPIAO_DAY1_HIT[3] ,hitNum)
	elseif iDay == x310941_g_InvalidTime[2] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY2_HIT[1], MD_HUODONG_CAIPIAO_DAY2_HIT[2], MD_HUODONG_CAIPIAO_DAY2_HIT[3] ,hitNum)
	elseif iDay == x310941_g_InvalidTime[3] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY3_HIT[1], MD_HUODONG_CAIPIAO_DAY3_HIT[2], MD_HUODONG_CAIPIAO_DAY3_HIT[3] ,hitNum)
	elseif iDay == x310941_g_InvalidTime[4] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY4_HIT[1], MD_HUODONG_CAIPIAO_DAY4_HIT[2], MD_HUODONG_CAIPIAO_DAY4_HIT[3] ,hitNum)
	elseif iDay == x310941_g_InvalidTime[5] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY5_HIT[1], MD_HUODONG_CAIPIAO_DAY5_HIT[2], MD_HUODONG_CAIPIAO_DAY5_HIT[3] ,hitNum)
	elseif iDay == x310941_g_InvalidTime[6] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY6_HIT[1], MD_HUODONG_CAIPIAO_DAY6_HIT[2], MD_HUODONG_CAIPIAO_DAY6_HIT[3] ,hitNum)
	elseif iDay == x310941_g_InvalidTime[7] then
		SetPlayerGameData( varMap, varPlayer, MD_HUODONG_CAIPIAO_DAY7_HIT[1], MD_HUODONG_CAIPIAO_DAY7_HIT[2], MD_HUODONG_CAIPIAO_DAY7_HIT[3] ,hitNum)	
	end
end

--检查当前是否为可兑签时间
function x310941_CheckGetAwardTime()
--	local iHour, iMin, iSec = GetHourMinSec()--看看时间的格式是12进制还是24进制的   --【松】因涉及第三天领第一天的，不好处理取消领取时间设定
--	if iHour < 12 then
--		return 0
--	end
	return 1
end



--获得当天的随机大奖号码的字段所在的int数组中的序号和偏移
function x310941_CountCountryBit_haoma(day)
	local offset = 0
	local index

	if day == x310941_g_InvalidTime[7] then
		index = CD_COUNTRY_CAIPIAO_START + 1
		offset = 0
	else 
		index =  CD_COUNTRY_CAIPIAO_START
		offset = 5 * (x310941_GetIndex(day) - 1)
	end
	
	return index , offset
end

function x310941_CountCountryBit_totalNum(day)
	local offset = 0
	local index
	local today = x310941_GetIndex(day)
	
	if today == 8 then
		return 
	end
	
	index = CD_COUNTRY_CAIPIAO_START + (today - 1)
	return index , offset	
end

function x310941_CountCountryBit_hitNum(day)
	local offset = 0
	local index
	
	local today = x310941_GetIndex(day)
	
	if today == 8 then
		return 
	end
	
	index = CD_COUNTRY_CAIPIAO_START + (today - 1)
	return index , offset
end


--获取当天生成的随机大奖的号码
function x310941_GetCountryHaoma(day)
	local haoma 
	local index, offset = x310941_CountCountryBit_haoma(day)
	
	if index == nil or offset == nil then
		return
	end
	
	haoma = GetCountryParamByBit(x310941_g_CountryID_HaoMa, index, offset, 5)
	return 	haoma
end

--获取当天的全服购买彩票的玩家总数
function x310941_GetCountryTotalNum(day)
	local totalNum
	local index, offset = x310941_CountCountryBit_totalNum(day)
	
	if index == nil or offset == nil then
		return
	end
	
	totalNum = GetCountryParamByBit(x310941_g_CountryID_Total, index, offset, 32)
	return totalNum
end

--获取当天全服买中彩票的玩家的总数
function x310941_GetCountryHitNum(day)
	local hitNum
	local index, offset = x310941_CountCountryBit_hitNum(day)

	if index == nil or offset == nil then
		return
	end
	
	hitNum = GetCountryParamByBit(x310941_g_CountryID_Hit, index, offset, 32)
	return hitNum
end

--记录当天的大奖号码
function x310941_SetCountryHaoma(value,day)
	local index, offset = x310941_CountCountryBit_haoma(day)
	
	if index == nil or offset == nil then
		return
	end
	
	SetCountryParamByBit(x310941_g_CountryID_HaoMa, index, offset, 5, value)
end

--记录当天全服买中大奖的玩家数量
function x310941_SetCountryHitNum(value,day)
	local index, offset = x310941_CountCountryBit_hitNum(day)
	
	if index == nil or offset == nil then
		return
	end
	
	SetCountryParamByBit(x310941_g_CountryID_Hit, index, offset, 32, value)
end

--记录当天全服购买彩票的玩家的总数
function x310941_SetCountryTotalNum(value,day)
	local index, offset = x310941_CountCountryBit_totalNum(day)
	
	if index == nil or offset == nil then
		return
	end
	
	SetCountryParamByBit(x310941_g_CountryID_Total, index, offset, 32, value)
end

--玩家选择彩票之后的处理
function x310941_HandlePlayerChoose(varMap, varPlayer,varTalknpc, value)
	local timeNow = x310941_GetTodayNum()
	local haoma = x310941_GetCountryHaoma(timeNow)
	
	--是否需要计算当天的大奖号码
	if haoma == 0 then
		haoma = x310941_CountRandomHaoma(varMap, varPlayer, timeNow)
	end
	--Msg2Player( varMap, varPlayer, "haoma="..tostring(haoma), 8, 3)--调试用，显示当天的大奖号码
	
	--扣除玩家买彩票的金币
	if  CostMoney(varMap, varPlayer, 2, x310941_g_CostMoney) == 1 then
		Msg2Player( varMap, varPlayer, "选签完成，扣除"..x310941_CurrencyDescribe(x310941_g_CostMoney).."现金", 8, 3)
		GamePlayScriptLog(varMap, varPlayer, x310941_g_GamePlaylog+value-1)
	else
		Msg2Player( varMap, varPlayer, "现金不足"..x310941_CurrencyDescribe(x310941_g_CostMoney).."，选签失败", 8, 3)
		return
	end
	
	--玩家选号后的处理
	local totalNumCountry = x310941_GetCountryTotalNum(timeNow)
	local totalNumPlayer = x310941_GetPlayerTotalNum(varMap, varPlayer, timeNow)
	totalNumCountry = totalNumCountry + 1
	totalNumPlayer = totalNumPlayer + 1
	x310941_SetCountryTotalNum(totalNumCountry, timeNow)
	x310941_SetPlayerTotalNum(varMap, varPlayer, totalNumPlayer, timeNow)
	
	if haoma == value then
		local hitNumCountry = x310941_GetCountryHitNum(timeNow)
		local hitNumPlayer = x310941_GetPlayerHitNum(varMap, varPlayer,timeNow)
		hitNumCountry = hitNumCountry + 1
		hitNumPlayer = hitNumPlayer +1
		x310941_SetCountryHitNum(hitNumCountry, timeNow)
		x310941_SetPlayerHitNum(varMap, varPlayer, hitNumPlayer, timeNow)
	end
		
	--判断是否是7或7的倍数
	if mod(totalNumCountry, 7) == 0 then
		Msg2Player( varMap, varPlayer, "恭喜，您是第"..tostring(totalNumCountry).."位选签的玩家，获得了额外的"..x310941_CurrencyDescribe(x310941_g_AwardMoney7).."金卡的奖励", 8, 3)
		--给玩家奖金
		x310941_GivePlayerAward(varMap, varPlayer, varTalknpc, 2)
	end
	
	x310941_EndOnce(varMap, varPlayer,varTalknpc)		
end

--给与玩家奖励的接口.1表示普通奖励，2表示玩家为7的倍数的时候的奖励
function x310941_GivePlayerAward(varMap, varPlayer, varTalknpc, index)
	if index == 1 then		
		--显示之前的中奖号，每注奖金，用户的中奖数	 		
		x310941_CountAward(varMap, varPlayer, varTalknpc, 1)		
	elseif index == 2 then
		AddMoney(varMap, varPlayer, 3, x310941_g_AwardMoney7)--每注彩票固定奖励的3两金卡					
	end
end

--生成随机的大奖号码
function x310941_CountRandomHaoma(varMap, varPlayer, day)
	local randHaoma = random( 1, 10)
	x310941_SetCountryHaoma(randHaoma,day) 
	return randHaoma
end

--初始化
function x310941_Initialize(varMap, varPlayer)
	local haoma = x310941_GetCountryHaoma(x310941_g_InvalidTime[1])
	if haoma > 10 then
			for i ,item in x310941_g_InvalidTime do
				x310941_SetCountryHaoma(0, item)
				x310941_SetCountryHitNum(0, item)
				x310941_SetCountryTotalNum(0, item)
			end
	end	
end

--查询当天的购买记录
function x310941_QueryRecordToday(varMap, varPlayer, varTalknpc)
	local today = x310941_CheckInvalidTime()
	if today > 7 then	
		StartTalkTask( varMap)
		TalkAppendString( varMap, "\t抱歉，活动时间已过,无法查询今天的选签资讯" )
		StopTalkTask()
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)
		return 
	end
		
	local playerTotal = x310941_GetPlayerTotalNum(varMap, varPlayer,x310941_g_InvalidTime[today])
	StartTalkTask( varMap)
	TalkAppendString( varMap, "#Y查询本日选签资讯")
	if playerTotal < 10 then
		TalkAppendString( varMap, "\t您今天已经选取了"..tostring(playerTotal).."个号签".."您今天还可以选取"..tostring(x310941_g_Max_CaiPiao - playerTotal).."个号签。" )
		--TalkAppendButton(varMap,x310941_var_FileId,"我要选签",13,0)--购买彩票	
	else
		TalkAppendString( varMap, "\t您今天已经选取了"..tostring(playerTotal).."个号签".."，感谢您的参与，请期待明天产生的本日上上签，祝您好运。" )
	end	
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310941_var_FileId, x310941_var_QuestName1)
	
end

--查询之前的购买记录
function x310941_QueryRecordBefore(varMap, varPlayer, varTalknpc)
	x310941_CountAward(varMap, varPlayer, varTalknpc, 0)--只显示玩家中奖信息，不实际给与玩家奖励
end

--中奖信息和查询和给玩家奖品的处理函数
--givemoney= 1查询处理 =2同时给与玩家奖励
function x310941_CountAward(varMap, varPlayer, varTalknpc, giveMoney)
		StartTalkTask(varMap)
		
		local totalAwardMoney = 0
		local totalSpendMoney = 0
		local startIndex = -1
		local endIndex = -1
		local playerTotal = 0
		local playerHit = 0
		
		local today = x310941_CheckInvalidTime()
		
		if today == 1 then
			TalkAppendString( varMap, "#Y"..x310941_var_QuestName1 )
			TalkAppendString( varMap, "\t很抱歉，今天是活动的第一天，还无法查询上上签资讯，请您明天再来" )	
			StopTalkTask()
			DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)		
			return
		end
		
		if today > 7 then
			endIndex = 7
		else
			endIndex = today - 1
		end
		
		for i = 1, endIndex do
			if x310941_GetPlayerTotalNum(varMap, varPlayer,x310941_g_InvalidTime[i]) ~= 0 then
				startIndex = i
				break
			end
		end
		
		if startIndex == -1 then
			TalkAppendString( varMap, "#Y"..x310941_var_QuestName2 )	
			TalkAppendString( varMap, "\t很抱歉，您目前没有可以兑换的号签。" )	
			StopTalkTask()
			DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)		
			return
		end
		
		local canUse =GetBagSpace(varMap, varPlayer)
			if playerHit > 3 and  canUse < 3  then
		 		Msg2Player( varMap, varPlayer, "背包空间不足3个，请先清理出至少3个的空余空间", 8, 2)
			 	Msg2Player( varMap, varPlayer, "背包空间不足3个，请先清理出至少3个的空余空间", 8, 3)
			 	return
		 	end

		TalkAppendString( varMap,"#Y"..x310941_var_QuestName2)	
		for j = startIndex, endIndex do
			local countryTotal = x310941_GetCountryTotalNum(x310941_g_InvalidTime[j])
			local countryHit = x310941_GetCountryHitNum(x310941_g_InvalidTime[j])
			local haoma = x310941_GetCountryHaoma(x310941_g_InvalidTime[j])
			local playerTotalLocal = x310941_GetPlayerTotalNum(varMap, varPlayer, x310941_g_InvalidTime[j])
			local playerHitLocal = x310941_GetPlayerHitNum(varMap, varPlayer, x310941_g_InvalidTime[j])
			local spendMoney = 0
			local awardMoney = 0
			local charm = 0
			
			local charmString = x310941_g_charmStringTable[4]
			
			if playerTotalLocal ~= 0 then
				charm = floor(playerHitLocal * 100/playerTotalLocal)
			end
			
			if charm > 60 then
				charmString = x310941_g_charmStringTable[1]
			elseif charm > 30 then
				charmString = x310941_g_charmStringTable[2]
			elseif charm > 0 then
				charmString = x310941_g_charmStringTable[3]
			end
			
			playerHit = playerHit + playerHitLocal
			spendMoney = playerTotalLocal * x310941_g_AwardMoney
			totalSpendMoney = totalSpendMoney + spendMoney
			if countryHit == 0 then
				awardMoney = 0
			else
				awardMoney = floor(countryTotal * x310941_g_CostMoney * playerHitLocal/countryHit)
			end	

			totalAwardMoney = totalAwardMoney + awardMoney
			
			if playerTotalLocal ~= 0 then	
				if playerHitLocal > 0 then
					TalkAppendString( varMap,"\n\t第【"..tostring(j).."】期：本期上上签为"..tostring(haoma).."号签\n\t"..charmString.."，您总共选取了"..tostring(playerTotalLocal).."个号签，其中有"..tostring(playerHitLocal).."个上上签,命中率为"..tostring(charm).."%\n\t您获得了"..x310941_CurrencyDescribe(spendMoney).."金卡的普通签奖励，和"..x310941_CurrencyDescribe(awardMoney).."金卡的上上签奖励。恭喜您选中了上上签，祝您鸿运当头，再接再厉。")		
				else
				  TalkAppendString( varMap,"\n\t第【"..tostring(j).."】期：本期上上签为"..tostring(haoma).."号签\n\t"..charmString.."，您总共选取了"..tostring(playerTotalLocal).."个号签，很遗憾您没有选中上上签\n\t您获得了"..x310941_CurrencyDescribe(spendMoney).."金卡的普通签奖励。希望您下一次可以选中上上签。")		
				end	
			end
		end
				
		if giveMoney == 1 then
			TalkAppendString( varMap,"\n\t您总共获得了"..x310941_CurrencyDescribe(totalSpendMoney).."金卡的普通签奖励和"..x310941_CurrencyDescribe(totalAwardMoney).."金卡的上上签奖励")		 	
		 	AddMoney(varMap, varPlayer,3, totalAwardMoney + totalSpendMoney)
		 	Msg2Player( varMap, varPlayer, "恭喜您获得了"..x310941_CurrencyDescribe(totalAwardMoney + totalSpendMoney).."金卡奖励", 8, 3)
		 	for k = startIndex, endIndex do
		 		x310941_SetPlayerHitNum(varMap, varPlayer, 0, x310941_g_InvalidTime[k])--在中奖之后把玩家的中奖信息清零
				x310941_SetPlayerTotalNum(varMap, varPlayer, 0, x310941_g_InvalidTime[k])
		 	end	
		 	
		 	if playerHit >= 1 then
		 		for k = 1, playerHit do
		 			x310941_ItemAward(varMap, varPlayer, varTalknpc)
		 		end
		 	end	
		else	
			 TalkAppendString( varMap,"\n\t您总共可以获得"..x310941_CurrencyDescribe(totalSpendMoney).."金卡的普通签奖励和"..x310941_CurrencyDescribe(totalAwardMoney).."金卡的上上签奖励")	
		end
		
		StopTalkTask()
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310941_var_FileId, -1)
end

--给与玩家随机物品
function x310941_ItemAward(varMap, varPlayer, varTalknpc)
	local randNum = random(1, x310941_g_Random)
	local randTemp = 0
	local index = 0
	
	for i, value in x310941_g_ItemAwardList do
		randTemp = randTemp + value.itemProbability
		if (randNum < randTemp) then
			index = i
			break
		end
	end
	
	if (index == 0) then
		return 
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, x310941_g_ItemAwardList[index].itemID, x310941_g_ItemAwardList[index].num)
	
	if StopItemTask(varMap,varPlayer) > 0 then
		DeliverItemListSendToPlayer( varMap, varPlayer)
		Msg2Player( varMap, varPlayer, "恭喜，您获得了"..tostring(x310941_g_ItemAwardList[index].num).."个 "..x310941_g_ItemAwardList[index].name.." 的随机奖励", 8, 3)
		local varMsg = format( "恭喜#R%s#cffcc00在新年上上签活动中获得%d个%s", GetName( varMap, varPlayer),x310941_g_ItemAwardList[index].num,x310941_g_ItemAwardList[index].name )
		LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
	end	
end


--货币显示处理函数
function x310941_CurrencyDescribe(money)
	local describe = "error"
	if money < 1000 then
		describe = tostring(money).."文"
	elseif money < 1000000 then
		local wen = mod(money,1000)
		local liang = floor((money - wen)/1000)
		
		if wen == 0 then
			describe = tostring(liang).."两"
		else
			describe = tostring(liang).."两"..tostring(wen).."文"
		end	
	else
		local wen = mod(money, 1000)	
		local liang = floor(mod(money - wen, 1000000)/1000)
		local ding = floor(money/1000000)
		
		if wen == 0 and liang == 0 then
			describe = tostring(ding).."锭"
		elseif wen == 0 and liang ~= 0 then
			describe = tostring(ding).."锭"..tostring(liang).."两"
		elseif wen ~= 0 and liang == 0 then
			describe = tostring(ding).."锭"..tostring(wen).."文"
		else
			describe = tostring(ding).."锭"..tostring(liang).."两"..tostring(wen).."文"
		end
	end

	return describe
end
