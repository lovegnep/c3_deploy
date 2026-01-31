

x930123_var_FileId = 930123
x930123_var_QuestName = "#R【坐骑】外形变换"
x930123_var_ModelList = {
	--低等级变异坐骑
	{probability = 10000, items = {349,350,352,363,347,383,346,385,348,351,341,355,380,381,353,384,364,365,358,359,356,357,366,367,376,377,368,369,354,382,392,546,392,546,465,360,202,231,245,329,340,374,375,378,379,370,371,362,361,372,373,462,467,320,321,234,343,342,321,344,440,454,459,460,461,409,411,386,387,390,391,407,408,413,414,412,410,416,415,417,342,425,419,422,418,420,424,423,421,426,439,437,438,433,434,374,375,378,379,370,371,362,361,441,442,443,433,434,219,463,464,466,468,469,470,471,472,473,474,475,234,477,218,484,483,488,489,485,486,490,491,349,350,352,363,347,383,493,492,494,216,495,462,500,496,522,498,524,525,499,523,497,528,491,452,531,393,530,529,539,537,542,500,547,541,543,550,535,533,534,536,551,553,552,549,548,544,538,561,487,562,540,564,565,545,533,567,568,570,569,13,14,17,16,15,18,25,26,27,28,29,30,7,8,11,10,9,12,235,236,248,247,237,249,19,20,23,22,21,24,250,251,254,253,252,255,256,257,260,259,258,261,262,263,266,265,264,267,394,395,398,397,396,399,400,401,404,403,402,405,350,363,383,385,351,355,381,384,365,359,357,367,377,369,382,360,202,231,245,340,375,379,371,361,373,462,467,321,234,343,342,321,344,440,454,459,460,461,411,387,391,408,414,412,410,416,415,417,342,425,419,422,418,420,424,423,421,426,439,438,434,375,379,371,361,441,442,443,434,219,464,466,468,469,470,471,472,473,474,475,234,477,218,483,488,489,485,486,491,350,363,383,493,492,494,216,495,462,500,496,522,498,524,525,499,523,497,528,491,452,531,393,530,529,539,537,542,500,547,541,543,550,535,533,534,536,551,553,552,549,548,544,538,563,487,562,540,564,565,545,533,567,568,570,569,13,14,17,16,15,18,25,26,27,28,29,30,7,8,11,10,9,12,235,236,248,247,237,249,19,20,23,22,21,24,250,251,254,253,252,255,256,257,260,259,258,261,262,263,266,265,264,267,394,395,398,397,396,399,400,401,404,403,402,405,350,363,383,385,351,355,381,384,365,359,357,367,377,369,382,360,202,231,245,340,375,379,371,361,373,462,467,321,234,343,342,321,344,440,454,459,460,461,411,387,391,408,414,412,410,416,415,417,342,425,419,422,418,420,424,423,421,426,439,438,434,375,379,371,361,441,442,443,434,219,464,466,468,469,470,471,472,473,474,475,234,477,218,483,488,489,485,486,491,350,363,383,493,492,494,216,495,462,500,496,522,498,524,525,499,523,497,528,491,452,531,393,530,529,539,537,542,500,547,541,543,550,535,533,534,536,551,553,552,549,548,544,538,487,562,540,564,565,545,533,567,568,570,569,480,576,577,575,578,579,580,581}},}
if x930123_var_CountList == nil then x930123_var_CountList = {} end
x930123_var_MaxCount = 500
--x930123_var_CurHour = -1

--x930123_var_ModelListCount = 21 + 72 + 3

function x930123_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton( varMap, x930123_var_FileId, x930123_var_QuestName, 3, 1)
end

function x930123_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
	StartTalkTask( varMap)
	TalkAppendString( varMap, x930123_var_QuestName..format("\n\t您在我这随机更换第一只坐骑的外形，\n每小时有%d次机会。但要支付给我#B50两现金#R哦.\n\t#B提示：骑乘变形只变第一只坐骑，如果提示变形失败，请把所有坐骑放在仓库再取出来即可，祝您玩得愉快！", x930123_var_MaxCount) )
	StopTalkTask()
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930123_var_FileId, -1)
end

function x930123_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	return 1
end

function x930123_RandomSelect()
	--	if 1==1 then return 551 end
	local Min = 1
	local Max = 1
	local probability = random(1,10000)
	for varI,iter in x930123_var_ModelList do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
			return iter.items[random(1, getn(iter.items))]
		end
	end
	return -1
end

function x930123_GetRestCount(varMap, varPlayer)
	local guid = GetGUID(varMap, varPlayer)
	local hour, min, second = GetHourMinSec()
	if hour ~= x930123_var_CurHour then
		x930123_var_CountList = {}
		x930123_var_CurHour = hour
	end

	local count = x930123_var_CountList[guid]
	if count == nil then
		count = x930123_var_MaxCount
	end
	x930123_var_CountList[guid] = count - 1
	return count - 1
end

function x930123_ProcAccept( varMap, varPlayer)
	local horsecount = GetHorseCount(varMap, varPlayer)
	if horsecount > 0 then
		local newid = x930123_RandomSelect()
		local restcount = x930123_GetRestCount(varMap, varPlayer)
		if restcount < 0 then
			Msg2Player(varMap,varPlayer,"这一小时的变形次数用完了，请下一小时再来",8,2);
			return
		end
		local money = GetMoney(varMap, varPlayer,2)
		if money<50000 then
			Msg2Player(varMap,varPlayer,"很抱歉，您包裹中的现金不够支付变形费用!",8,2);
			return
		end
		Msg2Player(varMap,varPlayer,format("您要变换的id是%d",newid),8,2);
		Msg2Player(varMap,varPlayer,format("您要变换的id是%d",newid),8,3);
		if newid ~= -1 then
			local ret = SetHorseModelID(varMap, varPlayer, 0, newid)
			if ret == newid then
				local cost = CostMoney( varMap , varPlayer ,2, 50000,301 )
				Msg2Player(varMap,varPlayer,"变换坐骑成功，请下马后重新召唤!",8,2);
				Msg2Player(varMap,varPlayer,"您还有"..restcount.."次机会!",8,2);
			else
				Msg2Player(varMap,varPlayer,"运气不好，变换坐骑失败!",8,2);
			end
		else
			Msg2Player(varMap,varPlayer,"运气不好，变换坐骑失败，请重新尝试!",8,2);
		end
	else
		Msg2Player(varMap,varPlayer,"你还没有坐骑!",8,2);
	end
end

