--皇帝战相关处理NPC召集相关脚本
x310128_var_FileId		 											= 310128
x310128_var_HasKaiserScript									=	310122 --有皇帝的脚本
x310128_var_AssistantFileId									=	310123
x310126_var_MapID														= SCENE_BATTLE_KAISER	--皇帝战场景Id

x310128_var_PrintDebugLog										=	0 --debug输出
x310128_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310128_var_CallInButton										=	"【国家】召集国民" --召集的Button显示
x310128_var_KaiserCallInOfficailFail				=	"我只听从各国大将军的号令" --官阶判断提示
x310128_var_KaiserCallInFailNotice					=	"很遗憾,只有在皇帝攻守战开始后才能进行召集国民"
x310128_var_KaiserCallInDes									=	"\t每次皇帝攻守战期间，每个国家有2次免费召集的许可权，同时本周#G神圣罗马帝国#W、#G耶路撒冷#W、#G福冈#W领地的所属国可以分别额外获得1次免费召集许可权。皇帝攻守战期间，每个国家固定有3次消耗国家资源进行召集的许可权，每次消耗500石国家粮草。\n\t你们国家这周共可以招%d次,还可以召集%d次,本次召集#R免费#W，你现在就要召集吗？" --召集的描述
x310128_var_KaiserCallInDes1									=	"\t每次皇帝攻守战期间，每个国家有2次免费召集的许可权，同时本周#G神圣罗马帝国#W、#G耶路撒冷#W、#G福冈#W领地的所属国可以分别额外获得1次免费召集许可权。皇帝攻守战期间，每个国家固定有3次消耗国家资源进行召集的许可权，每次消耗500石国家粮草。\n\t你们国家这周共可以招%d次,还可以召集%d次,本次召集会消耗#R500石#W国家粮草，你现在就要召集吗？" --召集的描述
x310128_var_RequestCallInOfficail						=	6 --可以发动召集的官阶
x310128_var_StartMark												=	1	--开始标志
x310128_var_CallInWeekIndexBit							=	{0, 12} --召集周索引的位数
x310128_var_CallInCountIndexBit							=	{12, 5} --召集次数索引的位数
x310128_var_CallInTotalCountIndexBit				=	{17, 5} --召集总数索引的位数
x310128_var_CostResId												=	1	--消耗资源的Id
x310128_var_CostResNum											=	500	--消耗资源的数量

x310128_var_CallInFreeCount									=	2 --免费召集的次数
x310128_var_CallInCostCount									=	3	--花钱的次数
x310128_var_CallInQueryTopList							=	{31, 47, 49} --召集查询的排行榜Id

function x310128_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_ProcEnumEvent Debug --- varMap = %d, varPlayer = %d, varTalknpc = %d", 
					varMap, varPlayer, varTalknpc))
	end
	
	TalkAppendButton(varMap, x310128_var_FileId, x310128_var_CallInButton, 3, 1)
end

--获取皇帝国家
function x310128_GetKaiserCountry()
	return GetEmpireCountry()
end

function x310128_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_ProcEventEntry --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
	if (idExt ~= nil) then
		if (x310128_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310128_ProcEventEntry --- idExt = %d"
				,	idExt))
		end
	
		if (idExt == 1) then --召集
			local isBattleStarted = LuaCallNoclosure(x310128_var_HasKaiserScript, "IsBattleStarted", varMap)
			if (x310128_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310128_ProcEventEntry Debug --- isBattleStarted = %d", 
							isBattleStarted))
			end
			
			if (isBattleStarted ~= x310128_var_StartMark) then
				x310128_ProcNoticeToPlayer(varMap, varPlayer, x310128_var_KaiserCallInFailNotice)
				return	
			end
			
			-- TODO 判断玩家的身份
			if( CountryGetOfficial(varMap, varPlayer) ~= x310128_var_RequestCallInOfficail ) then
				x310128_ProcNoticeToPlayer(varMap, varPlayer, x310128_var_KaiserCallInOfficailFail)
				return
			end
			
			local countryId = GetCurCountry(varMap, varPlayer) --玩家国家Id
			if (countryId < 0 or countryId > 3) then
				WriteLog(1, format("x310128_ProcEventEntry ERROR!!! Error CountryId = %d", countryId))
				return
			end
			
			local countryCallInInfo = GetCountryParam(varMap, countryId, CD_KAISER_BATTLE_CALL_IN_INFO)
			if (countryCallInInfo == -1) then
				SetCountryParam(varMap, countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 0) --设置初始值
			end
			
			local totalCount, remainCount = x310128_ProcCallInCount(varMap, countryId)
			if (x310128_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310128_ProcEventEntry --- varMap = %d, countryId = %d, totalCount = %d, remainCount = %d"
						,	varMap, countryId, totalCount, remainCount))
			end
			
			if (remainCount <= 0) then
				x310128_NoticeToPlayer(varMap, varPlayer, varTalknpc, "本周已经召满,不能再使用召集")
				return
			end
			
			
			if remainCount > 3 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, format(x310128_var_KaiserCallInDes, totalCount, remainCount))
				StopTalkTask(varMap)
				DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310128_var_FileId, -1)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap, format(x310128_var_KaiserCallInDes1, totalCount, remainCount))
				StopTalkTask(varMap)
				DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310128_var_FileId, -1)
			end	
		end
	end
	
end

--通知玩家相关提示
function x310128_NoticeToPlayer(varMap, varPlayer, varTalknpc, varMsg)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varMsg)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end

--处理召集次数
function x310128_ProcCallInCount(varMap, countryId)
	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_ProcCallInCount --- varMap = %d, countryId = %d"
			,	varMap, countryId))
	end
	
	local curWeekIndex = GetWeekIndex() --当前周索引
	local callInWeek = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInWeekIndexBit[1], x310128_var_CallInWeekIndexBit[2])
	
	if (curWeekIndex ~= callInWeek) then
		SetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInWeekIndexBit[1], x310128_var_CallInWeekIndexBit[2], curWeekIndex) --设置当前周索引
		
		local countTotal = x310128_var_CallInFreeCount + x310128_var_CallInCostCount 
									+ x310128_GetExtCountByToplist(countryId)        --从新计算总次数		
		
		SetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInTotalCountIndexBit[1], x310128_var_CallInTotalCountIndexBit[2], countTotal)
				
		SetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInCountIndexBit[1], x310128_var_CallInCountIndexBit[2], countTotal)
	end
	
	local totalCount = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInTotalCountIndexBit[1], x310128_var_CallInTotalCountIndexBit[2])
				
	local remianCount = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInCountIndexBit[1], x310128_var_CallInCountIndexBit[2])
				
	return totalCount, remianCount
end

--通过排行榜来获取额外次数
function x310128_GetExtCountByToplist(varCountry)
	local extCount = 0
	local worldId = GetWorldIdEx()
	for i = 1, getn(x310128_var_CallInQueryTopList) do
		local snid, key, countryId = GetToplistInfo(worldId, x310128_var_CallInQueryTopList[i], 0)
		if (varCountry == countryId) then
			extCount = extCount + 1
		end
	end
	
	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_GetExtCountByToplist Debug --- varCountry = %d, extCount = %d",
				varCountry, extCount))
	end
	
	return extCount
end

--通知玩家相关提示
function x310128_ProcNoticeToPlayer(varMap, varPlayer, varMsg)
	Msg2Player(varMap, varPlayer, varMsg, 8, 3)
end

function x310128_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310128_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_ProcQuestAccept --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
end

function x310128_ProcAccept(varMap, varPlayer)
	local isBattleStarted = LuaCallNoclosure(x310128_var_HasKaiserScript, "IsBattleStarted", varMap)
	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_ProcAccept Debug --- isBattleStarted = %d", 
					isBattleStarted))
	end
	
	if (isBattleStarted ~= x310128_var_StartMark) then
		x310128_ProcNoticeToPlayer(varMap, varPlayer, x310128_var_KaiserCallInFailNotice)
		return	
	end
	
	-- TODO 判断玩家的身份
	if( CountryGetOfficial(varMap, varPlayer) ~= x310128_var_RequestCallInOfficail ) then
		x310128_ProcNoticeToPlayer(varMap, varPlayer, x310128_var_KaiserCallInOfficailFail)
		return
	end
	
	local countryId = GetCurCountry(varMap, varPlayer)
	local countryCallInInfo = GetCountryParam(varMap, countryId, CD_KAISER_BATTLE_CALL_IN_INFO)
	if (countryCallInInfo == -1) then
		SetCountryParam(varMap, countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 0) --设置初始值
	end
	
	local totalCount, remainCount = x310128_ProcCallInCount(varMap, countryId)
	if (remainCount <= 0) then
		return
	end
	
	local useCount = totalCount - remainCount --使用过的次数
	
	if (x310128_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310128_ProcAccept Debug --- useCount = %d", 
					useCount))
	end
	
	local countryId = GetCurCountry(varMap, varPlayer)
	if (remainCount <= x310128_var_CallInCostCount) then --开始花钱
		--去验证资源
		local count = GetCountryResource(varMap, varPlayer, x310128_var_CostResId)
		if (count < x310128_var_CostResNum) then
			x310128_ProcNoticeToPlayer(varMap, varPlayer, "你们国家资源不足,无法召集")
			return
		else
			SubCountryResourceWithRecall(varMap, countryId, x310128_var_CostResId
					, x310128_var_CostResNum, x310128_var_FileId, "ProcCostCallIn", x310128_var_AssistantFileId, varPlayer, posX, posZ)
		end
	else --不花钱的,包括排行榜和免费的
		local posX, posZ= GetWorldPos(varMap, varPlayer)
		TransferKaiserOrder(7, x310126_var_MapID, countryId, x310128_var_AssistantFileId, varPlayer, posX, posZ)
		x310128_ProcNoticeToPlayer(varMap, varPlayer, "已经向所有本国玩家发出召集")
		
		local remain = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInCountIndexBit[1], x310128_var_CallInCountIndexBit[2])
				
		SetCountryParamByBit(countryId, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInCountIndexBit[1], x310128_var_CallInCountIndexBit[2], remain - 1)
	end
end

--处理花费的召集
function x310128_ProcCostCallIn(varMap, varCountry, varIndex, varResult, x310128_var_AssistantFileId, varPlayer, posX, posZ)
	if (varResult == 0) then
		local count = GetCountryResource(varMap, varPlayer, x310128_var_CostResId)
		if (count < x310128_var_CostResNum) then
			x310128_ProcNoticeToPlayer(varMap, varPlayer, "你们国家资源不足,无法召集")
			return
		else
			local countryId = GetCurCountry(varMap, varPlayer)
			SubCountryResourceWithRecall(varMap, countryId, x310128_var_CostResId
					, x310128_var_CostResNum, x310128_var_FileId, "ProcCostCallIn")
		end
	elseif (varResult == 1) then --扣除成功
		local posX, posZ= GetWorldPos(varMap, varPlayer)
		TransferKaiserOrder(7, x310126_var_MapID, varCountry, x310128_var_AssistantFileId, varPlayer, posX, posZ)
		x310128_ProcNoticeToPlayer(varMap, varPlayer, "已经向所有本国玩家发出召集")
		
		local remain = GetCountryParamByBit(varCountry, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInCountIndexBit[1], x310128_var_CallInCountIndexBit[2])
		
		if (x310128_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310128_ProcCostCallIn Debug --- remain = %d", 
					remain))
		end
		SetCountryParamByBit(varCountry, CD_KAISER_BATTLE_CALL_IN_INFO, 
				x310128_var_CallInCountIndexBit[1], x310128_var_CallInCountIndexBit[2], remain - 1)
	end
end
function x310128_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end
