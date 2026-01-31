
x300358_var_FileId 					= 300358
x300358_var_QuestName				= "【查询收徒剩余时间】"

function x300358_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap,x300358_var_FileId,x300358_var_QuestName,3,0)
end

function x300358_ProcEventEntry(varMap, varPlayer, varTalknpc)
	if GetLevel(varMap, varPlayer) >= 50 then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x300358_ShituQuery(varMap, varPlayer))
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300358_var_FileId, -1)
	else
		Msg2Player(varMap, varPlayer, "50级以上的玩家才可以收徒弟。", 8, 3)
	end
end

function x300358_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x300358_ProcAccept(varMap, varPlayer, varTalknpc)
	return 1
end

function x300358_ShituQuery(varMap, varPlayer)
	if IsPrenticeFull(varMap, varPlayer) == 1 then
		return "\t您徒弟数量已满，升级师傅称号能收取更多的徒弟，每位师傅最多能收取5位徒弟。"
	end
	
	
	local iTime = GetPrenticeBetrayTime(varMap, varPlayer)
	if iTime > 0 and iTime < MASTER_PRENTICE_TIME_LIMIT*3600 then
		return format("\t距离您下一次收徒弟还需要%d小时%d分。", x300358_Time(iTime))
	end
	
	return "\t您现在就可以收取下一位徒弟了，您可以通过查找徒弟模块找寻徒弟。"
end

function x300358_Time(iTime)
	iTime = iTime/60
	local h = iTime/60
	local m = mod(iTime, 60)
	if m >= 1 then
		h = h+1
	end
	if m < 1 then
		m = 60
	end
	return MASTER_PRENTICE_TIME_LIMIT-floor(h), 60-floor(m)
end
