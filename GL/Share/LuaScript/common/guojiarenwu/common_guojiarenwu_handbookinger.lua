--DECLARE_QUEST_INFO_START-- 
x430609_var_FileId 					= 	430609
x430609_var_QuestName				= 	"【赛马】赛马大竞猜" 
x430609_var_QuestInfo				= 	""

x430609_var_HorseGaming_JoinEndTime			= 1165	-- 赛马大竞猜结束投注时间 （分钟）
x430609_var_HorseGaming_BeginRewardTime		= 1210	-- 赛马大竞猜开始兑奖时间 （分钟）
x430609_var_HorseGaming_RewardItem_endTime  = 1260	-- 赛马大竞猜领取奖励道具结束时间 （分钟）
x430609_var_HorseGaming_FreePoint			= 1		-- 每次赛马大竞猜总共可以使用的免费点数
x430609_var_HorseGaming_BuyPoint			= 100	-- 每次赛马大竞猜总共可以购买的点数
x430609_var_HorseGmaing_UnitMoney			= 800	-- 赛马大竞猜每注多少钱 （现金）
--x430609_var_HorseGaming_Money_Type			= 3		-- 赛马大竞猜消耗货币类型 （现金）


-- 赛马大竞猜记录的md
x430609_var_HorseGaming_MD = 
{
	GamingTime = MD_HANDBOOKINGER_INVEST_TIME,
	UsedFreePoint = MD_HANDBOOKINGER_USEDFREEPOINT,
	RewardFlag = MD_HANDBOOKINGER_DEALREWARD,
	[1] = { MD_HANDBOOKINGER_NUM_TYPE1,MD_HANDBOOKINGER_COUNTRY1_TYPE1 },
	[2] = { MD_HANDBOOKINGER_NUM_TYPE2,MD_HANDBOOKINGER_COUNTRY1_TYPE2,MD_HANDBOOKINGER_COUNTRY2_TYPE2 },
	[3] = { MD_HANDBOOKINGER_NUM_TYPE3,MD_HANDBOOKINGER_COUNTRY1_TYPE3,MD_HANDBOOKINGER_COUNTRY2_TYPE3,MD_HANDBOOKINGER_COUNTRY3_TYPE3 },	
}

--Gameopen
x430609_var_GameOpen = 1099

--DECLARE_QUEST_INFO_STOP--

function x430609_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	
	TalkAppendButton( varMap,x430609_var_FileId, x430609_var_QuestName,0, -1 )

end

function x430609_ProcEventEntry(varMap, varPlayer,varTalknpc)	
	--SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.RewardFlag[1], x430609_var_HorseGaming_MD.RewardFlag[2], x430609_var_HorseGaming_MD.RewardFlag[3], 0)
	if GetLevel(varMap,varPlayer) <40 then
		Msg2Player(varMap, varPlayer, "等级不足40级无法参与赛马大竞猜", 0, 3)
		return
	end
	local Readme_1 = "#Y【赛马】赛马大竞猜#r#W"
	local IsCanSendHorseGamingData,msginfo = x430609_CheckIsHorseGamingOpen(varMap, varPlayer)
	if IsCanSendHorseGamingData == 0 then
		if (varTalknpc ~= nil) then
			-- 从npc处请求
			StartTalkTask(varMap)
			TalkAppendString(varMap, Readme_1);
			TalkAppendString(varMap, msginfo);
			StopTalkTask(varMap);
			DeliverTalkInfo( varMap, varPlayer, varTalknpc, x430609_var_FileId, -1 );
		else
			-- 随身功能请求
			Msg2Player(varMap, varPlayer, msginfo, 0, 3)
		end
	else
		-- 检测投注时间
		local nRet = x430609_IsCanResetPlayerGamingMD(varMap, varPlayer)
		if nRet == 1 then
			x430609_ResetHorseGamingData(varMap,varPlayer)
		end
		
		x430609_CheckAndInitCountryData(varMap)
		
		x430609_SendPlayerHorseGamingData(varMap, varPlayer)
	end
	
end 

function x430609_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end

function x430609_ProcAccept( varMap, varPlayer )
end

function x430609_ProcQuestAbandon( varMap, varPlayer, varQuest )
end

function x430609_ProcContinue( varMap, varPlayer, varTalknpc )
end

function x430609_CheckSubmit( varMap, varPlayer )
end

function x430609_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

function x430609_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end

function x430609_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end

function x430609_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

-- 重置赛马大竞猜数据
function x430609_ResetHorseGamingData(varMap,varPlayer)
	--print("x430609_ResetHorseGamingData".."-- begin")
	SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.GamingTime[1], x430609_var_HorseGaming_MD.GamingTime[2], x430609_var_HorseGaming_MD.GamingTime[3], GetCurrentTime())
	SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.UsedFreePoint[1], x430609_var_HorseGaming_MD.UsedFreePoint[2], x430609_var_HorseGaming_MD.UsedFreePoint[3], 0)
	SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.RewardFlag[1], x430609_var_HorseGaming_MD.RewardFlag[2], x430609_var_HorseGaming_MD.RewardFlag[3], 0)
	
	for idx = 1, getn(x430609_var_HorseGaming_MD) do
		local tab = x430609_var_HorseGaming_MD[idx]
		for subidx = 1, getn(tab) do
			local subtab = tab[subidx]
			SetPlayerGameData(varMap, varPlayer, subtab[1], subtab[2], subtab[3], 0)
		end
	end
	
end

-- 赛马大竞猜历史记录请求
function x430609_ProcHorseGamingHistoryRequest(varMap, varPlayer)
	local count = {}
	local year,month,day = GetYearMonthDay()
	local RecordeMonth = 0;
	local strinfo = {}
	for idx = 0, 3 do
		RecordeMonth = GetCountryParamByBit(idx,CD_COUNTYY_SAIMA_COUNT,28,4)
		if (RecordeMonth ~= month) then
			SetCountryParam(varMap,idx,CD_COUNTYY_SAIMA_COUNT,month)
		end

		for nMingci = 1, 4 do
			count[nMingci] = GetCountryParamByBit(idx,CD_COUNTYY_SAIMA_COUNT,(nMingci-1)*6,6)
		end
		strinfo[idx] = count[1] .. "|" .. count[2] .. "|" .. count[3] 
	end
			
	SendHorseRaceHistory(varMap, varPlayer, strinfo[0], strinfo[1], strinfo[2], strinfo[3])
end


-- 发送玩家赛马大竞猜数据 
-- varPoolRefixValue 参数：奖池修正值 当玩家投注时 此值才有用，因为当玩家投注后map发送保存奖池的国家变量的增量给gl，map中的奖池国家变量
--                         的值在gl通知后才会改变，所以这里将发送给client消息中的奖池数据修正一下，只是显示上让玩家感觉不会有问题，实际
--						   上map中奖池国家变量的值并没有因此值改变
function x430609_SendPlayerHorseGamingData(varMap, varPlayer, varPoolRefixValue)
	local str = {}
	local UsedPoint = 0
	local FreePoint = 0
	local UsedBuyPoint = 0
	local LastCanBuyPoint = x430609_var_HorseGaming_BuyPoint
	local LastCanUseFreePoint = x430609_var_HorseGaming_FreePoint
	
	for idx = 1, getn(x430609_var_HorseGaming_MD) do
		local tab = x430609_var_HorseGaming_MD[idx]
		local num = GetPlayerGameData(varMap, varPlayer, tab[1][1], tab[1][2], tab[1][3])
		UsedPoint = UsedPoint + num
		str[idx] = tostring(num)
		
		str[idx] = str[idx] .. "|"
		if tab[2] == nil then
			str[idx] = str[idx] .. "0"
		else
			str[idx] = str[idx] .. GetPlayerGameData(varMap, varPlayer, tab[2][1], tab[2][2], tab[2][3])
		end
		
		str[idx] = str[idx] .. "|"
		if tab[3] == nil then
			str[idx] = str[idx] .. "0"
		else
			str[idx] = str[idx] .. GetPlayerGameData(varMap, varPlayer, tab[3][1], tab[3][2], tab[3][3])
		end
		
		str[idx] = str[idx] .. "|"
		if tab[4] == nil then
			str[idx] = str[idx] .. "0"
		else
			str[idx] = str[idx] .. GetPlayerGameData(varMap, varPlayer, tab[4][1], tab[4][2], tab[4][3])
		end
	end
	
	local FreePointTab = x430609_var_HorseGaming_MD.UsedFreePoint
	FreePoint = GetPlayerGameData(varMap, varPlayer, FreePointTab[1], FreePointTab[2], FreePointTab[3])
	LastCanUseFreePoint = LastCanUseFreePoint - FreePoint
	
	UsedBuyPoint = UsedPoint - FreePoint
	LastCanBuyPoint = LastCanBuyPoint - UsedBuyPoint
	
	local varRewardState, varRewardPool
	varRewardPool = x430609_GetRewardPoolRecorder(varMap)
	varRewardState = x430609_GetGetRewardState(varMap, varPlayer)
	
	if (varPoolRefixValue ~= nil) then
		varRewardPool = varRewardPool + varPoolRefixValue
	end
	
	--print("---send info b----")
	--print(x430609_var_HorseGaming_FreePoint)
	--print(FreePoint)
	--print(LastCanUseFreePoint)
	--print(str[1])
	--print(str[2])
	--print(str[3])
	--print(varRewardPool)
	--print(varRewardState)
	--print("---send info e----")
	SendHorseRaceGamingData(varMap, varPlayer, LastCanUseFreePoint, LastCanBuyPoint, x430609_var_HorseGmaing_UnitMoney, str[1], str[2], str[3], varRewardPool, varRewardState)
	
end



-----------------------------------公共处理--------------------------------------------------
-- 获取状态
function x430609_GetGetRewardState(varMap, varPlayer)
	local nResult = 0
	local nReward = 1
	local nInvest = 1
		
	nInvest = x430609_CheckCanHorseGaming(varMap, varPlayer)
	nReward = x430609_IsCanGetReward(varMap, varPlayer)
	
	nResult = nReward * 10 + nInvest
	--print(nResult)
	return  nResult
end

-- 客户端请求赛马数据
function x430609_ProcHorseGamingRequestInfo(varMap, varPlayer)
	x430609_ProcEventEntry(varMap, varPlayer)
end

-- 获取奖池数据
function x430609_GetRewardPoolRecorder(varMap)
	return GetCountryParam(varMap, 1, CD_COUNTRY_SAIMA_POOL)
end
-- 设置奖池数据
function x430609_AddRewardPoolRecorder(varMap, varValue)
	SetCountryQuestData(varMap, 1, CD_COUNTRY_SAIMA_POOL, varValue, 1)
end
-- 记录兑奖份数
function x430609_AddRewardItemValue(varMap, varValue)
	SetCountryQuestData(varMap, 2, CD_COUNTRY_SAIMA_POOL, varValue, 1)
end
-- 获取兑奖份数
function x430609_GetRewardItemValue(varMap, varValue)
	return GetCountryParam(varMap, 2, CD_COUNTRY_SAIMA_POOL)
end
-- 检查重置国家变量中的数据
function x430609_CheckAndInitCountryData(varMap)
	-- 在玩家请求数据时 检查奖池等变量是否重置，
	local CurYear,CurMonth,CurDay = GetYearMonthDay()
	local RecordTime = GetCountryParam(varMap, 0, CD_COUNTRY_SAIMA_POOL)
	local oYear, oMon, oDay, oHour, oMin, oSec = Localtime( RecordTime )
	if( oYear ~= CurYear or oMon ~= CurMonth or oDay ~= CurDay ) then
		SetCountryParam(varMap, 0, CD_COUNTRY_SAIMA_POOL, GetCurrentTime())
		SetCountryParam(varMap, 1, CD_COUNTRY_SAIMA_POOL, 0)
		SetCountryParam(varMap, 2, CD_COUNTRY_SAIMA_POOL, 0)
	end
end

-- 是否有奖励未领取
function x430609_IsCanGetReward(varMap, varPlayer)
	local IsHave = 0
	local MsgInfo = ""
	local IsOverDataReward = 0
	-- 判断是否是可以领取奖励道具
	local flag = GetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.RewardFlag[1], x430609_var_HorseGaming_MD.RewardFlag[2], x430609_var_HorseGaming_MD.RewardFlag[3])
	if (flag == 1) then
		-- 已经领取了奖励
		MsgInfo = "您已经领取过了赛马奖励"
	else
		-- 判断是否有奖励可领
		local free,used = x430609_ProcGetAllPoint(varMap, varPlayer)
		if used > 0 then
			local CurYear,CurMonth,CurDay = GetYearMonthDay()
			local CurMin = GetMinOfDay()
			local TimeTab = x430609_var_HorseGaming_MD.GamingTime
			local RecordTime = GetPlayerGameData(varMap, varPlayer, TimeTab[1], TimeTab[2], TimeTab[3])
			if (RecordTime ~= 0) then
				local oYear, oMon, oDay, oHour, oMin, oSec = Localtime( RecordTime )
				if( oYear == CurYear and oMon == CurMonth and oDay == CurDay ) then
					if CurMin < x430609_var_HorseGaming_BeginRewardTime then
						MsgInfo = "还未到领奖时间"
					else
						IsHave = 1
					end
				else
					IsOverDataReward = 1
					IsHave = 1
				end
			else
				MsgInfo = "您没有可以领取的赛马奖励"
			end
		else
			MsgInfo = "您没有可以领取的赛马奖励"
		end
	end

	return IsHave,MsgInfo,IsOverDataReward
end
-- 是否有奖励物品没有兑换成经验等
function x430609_IsRewardItemIsExchanged(varMap, varPlayer)
	local lbResult = 1
	local flag = GetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.RewardFlag[1], x430609_var_HorseGaming_MD.RewardFlag[2], x430609_var_HorseGaming_MD.RewardFlag[3])
	if flag == 0 then
		lbResult = 0
	end
	return lbResult
end
-- 是否可以重置玩家投注数据
function x430609_IsCanResetPlayerGamingMD(varMap, varPlayer)
	local nResult, strMsg = x430609_IsCanGetReward(varMap, varPlayer)
	local nRet = 0
	if nResult == 0 then
		nResult = x430609_IsRewardItemIsExchanged(varMap, varPlayer)
		if nResult == 0 then
			nRet = 1
		end
	end
	
	if nRet == 1 then
		local CurYear,CurMonth,CurDay = GetYearMonthDay()
		local TimeTab = x430609_var_HorseGaming_MD.GamingTime
		local RecordTime = GetPlayerGameData(varMap, varPlayer, TimeTab[1], TimeTab[2], TimeTab[3])
		if (RecordTime ~= 0) then
			local oYear, oMon, oDay, oHour, oMin, oSec = Localtime( RecordTime )
			if( oYear == CurYear or oMon == CurMonth or oDay == CurDay ) then
				nRet = 0
			end
		end
	end
	
	return nRet
end
-- 获取投注数量 return 免费注数，总注数（免费+花钱的）
function x430609_ProcGetAllPoint(varMap, varPlayer)
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

-- 检查玩法是否开放
function x430609_CheckIsHorseGamingOpen(varMap, varPlayer)
	-- 判断当前是否可以赛马
	local IsCanGaming = 1
	local msginfo = ""
	
	-- 赛马大会未开放
	if GetGameOpenById( x430609_var_GameOpen ) <= 0 then
		msginfo = "赛马大会未开放"
		IsCanGaming = 0
	end
	
	return IsCanGaming,msginfo
end

-- 检查是否可以开始投注
function x430609_CheckCanHorseGaming(varMap, varPlayer)
	-- 判断当前是否可以赛马
	local IsCanGaming = 1
	local msginfo = ""
	local CurYear,CurMonth,CurDay = GetYearMonthDay()
	local CurMin = GetMinOfDay()
	
	-- 赛马大会开放检测
	IsCanGaming,msginfo = x430609_CheckIsHorseGamingOpen(varMap, varPlayer)
	
	-- 不在赛马大竞猜投注时间
	if IsCanGaming == 1 then
		if( CurMin >= x430609_var_HorseGaming_JoinEndTime ) then
			msginfo = "今天的赛马大竞猜活动的投注时间已经结束，赛马大竞猜投注时间00:00-19:25"
			IsCanGaming = 0
		end
	end
	
	-- 尚有上次赛马大竞猜未领取的奖励
	local nResult, strMsg = x430609_IsCanGetReward(varMap, varPlayer)
	local nRet = 0
	if nResult == 0 then
		nResult = x430609_IsRewardItemIsExchanged(varMap, varPlayer)
		if nResult == 1 then
			msginfo = "您尚有未兑换的赛马大竞猜奖励，请将背包中的赛马大竞猜奖励大礼包进行兑换兑换"
			IsCanGaming = 0
		end
	else
		msginfo = "您尚有未领取的赛马大竞猜奖励，请领取上次赛马大竞猜奖励后在参加本次的赛马大竞猜活动"
		IsCanGaming = 0
	end
	
	return IsCanGaming,msginfo
end

-----------------------------------投注处理--------------------------------------------------
-- 赛马大竞猜请求 （varHorseGamingType：投注类型 1 - 3）
function x430609_ProcHorseGamingRequest(varMap, varPlayer, varHorseGamingType, varHorseGamingIsFreeType, varGamingNum, varParam1, varParam2, varParam3) 
	--print("x430609_ProcHorseGamingRequest" ..  varHorseGamingType .. "|" .. varHorseGamingIsFreeType .. "|" .. varGamingNum .. "|" .. varParam1 .. "|" .. varParam2 .. "|" .. varParam3)

	-- 判断当前是否可以赛马
	local IsCanGaming,msginfo = x430609_CheckCanHorseGaming(varMap, varPlayer)
	local varPlayerName = GetName(varMap,varPlayer)
	if IsCanGaming == 0 then
		LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,3,1)
		return
	end
	
	-- 投注类型是否合法
	if varHorseGamingType < 1 or varHorseGamingType > 3 then
		return
	end
	
	-- 计算当前可用的免费注数和可以购买的免费注数
	local UsedPoint = 0
	local FreePoint = 0
	local UsedBuyPoint = 0
	local LastCanBuyPoint = x430609_var_HorseGaming_BuyPoint
	local LastCanUseFreePoint = x430609_var_HorseGaming_FreePoint
	
	for idx = 1, getn(x430609_var_HorseGaming_MD) do
		local tab = x430609_var_HorseGaming_MD[idx]
		local num = GetPlayerGameData(varMap, varPlayer, tab[1][1], tab[1][2], tab[1][3])
		UsedPoint = UsedPoint + num
	end
	
	local FreePointTab = x430609_var_HorseGaming_MD.UsedFreePoint
	FreePoint = GetPlayerGameData(varMap, varPlayer, FreePointTab[1], FreePointTab[2], FreePointTab[3])
	LastCanUseFreePoint = LastCanUseFreePoint - FreePoint
	
	UsedBuyPoint = UsedPoint - FreePoint
	LastCanBuyPoint = LastCanBuyPoint - UsedBuyPoint
	
	-- 判断是否还可以投注
	if varHorseGamingIsFreeType == 1 then
		if varGamingNum > LastCanUseFreePoint then
			IsCanGaming = 0
			msginfo = "您今天的免费注已经使用完了"
		end
	else
		if varGamingNum > LastCanBuyPoint then
			IsCanGaming = 0
			msginfo = "您今天购买的注数已经达到了上限 每天购买投注上限为" .. x430609_var_HorseGaming_BuyPoint .. "注"
		end
	end
	
	if IsCanGaming == 0 then
		LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,3,1)
		return
	end
	
	-- 判断金钱
	local needmoney = 0
	if varHorseGamingIsFreeType == 0 then
		needmoney = varGamingNum * x430609_var_HorseGmaing_UnitMoney
		if (IsMoneyEnoughEx( varMap, varPlayer, 3, needmoney ) == 0 and IsMoneyEnoughEx( varMap, varPlayer, 2, needmoney ) == 0 )then
			IsCanGaming = 0
			msginfo = "金钱不足"
		end
	end
	
	if IsCanGaming == 0 then
		LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,2,1)
		LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,3,1)
		return
	end
	
	-- 减钱
	if needmoney > 0 then
		--SpendMoneyEx( varMap, varPlayer, x430609_var_HorseGaming_Money_Type, needmoney, eCurrencyAct_HorseGamingCost )
		
		if GetGoldMode( varMap, varPlayer) == 1 then
            if GetMoney(varMap, varPlayer, 2) < needmoney then
				SpendMoneyEx(varMap, varPlayer, 3, needmoney, eCurrencyAct_HorseGamingCost)
			else
				SpendMoneyEx(varMap, varPlayer, 2, needmoney, eCurrencyAct_HorseGamingCost)
            end
        else
            if GetMoney(varMap, varPlayer, 3) < needmoney then
				SpendMoneyEx(varMap, varPlayer, 2, needmoney, eCurrencyAct_HorseGamingCost)
			else
				SpendMoneyEx(varMap, varPlayer, 3, needmoney, eCurrencyAct_HorseGamingCost)
            end
        end
	end
	
	-- 设置投注数据
	if varHorseGamingIsFreeType == 1 then
		FreePoint = FreePoint + varGamingNum
		SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.UsedFreePoint[1], x430609_var_HorseGaming_MD.UsedFreePoint[2], x430609_var_HorseGaming_MD.UsedFreePoint[3], FreePoint)
	end
	
	local tabcountry = {}
	tabcountry[1] = varParam1
	tabcountry[2] = varParam2
	tabcountry[3] = varParam3
	
	local SelGamingTypeMDTab = x430609_var_HorseGaming_MD[varHorseGamingType]
	
	local curPoint = GetPlayerGameData(varMap, varPlayer, SelGamingTypeMDTab[1][1], SelGamingTypeMDTab[1][2], SelGamingTypeMDTab[1][3])
	curPoint = curPoint + varGamingNum
	SetPlayerGameData(varMap, varPlayer, SelGamingTypeMDTab[1][1], SelGamingTypeMDTab[1][2], SelGamingTypeMDTab[1][3], curPoint)
	
	for idx = 2, getn(SelGamingTypeMDTab) do
		SetPlayerGameData(varMap, varPlayer, SelGamingTypeMDTab[idx][1], SelGamingTypeMDTab[idx][2], SelGamingTypeMDTab[idx][3], tabcountry[idx - 1])
	end
	
	local liTmp = 0
	if (varHorseGamingIsFreeType ~= 1) then
		x430609_AddRewardPoolRecorder(varMap, varGamingNum)
		liTmp = varGamingNum
	end
	
	-- 发送赛马大竞猜数据的更新
	x430609_SendPlayerHorseGamingData(varMap, varPlayer, liTmp)
	GamePlayScriptLog( varMap, varPlayer, 995)
	msginfo = "赛马大竞猜投注完成"
	LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,2,1)
	--LuaScenceM2Player(varMap,varPlayer,msginfo,varPlayerName,3,1)
end
-----------------------------------领奖处理--------------------------------------------------
-- 领奖处理
function x430609_ProcHorseGamingRequestReward(varMap, varPlayer)
	local nRet,strMsg,IsOverData = x430609_IsCanGetReward(varMap, varPlayer)
	if nRet == 1 then
		if IsOverData == 0 then
			-- 没有过期了
			x430609_ProcGetCurDayReward(varMap, varPlayer)
		else
			-- 过期了
			x430609_ProcGetOverdueReward(varMap, varPlayer)
		end
		
		x430609_SendPlayerHorseGamingData(varMap, varPlayer)
	else
		Msg2Player(varMap, varPlayer, strMsg, 0, 3)
	end

end

-- 领取没有过期的奖励
function x430609_ProcGetCurDayReward(varMap, varPlayer)
	--print("领取没有过期的奖励")
	local CountryTab = {}
	local nWorldId = GetWorldIdEx()
	for idx = 0, 3 do
		local snid, key, country, name, guidname, snguid  = GetToplistInfo(nWorldId, SAIMA_TOP_LIST, idx)
		CountryTab[idx + 1] = country
	end
	
	-- tst b
	CountryTab[1] = 0
	CountryTab[2] = 0
	CountryTab[3] = 2
	-- tst e
	
	local ResultTab = {}
	for idx = 1, getn(x430609_var_HorseGaming_MD) do
		
		ResultTab[idx] = {}
		ResultTab[idx].type = idx 	-- 投注类型
		ResultTab[idx].Num = 0		-- 投注数量
		ResultTab[idx].IsRight = 1	-- 选对标志
	
		local tab = x430609_var_HorseGaming_MD[idx]
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
				if value ~= CountryTab[idx] then
					ResultTab[idx].IsRight = 0
					--print("wrong"..idx.." "..value.."|"..CountryTab[idx - 1])
					break
				end
			end
		end
	end

	local nMDValue = 0
	for idx = 1, getn(x430609_var_HorseGaming_MD) do
		if ResultTab[idx].Num > 0 and ResultTab[idx].IsRight == 1 then
			if (ResultTab[idx].type == 1) then
				--print("=1 -".. nMDValue .."|"..ResultTab[idx].Num)
				nMDValue = nMDValue + ResultTab[idx].Num 
			elseif (ResultTab[idx].type == 2) then
				--print("=2 -".. nMDValue .."|"..ResultTab[idx].Num)
				nMDValue = nMDValue + ResultTab[idx].Num * 5
			elseif (ResultTab[idx].type == 3) then
				--print("=3 -".. nMDValue .."|"..ResultTab[idx].Num)
				nMDValue = nMDValue + ResultTab[idx].Num * 10
			end
		end
	end
	--print(nMDValue)
	if (nMDValue > 0) then
		--print("nMDValue > 0 "..nMDValue)
		x430609_AddRewardItemValue(varMap, nMDValue)
		--这个标记暂时先不用
		--SetPlayerGameData(varMap, varPlayer, x430609_var_HorseGaming_MD.RewardFlag[1], x430609_var_HorseGaming_MD.RewardFlag[2], x430609_var_HorseGaming_MD.RewardFlag[3], 1)
	end
	
	------------------------------------------------------------------------
	-- 根据表 ResultTab 设置玩家奖励
	
	------------------------------------------------------------------------
	
	-- 领取后处理
	x430609_ResetHorseGamingData(varMap,varPlayer)
end

-- 领取过期的奖励
function x430609_ProcGetOverdueReward(varMap, varPlayer)
	--print("领取过期的奖励")
	-- 获取投注数量 return 免费注数，总注数（免费+花钱的）
		local freepoint,allpoint = x430609_ProcGetAllPoint(varMap, varPlayer)
		--print(allpoint)
	------------------------------------------------------------------------
	-- 这里设置奖励
	
	------------------------------------------------------------------------
	-- 领取后处理
	x430609_ResetHorseGamingData(varMap,varPlayer)
end
