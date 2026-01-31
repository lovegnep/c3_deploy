-- 团队副本 角斗场
------------------------------------------------------------------
x700302_g_ScriptId			=	700302
---------------------------------------------
--# define 0-20 for common,  240-255 for common
-----------------------------------------------
x700302_CSP_FUBENTYPE				= 	0
x700302_CSP_SCRIPTID				=	1
x700302_CSP_TICKCOUNT				= 	2
x700302_CSP_BACKSCENEID				= 	3
x700302_CSP_ISCLOSING				= 	4
x700302_CSP_LEAVECOUNTDOWN			= 	5
x700302_CSP_TEAMID					=	6
x700302_CSP_TICKTIME				=	7
x700302_CSP_HOLDTIME				=	8
x700302_CSP_FUBENLEVEL				=	9
x700302_CSP_FUBEN_SCENE_ID			=	10
x700302_CSP_CLOSETICK				=	11
x700302_CSP_TICKCOUNT_ADD			=	12
x700302_CSP_TICKCOUNT_SUB			=	13
x700302_CSP_B_TOPLIST_ABLE			=	14
x700302_CSP_PLAYER_DEAD				=	15
x700302_CSP_FUBEN_KIND				=	16  --现仅针对轮回台副本
x700302_CSP_XINSHOU_FLAG			=   17  --新手模式，现仅针对轮回台副本

------------------------------------------------------
x700302_CSP_BOSS_INDEX				= 30 -- boss编号,记录当前boss索引
x700302_CSP_LASTBOSS_DEAD		=	31	-- 标识最后一个boss是否死亡
------------------------------------------------------

x700302_CSP_GROUP_GUID_START  = 150  -- 空36位给团队副本

------------------------------------------------------
x700302_CSP_HUMAN_COUNT				=	240
x700302_CSP_PLAYER_ENTER_START		=	241
x700302_CSP_LAST_TICKOUNT			=	247
x700302_CSP_GUID_START        = 248  --空6个
x700302_CSP_FUBEN_TYPE				=	254	--试练，普通，英雄，三种类型 0 -- 普通 1 -- 试练 2 -- 英雄 3 -- 团队副本
x700302_CSP_FUBEN_MODE				= 255

------------------------------------------------------
--------------------------------------------------------------
------------ 256 ~ 384 一共128个索引给团队副本----------------
------------ 256 ~ 319 用于场景与副本交互的公共数据段---------
x700302_CSP_GROUPID						= 256  -- 团对 ID
x700302_CSP_GROUP_GUID_START  = 257  -- 257 ~ 292 位给团队副本
--------------------------------------------------------------

x700302_g_CenterX 					= 126	-- 角斗场中央X坐标
x700302_g_CenterZ					  = 126	-- 角斗场中央Y坐标
x700302_g_Potal 					  = 1	-- 主城门
x700302_g_FirstDoor 				= 2 -- 关boss的第一扇门
x700302_g_SecondDoor				= 3	-- 关boss的第二扇门
x700302_g_ThirdDoor					= 4 -- 关boss的第三扇门

x700302_g_PotalState 				= 1 -- 标识主城门关闭状态
x700302_g_LastBossIndex			= 6	-- 最后一个boss序列号

x700302_g_FubenPerTime = 5000 -- 副本每次刷新的时间间隔（毫秒)
x700302_g_KickOutTime = 30000 -- 团队解散或非成员被踢出前倒计时时间（毫秒）

x700302_g_BossAngryFlag = 0 -- 狂暴标识
x700302_g_AngryTime = 30000 -- boss狂暴时间（5分钟）
x700302_g_AngryTick = 65536 -- boss走到中央时开始记录进入狂暴倒计时

x700302_g_AngryAttacct = 7921	-- boss狂暴时增加的攻击技能
x700302_g_AngryDefend = 7933	-- boss狂暴时增加的防御技能

x700302_g_CurseRate = 10	--点名概率
x700302_g_CurseDistance = 30 -- 点名距离
x700302_g_CurseState = 0 -- 标识点名状态
x700302_g_LastTick = 65536 --  标识点名时间（tick次数)
x700302_g_TimeAfterCurse = 5000 -- 点名后实际释放魔法的时间间隔（毫秒）
x700302_g_MAX = 65536

x700302_g_BossHp80 = 80		--80血量
x700302_g_BossHp50 = 50
x700302_g_BossHp20 = 20



x700302_g_LevFubenFlagTbl = {}	--标识玩家是否离开团队
x700302_g_BossInfoTbl = {} 				--标识信息

-----------------------------------------------------boss技能--------------------------------------
x700302_g_PlayerDetonate_EffectID		=	7906			-- 诅咒


x700302_g_SubmitNPC         = {type =55106,guid =150597,x = 150, z=110, facedir =180, title = ""}
x700302_g_EnterNPC					= 150597

-- 点npc时显示挑战几号房间
x700302_g_SelectRoomMenu = {"挑战%u号房间"}
x700302_g_BackMenu = {"回到角斗场入口场景", "确定", "副本完成，返回角斗场入口场景"}
x700302_g_BackInfo = "\t你确认要离开此副本，返回角斗场入口场景吗？"

-- 点击房间进入下一级界面时的npc界面文字描述
x700302_g_RoomBossInfo = {"挑战1号房间boss", "挑战2号房间boss", "挑战3号房间boss"}

-- 返回设置,团队副本最多有12人，所以配置12对坐标
x700302_g_BackPos = {
		{ 128,128 },
		{ 125,127 },
		{ 131,127 },
		{ 131,130 },
		{ 127,130 },
		{ 123,129 },
}

x700302_g_RelivePos = {
		{ 126,60 },
		{ 126,54 },
		{ 119,48 },
		{ 116,42 },
		{ 136,53 },
		{ 112,34 },
}

function x700302_GetFubenIndex(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3])
end

function x700302_SetCurrentBossIndex(varMap)
	local nProc = -1
	local leaderguid = GetFubenData_TeamLeader(varMap)
	local leaderObjId = Guid2ObjId(varMap, leaderguid)

	WriteLog(1,"md [1] ="..MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1])
	WriteLog(1,"md [2] ="..MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2])
	WriteLog(1,"leader process = "..GetPlayerGameData(varMap, leaderObjId, MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1], MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2], MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[3]))

	for i= MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[3]-1, 0, -1 do
		WriteLog(1, "bitindex="..(32-MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2] - i -1).."bit ="..GetPlayerGameDataBit(varMap, leaderObjId, MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1], 32-MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2] - i -1))
		if tonumber(1) == tonumber(GetPlayerGameDataBit(varMap, leaderObjId, MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1], 32-MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2] - i -1)) then
			nProc = i
			WriteLog(1,"nProc ="..nProc)
			break
		end
	end

	WriteLog(1,"boss nProc ="..nProc)

	if nProc<0 then
		SetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX, -1)
	else
		SetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX, nProc)
	end
end

function x700302_SaveGroupSelfFubenProcess(varMap, bossid, nBitIndex, nValue)
	if tonumber(nBitIndex) < tonumber(MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2]) or tonumber(nBitIndex) > tonumber(MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2]) + tonumber(MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[3]) then
		WriteLog(1, "nBitIndex = "..nBitIndex.."error")
		return
	end

	if 0 ~= tonumber(nValue) and 1 ~= tonumber(nValue) then
		WriteLog(1, "nValue = "..nValue.."error")
		return
	end

	local nCount = GetFuben_PlayerCount(varMap)
	local curWeekIndex = GetWeekIndex()

	for i = 0, nCount-1 do 	-- 为玩家保存副本进度
		local nPlayerId = GetFuben_PlayerObjId(varMap, i)
		WriteLog(1, "nValue = "..nValue.."nBitIndex ="..nBitIndex.."MD[1]="..MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1])
		SetPlayerGameData(varMap, nPlayerId, MD_FUBEN_GROUP_JUEDOUCHANG_WEEK2[1], MD_FUBEN_GROUP_JUEDOUCHANG_WEEK2[2], MD_FUBEN_GROUP_JUEDOUCHANG_WEEK2[3], curWeekIndex)
		SetPlayerGameDataBit(varMap, nPlayerId, MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1], 32 - MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2] - nBitIndex-1, nValue)
	end

	if nCount > 0 then	-- 为团队保存副本进度
		local nPlayerId =  GetFuben_PlayerObjId(varMap, 0)
		local nProcess = GetPlayerGameData(varMap, nPlayerId, MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[1], MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[2], MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS2[3])
		local varIndex = x700302_GetFubenIndex(varMap, nPlayerId)
		local igroupId = GetFubenData_Param(varMap, x700302_CSP_GROUPID)
		WriteLog(1, "nProcess = "..nProcess.."right")
		SetGroupFubenProcess(varMap, nPlayerId, igroupId, varIndex, nProcess)
	end

end

-- 当副本创建成功时, (初始化操作在这进行)
function x700302_ProcFubenSceneCreated(varMap)
	SetFubenData_Param(varMap, x700302_CSP_LASTBOSS_DEAD, 0)
	x700302_CreateSubmitNpc(varMap)
	
	x700302_SetCurrentBossIndex(varMap)

	local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX)
	x700302_CreateBoss(varMap, iBossIndex+1)				-- 创建没挑战过的BOSS
	x700302_g_FubenPerTime = GetFubenData_Timer(varMap)
	if iBossIndex+1 <= x700302_g_LastBossIndex then
		LuaAllScenceM2Wrold (varMap,"团队副本开始", 5, 1)
	end
end

-- 副本心跳接口
function x700302_EnterTick(varMap, nowTickCount)
	local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX)
	local objId = -1
	local step = -1
	local fullHp = -1

	-- 进入副本后选择进入房间的NPC冒泡提示
	if nowTickCount == 5 and iBossIndex ~= x700302_g_LastBossIndex then
		NpcTalk(varMap, FindMonsterByGUID(varMap, x700302_g_EnterNPC), "选择房间，回圈挑战BOSS！",  -1)
	end

	if tonumber(iBossIndex) >= 0 then
		if nil ~= x700302_g_BossInfoTbl[iBossIndex+1] then
			objId = x700302_g_BossInfoTbl[iBossIndex+1].BossId
			step = x700302_g_BossInfoTbl[iBossIndex+1].BossStep
			fullHp = x700302_g_BossInfoTbl[iBossIndex+1].BossHp
		end
	end

	if -1 == objId or -1 == fullHp then
		return
	end

	WriteLog(1,"iBossIndex"..iBossIndex.."objId ="..objId)

	--1)根据boss仇恨度改变主城门关闭状态
	x700302_ChangeThePotalState(varMap, objId) 

	-- 2)判断玩家是否离开团队,是则在30秒后跳请离团队副本
	x700302_KickSomeOneOut(varMap)

	-- 3)前面6只boss会寻路到中央
	if iBossIndex < x700302_g_LastBossIndex and objId ~= nil and objId ~= -1 and step == -1 then
		local x,z = GetWorldPos(varMap,objId)
		if tonumber(x-x700302_g_CenterX)* tonumber(x-x700302_g_CenterX) + tonumber(z-x700302_g_CenterZ)*tonumber(z-x700302_g_CenterZ) < 36 then
			NpcTalk(varMap, objId, "开始战斗！",  -1)
			SetRevPos(varMap,objId,x,z)
		 	SetPatrolId(varMap, objId, -1)
		  SetMonsterCamp(varMap,objId,21)
		  x700302_CloseTheDoor(varMap, iBossIndex)
		  -- 进入BOSS 第一阶段
		 if nil ~= x700302_g_BossInfoTbl[iBossIndex+1] then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep  = 0
			x700302_g_AngryTick = nowTickCount
		 end
		end
	end

	-- 4)最后一只boss 进入第一阶段
	if iBossIndex == x700302_g_LastBossIndex  and objId ~= nil and objId ~= -1 and step == -1 then
		 if nil ~= x700302_g_BossInfoTbl[iBossIndex+1] then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep  = 0
			x700302_g_AngryTick = nowTickCount
		 end
	end

	-- 4)切换boss状态转换
	x700302_ChangeMonsterState(varMap, objId, iBossIndex, nowTickCount)

	--5)boss在不同状态下应对各种事件的处理
	x700302_ProcessMonsterEvent(varMap, objId, iBossIndex, nowTickCount)

end

-- 显示房间号
function x700302_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)
	local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX) + 1  --此次要打的boss索引
	local iRoomNum = 0
	local bLaBsDead = GetFubenData_Param(varMap,x700302_CSP_LASTBOSS_DEAD)

	if tonumber(iBossIndex) < tonumber(x700302_g_LastBossIndex) then
		-- 处于选择房间打boss阶段
		iRoomNum = iBossIndex - floor(iBossIndex/3)*3 + 1

		local item = format(x700302_g_SelectRoomMenu[1],iRoomNum)

		if nil == item then 
			WriteLog(1,"nil == item")
			do return end
		end

		TalkAppendButton(varMap, x700302_g_ScriptId, item, 0, 1)
		TalkAppendButton(varMap, x700302_g_ScriptId, x700302_g_BackMenu[1], 0, 2)
	elseif 0 == bLaBsDead then
		-- 处于最后一个boss阶段不需要显示挑战房间
		TalkAppendButton(varMap, x700302_g_ScriptId, x700302_g_BackMenu[1], 0, 2)
	elseif 1 == bLaBsDead then
		--  最后一个boss死亡，副本完成
		TalkAppendButton(varMap, x700302_g_ScriptId, x700302_g_BackMenu[3], 0, 3)
	end
end

-- 选择进入房间
function x700302_ProcEventEntry(varMap, varPlayer, NPCId,varScriptFileId, varIndex)
	if varIndex == 1 then
		local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX) + 1 --此次要打的boss索引
		local iRoomNum = 0

		iRoomNum = iBossIndex - floor(iBossIndex/3)*3 + 1

		StartTalkTask(varMap)
		TalkAppendString(varMap,x700302_g_RoomBossInfo[iRoomNum])
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, NPCId, x700302_g_ScriptId, -1);
	elseif varIndex == 2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x700302_g_BackInfo)
		TalkAppendButton(varMap, x700302_g_ScriptId, x700302_g_BackMenu[2],0,3)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, NPCId)
	elseif varIndex == 3 then
		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
    TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
    local pos = x700302_g_BackPos[random(1, 6)]
		NewWorld( varMap, varPlayer, 50, pos[1], pos[2], 700302)
	end
end

-- 确定进入房间
function x700302_ProcAccept(varMap, varPlayer)
-- 是否需要判断只有团长才能点确定
	local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX) + 1 -- 此次要打的boss索引
	local nBossId = -1

	if nil ~= x700302_g_BossInfoTbl[iBossIndex+1] then
		nBossId = x700302_g_BossInfoTbl[iBossIndex+1].BossId
	end

	if -1 == nBossId then
		WriteLog(1,"nBossId error")
		return
	end

	SetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX, iBossIndex)
	x700302_OpenTheDoor(varMap, iBossIndex)
	SetPatrolId(varMap, nBossId, 0)
end

---------------------------------------------------------------------------------------------------
--申请进入副本
---------------------------------------------------------------------------------------------------
function x700302_ProcAcceptCheck( varMap, varPlayer, NPCId )
	local iFubenGroupId = GetFubenData_Param(varMap, x700302_CSP_GROUPID)
	local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX)
	local objId = -1

	if tonumber(iBossIndex) >= 0 then
		if nil ~= x700302_g_BossInfoTbl[iBossIndex+1] then
			objId = x700302_g_BossInfoTbl[iBossIndex+1].BossId
		end
	end

	if GetGroupId(varMap, varPlayer) < 0 or iFubenGroupId ~= GetGroupId(varMap, varPlayer) then
	  x700302_ShowTips(varMap, varPlayer, "您的团队已被解散")
  	return 0
	end
	
	if IsGroupLeader(varMap, varPlayer) <= 0 then
  	x700302_ShowTips(varMap, varPlayer, "您不是团长")
  	return 0
  end

	WriteLog(1, "AcceptCheck objId="..objId)

 	if tonumber(objId) < 0 then
 		return 1
 	else
 		x700302_ShowTips(varMap, varPlayer, "当前boss没死亡，不能挑战下一个boss！")
 		return 0
 	end
end

-- 进入区域
function x700302_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId)
	
end

--离开区域
function x700302_ProcAreaLeaved(varMap, varPlayer, zoneId, MissionId)

end

--区域定时器
---------------------------------------------------------------------------------------------------
function x700302_ProcTiming(varMap, varPlayer, ScriptId, MissionId)

end

-- 死亡通知
function x700302_ProcDie(varMap, varPlayer, killerId)
	local iBossIndex = GetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX)
	local objId = -1

	if tonumber(iBossIndex) >= 0 then
		if nil ~= x700302_g_BossInfoTbl[iBossIndex+1] then
			objId = x700302_g_BossInfoTbl[iBossIndex+1].BossId
		end
	end

	x700302_SaveGroupSelfFubenProcess(varMap, bossid, iBossIndex, 1)
	x700302_g_BossInfoTbl[iBossIndex+1] = nil
	x700302_g_BossAngryFlag = 0 -- 狂暴标识
	x700302_g_AngryTick = x700302_g_MAX -- boss走到中央时开始记录进入狂暴倒计时
	x700302_g_CurseState = 0 -- 标识点名状态
	x700302_g_LastTick = x700302_g_MAX --  标识点名时间（tick次数)

	if objId == varPlayer then
				-- 第1只BOSS死亡
			if 0 == iBossIndex then
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS1")
				-- 第2只BOSS死亡
			elseif 1 == iBossIndex then
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS2")
			elseif 2 == iBossIndex then
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS3")
				x700302_CreateBoss(varMap, iBossIndex+1) -- 创建下一轮boss
			elseif 3 == iBossIndex then
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS4")
			elseif 4 == iBossIndex then
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS5")
			elseif 5 == iBossIndex then
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS6")
				x700302_CreateBoss(varMap, iBossIndex+1) -- 创建最后一个boss
			elseif x700302_g_LastBossIndex == iBossIndex then
				-- 最后一个boss死亡
				x700302_ShowTipsToAll(varMap, "顺利击杀BOSS7")
				SetFubenData_Param(varMap, x700302_CSP_LASTBOSS_DEAD, 1)
			end
	end
end

--通知所有玩家
function x700302_ShowTipsToAll(varMap, str)
	local humancount = GetFuben_PlayerCount(varMap)

	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i)
		Msg2Player(varMap, humanId, str, 8, 3)
	end
end

function x700302_ShowTips(varMap, varPlayer, str)
	StartTalkTask(varMap);
	TalkAppendString(varMap,str);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

-- 完成任务
function x700302_CreateSubmitNpc(varMap)
	local npc = x700302_g_SubmitNPC

	local nRet = -1
	if npc.title~= "" then
		nRet = CreateMonster(varMap, npc.type, npc.x, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		nRet = CreateMonster(varMap, npc.type, npc.x, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
end

-- 创建Boss
function x700302_CreateBoss(varMap, iBossIndex)
	local fubenmode = GetFubenData_Param(varMap, x700302_CSP_FUBEN_MODE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700302_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID( x700302_g_ScriptId)

	local nextboss1 = -2
	local nextboss2 = -2

	if x700302_g_LastBossIndex ~= iBossIndex then
		if mod(iBossIndex,3) == 0 then
			nextboss1 = iBossIndex +1
			nextboss2 = iBossIndex +2
		elseif mod(iBossIndex,3) == 1 then
			nextboss1 = iBossIndex +1
		end
	end

	for i = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x1,z1,r,ai,aiscript,flag,flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700302_g_ScriptId,nIndexFrom,i)
			WriteLog(1,"monsterFlag="..monsterFlag.."flag="..flag.."flag3="..flag3.."iBossIndex="..iBossIndex.."fubenmode"..fubenmode)
		if idScript == x700302_g_ScriptId and 1 == monsterFlag and (flag == iBossIndex or flag == nextboss1 or flag == nextboss2) 
				and flag3 == fubenmode and tonumber(0) == tonumber(flag2) then
			local nMonsterID = 0
			if title ~="" then
				nMonsterID = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700302_g_ScriptId, -1, 21,-1,facedir, "",title)
			else
				nMonsterID = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700302_g_ScriptId, -1, 21,-1,facedir)
			end

			if nMonsterID > 0 then
				if nil == x700302_g_BossInfoTbl[flag+1] then
					x700302_g_BossInfoTbl[flag+1] = {}
				end

				local hp = GetHp(varMap, nMonsterID)

				x700302_g_BossInfoTbl[flag+1].BossId = nMonsterID
				x700302_g_BossInfoTbl[flag+1].BossHp = hp
				x700302_g_BossInfoTbl[flag+1].BossStep = -1

				WriteLog(1,"create Success flag="..tonumber(iBossIndex).."bossid"..x700302_g_BossInfoTbl[flag+1].BossId)
				
				if x700302_g_LastBossIndex == iBossIndex then
					SetFubenData_Param(varMap, x700302_CSP_BOSS_INDEX, iBossIndex)
					NpcTalk(varMap, nMonsterID, "最后的boss现身！",  -1)
				end

				if iBossIndex < x700302_g_LastBossIndex then
					SetMonsterCamp(varMap,nMonsterID,-1)
				end
			end
    end
	end
end

--创建Monster
function x700302_CreateMonster(varMap, step)
end

--创建现金boss
function x700302_CreateXianJinBoss(varMap)
end

---------------------------------------------------------------------------------------------------
--随机点名一个人，点名范围距离boss 50米，被点中者受到技能伤害
---------------------------------------------------------------------------------------------------
function x700302_AppointPlayerToDetonate(varMap, objId, distance, buffId)
	if -1 == objId then
		return
	end

	local x,z = GetWorldPos(varMap, objId)
	local Num =  GetNearPlayerCountForMonster(varMap, objId, x, z, distance)

	if Num > 0 then
		local RandomIndex = random(0,Num-1);
		local humanObjId = GetNearPlayerMemberForMonster(varMap, objId, RandomIndex);

		if humanObjId ~= -1 then
			local humanObjName = GetName(varMap, humanObjId)
			local nRet = SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffId, 0)
			if nRet == 1 then
				NpcTalk(varMap, objId, format("#R"..humanObjName.."已经被我诅咒，你们会因为他受到伤害的"), -1)
			end
		end
	end
end


function x700302_CloseTheDoor(varMap, iBossIndex)
	if iBossIndex >= x700302_g_LastBossIndex then
		return
	end

	local ndoorId = -1

	if 0 == mod(iBossIndex,3) then
		ndoorId =  x700302_g_FirstDoor
	elseif 1 == mod(iBossIndex,3) then
		ndoorId = x700302_g_SecondDoor
	elseif 2 == mod(iBossIndex,3) then
		ndoorId = x700302_g_ThirdDoor
	end

	if -1 == ndoorId then
		return
	end

	local nCount = GetFuben_PlayerCount(varMap)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		WriteLog(1, "close door nPlayerId="..nPlayerId.."ndoorId="..ndoorId.."iBossIndex ="..iBossIndex)
		LuaCallNoclosure(UTILITY_SCRIPT,"StopClientAnimEffect", varMap, nPlayerId, ndoorId)
	end
end

function x700302_ClosePotal(varMap)
	local nCount = GetFuben_PlayerCount(varMap)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		LuaCallNoclosure(UTILITY_SCRIPT,"StopClientAnimEffect", varMap, nPlayerId, x700302_g_Potal)
	end
end

function x700302_OpenPotal(varMap)
	local nCount = GetFuben_PlayerCount(varMap)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientAnimEffect",varMap, nPlayerId, x700302_g_Potal)
	end
end

function x700302_OpenTheDoor(varMap, iBossIndex)
	if iBossIndex >= x700302_g_LastBossIndex then
		return
	end

	local ndoorId = -1

	if 0 == mod(iBossIndex,3) then
		ndoorId =  x700302_g_FirstDoor
	elseif 1 == mod(iBossIndex,3) then
		ndoorId = x700302_g_SecondDoor
	elseif 2 == mod(iBossIndex,3) then
		ndoorId = x700302_g_ThirdDoor
	end

	if -1 == ndoorId then
		return
	end

	local nCount = GetFuben_PlayerCount(varMap)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		WriteLog(1, "opendoor nPlayerId"..nPlayerId.."ndoorId ="..ndoorId.."iBossIndex ="..iBossIndex)
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientAnimEffect",varMap, nPlayerId, ndoorId)
	end
end

function x700302_ProcPlayerRelive(mapId, playerId, ReliveType)
	WriteLog(1, "700302 relive type"..ReliveType)
	if 0 == ReliveType then
		x700302_ShowTips(mapId, playerId, "此副本不能原地复活")
	elseif 2 == ReliveType then
		ClearPlayerNextSceneInfo(mapId,playerId)
		x700302_DoPlayerRelive(mapId,playerId,50,0)
		local pos = x700302_g_RelivePos[random(1, 6)]
		SetPos(mapId,playerId,pos[1],pos[2])
	end
end

---------------------------------------------------------------------------------------------------
--执行玩家复活
---------------------------------------------------------------------------------------------------
function x700302_DoPlayerRelive( mapId, playerId, value, usehorse )
	ClearRageRecoverTick(mapId, playerId)
	RestoreHp(mapId, playerId,value)
	RestoreRage(mapId, playerId,value)
	ClearMutexState(mapId, playerId, 6)
	SendReliveResult(mapId, playerId,1)	
	if usehorse==1 then
		LastMount(mapId, playerId )
		RestoreHp(mapId, playerId,0)
	end
end

function x700302_ChangeThePotalState(varMap, monsterId)
	if nil == monsterId or -1 == monsterId and 0 == x700302_g_PotalState then
		x700302_OpenPotal(varMap)
		x700302_g_PotalState = 1
		DelSceneTempImpassable(varMap,118,60,140,67)		--清障碍
	end

	if monsterId ~= nil and tonumber(monsterId) ~= tonumber(-1) then
		if IsTheMonsterHasThreat(varMap, monsterId) > 0 then
			if 1 == x700302_g_PotalState then
				x700302_ClosePotal(varMap)
				x700302_g_PotalState = 0
				AddSceneTempImpassable(varMap,118,60,140,67)			--置障碍
			end
		else
			if 0 == x700302_g_PotalState then
			  x700302_OpenPotal(varMap)
				x700302_g_PotalState = 1
				DelSceneTempImpassable(varMap,118,60,140,67)				--清障碍
			end
		end
	end
end

function x700302_ChangeMonsterState(varMap, monsterId, iBossIndex, nowTickCount)
	if nil == iBossIndex or -1 == iBossIndex or nil == monsterId or -1 == monsterId or nil == varMap or -1 == varMap then
		return
	end

	if -1 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
		return
	end

	local Hp = GetHp(varMap, monsterId)
	local fullHp = x700302_g_BossInfoTbl[iBossIndex+1].BossHp
	local curHpRate = Hp*100/fullHp

	-- 第一个boss and 0 == iBossIndex 
	if monsterId ~= nil and monsterId ~= -1 then
		if curHpRate > x700302_g_BossHp80  then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep = 0 			-- 第1阶段处理
				x700302_g_CurseState = 0
				x700302_g_LastTick = x700302_g_MAX
		elseif curHpRate <= x700302_g_BossHp80 and curHpRate > x700302_g_BossHp50 then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep = 1 			-- 第2阶段处理
		elseif curHpRate <= x700302_g_BossHp50 and curHpRate > x700302_g_BossHp20 then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep = 2 -- 第3阶段处理
		elseif curHpRate <= x700302_g_BossHp20 then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep = 3 -- 第4阶段处理
		end

		if 0 == x700302_g_BossAngryFlag and  nowTickCount*x700302_g_FubenPerTime >= x700302_g_AngryTick * x700302_g_FubenPerTime + x700302_g_AngryTime then
			x700302_g_BossInfoTbl[iBossIndex+1].BossStep = 4 -- 第5阶段处理
			x700302_g_BossAngryFlag = 1
		end
	end
end


function x700302_ProcessMonsterEvent(varMap, monsterId, iBossIndex, nowTickCount)
	if nil == iBossIndex or -1 == iBossIndex or nil == monsterId or -1 == monsterId or nil == varMap or -1 == varMap then
		return
	end

	if -1 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
		return
	end

	-- 第一个boss and 0 == iBossIndex
	if monsterId ~= nil and monsterId ~= -1 then
		if 0 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
		elseif 1 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
			if 0 == x700302_g_CurseState then
				if x700302_g_CurseRate > random(0,100) then
					LuaAllScenceM2Wrold (varMap,"5秒过后boss将点名", 5, 1)
					NpcTalk(varMap, monsterId, "5秒过后点名！",  -1)
					x700302_g_CurseState = 1
					x700302_g_LastTick = nowTickCount
				end
			end

			if 1 == x700302_g_CurseState and nowTickCount*x700302_g_FubenPerTime > x700302_g_LastTick*x700302_g_FubenPerTime + x700302_g_TimeAfterCurse  then
				WriteLog(1,"x700302_g_FubenPerTime ="..x700302_g_FubenPerTime)
				x700302_AppointPlayerToDetonate(varMap, monsterId, x700302_g_CurseDistance, x700302_g_PlayerDetonate_EffectID)
				x700302_g_CurseState = 0
				x700302_g_LastTick = x700302_g_MAX
			end

		elseif 2 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
		elseif 3 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
		elseif 4 == x700302_g_BossInfoTbl[iBossIndex+1].BossStep then
			if 1 == x700302_g_BossAngryFlag and nowTickCount*x700302_g_FubenPerTime >= x700302_g_AngryTick * x700302_g_FubenPerTime + x700302_g_AngryTime then
				SendSpecificImpactToUnit(varMap, monsterId, monsterId, monsterId, x700302_g_AngryAttacct, 0)
				SendSpecificImpactToUnit(varMap, monsterId, monsterId, monsterId, x700302_g_AngryDefend, 0)
				LuaAllScenceM2Wrold(varMap,"boss已经狂暴", 5, 1)
				x700302_g_BossAngryFlag = 2
			end
		end
	end
end

function x700302_KickSomeOneOut(varMap)
	local nCount = GetFuben_PlayerCount(varMap)
	local iFubenGroupId = GetFubenData_Param(varMap, x700302_CSP_GROUPID)
	
	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		local nPlayerGuid = ObjId2Guid(varMap, nPlayerId)

		if GetGroupId(varMap, nPlayerId) < 0 or iFubenGroupId ~= GetGroupId(varMap, nPlayerId) then
			if nil == x700302_g_LevFubenFlagTbl[nPlayerGuid] then
				x700302_g_LevFubenFlagTbl[nPlayerGuid] = {}
				x700302_g_LevFubenFlagTbl[nPlayerGuid] = nowTickCount
				x700302_ShowTips(varMap, nPlayerId, format("您不在团队中，将在%u秒后传出副本", x700302_g_KickOutTime))
			elseif x700302_g_LevFubenFlagTbl[nPlayerGuid]*x700302_g_FubenPerTime + x700302_g_KickOutTime  < nowTickCount * x700302_g_FubenPerTime  then
				x700302_g_LevFubenFlagTbl[nPlayerGuid] = nil
        RelivePlayerNM(varMap,nPlayerId,2) --如果玩家处于死亡状态，自动复活
        SetPlayerMutexState(varMap,nPlayerId,PLAYER_STATE_DIE,0) 
        TimerCommand(varMap, nPlayerId, 1, 7010, 3, x700302_g_ScriptId, -1, -1)
        local pos = x700302_g_BackPos[random(1, 6)]
        local nBackSceneId = GetFubenData_Param(varMap, x700302_CSP_BACKSCENEID)
        NewWorld(varMap, nPlayerId, nBackSceneId, pos[1], pos[2], x700302_g_ScriptId)
			end
		elseif nil ~= x700302_g_LevFubenFlagTbl[nPlayerGuid] then
			x700302_g_LevFubenFlagTbl[nPlayerGuid] = nil
		end
	end
end
