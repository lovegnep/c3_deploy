

x930124_var_FileId = 930124
x930124_var_QuestName = "#G【时装】外形变换"
x930124_var_ModelList = {
--旧时装
{probability = 10000, items = {10300000,10300001,10300010,10300011,10300100,10300101,10300102,10300103,10300104,10300105,10300106,10300107,10300108,10300109,10300110,10300111,10300112,10300113,10300114,10300115,10300116,10300117,10300118,10300119,10300120,10300121,10300122,10300123,10300124,10300125,10300126,10300127,10300128,10300129,10300130,10300131,10300132,10300133,10300134,10300135,10300136,10300137,10300138,10300139,10300140,10300141,10300142,10300143,10300144,10300145,10300146,10300147,10300148,10300149,10300150,10300153,10300156,10300159,10300162,10300179,10300182,10300183,10300185,10300186,10300188,10300189,10300192,10300193,10300204,10300206,10300209,10300211,10300213,10300214,10300215}},
}
if x930124_var_CountList == nil then x930124_var_CountList = {} end
x930124_var_MaxCount = 50
--x930124_var_CurHour = -1

function x930124_OnEnumerate(varMap, varPlayer, varTalknpc, varQuest)
	AddQuestNumText( varMap, x930124_var_FileId, x930124_var_QuestName, 3, 1)
end

function x930124_OnDefaultEvent( varMap, varPlayer, varTalknpc, varScript, extid)	
	BeginQuestEvent( varMap)
	AddQuestText( varMap, x930124_var_QuestName..format("\n\t您在我这随机更换时装的外形，\n每小时有%d次机会。", x930124_var_MaxCount) )
	EndQuestEvent()
	DispatchQuestInfo( varMap, varPlayer, varTalknpc, x930124_var_FileId, -1)
end

function x930124_CheckAccept( varMap, varPlayer, varTalknpc)
    return 1
end

function x930124_RandomSelect()
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

function x930124_OnAccept( varMap, varPlayer)
	local curID = GetItemIDByIndexInBody(varMap, varPlayer, 14)
	if curID == -1 then
		Msg2Player(varMap,varPlayer,"您没有穿戴时装!",8,2);
		return
	end
	local restcount = x930124_GetRestCount(varMap, varPlayer)
	if restcount < 0 then
		Msg2Player(varMap,varPlayer,"这一小时的变形次数用完了，请下一小时再来",8,2);
		return
	end
	local newid = x930124_RandomSelect()
	
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

