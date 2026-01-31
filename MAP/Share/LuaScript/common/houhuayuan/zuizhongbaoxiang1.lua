--DECLARE_QUEST_INFO_START--
x920012_var_FileId 				= 920012
x920012_var_MissionName			= "【大逃杀】领取终极大奖"
x920012_var_MissionText			= "\t能够幸运的找到我的家伙，会得到稀有的奖励！\t点击确定后你将会获得#R高额奖励#W,并被#R传送出后花园#W，你确定要现在领取吗？"
x920012_var_LeaveScenceDrop		=  { idx = 1, Mapid = 15, varX = 100, z=100 }

x920012_var_GetExp = {25000, 50000, 75000, 100000}
--DECLARE_QUEST_INFO_STOP--
function x920012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

end


function x920012_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest)
	if IsHaveSpecificImpact( varMap, varPlayer, 7538) == 1 then
			Msg2Player(varMap, varPlayer, "变身状态无法领取终极大奖",8, 2)
			Msg2Player(varMap, varPlayer, "变身状态无法领取终极大奖",8, 3)
			return 0
	end
	StartTalkTask(varMap)
	TalkAppendString(varMap,x920012_var_MissionName)
	TalkAppendString(varMap,x920012_var_MissionText)		
	StopTalkTask()	
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x920012_var_FileId, -1)
end


function x920012_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local teamid = GetTeamId(varMap, varPlayer)
	local mapid, posX, posZ = x920012_GetScencePosition(varMap, varPlayer, npos)
	local Level = GetLevel(varMap, varPlayer)
	local n = x920012_AddExpParameterToPlayer(varMap, varPlayer)
	local nExp = Level * x920012_var_GetExp[n]
	local minOfDay = GetMinOfDay()
	if minOfDay > 900 then 
		Msg2Player(varMap, varPlayer, "大逃杀活动已结束！",8, 2)
		return
	end
	if varMap == 44 then
		if teamid == -1 then		
			DeleteMonster(varMap, varTalknpc)
			AddExp(varMap, varPlayer, nExp)
			Msg2Player(varMap, varPlayer, format("获得经验值为#R%d",nExp),8, 2)
			WriteLog(1, format("x920012_ProcAcceptCheck: varMap = %d, PlayerGUID = %u, AddExp = %d", varMap, GetGUID(varMap, varPlayer),nExp))
			NewWorld(varMap, varPlayer, mapid, posX, posZ, x920012_var_FileId)			
		else
			x920012_CheckMemberCondition(varMap, varPlayer, varTalknpc)
		end
	end
end


function x920012_GetScencePosition(varMap, varPlayer, npos)
	local mapid = x920012_var_LeaveScenceDrop.Mapid
	local x1 = x920012_var_LeaveScenceDrop.varX
	local z1 = x920012_var_LeaveScenceDrop.z
	return mapid, x1, z1
	
end


function x920012_CheckMemberCondition(varMap, varPlayer, varTalknpc)
	local teamnum = GetNearTeamCount(varMap, varPlayer)
	local mapid, posX, posZ = x920012_GetScencePosition(varMap, varPlayer, npos)
	local Level = GetLevel(varMap, varPlayer)
	local n = x920012_AddExpParameterToPlayer(varMap, varPlayer)
	local nExp = Level * x920012_var_GetExp[n]	
	
	DeleteMonster(varMap, varTalknpc)
	for varI = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(varMap, varPlayer, varI)
        if GetHp(varMap, memberId) > 0 then	
			AddExp(varMap, memberId, nExp)
			Msg2Player(varMap, memberId,format("获得经验值为#R%d",nExp),8, 2)	
			WriteLog(1, format("x920012_CheckMemberCondition: varMap = %d, PlayerGUID = %u, AddExp = %d", varMap, GetGUID(varMap, memberId),nExp))
		end
	end	
	
	for varI = 0, teamnum - 1 do
		local memberId = GetNearTeamMember(varMap, varPlayer, varI)
		if GetHp(varMap, memberId) > 0 then	
		NewWorld(varMap, memberId, mapid, posX, posZ, x920012_var_FileId)
	end		
end
end

function x920012_AddExpParameterToPlayer(varMap, varPlayer)
	local Level = GetLevel(varMap, varPlayer)
	if Level > 1 and Level <= 70 then
		return 1
	elseif Level > 70 and Level <= 80 then
		return 2
	elseif Level > 80 and Level <= 90 then
		return 3
	else
		return 4	
	end			
end
