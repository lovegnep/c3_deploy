--皇帝战辅助脚本,包括任务和额外功能
x310123_var_FileId		 											= 310123
x310123_var_HasKaiserScript									=	310122 --有皇帝的脚本
x310123_var_KaiserMainScript								=	310120	--皇帝战主脚本
x310123_var_TransferCheckScript							=	800021	--传送检查的脚本Id

x310123_var_AvailabilityMap									=	SCENE_BATTLE_KAISER

x310123_var_PrintDebugLog										=	0 --debug输出
x310123_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310123_var_QuestId													=	9230
x310123_var_QuestLevelLimit  								=	60	--接任务的等级限制

x310123_var_CallInLevelLimit 								=	60

x310123_var_MissionStart										=	0	--标识任务是否开始
x310123_var_MissionNoticeMap								=	{50, 150, 250, 350} --任务状态需要通知到的场景

x310123_var_QuestDateIndex									=	3	--任务日期的索引
x310123_var_QuestKillNumIndex								=	4	--任务杀人的索引
x310123_var_QuestRoleIndex									=	5	--身份的索引
x310123_var_QuestFinishMark									=	7	--任务的完成标识

x310123_var_LastKaiserDay										=	{0, 15}	--上次获取皇帝的日期
x310123_var_QuestNpc												=	{123724,126021,129021,132021}	--提交皇帝战任务的NPC
x310123_var_QuestName												= "【国家】皇帝战" --任务名字
x310123_var_QuestDepict											=	"  前往沙城参与皇帝战" --任务描述
x310123_var_IsKaiser											= {0, 2}
x310123_var_LevelNotEnoughNotice						=	"等级不足60级，无法参与皇帝战" --等级不足的提示
x310123_var_KaiserQuestAccept								=	"\t皇帝战开始了，你要接受皇帝战任务吗？" --任务提示
x310123_var_OverdueHit											=	"任务已过期,请放弃本任务" -- 任务过期提示
x310123_var_AddKaiserQuestFail 							=	"参加【国家】皇帝战失败，无法添加相关任务！" --添加皇帝战任务失败的提示
x310123_var_JoinKaiserConfirm								=	"您参加了%s！" --接受任务的提示
x310123_var_QuitKaiserConfirm								=	"您退出了%s！" --退出任务的提示
x310123_var_GetAwardFailNotice								=	"只能等到皇帝战结束后才能领取奖励" --领取奖励失败的提示
x310123_var_JoinKaiserBattlePrompt					=	"【国家】参加皇帝战" --参加皇帝战的提示
x310123_var_GetKaiserAwardPrompt						=	"【国家】皇帝战奖励领取" --获取皇帝战的奖励

x310123_var_CountryTransferPlace						=	
{
	[1] = {437, 318},
	[2]	=	{238, 462},
	[3]	=	{113, 417},
	[4]	=	{409, 434},
}

x310123_var_KaiserTransferPlace							=	{255, 96}

--各国家的召集地点,动态记录
x310123_var_CountryCallInTable								=	{
	{ --楼兰的召集地点
		var_CallPlayer	=	-1,
		var_MapId 			= -1,
		var_XPos 				= -1,
		var_ZPos 				= -1
	},
	{ --天山的召集地点
		var_CallPlayer	=	-1,
		var_MapId 			= -1,
		var_XPos 				= -1,
		var_ZPos 				= -1
	},
	{ --昆仑的召集地点
		var_CallPlayer	=	-1,
		var_MapId 				= -1,
		var_XPos 				= -1,
		var_ZPos 				= -1
	},
	{ --敦煌的召集地点
		var_CallPlayer	=	-1,
		var_MapId 			= -1,
		var_XPos 				= -1,
		var_ZPos 				= -1
	}
}

--获取皇帝国
function x310123_GetKaiser()
	return GetEmpireCountry()
end

function x310123_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	if (GetLevel(varMap,varPlayer) < x310123_var_QuestLevelLimit) then
		return 
	end
	
	local questCount = IsHaveQuest(varMap, varPlayer, x310123_var_QuestId)
	
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcEnumEvent Debug --- varMap = %d, varPlayer = %d, x310123_var_MissionStart = %d, questCount = %d"
			,	varMap, varPlayer, x310123_var_MissionStart, questCount))
	end
	
	local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, x310123_var_QuestId)
	if (x310123_var_MissionStart == 1) then --战争已经开始
		if (questCount <= 0) then --可以领取皇帝战任务
			
			TalkAppendButton( varMap, x310123_var_QuestId, x310123_var_JoinKaiserBattlePrompt, state, 1); 
		end
	end
		if (questCount > 0) then --可以领取皇帝战奖励
		TalkAppendButton( varMap, x310123_var_QuestId, x310123_var_GetKaiserAwardPrompt, state, 2); 
	end
	
end
	
function x310123_GetKaiserCountry()
	return GetEmpireCountry()
end

--处理任务完成的逻辑
function x310123_IsMissionFinished(varMap, varPlayer)
	if (IsHaveQuest(varMap, varPlayer, x310123_var_QuestId) > 0) then
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_IsMissionFinished --- varMap = %d, varPlayer = %d"
			,	varMap, varPlayer))
		end
	
		local questIdx = GetQuestIndexByID( varMap, varPlayer, x310123_var_QuestId)
		local nDay = GetQuestParam( varMap, varPlayer, questIdx, x310123_var_QuestDateIndex)
		local nCurDayTime = GetDayTime()
		
		if (nDay == nCurDayTime) then
			local kaiserCountry = x310123_GetKaiserCountry()
			local kaiserDay = GetCountryParamByBit(kaiserCountry, CD_KAISER_BATTLE_LAST_KAISER_DATE, 
												x310123_var_LastKaiserDay[1], x310123_var_LastKaiserDay[2])
			if (kaiserDay == nDay) then --说明当前皇帝已经产生
				return 1
			end
		end
		
	end
	
	return 0
end

function x310123_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	x310123_ProcPushMissionToAllPlayer(varMap)
end

function x310123_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcEventEntry --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
	if (idExt ~= nil) then
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcEventEntry --- idExt = %d"
				,	idExt))
		end
	
		if (idExt == 1) then --任务相关项
			if (x310123_var_MissionStart == 1) then
				x310123_ProcPushMission(varMap, varPlayer, varTalknpc)
			end
			
		elseif (idExt == 2) then --领取任务奖励
			
			if (x310123_var_MissionStart == 0) then
				local playerCamp = GetCurCamp(varMap, varPlayer)
				local monsterCamp = GetMonsterCamp(varMap, varTalknpc)
				x310123_GetMissionAward(varMap, varPlayer, varTalknpc)
			else
				x310123_NoticeToPlayer(varMap, varPlayer, x310123_var_GetAwardFailNotice)
			end
			
		elseif (idExt == 3) then --测试使用
			--SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestFinishMark, 1)
		elseif (idExt == 4) then --测试使用
			--x310123_ProcPushMissionToAllPlayer(varMap)
		end
	end
	
end

--获取任务奖励
function x310123_GetMissionAward(varMap, varPlayer, varTalknpc)


	if (x310123_IsMissionFinished(varMap, varPlayer) == 1) then --任务完成
		-- TODO 给玩家相应奖励
		
		local questIdx = GetQuestIndexByID( varMap, varPlayer, x310123_var_QuestId)
		local killNum = GetQuestParam( varMap, varPlayer, questIdx, x310123_var_QuestKillNumIndex)
		if (x310123_var_PrintInfoLog == 1) then
			WriteLog(1, format("x310123_GetMissionAward --- varMap = %d, varPlayer = %d, killNum = %d",	
					varMap, varPlayer, killNum))
		end
		
		local level =GetLevel( varMap, varPlayer) 
		local exp = killNum * 10000
		if exp >level * 50000 then
			exp =level * 50000
		end
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("\t本次皇帝战期间,您共获得了#R%d#W点积分,将获得#R%d#W点经验奖励,现在就要要领取吗?\n \n\t#B活动提示#W：击杀一名#G敌方成员#W增加#R1#W点积分，击杀一名#G敌方战车#W获得#R2#W点积分。", killNum,exp))
		StopTalkTask(varMap)
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310123_var_FileId, x310123_var_QuestId)
	else
		x310123_NoticeToPlayer(varMap, varPlayer, "任务已过期,请放弃！！！")
	end
	
	return 
end

--处理皇帝战开始接受
function x310123_ProcKaiserStartAccept(varMap, varPlayer)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcKaiserStartAccept --- varMap = %d, varPlayer = %d", 
				varMap, varPlayer))
	end

	x310123_ProcAddPlayerMission(varMap, varPlayer)
end

--给玩家增加任务
function x310123_ProcAddPlayerMission(varMap, varPlayer)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcAddPlayerMission --- varMap = %d, varPlayer = %d", 
				varMap, varPlayer))
	end

	if (GetLevel(varMap,varPlayer) < x310123_var_QuestLevelLimit) then
		return 
	end
	
	if  GetWeek() ~= 6 then
			Msg2Player(varMap,varPlayer,"很抱歉，只有周六才能领取皇帝战任务。",8,3)
			return 0
	end
	
	local hour,minute,sec =GetHourMinSec();
	if hour >20 then
			Msg2Player(varMap,varPlayer,"很抱歉，皇帝战已结束请下周再来参加。",8,3)
			return 0
	end
	
	if (IsHaveQuest(varMap, varPlayer, x310123_var_QuestId) == 0) then

		if AddQuest(varMap, varPlayer, x310123_var_QuestId, x310123_var_FileId, 0, 0, 0, 1) ~= 1 then
			x310123_NoticeToPlayer(varMap, varPlayer, x310123_var_AddKaiserQuestFail)
			return
		end
		
		local questIdx = GetQuestIndexByID( varMap, varPlayer, x310123_var_QuestId )
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcQuestAccept --- questIdx = %d"
				,	questIdx))
		end
		
		local nCurDayTime = GetDayTime()
		
		SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestDateIndex, nCurDayTime)
		SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestKillNumIndex, 0)
		
		local countryId = GetCurCountry(varMap, varPlayer)
		
		local kaiserId = x310123_GetKaiser()
		if (kaiserId == -1) then --没有皇帝
			if (x310123_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310123_ProcQuestAccept --- kaiserId = %d, role = 3"
				,	kaiserId))
			end
			SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestRoleIndex, 3)
		elseif (kaiserId == countryId) then
			if (x310123_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310123_ProcQuestAccept --- kaiserId = %d, role = 1"
				,	kaiserId))
			end
			
			SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestRoleIndex, 1)
		elseif GetCountryParamByBit(countryId, CD_KAISER_BATTLE_INFO, x310123_var_IsKaiser[1],x310123_var_IsKaiser[2]) == 2 then --有皇帝，为主攻方
			if (x310123_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310123_ProcQuestAccept --- kaiserId = %d, role = 2"
				,	kaiserId))
			end
			SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestRoleIndex, 2)
		elseif (GetCountryParamByBit(countryId, CD_KAISER_BATTLE_INFO, x310123_var_IsKaiser[1],x310123_var_IsKaiser[2]) == 0) then --有皇帝，为辅攻方
			if (x310123_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310123_ProcQuestAccept --- kaiserId = %d, role = 0"
				,	kaiserId))
			end
			SetQuestParam( varMap, varPlayer, x310123_var_QuestId, x310123_var_QuestRoleIndex, 0)
		end				
		
		x310123_ProcQuestLogRefresh( varMap,varPlayer,x310123_var_QuestId)
		
		x310123_Msg2toplayer(varMap,varPlayer, 0)
		
		--TODO 记录游戏日志 GamePlayScriptLog
		
    if (x310123_var_PrintInfoLog == 1) then
    	local varName = GetName(varMap, varPlayer)
	    if varName == nil then
	        varName = "<ErrorName>"
	    end
	
	    local varCountry = GetCurCountry( varMap,varPlayer)
	    
	    local strMsg = format("x310123_ProcAcceptCheck Info --- varMap = %d, varName = %s, varCountry = %d", 
	    			varMap, varName, varCountry )
    
    	WriteLog( 1, strMsg ) 
    end
	end
end

--向全图所有玩家推送皇帝战的任务
function x310123_ProcPushMissionToAllPlayer(varMap)
	if (x310123_IsMissionNoticeMap(varMap) == 1) then
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcPushMissionToAllPlayer Debug --- RecordMap: varMap = %d", varMap))
		end
		
		x310123_var_MissionStart = 1
	end	
	local playerCount = GetScenePlayerCount( varMap )
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcPushMissionToAllPlayer --- varMap = %d, playerCount = %d", 
				varMap, playerCount))
	end
	
	local playerObjId = -1
	for playerIndex = 0, (playerCount - 1) do
		playerObjId = GetScenePlayerObjId(varMap, playerIndex)
		
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcPushMissionToAllPlayer --- playerObjId = %d", 
					playerObjId))
		end
		
		if (playerObjId ~= -1) then
			if (GetLevel(varMap, playerObjId) < x310123_var_QuestLevelLimit) then
				return 
			end
			
			-- 多了拉人的动作,所以不论该玩家是否有任务,都推送提示
			--if (IsHaveQuest(varMap, playerObjId, x310123_var_QuestId) > 0) then
			--	return 
			--end
			
			KaiserStartHint(varMap, playerObjId)
		end
	end
end

--判断是否是需要通知任务状态的场景
function x310123_IsMissionNoticeMap(varMap)
	local mark = 0
	for i, mapId in x310123_var_MissionNoticeMap do
		if (mapId == varMap) then
			mark = 1
			break
		end
	end
	
	return mark
end

--处理任务结束的标识
function x310123_ProcMissionOver(varMap)
	x310123_var_MissionStart = 0
end

--向玩家推送任务
function x310123_ProcPushMission(varMap, varPlayer, varTalknpc)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcPushMission --- varMap = %d, varPlayer = %d, varTalknpc = %d", 
				varMap, varPlayer, varTalknpc))
	end

	if (GetLevel(varMap, varPlayer) < x310123_var_QuestLevelLimit) then
		return 
	end
	
	if (IsHaveQuest(varMap, varPlayer, x310123_var_QuestId) > 0) then --已经接过此任务
		local questIdx = GetQuestIndexByID( varMap, varPlayer, x310123_var_QuestId)
		local nDay = GetQuestParam( varMap, varPlayer, questIdx, x310123_var_QuestDateIndex)
		local nCurDayTime = GetDayTime()
		
		if nDay == nCurDayTime then
			return 
		else
			x310123_NoticeToPlayer(varMap, varPlayer, x310123_var_OverdueHit)
			return 
		end
	end
	
	StartTalkTask(varMap)
	TalkAppendString(varMap, "#Y"..x310123_var_QuestName)
	TalkAppendString(varMap, x310123_var_KaiserQuestAccept)
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310123_var_FileId, x310123_var_QuestId)
end

function x310123_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310123_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcQuestAccept --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
	if (varQuest ~= nil) then
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcQuestAccept --- varQuest = %d"
				,	varQuest))
		end
		
		if (varQuest == x310123_var_QuestId) then
			if (IsHaveQuest(varMap, varPlayer, x310123_var_QuestId) == 0) then
				if (x310123_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310123_ProcQuestAccept Debug --- varPlayer = %d accept mission", varPlayer))
				end
				
				x310123_ProcAddPlayerMission(varMap, varPlayer) --接受任务
			else --提交任务
				if (x310123_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310123_ProcQuestAccept Debug --- varPlayer = %d comit mission", varPlayer))
				end
				
				if (x310123_IsMissionFinished(varMap, varPlayer) == 1) then --任务完成
					local questIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
					local killNum = GetQuestParam( varMap, varPlayer, questIdx, x310123_var_QuestKillNumIndex)
					local level =GetLevel( varMap, varPlayer)
					
					local exp = killNum * 10000
					if exp >level * 50000 then
						exp =level * 50000
					end
					AddExp(varMap, varPlayer, exp)
					Msg2Player(varMap, varPlayer, format("获得%d经验奖励", exp), 0, 2)
					
					DelQuest(varMap, varPlayer, varQuest)
				end
				
			end
		end
			
	end
	
end

--处理任务刷新
function x310123_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, varQuest );
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcQuestLogRefresh --- varMap = %d, varPlayer = %d, varQuest = %d, varHaveQuest = %d"
			,	varMap, varPlayer, varQuest, varHaveQuest))
	end
	
	if varHaveQuest <= 0 then
		return
	end
	
	local questIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local killNum = GetQuestParam( varMap, varPlayer, questIdx, x310123_var_QuestKillNumIndex)
	
	local countryId = GetCurCountry(varMap, varPlayer)
	local npc = format("@npc_%d",x310123_var_QuestNpc[countryId + 1])
	if (npc ~= nil) then
		StartTalkTask(varMap)
		
		
		local szTarget, szShow, szDescription
		szDescription = "\t激情四射的皇帝战在沙城火热开场！\n\t无论你是万众瞩目的高手还是低调行事的隐士，拿起你们的武器，参与到这火热的战斗中吧！除了那皇帝的无上荣耀，更有着无比丰厚的奖励等待着您！"
		
		local questIdx = GetQuestIndexByID( varMap, varPlayer, x310123_var_QuestId)
		local roleMark = GetQuestParam( varMap, varPlayer, questIdx, x310123_var_QuestRoleIndex)
		
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcQuestLogRefresh --- roleMark = %d"
			,	roleMark))
		end
		
		if (roleMark == 3) then --没有皇帝
			szTarget ="  前往@npc_82008，夺取@npc_82007，争夺皇帝之位"
			szShow = "  前往@npc_82008，夺取@npc_82007，争夺皇帝之位"
		elseif (roleMark == 1) then
			szTarget ="  您的国家为#R皇帝国#W，前往@npc_82008，保护@npc_401022，@npc_401023，@npc_401024和皇宫内的@npc_401300"
			szShow = "  您的国家为#R皇帝国#W，前往@npc_82008，保护@npc_401022，@npc_401023，@npc_401024和皇宫内的@npc_401300"
		elseif (roleMark == 2) then --有皇帝，为主攻方
			szTarget ="  您的国家为本次皇帝战#R主攻方#W，前往@npc_82008，消灭@npc_401022，@npc_401023，@npc_401024或皇宫内的@npc_401300，争夺皇帝之位"
			szShow = "  您的国家为本次皇帝战#R主攻方#W，前往@npc_82008，消灭@npc_401022，@npc_401023，@npc_401024或皇宫内的@npc_401300，争夺皇帝之位"
		elseif (roleMark == 0) then --有皇帝，为辅攻方
			szTarget ="  您的国家为本次皇帝战#R辅攻方#W，前往@npc_82008，消灭@npc_401022，@npc_401023，@npc_401024或皇宫内的@npc_401300，争夺皇帝之位"
			szShow = "  您的国家为本次皇帝战#R辅攻方#W，前往@npc_82008，消灭@npc_401022，@npc_401023，@npc_401024或皇宫内的@npc_401300，争夺皇帝之位"			
		end
		
		AddQuestLogCustomText( varMap,
								x310123_var_QuestName,						
								x310123_var_QuestName,        
								szTarget,		
								npc,			
								szShow,               --攻略
								szDescription,	
								""					
								)
		StopTalkTask()
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end
end

--处理召集广播
function x310123_ProcCallIn(varMap, varCountry, varTargetMap, varPlayer, varXPos, varZPos)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcCallIn --- varMap = %d, varCountry = %d, varTargetMap = %d, varPlayer = %d, varXPos = %d, varZPos = %d"
			,	varMap, varCountry, varTargetMap, varPlayer, varXPos, varZPos))
	end
	
	local targetPosTable = x310123_var_CountryCallInTable[varCountry + 1]
	if (targetPosTable ~= nil) then
		targetPosTable.var_CallPlayer = varPlayer
		targetPosTable.var_MapId = varTargetMap
		targetPosTable.var_XPos = varXPos
		targetPosTable.var_ZPos = varZPos
	end
	
	local playerObjId = -1
	local playerCount = GetScenePlayerCount( varMap )
	for playerIndex = 0, (playerCount - 1) do
		playerObjId = GetScenePlayerObjId(varMap, playerIndex)
		
		if (x310123_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310123_ProcCallIn --- playerObjId = %d", 
					playerObjId))
		end
		
		if (playerObjId ~= -1) then
			if (GetCurCountry(varMap, playerObjId) == varCountry 
							and GetLevel(varMap, playerObjId) >= x310123_var_CallInLevelLimit
							and varPlayer ~= playerObjId) then
							
				KaiserCallIn(varMap, playerObjId)	--向60级以上的本国玩家发出邀请
			end
		end
	end
	
end

function x310123_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end

--任务放弃的处理
function x310123_ProcQuestAbandon(varMap, varPlayer, varQuest)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcQuestAbandon --- varMap = %d, varPlayer = %d, varQuest = %d"
			,	varMap, varPlayer, varQuest))
	end
	
	if IsHaveQuest(varMap,varPlayer, x310123_var_QuestId) <= 0 then
		return 
	end
	
	DelQuest(varMap, varPlayer, x310123_var_QuestId)
	x310123_Msg2toplayer( varMap, varPlayer, 1)
	
	--TODO 记录游戏日志 GamePlayScriptLog
end

--给玩家的提示
function x310123_Msg2toplayer( varMap, varPlayer, type)
	
	if type == 0 then
		Msg2Player(varMap, varPlayer, format(x310123_var_JoinKaiserConfirm, x310123_var_QuestName), 0, 2)
	  Msg2Player(varMap, varPlayer, format(x310123_var_JoinKaiserConfirm, x310123_var_QuestName), 0, 3)
	elseif type == 1 then
		Msg2Player(varMap, varPlayer, format(x310123_var_QuitKaiserConfirm, x310123_var_QuestName), 0, 2)
		Msg2Player(varMap, varPlayer, format(x310123_var_QuitKaiserConfirm, x310123_var_QuestName), 0, 3)
	end
	
end

--通知玩家相关提示
function x310123_NoticeToPlayer(varMap, varPlayer, varMsg)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end

--玩家同意召集的处理
function x310123_ProcKaiserCallInAccept(varMap, varPlayer)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310123_ProcKaiserCallInAccept --- varMap = %d, varPlayer = %d"
			,	varMap, varPlayer))
	end
	
	local varState,varMsg = LuaCallNoclosure(x310123_var_TransferCheckScript,"BattleTransCheckPlayerState", varMap,varPlayer )
  if varState == 1 then
      StartTalkTask(varMap)
      TalkAppendString( varMap, varMsg );
      StopTalkTask(varMap)
      DeliverTalkTips(varMap,varPlayer)
      
      return 
  end
  
  --轮回之地
  if (varMap == 91 or 
  		varMap == 191 or 
  		varMap == 291 or 
  		varMap == 391) then
  		
  		return
  end
  
  if GetSceneType(varMap) == 2 then
  	varMsg = "战场无法传送"
		StartTalkTask(varMap)
    TalkAppendString( varMap, varMsg );
    StopTalkTask(varMap)
    DeliverTalkTips(varMap, varPlayer)
    
    return
	end
  
	local country = GetCurCountry(varMap, varPlayer)
	local placeTable = x310123_var_CountryCallInTable[country + 1]
	if (placeTable ~= nil) then
		if (varMap == placeTable.var_MapId) then --本图玩家,直接设置过去
			SetPos( varMap, varPlayer, placeTable.var_XPos, placeTable.var_ZPos)
		else --不是本图,处理切图
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,Map_ID) == 0 then
				return
			end
			
			NewWorld(varMap, varPlayer, placeTable.var_MapId, 
			placeTable.var_XPos, placeTable.var_ZPos, x310123_var_FileId);
			
		end
	end
end

--皇帝战开始传入的接受处理
function x310123_ProcKaiserStartTransferAccept(varMap, varPlayer)
	if (x310123_var_PrintDebugLog == 1) then
		WriteLog(1, format("ProcKaiserStartTransferAccept --- varMap = %d, varPlayer = %d"
			,	varMap, varPlayer))
	end
	
	x310123_ProcAddPlayerMission(varMap, varPlayer)
	
	local varState, varMsg = LuaCallNoclosure(x310123_var_TransferCheckScript, "BattleTransCheckPlayerState", varMap,varPlayer )
  if varState == 1 then
      StartTalkTask(varMap)
      TalkAppendString( varMap, varMsg );
      StopTalkTask(varMap)
      DeliverTalkTips(varMap,varPlayer)
      return 1
  end
	
	--轮回之地
  if (varMap == 91 or 
  		varMap == 191 or 
  		varMap == 291 or 
  		varMap == 391) then
  		
  		return
  end
  
  if GetSceneType(varMap) == 2 then
  	varMsg = "战场无法传送"
		StartTalkTask(varMap)
    TalkAppendString( varMap, varMsg );
    StopTalkTask(varMap)
    DeliverTalkTips(varMap, varPlayer)
    
    return
	end
	
	local country = GetCurCountry(varMap, varPlayer)
	local placeTable	=	{}
	if (x310123_GetKaiser() == country) then --皇帝国
		placeTable = x310123_var_KaiserTransferPlace
	else		--其他国家
		placeTable = x310123_var_CountryTransferPlace[country + 1]
	end
	
	if (placeTable ~= nil) then
		if (varMap == placeTable.var_MapId) then --本图玩家,直接设置过去
			SetPos( varMap, varPlayer, placeTable[1], placeTable[2])
		else --不是本图,处理切图
			NewWorld(varMap, varPlayer, SCENE_BATTLE_KAISER, placeTable[1], placeTable[2], x310123_var_FileId);
		end
	end
end
