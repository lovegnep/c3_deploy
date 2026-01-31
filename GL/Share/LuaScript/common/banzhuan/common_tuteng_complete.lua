
x311102_var_FileId = 311102
x311102_var_QuestName = "【国家】争夺龙魂"
x311102_var_QuestId = {10304,10329,10330,10331}
x311102_var_GameOpenId = 1088

x311102_var_BrickColor = {
[1] = {varBrick = 7062, varExp = 5000, inh = 5},	--绿砖
[2] = {varBrick = 7064, varExp = 8000, inh = 6},	--黄砖
[3] = {varBrick	= 7063, varExp = 12000, inh = 8},	--红砖
[4] = {varBrick = 7065, varExp = 15000, inh = 10},	--紫砖
}

function x311102_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if x311102_var_GameOpenId > 0 and GetGameOpenById( x311102_var_GameOpenId ) <= 0 then
      return
  end
--LuaCallNoclosure(311101, "ProcEnumEvent", varMap, varPlayer) --test创建古道采集点
	if IsHaveQuestNM(varMap, varPlayer, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1]) == 1 then
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
		TalkAppendButton(varMap, x311102_var_FileId, x311102_var_QuestName, state, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
	end
end

function x311102_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varQuest)
	local nBrick = x311102_GetBrick(varMap, varPlayer, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
	if nBrick > 0 then
		local localexp = GetLevel(varMap, varPlayer) * x311102_var_BrickColor[nBrick].varExp
		local localinh = GetLevel(varMap, varPlayer) *x311102_var_BrickColor[nBrick].inh
		local refixInh = RefixInherenceExp( varMap, varPlayer, localinh)

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】争夺龙魂")
		TalkAppendString(varMap,"   很好！我们国家的龙魂又多了一份。")
		TalkAppendString(varMap," ")
		TalkAppendString(varMap,"#Y任务奖励：")
		TalkAppendString(varMap,"  经验值："..localexp.."点")
			if GetLevel(varMap, varPlayer) >= 80 then
				TalkAppendString(varMap,"  天赋值："..refixInh.."点")
			end
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x311102_var_FileId, -1)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】争夺龙魂")
		TalkAppendString(varMap,"   你带回的龙魂呢？")
		StopTalkTask()
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x311102_var_FileId, varQuest, 1)
	end
end

function x311102_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if x311102_var_GameOpenId > 0 and GetGameOpenById( x311102_var_GameOpenId ) <= 0 then
      return
  end
	if x311102_CheckDistanceFromNpc(varMap, varPlayer, varTalknpc) <=0 then
		return 0
	end
	return 1
end


function x311102_ProcAccept(varMap, varPlayer)
	local nBrick = x311102_GetBrick(varMap, varPlayer, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])

	if nBrick <=0 then
		WriteLog(1, "x311102_ProcQuestSubmit get brick error")
		return 0
	end

	-- 增加搬砖次数
	x311102_IncCurDateCount(varMap, varPlayer, MD_CURRENT_BANZHUAN_DATE, MD_CURRENT_BANZHUAN_DAYCOUNT)

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
	local EnemyCountry = GetQuestParam(varMap, varPlayer, varQuestIdx, 0)
	
	if GetCountryParam(varMap, EnemyCountry, CD_CURDATE_BANZHUAN_NUM) > 100 then
		local SelfCountry = GetCurCountry(varMap, varPlayer)

		-- 增加本国砖数目
		SetCountryQuestData(varMap, SelfCountry, CD_CURDATE_BANZHUAN_NUM, 1, 1)
		-- 减少敌国砖数目
		SetCountryQuestData(varMap, EnemyCountry, CD_CURDATE_BANZHUAN_NUM, -1, 1)
	end

	x311102_DiliverStrInfo(varMap, varPlayer, "您完成了任务:【国家】争夺龙魂")
	Msg2Player(varMap,varPlayer,"您完成了任务:【国家】争夺龙魂",8,2)

	x311102_DiliverStrInfo(varMap, varPlayer, "恭喜，您为国家夺回了龙魂")
	Msg2Player(varMap,varPlayer,"恭喜，您为国家夺回了龙魂",8,2)

	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = varLevel *  x311102_var_BrickColor[nBrick].varExp
	local varinh =  varLevel *  x311102_var_BrickColor[nBrick].inh

	--增加经验与天赋
  if varExpBonus > 0 then
		AddExp(varMap, varPlayer, varExpBonus)
		x311102_DiliverStrInfo(varMap, varPlayer, "#o获得#R经验"..varExpBonus.."点#o的奖励")
		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
			if varLevel >= 80 then
				local refixInh = AddInherenceExp( varMap, varPlayer, varinh)
				Msg2Player(varMap,varPlayer,"#o获得#R天赋值"..refixInh.."点#o的奖励",4,2)
				Msg2Player(varMap,varPlayer,"#o获得#R天赋值"..refixInh.."点#o的奖励",4,3)
			end
	end

	-- 删除任务，取消buff
	DelQuestNM( varMap, varPlayer, x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
	CancelSpecificImpact(varMap, varPlayer, x311102_var_BrickColor[nBrick].varBrick)
	GamePlayScriptLog(varMap, varPlayer, 2522)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,14)
	return 1
end

function x311102_GetBrick(varMap, varPlayer, varQuest)
	if varQuest ~= x311102_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return 0
	end

	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)
		local iRet = GetQuestParam(varMap, varPlayer, varQuestIdx, 0)

		if iRet>=0 then
			for i, item in x311102_var_BrickColor do
				if IsHaveSpecificImpact(varMap, varPlayer, item.varBrick) > 0 then
					return i
				end
			end
		end
	end

	return 0
end

function x311102_CheckDistanceFromNpc(varMap, varPlayer, varNpcId)	
	local longGuid = GetPlayerGUID(varMap, varPlayer)
	local msgTip = "x311102_CheckDistanceFromNpc:".."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"

	if 0 == IsInDist(varMap, varPlayer, varNpcId, 5) then
		WriteLog(1, msgTip)
		return 0
	end

	return 1
end

function x311102_GetMD(varMap, varPlayer, varMDIndex)
	local varValue = GetPlayerGameData(varMap, varPlayer,  varMDIndex[1], varMDIndex[2], varMDIndex[3])
	return varValue
end

function x311102_SetMD(varMap, varPlayer, varMDIndex, varValue)
	SetPlayerGameData(varMap, varPlayer, varMDIndex[1], varMDIndex[2], varMDIndex[3], varValue)
end


function x311102_GetCurDateCount(varMap, varPlayer, nMDDayIndex, nMDCountIndex)
	local varToday = GetDayOfYear()
	local varLastday = x311102_GetMD(varMap, varPlayer, nMDDayIndex)

	if varToday ~= varLastday then
		return 0
	end

	local varDaycount = x311102_GetMD(varMap, varPlayer, nMDCountIndex)

	return varDaycount
end


function x311102_IncCurDateCount(varMap, varPlayer, nMDDayIndex, nMDCountIndex)
	local varToday = GetDayOfYear()
	local varLastday = x311102_GetMD(varMap, varPlayer, nMDDayIndex)

	if varToday ~= varLastday then
		x311102_SetMD(varMap, varPlayer, nMDDayIndex, varToday)
		x311102_SetMD(varMap, varPlayer, nMDCountIndex, 1)
		return
	end

	local varDaycount = x311102_GetCurDateCount(varMap, varPlayer, nMDDayIndex, nMDCountIndex) + 1
	x311102_SetMD(varMap, varPlayer, nMDCountIndex, varDaycount)
end

function x311102_DiliverStrInfo(varMap, varPlayer, varStr)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varStr)
	StopTalkTask()
	DeliverTalkTips(varMap, varPlayer)
end

