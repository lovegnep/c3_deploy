--DECLARE_QUEST_INFO_START-- 
x430610_var_FileId 					= 	430610
x430610_var_QuestName				= 	"【赛马】领取奖励" 
x430610_var_QuestInfo				= 	""

--Gameopen
x430610_var_GameOpen = 1099

x430610_var_HorseGaming_JoinEndTime			= 1165	-- 赛马大竞猜结束投注时间 （分钟）
x430610_var_HorseGaming_BeginRewardTime		= 1210	-- 赛马大竞猜开始兑奖时间 （分钟）
x430610_var_HorseGmaing_UnitMoney			= 800	-- 赛马大竞猜每注多少钱 （现金）

-- 赛马大竞猜记录的md
x430610_var_HorseGaming_MD = 
{
	GamingTime = MD_HANDBOOKINGER_INVEST_TIME,
	UsedFreePoint = MD_HANDBOOKINGER_USEDFREEPOINT,
	[1] = { MD_HANDBOOKINGER_NUM_TYPE1,MD_HANDBOOKINGER_COUNTRY1_TYPE1 },
	[2] = { MD_HANDBOOKINGER_NUM_TYPE2,MD_HANDBOOKINGER_COUNTRY1_TYPE2,MD_HANDBOOKINGER_COUNTRY2_TYPE2 },
	[3] = { MD_HANDBOOKINGER_NUM_TYPE3,MD_HANDBOOKINGER_COUNTRY1_TYPE3,MD_HANDBOOKINGER_COUNTRY2_TYPE3,MD_HANDBOOKINGER_COUNTRY3_TYPE3 },
}

--奖励数值
x430610_var_ExpBonus = 31500
x430610_var_BonusMoney1 =0
x430610_var_BonusMoney2 =0
x430610_var_BonusMoney3 =0
x430610_var_BonusMoney4 =0
x430610_var_BonusMoney5 =0
x430610_var_BonusMoney6 =0
x430610_var_BonusMoney18 = 50
x430610_var_BonusItem	=	12030967
x430610_var_BonusChoiceItem ={}
--系统调节数值
x430610_var_sysBonus = 2
--DECLARE_QUEST_INFO_STOP--

function x430610_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	--SendToplistKeyValue2GL(varMap,varPlayer,SAIMA_TOP_LIST,10)

	TalkAppendButton( varMap,x430610_var_FileId, x430610_var_QuestName,0, -1 )

end

function x430610_ProcEventEntry(varMap, varPlayer,varTalknpc)	
	if GetLevel(varMap,varPlayer) <40 then
		Msg2Player(varMap, varPlayer, "等级不足40级无法参与赛马大竞猜", 0, 3)
		return
	end
	-- 赛马大会未开放
	if GetGameOpenById( x430609_var_GameOpen ) <= 0 then
		StartTalkTask(varMap)
		local Readme_1 = "#Y【赛马】领取奖励#r#W"
		local mingciinfo = ""
		mingciinfo = "赛马大会未开放"
		TalkAppendString(varMap, Readme_1);
		TalkAppendString(varMap, mingciinfo);
		StopTalkTask(varMap);
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x430609_var_FileId, -1 );
		return
	else
		x430610_ProcHorseGamingReward(varMap, varPlayer, varTalknpc)
	end
	
end 

function x430610_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end

function x430610_ProcAccept( varMap, varPlayer )
end

function x430610_ProcQuestAbandon( varMap, varPlayer, varQuest )
end

function x430610_ProcContinue( varMap, varPlayer, varTalknpc )
end

function x430610_CheckSubmit( varMap, varPlayer )
end

function x430610_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

function x430610_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end

function x430610_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end

function x430610_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

-- 领奖处理
function x430610_ProcHorseGamingReward(varMap, varPlayer, varTalknpc)
	if x430610_IsHasReward(varMap, varPlayer) == 0 then
		StartTalkTask(varMap)
		local Readme_1 = "#Y【赛马】领取奖励#r#W"
		local mingciinfo = ""
		mingciinfo = "\t您当前没有可以领取的奖励"
		TalkAppendString(varMap, Readme_1);
		TalkAppendString(varMap, mingciinfo);
		StopTalkTask(varMap);
		DeliverTalkMenu( varMap, varPlayer, varTalknpc, x430609_var_FileId, -1 );

		return
	end
	
	if x430610_IsOverdueReawrd(varMap, varPlayer) == 1 then
		x430610_ProcGetOverdueReward(varMap, varPlayer)
	else
		x430610_ProcGetCurDayReward(varMap, varPlayer)
	end
	
	StartTalkTask(varMap)
	local Readme_1 = "#Y【赛马】领取奖励#r#W"
	local mingciinfo = ""
	mingciinfo = "\t顺利领取赛马大竞猜奖励！"
	TalkAppendString(varMap, Readme_1);
	TalkAppendString(varMap, mingciinfo);
	StopTalkTask(varMap);
	DeliverTalkMenu( varMap, varPlayer, varTalknpc, x430609_var_FileId, -1 );
	
	x430610_ProcAfterGetReward(varMap,varPlayer)
	GamePlayScriptLog( varMap, varPlayer, 996)
end

-- 领取过期奖励

function x430610_ProcGetOverdueReward(varMap, varPlayer)
	-- 获取投注数量 return 免费注数，总注数（免费+花钱的）
	local freepoint,allpoint = x430610_ProcGetAllPoint(varMap, varPlayer)
--	print(allpoint)
	-- 这里设置奖励
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, x430610_var_BonusItem, allpoint )	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很遗憾，赛马大竞猜您没有猜中任何结果，获得"..allpoint.."个@item_"..x430610_var_BonusItem.."!")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
	x430610_GetBonus( varMap, varPlayer,varTalknpc,x430610_var_BonusMoney3 * allpoint)
	x430610_Msg2toplayer( varMap, varPlayer,x430610_var_BonusMoney3 * allpoint)
end

-- 领取当天奖励
function x430610_ProcGetCurDayReward(varMap, varPlayer)
	local CountryTab = {}
	local nWorldId = GetWorldIdEx()
	for idx = 0, 3 do
		local snid, key, country, name, guidname, snguid  = GetToplistInfo(nWorldId, SAIMA_TOP_LIST, idx)
		CountryTab[idx + 1] = country
	end
	
	local ResultTab = {}
	for idx = 1, getn(x430610_var_HorseGaming_MD) do
		
		ResultTab[idx] = {}
		ResultTab[idx].type = idx 	-- 投注类型
		ResultTab[idx].Num = 0		-- 投注数量
		ResultTab[idx].IsRight = 1	-- 选对标志
	
		local tab = x430610_var_HorseGaming_MD[idx]
		for subidx = 1, getn(tab) do
			local subtab = tab[subidx]
			local value = GetPlayerGameData(varMap, varPlayer, subtab[1], subtab[2], subtab[3])
			
			if subidx == 1 then
				ResultTab[idx].Num = value
				if value == 0 then
					ResultTab[idx].IsRight = 0
					break
				end
			else
				if value ~= CountryTab[idx - 1] then
					ResultTab[idx].IsRight = 0
					break
				end
			end
		end
	end
	-- 获取投注数量 return 免费注数，总注数（免费+花钱的）
	local freepoint,allpoint = x430610_ProcGetAllPoint(varMap, varPlayer)
	-- 根据表 ResultTab 设置玩家奖励
	local dumaaward = x430610_guessright(varMap, varPlayer,ResultTab,CountryTab)
	if dumaaward <=0 then
		StartItemTask(varMap)
		ItemAppendBind( varMap, x430610_var_BonusItem, allpoint )	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"很遗憾，赛马大竞猜您没有猜中任何结果，获得"..allpoint.."个@item_"..x430610_var_BonusItem.."!")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
	x430610_GetBonus( varMap, varPlayer,varTalknpc,	dumaaward)
	x430610_Msg2toplayer( varMap, varPlayer,dumaaward)
	
end
-- 判断是否可以领取奖励
function x430610_IsHasReward(varMap, varPlayer)
	local CurYear,CurMonth,CurDay = GetYearMonthDay()
	local CurMin = GetMinOfDay()
	
	local TimeTab = x430610_var_HorseGaming_MD.GamingTime
	local RecordTime = GetPlayerGameData(varMap, varPlayer, TimeTab[1], TimeTab[2], TimeTab[3])
	
	-- 已经领取 或 未参加过奖励
	if RecordTime == 0 then
		return 0
	end
	
	-- 当天的且不在领取时间内时不能领取奖励
	local oYear, oMon, oDay, oHour, oMin, oSec = Localtime( RecordTime )
	if( oYear == CurYear and oMon == CurMonth and oDay == CurDay) then
		if CurMin <= x430610_var_HorseGaming_BeginRewardTime then
			return 0
		end
	end
	
	return 1
end

-- 判断要领取的奖励是否是过期的奖励
function x430610_IsOverdueReawrd(varMap, varPlayer)
	local IshasReward = 1
	local CurYear,CurMonth,CurDay = GetYearMonthDay()
	local CurMin = GetMinOfDay()
	
	local TimeTab = x430610_var_HorseGaming_MD.GamingTime
	local RecordTime = GetPlayerGameData(varMap, varPlayer, TimeTab[1], TimeTab[2], TimeTab[3])
	
	-- 当天的且不在领取时间内时不能领取奖励
	local oYear, oMon, oDay, oHour, oMin, oSec = Localtime( RecordTime )
	if( oYear == CurYear and oMon == CurMonth and oDay == CurDay) then
		return 0
	end
	
	return 1
end

-- 领奖后md处理
function x430610_ProcAfterGetReward(varMap, varPlayer)
	--print("领奖后处理")
	SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.GamingTime[1], x430609_var_HorseGaming_MD.GamingTime[2], x430609_var_HorseGaming_MD.GamingTime[3], 0)
end

-- 获取投注数量 return 免费注数，总注数（免费+花钱的）
function x430610_ProcGetAllPoint(varMap, varPlayer)
	local UsedPoint = 0
	local FreePoint = 0
	
	for idx = 1, getn(x430609_var_HorseGaming_MD) do
		local tab = x430609_var_HorseGaming_MD[idx]
		local num = GetPlayerGameData(varMap, varPlayer, tab[1][1], tab[1][2], tab[1][3])
		UsedPoint = UsedPoint + num
	end
	
	local FreePointTab = x430609_var_HorseGaming_MD.UsedFreePoint
	FreePoint = GetPlayerGameData(varMap, varPlayer, FreePointTab[1], FreePointTab[2], FreePointTab[3])

	return FreePoint,UsedPoint
end

--基础奖励给予
function x430610_GetBonus( varMap, varPlayer,varTalknpc,money)
	local level = GetLevel(varMap, varPlayer)

	if x430610_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x430610_var_ExpBonus*level);
  	end
	if x430610_var_BonusMoney1 > 0 then
		AddMoney( varMap, varPlayer, 1, x430610_var_BonusMoney1 )
	end
	if x430610_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x430610_var_BonusMoney2 )
	end
	if money > 0 then
	    AddMoney( varMap, varPlayer, 3, money )
	end
	if x430610_var_BonusMoney4 > 0 then
	local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x430610_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
	end
	if x430610_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x430610_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
	end
	if x430610_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x430610_var_BonusMoney6)
	end
	if x430610_var_BonusMoney18 > 0 and GetLevel(varMap,varPlayer) >= 75 then
		AddHorseMoney(varMap, varPlayer, x430610_var_BonusMoney18 )
	end
end

--基础奖励通报
function x430610_Msg2toplayer( varMap, varPlayer,money)
		local level =GetLevel( varMap, varPlayer )
	--	x430610_var_ExpBonus = x430610_var_ExpBonus*level
		if x430610_var_ExpBonus > 0 then
			Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x430610_var_ExpBonus*level.."#Y的奖励", 0, 2)
		end
		if x430610_var_BonusMoney1 > 0 then
  		  Msg2Player(varMap, varPlayer,format( "#Y获得#R银卡#{_MONEY%d}#Y的奖励",x430610_var_BonusMoney1), 0, 2)
  		end
		 if x430610_var_BonusMoney2 > 0 then
  		  Msg2Player(varMap, varPlayer,format( "#Y获得#R现银#{_MONEY%d}#Y的奖励",x430610_var_BonusMoney2), 0, 2)
  		end
		if money > 0 then
  		 Msg2Player(varMap, varPlayer, format( "#Y获得#R金卡#{_MONEY%d}#Y的奖励",money), 0, 2)
  		 Msg2Player(varMap, varPlayer, format( "#Y获得#R金卡#{_MONEY%d}#Y的奖励",money), 0, 3)
		end
		if x430610_var_BonusMoney4 > 0 then
			Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x430610_var_BonusMoney4.."#Y的奖励", 0, 2)
		end
		if x430610_var_BonusMoney5 > 0 then
			Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x430610_var_BonusMoney5.."#Y的奖励", 0, 2)
		end
		if x430610_var_BonusMoney6 > 0 then
			Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x430610_var_BonusMoney6.."#Y的奖励", 0, 2)
		end
		if x430610_var_BonusMoney18 > 0 and GetLevel(varMap,varPlayer) >= 75 then
			Msg2Player(varMap, varPlayer, "#Y获得#R马币"..x430610_var_BonusMoney18.."#Y的奖励", 0, 2)
			Msg2Player(varMap, varPlayer, "#Y获得#R马币"..x430610_var_BonusMoney18.."#Y的奖励", 0, 3)
		end
		
end

--赛马中奖所获的奖励计算
function x430610_guessright(varMap, varPlayer,resulttab,CountryTab)
--		resulttab[idx] = {}
--		resulttab[idx].type = idx 	-- 投注类型
--		resulttab[idx].Num = 0		-- 投注数量
--		resulttab[idx].IsRight = 1	-- 选对标志
	local xianjin2jinka = x430610_var_sysBonus --现金金卡比率
	--根据每种的中奖概率提高赔率
	local jianglitype = {} 
	jianglitype[1] = xianjin2jinka*(2-0.25)
	jianglitype[2] = 2*xianjin2jinka*(2-0.06)
	jianglitype[3] = 3*xianjin2jinka*(2-0.02)
--	print("tigao==============="..jianglitype[1])
--	print("tigao==============="..jianglitype[2])
--	print("tigao==============="..jianglitype[3])
	--根据排行榜计算出国家获胜概率
	
	--获得排行榜数据
	local count = {}
	for idx = 0, 3 do
		count[idx]={}
		for nMingci = 1, 3 do
			count[idx][nMingci] = GetCountryParamByBit(idx,CD_COUNTYY_SAIMA_COUNT,(nMingci-1)*6,6)
--			print("mingci"..count[idx][nMingci])
		end	
	end
	
	--计算出各国获胜的概率
	local mingcitype = {}
	for idx = 0, 3 do
		mingcitype[idx] = {}
		mingcitype[idx][1] = count[idx][1]/(count[0][1]+count[1][1]+count[2][1]+count[3][1])
		mingcitype[idx][2] = count[idx][2]/(count[0][1]+count[1][1]+count[2][1]+count[3][1])
		mingcitype[idx][3] = count[idx][3]/(count[0][1]+count[1][1]+count[2][1]+count[3][1])
--		print("geguoshenglv11111=========="..mingcitype[idx][1])
--		print("geguoshenglv22222=========="..mingcitype[idx][2])
--		print("geguoshenglv33333=========="..mingcitype[idx][3])
	end
	
	----------------------------------
	--获得数据
	----------------------------------
		
	local CountryTab = {}
	local nWorldId = GetWorldIdEx()
	for idx = 0, 3 do
		local snid, key, country, name, guidname, snguid  = GetToplistInfo(nWorldId, SAIMA_TOP_LIST, idx)
		CountryTab[idx + 1] = country
--		print("2222222222222222222222222=============="..CountryTab[idx + 1])
	end
	
	
	local ResultTab = {}
	for idx = 1, getn(x430610_var_HorseGaming_MD) do
		
		ResultTab[idx] = {}
		ResultTab[idx].type = idx 	-- 投注类型
		ResultTab[idx].Num = 0		-- 投注数量
		ResultTab[idx].IsRight = 1	-- 选对标志
	
		local tab = x430610_var_HorseGaming_MD[idx]
		for subidx = 1, getn(tab) do
			local subtab = tab[subidx]
			local value = GetPlayerGameData(varMap, varPlayer, subtab[1], subtab[2], subtab[3])
--			print("333333333333"..value)
			if subidx == 1 then
				ResultTab[idx].Num = value
				if value == 0 then
					ResultTab[idx].IsRight = 0
					break
				end
			else
--				print("value=========="..value)
--				print("CountryTab[idx ]==="..CountryTab[idx])
				if value ~= CountryTab[idx] then
--					print(9999999999999999)
					ResultTab[idx].IsRight = 0
					break
				end
			end
		end
	end

--	print("2312313"..ResultTab[1].IsRight)	
	

	local freepoint,allpoint = x430610_ProcGetAllPoint(varMap, varPlayer)
	local moneyreward = 0
	for i=1,getn(x430610_var_HorseGaming_MD) do
		if ResultTab[i] ~= nil then
			
			local temp1 =(1- mingcitype[CountryTab[1]][1])*jianglitype[1]
			local temp2 =(1- mingcitype[CountryTab[1]][1] * mingcitype[CountryTab[2]][2])*jianglitype[2]
			local temp3 =(1- mingcitype[CountryTab[1]][1] * mingcitype[CountryTab[2]][2] * mingcitype[CountryTab[3]][3])*jianglitype[3]
				
			if ResultTab[i].Num>0 and ResultTab[i].IsRight ==1 then
				if temp1 < 1 then
					temp1 = 1
				end
				if temp2 < 1 then
					temp2 = 1
				end
				if temp3 < 1 then
					temp3 = 1
				end
				
				if i == 1 then
					moneyreward =moneyreward+ ResultTab[i].Num * temp1 *x430610_var_HorseGmaing_UnitMoney
				elseif i == 2 then
					moneyreward =moneyreward+ ResultTab[i].Num * temp2 *x430610_var_HorseGmaing_UnitMoney
				elseif i == 3 then
					moneyreward =moneyreward+ ResultTab[i].Num * temp3 *x430610_var_HorseGmaing_UnitMoney
				end
			elseif ResultTab[i].Num>0 and ResultTab[i].IsRight ==0 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, x430610_var_BonusItem, ResultTab[i].Num )	
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"赛马大竞猜您有部分注数没有猜中，获得"..ResultTab[i].Num.."个@item_"..x430610_var_BonusItem.."!")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					DeliverItemListSendToPlayer(varMap,varPlayer)
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"背包已满，无法得到物品！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end
			end
			
		end
	end
	--print("moneyreward======="..moneyreward)
	return moneyreward
end
