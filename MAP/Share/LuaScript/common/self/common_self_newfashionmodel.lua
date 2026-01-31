

x930124_var_FileId = 930124
x930124_var_QuestName = "#R【时装】外形变换"
x930124_var_ModelList = {
	--旧时装
	{probability = 10000, items = {10306080,10306081,10306082,10306083,10306084,10306085,10306086,10306087,10306090,10306091,10306092,10306093,10306094,10306095,10306098,10306099,10306100,10306101,10306102,10306103,10306104,10306105,10306106,10306107,10306108,10306109,10306110,10306111,10306040,10306041,10306042,10306043,10306044,10306045,10306046,10306047,10306048,10306049,10306050,10306051,10306052,10306053,10306054,10306055,10306056,10306057,10306058,10306059,10306060,10306061,10306062,10306063,10306064,10306065,10306066,10306067,10306068,10306069,10306070,10306071,10306072,10306073,10306074,10306075,10306076,10306015,10306016,10306017,10306018,10306019,10306020,10306021,10306022,10306023,10306024,10306025,10306026,10306027,10306028,10306029,10306030,10306031,10306032,10306033,10306034,10306035,10306036,10306037,10306038,10306039,10300142,10300143,10300144,10300145,10300146,10300147,10300148,10300149,10300150,10300151,10300152,10300153,10300154,10300155,10300116,10300117,10300118,10300119,10300120,10300121,10300122,10300123,10300124,10300125,10300126,10300127,10300128,10300129,10300130,10300131,10300132,10300133,10300134,10300135,10300136,10300137,10300138,10300139,10300140,10300141}},
	--新时装
	--最新时装
	--{probability = 3000, items = {10306109,10306110,10306111,10306112,10306113,10306114,10306115,10306118,10306134,10306136,10306137,10306138,10306139,10306140,10306141,10306143}},
}
x930124_var_huangdiList = {10300157,10300162,10300163,10300164,10300165,10300166,10300167,10300162}
if x930124_var_CountList == nil then x930124_var_CountList = {} end
x930124_var_MaxCount = 500
--x930124_var_CurHour = -1

function x930124_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton( varMap, x930124_var_FileId, x930124_var_QuestName, 3, 1)
end

function x930124_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
	StartTalkTask( varMap)
	TalkAppendString( varMap, x930124_var_QuestName..format("\n\t您在我这随机更换时装的外形，\n每小时有%d次机会。但要支付给我#B50两现金#R哦.", x930124_var_MaxCount) )
	StopTalkTask()
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930124_var_FileId, -1)
end

function x930124_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	return 1
end

function x930124_RandomSelect()
	--	if 1==1 then return 551 end
	local Min = 1
	local Max = 1
	local probability = random(1,10000)
	for varI,iter in x930124_var_ModelList do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
			return iter.items[random(1, getn(iter.items))]
		end
	end
	return -1
end

function x930124_GetRestCount(varMap, varPlayer)
	local guid = GetGUID(varMap, varPlayer)
	local hour, min, second = GetHourMinSec()
	if hour ~= x930124_var_CurHour then
		x930124_var_CountList = {}
		x930124_var_CurHour = hour
	end

	local count = x930124_var_CountList[guid]
	if count == nil then
		count = x930124_var_MaxCount
	end
	x930124_var_CountList[guid] = count - 1
	return count - 1
end

function x930124_ProcAccept( varMap, varPlayer)
	local curID = GetItemIDByIndexInBody(varMap, varPlayer, 14)
	if curID == -1 then
		Msg2Player(varMap,varPlayer,"您没有穿戴时装!",8,2);
		return
	end
	if curID == 10300100 then
		Msg2Player(varMap,varPlayer,"很抱歉，王者时装不能变形!",8,2);
		return
	end

	for varI,s in x930124_var_huangdiList do
		if curID == x930124_var_huangdiList[varI] then
			Msg2Player(varMap,varPlayer,"很抱歉，皇帝时装不能变形!",8,2);
			return
		end
	end

	local restcount = x930124_GetRestCount(varMap, varPlayer)
	if restcount < 0 then
		Msg2Player(varMap,varPlayer,"这一小时的变形次数用完了，请下一小时再来",8,2);
		return
	end
	local money = GetMoney(varMap, varPlayer,2)
	if money<50000 then
		Msg2Player(varMap,varPlayer,"很抱歉，您包裹中的现金不够支付变形费用!",8,2);
		return
	end
	local cost = CostMoney( varMap , varPlayer ,2, 50000,301 )
	if cost == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您包裹中的现金不够支付变形费用!");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "很抱歉，您包裹中的现金不够支付变形费用！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	else
		local newid = x930124_RandomSelect()
		Msg2Player(varMap,varPlayer,format("您要变换的id是%d",newid),8,2)
		Msg2Player(varMap,varPlayer,format("您要变换的id是%d",newid),8,3)
		--newid = curID + 1
		if newid ~= -1 then
			local ret = SetItemIDByIndexInBody(varMap, varPlayer, 14, newid)
			if ret == newid then
				Msg2Player(varMap,varPlayer,"时装变换成功，请脱下并重新穿上时装!",8,2);
				Msg2Player(varMap,varPlayer,"您还有"..restcount.."次机会!",8,2);
			else
				Msg2Player(varMap,varPlayer,"运气不好，时装变换失败!",8,2);
			end
		else
			Msg2Player(varMap,varPlayer,"运气不好，时装变换失败，请重新尝试!",8,2);
		end
	end
end

