-- 团队副本 角斗场
------------------------------------------------------------------
x700300_g_ScriptId			=	700300
---------------------------------------------
--# define 0-20 for common,  240-255 for common
-----------------------------------------------
x700300_CSP_FUBENTYPE				= 	0
x700300_CSP_SCRIPTID				=	1
x700300_CSP_TICKCOUNT				= 	2
x700300_CSP_BACKSCENEID				= 	3
x700300_CSP_ISCLOSING				= 	4
x700300_CSP_LEAVECOUNTDOWN			= 	5
x700300_CSP_TEAMID					=	6
x700300_CSP_TICKTIME				=	7
x700300_CSP_HOLDTIME				=	8
x700300_CSP_FUBENLEVEL				=	9
x700300_CSP_FUBEN_SCENE_ID			=	10
x700300_CSP_CLOSETICK				=	11
x700300_CSP_TICKCOUNT_ADD			=	12
x700300_CSP_TICKCOUNT_SUB			=	13
x700300_CSP_B_TOPLIST_ABLE			=	14
x700300_CSP_PLAYER_DEAD				=	15
x700300_CSP_FUBEN_KIND				=	16  --现仅针对轮回台副本
x700300_CSP_XINSHOU_FLAG			=   17  --新手模式，现仅针对轮回台副本

------------------------------------------------------
x700300_CSP_BOSS_INDEX				= 30 -- boss编号,记录当前boss索引
x700300_CSP_LASTBOSS_DEAD		=	31	-- 标识最后一个boss是否死亡
x700300_CSP_CALLRANDOM = 32 -- 空四位用于记录被点名点中的玩家
x700300_CSP_POTALSTATE = 33 -- 标识主城门关闭状态 0:原始状态（开）1:开 2:关
------------------------------------------------------


------------------------------------------------------
x700300_CSP_HUMAN_COUNT				=	240
x700300_CSP_PLAYER_ENTER_START		=	241
x700300_CSP_LAST_TICKOUNT			=	247
x700300_CSP_GUID_START        = 248  --空6个
x700300_CSP_FUBEN_TYPE				=	254	--试练，普通，英雄，三种类型 0 -- 普通 1 -- 试练 2 -- 英雄 3 -- 团队副本
x700300_CSP_FUBEN_MODE				= 255

--------------------------------------------------------------
------------ 256 ~ 384 一共128个索引给团队副本----------------
------------ 256 ~ 319 用于场景与副本交互的公共数据段---------
x700300_CSP_GROUPID						= 256  -- 团对 ID
x700300_CSP_GROUP_GUID_START  = 257  -- 257 ~ 292 位给团队副本
--------------------------------------------------------------

x700300_g_CenterX 					= 126	-- 角斗场中央X坐标
x700300_g_CenterZ					  = 126	-- 角斗场中央Y坐标
x700300_g_Potal 					  = 1	-- 主城门
x700300_g_FirstDoor 				= 2 -- 关boss的第一扇门
x700300_g_SecondDoor				= 3	-- 关boss的第二扇门
x700300_g_ThirdDoor					= 4 -- 关boss的第三扇门

x700300_g_LastBossIndex			= 6	-- 最后一个boss序列号

x700300_g_FubenPerTime = 5000 -- 副本每次刷新的时间间隔（毫秒)
x700300_g_KickOutTime = 30000 -- 团队解散或非成员被踢出前倒计时时间（毫秒）

x700300_g_AngryTime = 300000 -- boss狂暴时间（5分钟）





x700300_g_CallRamdomDistance = 30 -- 点名距离
x700300_g_CallRamdomBlastDistance = 10 -- 爆炸距离

x700300_g_TimeBeforeCallRamdom = 5000 -- 点名前的提示时间（毫秒）
x700300_g_TimeBeforeCallRamdomBlast = 5000 -- 爆炸前的提示时间（毫秒）

x700300_g_MAX = 65536

--各boss各阶段阶段点名概率
x700300_g_CurseRate = {
											{0,15,20,25},
											{0,0,0,0},
											{0,0,0,0},
											{0,18,25,28},
											{0,0,0,0},
											{0,0,0,0},
											{0,15,0,0},
}

--4个阶段 点名数目,召唤怪兽数目(未使用)，陨石坑数目						
x700300_g_CurseNum = {
											{0,1,2,4},
											{0,3,6,10},
											{0,1,1,2},
											{0,2,4,4},
											{0,3,6,10},
											{0,1,1,2},
											{0,4,10,2},
}

--各boss各阶段掉陨石的概率
x700300_g_AeroLiteRate = {
											{0,0,0,0},
											{0,0,0,0},
											{0,15,20,25},
											{0,0,0,0},
											{0,0,0,0},
											{0,15,20,25},
											{0,0,0,20},
}

--血量用于区分boss阶段
x700300_g_BossHpStep = { 
							{80,50,20},
							{80,50,20},
							{80,50,20},
							{80,50,20},
							{80,50,20},
							{80,50,20},
							{95,70,40},
}

x700300_g_LevFubenFlagTbl = {}	--标识玩家是否离开团队
x700300_g_BossInfoTbl = {} 			--标识信息

-----------------------------------------------------boss技能--------------------------------------
x700300_g_AngryBuff = 8900  	-- boss狂暴时增加的攻击技能
x700300_g_CallRamdonBuff = 8903
x700300_g_CallRamdonBlastBuff =	8903			-- 爆炸
x700300_g_AerLiteBuff =	3235			-- 陨石伤害
x700300_g_HideBuff = 19010			-- 隐身技能

x700300_g_EnterNPC         = {type =55105,guid =150600,x = 130, z=85, facedir =180, title = ""}
x700300_g_SubmitNPC         = {type =55106,guid =150601,x = 100, z=100, facedir =180, title = ""}

-- 点npc时显示挑战几号房间
x700300_g_SelectRoomMenu = {"挑战%u号房间"}
x700300_g_BackMenu = {"回到角斗场入口场景", "确定", "副本完成，返回角斗场入口场景"}
x700300_g_BackInfo = "\t你确认要离开此副本，返回角斗场入口场景吗？"

-- 点击房间进入下一级界面时的npc界面文字描述
x700300_g_RoomBossInfo = {"挑战1号房间boss", "挑战2号房间boss", "挑战3号房间boss"}

-- 返回设置,团队副本最多有12人，所以配置12对坐标
x700300_g_BackPos = {
		{ 128,128 },
		{ 125,127 },
		{ 131,127 },
		{ 131,130 },
		{ 127,130 },
		{ 123,129 },
}

x700300_g_RelivePos = {
		{ 126,60 },
		{ 126,54 },
		{ 119,48 },
		{ 116,42 },
		{ 136,53 },
		{ 112,34 },
}

x700300_g_BlockArea= {
		{left=108,top=18,right=147,bottom=57},
		{left=118,top=57,right=140,bottom=67},
}

x700300_g_MD = {
	[0]={mdProc =MD_FUBEN_GROUP_JUEDOUCHANG_PROCESS, mdWeek = MD_FUBEN_GROUP_JUEDOUCHANG_WEEK},
	[1]={mdProc =MD_FUBEN_GROUP_JY_JUEDOUCHANG_PROCESS,mdWeek = MD_FUBEN_GROUP_JY_JUEDOUCHANG_WEEK},
}

function x700300_GetFubenIndex(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_FUBEN_TALK_INDEX[1], MD_FUBEN_TALK_INDEX[2], MD_FUBEN_TALK_INDEX[3])
end

function x700300_SetCurrentBossIndex(varMap, varCostnmode)
	local nProc = -1
	local leaderguid = GetFubenData_TeamLeader(varMap)
	local leaderObjId = Guid2ObjId(varMap, leaderguid)
	local MD_PROC = x700300_g_MD[varCostnmode].mdProc
	
	if nil == MD_PROC then
		WriteLog(1, "x700300_SetCurrentBossIndex get MD failed")
		return
	end

	local leaderProcess = GetPlayerGameData(varMap, leaderObjId, MD_PROC[1], MD_PROC[2], MD_PROC[3])
	local leaderBitProc = BitCount(leaderProcess)

	WriteLog(1, format("x700300_SetCurrentBossIndex md [1] = %d md [2] =%d md [3] =%d leaderBitProc = %d", MD_PROC[1], MD_PROC[2],
						MD_PROC[3], leaderBitProc))

	SetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX, leaderBitProc-1)
end

function x700300_SaveGroupSelfFubenProcess(varMap, bossid, nBitIndex, nValue)
	local varCostnmode = GetFubenData_Param(varMap, x700300_CSP_FUBEN_MODE)
	local MD_PROC = x700300_g_MD[varCostnmode].mdProc
	local MD_WEEK = x700300_g_MD[varCostnmode].mdWeek

	if nil == MD_PROC or nil == MD_WEEK then
		WriteLog(1, "x700300_SaveGroupSelfFubenProcess get MD failed")
		return
	end

	if tonumber(nBitIndex) < tonumber(MD_PROC[2]) or tonumber(nBitIndex) > tonumber(MD_PROC[2]) + tonumber(MD_PROC[3]) then
		WriteLog(1, "x700300_SaveGroupSelfFubenProcess nBitIndex = "..nBitIndex.."error")
		return
	end

	if 0 ~= tonumber(nValue) and 1 ~= tonumber(nValue) then
		WriteLog(1, "nValue = "..nValue.."error")
		return
	end

	local nCount = GetFuben_PlayerCount(varMap)
	local curWeekIndex = GetWeekIndex()
	local msgLogWeek = "MDWEEK[1] = "..MD_WEEK[1].."MDWEEK[2] = "..MD_WEEK[2].."MDWEEK[3] = "..MD_WEEK[3]

	msgLogWeek = msgLogWeek..curWeekIndex
	WriteLog(1, msgLogWeek)

	for i = 0, nCount-1 do 	-- 为玩家保存副本进度
		local nPlayerId = GetFuben_PlayerObjId(varMap, i)
		local nPlayerGuid = ObjId2Guid(varMap, nPlayerId)

		WriteLog(1, "x700300_SaveSelfFubenProc nPlayerGuid ="..nPlayerGuid.."nBitIndex ="..nBitIndex.."nValue = "..nValue.."MD[1] ="..MD_PROC[1])
		SetPlayerGameData(varMap, nPlayerId, MD_WEEK[1], MD_WEEK[2], MD_WEEK[3], curWeekIndex)
		SetPlayerGameDataBit(varMap, nPlayerId, MD_PROC[1], 32 - MD_PROC[2] - nBitIndex-1, nValue)
	end

	if nCount > 0 then	-- 为团队保存副本进度
		local nPlayerId =  GetFuben_PlayerObjId(varMap, 0)
		local nProcess = GetPlayerGameData(varMap, nPlayerId, MD_PROC[1], MD_PROC[2], MD_PROC[3])
		local varIndex = x700300_GetFubenIndex(varMap, nPlayerId)
		local igroupId = GetFubenData_Param(varMap, x700300_CSP_GROUPID)

		WriteLog(1, format("x700300_SaveGroup Process PlayerMD[1] = %d  PlayerMD[1] = %d PlayerMD[1] = %d Proc = %d", MD_PROC[1]
						, MD_PROC[2], MD_PROC[3], nProcess))

		SetGroupFubenProcess(varMap, nPlayerId, igroupId, varIndex, nProcess)
	end
end

-- 当副本创建成功时, (初始化操作在这进行)
function x700300_ProcFubenSceneCreated(varMap)
	SetFubenData_Param(varMap, x700300_CSP_LASTBOSS_DEAD, 0)
	SetFubenData_Param(varMap, x700300_CSP_POTALSTATE, 1)

	x700300_CreateNpc(varMap, 0)

	local nCostnmode = GetFubenData_Param(varMap, x700300_CSP_FUBEN_MODE)

	x700300_SetCurrentBossIndex(varMap, nCostnmode)

	local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX)
	x700300_CreateBoss(varMap, iBossIndex+1)				-- 创建没挑战过的BOSS
	x700300_g_FubenPerTime = GetFubenData_Timer(varMap)
	if iBossIndex+1 <= x700300_g_LastBossIndex then
		LuaThisScenceM2Wrold (varMap,"团队副本开始", 5, 1)
	end
end

-- 副本心跳接口
function x700300_EnterTick(varMap, nowTickCount)
	local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX)
	local objId = -1
	local step = -1

	if tonumber(iBossIndex) >= 0 then
		if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
			objId = x700300_g_BossInfoTbl[iBossIndex+1].BossId
			step = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end
	end

	--1)根据boss仇恨度改变主城门关闭状态
	x700300_ChangeThePotalState(varMap, objId) 

	-- 2)判断玩家是否离开团队,是则在30秒后跳请离团队副本
	x700300_KickSomeOneOut(varMap, nowTickCount)

	if tonumber(-1) == tonumber(objId) then
		return
	end

	-- 3)前面6只boss会寻路到中央
	if iBossIndex < x700300_g_LastBossIndex and objId ~= nil and objId ~= -1 and step == -1 then
		local x,z = GetWorldPos(varMap,objId)
		if tonumber(x-x700300_g_CenterX)* tonumber(x-x700300_g_CenterX) + tonumber(z-x700300_g_CenterZ)*tonumber(z-x700300_g_CenterZ) < 36 then
			NpcTalk(varMap, objId, "开始战斗！",  -1)
			SetRevPos(varMap,objId,x,z)
		 	SetPatrolId(varMap, objId, -1)
		  SetMonsterCamp(varMap,objId,21)
		  x700300_CloseTheDoor(varMap, iBossIndex)
		  -- 进入BOSS 第一阶段
		 if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
			x700300_g_BossInfoTbl[iBossIndex+1].BossStep  = 0
		 end
		end
	end

	-- 4)最后一只boss 进入第一阶段
	if iBossIndex == x700300_g_LastBossIndex  and objId ~= nil and objId ~= -1 and step == -1 then
		 if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
			x700300_g_BossInfoTbl[iBossIndex+1].BossStep  = 0
		 end
	end

	-- 4)切换boss状态转换
	x700300_ChangeBossState(varMap, objId, iBossIndex, nowTickCount)

	--5)boss在不同状态下应对各种事件的处理
	x700300_ProcessMonsterEvent(varMap, objId, iBossIndex, nowTickCount)

end

-- 显示房间号
function x700300_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)
	local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX) + 1  --此次要打的boss索引
	local iRoomNum = 0
	local bLaBsDead = GetFubenData_Param(varMap,x700300_CSP_LASTBOSS_DEAD)

	if tonumber(iBossIndex) < tonumber(x700300_g_LastBossIndex) then
		-- 处于选择房间打boss阶段
		iRoomNum = iBossIndex - floor(iBossIndex/3)*3 + 1

		local item = format(x700300_g_SelectRoomMenu[1],iRoomNum)

		if nil == item then 
			WriteLog(1,"nil == item")
			do return end
		end

		TalkAppendButton(varMap, x700300_g_ScriptId, item, 0, 1)
		TalkAppendButton(varMap, x700300_g_ScriptId, x700300_g_BackMenu[1], 0, 2)
	elseif 0 == bLaBsDead then
		-- 处于最后一个boss阶段不需要显示挑战房间
		TalkAppendButton(varMap, x700300_g_ScriptId, x700300_g_BackMenu[1], 0, 2)
	elseif 1 == bLaBsDead then
		--  最后一个boss死亡，副本完成
		TalkAppendButton(varMap, x700300_g_ScriptId, x700300_g_BackMenu[3], 0, 3)
	end
end

-- 选择进入房间
function x700300_ProcEventEntry(varMap, varPlayer, NPCId,varScriptFileId, varIndex)
	if varIndex == 1 then
		local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX) + 1 --此次要打的boss索引
		local iRoomNum = 0

		iRoomNum = iBossIndex - floor(iBossIndex/3)*3 + 1

		StartTalkTask(varMap)
		TalkAppendString(varMap,x700300_g_RoomBossInfo[iRoomNum])
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, NPCId, x700300_g_ScriptId, -1);
	elseif varIndex == 2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x700300_g_BackInfo)
		TalkAppendButton(varMap, x700300_g_ScriptId, x700300_g_BackMenu[2],0,3)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, NPCId)
	elseif varIndex == 3 then
		TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
    TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
    local pos = x700300_g_BackPos[random(1, 6)]
		NewWorld( varMap, varPlayer, 50, pos[1], pos[2], x700300_g_ScriptId)
	end
end

-- 确定进入房间
function x700300_ProcAccept(varMap, varPlayer)
-- 是否需要判断只有团长才能点确定
	local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX) + 1 -- 此次要打的boss索引
	local nBossId = -1

	if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
		nBossId = x700300_g_BossInfoTbl[iBossIndex+1].BossId
	end

	if -1 == nBossId then
		WriteLog(1,"nBossId error")
		return
	end

	SetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX, iBossIndex)
	x700300_OpenTheDoor(varMap, iBossIndex)
	SetPatrolId(varMap, nBossId, 0)
end

---------------------------------------------------------------------------------------------------
--申请进入副本
---------------------------------------------------------------------------------------------------
function x700300_ProcAcceptCheck( varMap, varPlayer, NPCId )
	local iFubenGroupId = GetFubenData_Param(varMap, x700300_CSP_GROUPID)
	local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX)
	local objId = -1

	if tonumber(iBossIndex) >= 0 then
		if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
			objId = x700300_g_BossInfoTbl[iBossIndex+1].BossId
		end
	end

	if GetGroupId(varMap, varPlayer) < 0 or iFubenGroupId ~= GetGroupId(varMap, varPlayer) then
	  x700300_ShowTips(varMap, varPlayer, "您的团队已被解散")
  	return 0
	end
	
	if IsGroupLeader(varMap, varPlayer) <= 0 then
  	x700300_ShowTips(varMap, varPlayer, "您不是团长")
  	return 0
  end

 	if tonumber(objId) < 0 then
 		return 1
 	else
 		x700300_ShowTips(varMap, varPlayer, "当前boss没死亡，不能挑战下一个boss！")
 		return 0
 	end
end

-- 玩家进入
function x700300_ProcPlayerEnter(varMap,varPlayer)
	local potalState = tonumber(GetFubenData_Param(varMap, x700300_CSP_POTALSTATE))

	if tonumber(2) == potalState then
		x700300_ClosePotal(varMap)
		AddSceneTempImpassable(varMap,118,67,140,72)			--置障碍
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x700300_g_HideBuff, 0)
	end
end

-- 进入区域
function x700300_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId)
	
end

--离开区域
function x700300_ProcAreaLeaved(varMap, varPlayer, zoneId, MissionId)

end

--区域定时器
---------------------------------------------------------------------------------------------------
function x700300_ProcTiming(varMap, varPlayer, ScriptId, MissionId)

end

-- 死亡通知
function x700300_ProcDie(varMap, varMonsterId, killerId)
	local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX)
	local BossId = -1

	if tonumber(iBossIndex) >= 0 then
		if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
			BossId = x700300_g_BossInfoTbl[iBossIndex+1].BossId
		end
	end
	
	-- 死亡的是召唤的小怪
	if tonumber(BossId) ~= tonumber(varMonsterId) then
		return
	end

	x700300_SaveGroupSelfFubenProcess(varMap, bossid, iBossIndex, 1)
	x700300_g_BossInfoTbl[iBossIndex+1] = nil

	if tonumber(BossId) == tonumber(varMonsterId) then
				-- 第1只BOSS死亡
			if tonumber(0) == tonumber(iBossIndex) then
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS1")
				-- 第2只BOSS死亡
			elseif tonumber(1) == tonumber(iBossIndex) then
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS2")
			elseif tonumber(2) == tonumber(iBossIndex) then
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS3")
				x700300_CreateBoss(varMap, iBossIndex+1) -- 创建下一轮boss
			elseif tonumber(3) == tonumber(iBossIndex) then
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS4")
			elseif tonumber(4) == tonumber(iBossIndex) then
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS5")
			elseif tonumber(5) == tonumber(iBossIndex) then
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS6")
				x700300_CreateBoss(varMap, iBossIndex+1) -- 创建最后一个boss
			elseif tonumber(x700300_g_LastBossIndex) == tonumber(iBossIndex) then
				-- 最后一个boss死亡
				x700300_ShowTipsToAll(varMap, "顺利击杀BOSS7,副本完成")
				SetFubenData_Param(varMap, x700300_CSP_LASTBOSS_DEAD, 1)
				x700300_CreateNpc(varMap, 1)
			end
	end
end

--通知所有玩家
function x700300_ShowTipsToAll(varMap, str)
	local humancount = GetFuben_PlayerCount(varMap)

	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i)
		Msg2Player(varMap, humanId, str, 8, 3)
	end
end

function x700300_ShowTips(varMap, varPlayer, str)
	StartTalkTask(varMap);
	TalkAppendString(varMap,str);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700300_CreateNpc(varMap, varFlag)
	local npc = x700300_g_EnterNPC
	
	if 1 == varFlag then
		npc = x700300_g_SubmitNPC
	end

	local NpcId = -1
	if npc.title~= "" then
		NpcId = CreateMonster(varMap, npc.type, npc.x, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		NpcId = CreateMonster(varMap, npc.type, npc.x, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end

	if NpcId ~= -1 and 0 == varFlag then
		local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX)
		if iBossIndex ~= x700300_g_LastBossIndex then
			NpcTalk(varMap, NpcId, "选择房间，回圈挑战BOSS！",  -1)
		end
	end
end

---------------------------------------------------------------------------------------------------
--召唤小怪
---------------------------------------------------------------------------------------------------
function x700300_SummonMonster(varMap, iBossIndex, varSummonFlag)
	local fubenmode = GetFubenData_Param(varMap, x700300_CSP_FUBEN_MODE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700300_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID( x700300_g_ScriptId)
	local varX,varZ = GetWorldPos(varMap, x700300_g_BossInfoTbl[iBossIndex+1].BossId)

	for i = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x1,z1,r,ai,aiscript,flag,flag1,flag2,flag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700300_g_ScriptId,nIndexFrom,i)
		if idScript == x700300_g_ScriptId and tonumber(0) == tonumber(monsterFlag) and tonumber(flag) == tonumber(iBossIndex) 
				and tonumber(flag3) == tonumber(fubenmode) and tonumber(varSummonFlag) == tonumber(flag2) then

			for j=1, varCount do
				local rx = random(-r,r)
				local varX = varX + rx
				local rz = random(-r,r)
				local varZ = varZ + rz
				local nMonsterID = 0

				if title ~="" then
					nMonsterID = CreateMonster(varMap, type, varX, varZ, ai, aiscript, x700300_g_ScriptId, -1, 21,-1,facedir, "",title)
				else
					nMonsterID = CreateMonster(varMap, type, varX, varZ, ai, aiscript, x700300_g_ScriptId, -1, 21,-1,facedir)
				end

				if nMonsterID > 0 then
					if tonumber(1) == tonumber(varSummonFlag) then
						x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_1[j] = nMonsterID
					end

					if tonumber(2) == tonumber(varSummonFlag) then
						x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[j] = nMonsterID
					end

					if tonumber(3) == tonumber(varSummonFlag) then
						x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_3[j] = nMonsterID
					end
				end
			end
    end
	end
end

-- boss变形
function x700300_ChangeBoss1Form(varMap, iBossIndex, varformFlag)
	local fubenmode = GetFubenData_Param(varMap, x700300_CSP_FUBEN_MODE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700300_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID( x700300_g_ScriptId)
	local varX,varZ = GetWorldPos(varMap, x700300_g_BossInfoTbl[iBossIndex+1].BossId)
	local incHp = GetHp(varMap, x700300_g_BossInfoTbl[iBossIndex+1].BossId) - GetMaxHp(varMap, x700300_g_BossInfoTbl[iBossIndex+1].BossId)

	--WriteLog(1, "x700300_ChangeBoss1Form varformFlag:"..varformFlag.."incHp ="..incHp.."iBossIndex="..iBossIndex)

	for i = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x1,z1,r,ai,aiscript,flag,flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700300_g_ScriptId,nIndexFrom,i)

		if idScript == x700300_g_ScriptId and 1 == monsterFlag and tonumber(flag) == tonumber(iBossIndex) 
				and tonumber(flag3) == tonumber(fubenmode) and tonumber(varformFlag) == tonumber(flag2) then
			local nMonsterID = 0

			if title ~="" then
				nMonsterID = CreateMonster(varMap, type, varX, varZ, ai, aiscript, x700300_g_ScriptId, -1, 21,-1,facedir, "",title)
			else
				nMonsterID = CreateMonster(varMap, type, varX, varZ, ai, aiscript, x700300_g_ScriptId, -1, 21,-1,facedir)
			end

			if nMonsterID > 0 then
				SetHp(varMap, nMonsterID, incHp)
				DeleteMonster(varMap, x700300_g_BossInfoTbl[iBossIndex+1].BossId)
				x700300_g_BossInfoTbl[iBossIndex+1].BossId = nMonsterID

				if tonumber(0) == tonumber(varformFlag) then
					SetPatrolId(varMap, nMonsterID, 3)
				end

				break
			end
    end
	end
end

-- 创建Boss
function x700300_CreateBoss(varMap, iBossIndex)
	local fubenmode = GetFubenData_Param(varMap, x700300_CSP_FUBEN_MODE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700300_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID( x700300_g_ScriptId)

	local nextboss1 = -2
	local nextboss2 = -2

	if x700300_g_LastBossIndex ~= iBossIndex then
		if mod(iBossIndex,3) == 0 then
			nextboss1 = iBossIndex +1
			nextboss2 = iBossIndex +2
		elseif mod(iBossIndex,3) == 1 then
			nextboss1 = iBossIndex +1
		end
	end

	for i = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x1,z1,r,ai,aiscript,flag,flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700300_g_ScriptId,nIndexFrom,i)
		if idScript == x700300_g_ScriptId and 1 == monsterFlag and (flag == iBossIndex or flag == nextboss1 or flag == nextboss2) 
					and tonumber(flag3) == tonumber(fubenmode) and tonumber(0) == tonumber(flag2) then
			local nMonsterID = 0
			if title ~="" then
				nMonsterID = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700300_g_ScriptId, -1, 21,-1,facedir, "",title)
			else
				nMonsterID = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700300_g_ScriptId, -1, 21,-1,facedir)
			end

			if nMonsterID > 0 then
				if nil == x700300_g_BossInfoTbl[flag+1] then
					x700300_g_BossInfoTbl[flag+1] = {}
				end

				x700300_g_BossInfoTbl[flag+1].BossId = nMonsterID
				x700300_g_BossInfoTbl[flag+1].BossStep = -1
				x700300_g_BossInfoTbl[flag+1].AngryFlg = -1
				x700300_g_BossInfoTbl[flag+1].Form = 0
				x700300_g_BossInfoTbl[flag+1].SummonFlag = 0

				if tonumber(1) == tonumber(flag) or tonumber(4) == tonumber(flag) or tonumber(6) == tonumber(flag) then
					x700300_g_BossInfoTbl[flag+1].SummonMonsterId_1 = {}
					x700300_g_BossInfoTbl[flag+1].SummonMonsterId_2 = {}
					x700300_g_BossInfoTbl[flag+1].SummonMonsterId_3 = {}
					
					for j = 1, x700300_g_CurseNum[flag+1][2] do
						x700300_g_BossInfoTbl[flag+1].SummonMonsterId_1[j] = -1
					end

					for j = 1, x700300_g_CurseNum[flag+1][3] do
						x700300_g_BossInfoTbl[flag+1].SummonMonsterId_2[j] = -1
					end

					for j = 1, x700300_g_CurseNum[flag+1][4] do
						x700300_g_BossInfoTbl[flag+1].SummonMonsterId_3[j] = -1
					end
				end

				--WriteLog(1,"create Success flag="..tonumber(iBossIndex).."bossid"..x700300_g_BossInfoTbl[flag+1].BossId)

				if tonumber(x700300_g_LastBossIndex) == tonumber(iBossIndex) then
					SetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX, iBossIndex)
					NpcTalk(varMap, nMonsterID, "最后的boss现身！",  -1)
				end

				if iBossIndex < x700300_g_LastBossIndex then
					SetMonsterCamp(varMap,nMonsterID,-1)
				end
			end
    end
	end
end

--创建Monster
function x700300_CreateMonster(varMap, step)
end

--创建现金boss
function x700300_CreateXianJinBoss(varMap)
end

--------------------------------------------------------------------
--随机点名
--------------------------------------------------------------------
function x700300_CallRamdom(varMap, objId, distance, buffId, varNum)
	if -1 == objId then
		return
	end

	local x,z = GetWorldPos(varMap, objId)
	local Sum =  GetNearPlayerCountForMonster(varMap, objId, x, z, distance)
	local d = floor(Sum/varNum)

	if tonumber(Sum) > 0 and tonumber(varNum) > 0 then
		-- 清除上次被点中名单
		for k=0, 3 do
			SetFubenData_Param(varMap, x700300_CSP_CALLRANDOM+k, -1)
		end

		local CallName =""
		--WriteLog(1, "Sum="..Sum.."varNum="..varNum.."d="..d)
		if d < 1 then
			for j =0, Sum-1 do
				local humanObjId = GetNearPlayerMemberForMonster(varMap, objId, j)
				if humanObjId ~= -1 then
					local humanObjName = GetName(varMap, humanObjId)
					SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffId, 0)
					CallName = CallName.."#R"..humanObjName.." "
					-- 标识被点中玩家id
					SetFubenData_Param(varMap, x700300_CSP_CALLRANDOM+j, humanObjId)
				end
			end
		else
			for i=1, varNum do
				local RandomIndex = random((i-1)*d,i*d-1)
				local humanObjId = GetNearPlayerMemberForMonster(varMap, objId, RandomIndex)
	
				if humanObjId ~= -1 then
					local humanObjName = GetName(varMap, humanObjId)
					SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buffId, 0)
					CallName = CallName.."#R"..humanObjName.." "
					-- 标识被点中玩家id
					SetFubenData_Param(varMap, x700300_CSP_CALLRANDOM+i-1, humanObjId)
				end
		 end
		end

	 if "" ~= CallName then
	 		LuaThisScenceM2Wrold (varMap,CallName.."#Y".."已经被boss点中，5秒后爆炸，你们会因他而受到伤害", 5, 1)
	 end
	end
end

--------------------------------------------------------------------
--点名后爆炸
--------------------------------------------------------------------
function x700300_CallRamdomBlast(varMap, distance)
	for i=0,3 do
		local varPlayer = GetFubenData_Param(varMap, x700300_CSP_CALLRANDOM+i)

		if tonumber(-1) == tonumber(varPlayer) then
			break
		end

		local varX,z = GetWorldPos(varMap,varPlayer)
		local humancount = GetNearPlayerCount(varMap,varPlayer,varX,z,distance)

		if humancount <= 0 then
			break
		end

		if tonumber(IsPlayerStateNormal(varMap,varPlayer)) == tonumber(1) then
			local hp = GetHp(varMap, varPlayer)
			SetHp(varMap, varPlayer, -floor(hp*0.5+1))
		end

		for	varI = 0, humancount - 1 do
			local humanId = GetNearPlayerMember(varMap,varPlayer, varI)
			if IsPlayerStateNormal(varMap,humanId) == 1 and tonumber(humanId) ~=  tonumber(varPlayer) then
			local hp = GetHp(varMap, humanId)
			SetHp(varMap, humanId, -hp)
			end
		end
	end
end

-------------------------------------------------------
--掉陨石
-------------------------------------------------------
function x700300_DropAeroLiteToPlayer(varMap, varMonsterId, varBuffId, varNum)
	-- 掉陨石
	local humanId1, humanId2, humanId3 = GetBossThreatPlayerId(varMap, varMonsterId)

	if tonumber(1) == tonumber(varNum) then
		if nil ~= humanId1 and tonumber(-1) ~= tonumber(humanId1) then
			SendSpecificImpactToUnit(varMap, humanId1, humanId1, humanId1, varBuffId, 0)
		end
	elseif tonumber(2) == tonumber(varNum) then
		if nil ~= humanId1 and tonumber(-1) ~= tonumber(humanId1) then
			SendSpecificImpactToUnit(varMap, humanId1, humanId1, humanId1, varBuffId, 0)
		end

		if nil ~= humanId2 and tonumber(-1) ~= tonumber(humanId2) then
			SendSpecificImpactToUnit(varMap, humanId2, humanId2, humanId2, varBuffId, 0)
		end
	elseif tonumber(3) == tonumber(varNum) then
		if nil ~= humanId1 and tonumber(-1) ~= tonumber(humanId1) then
			SendSpecificImpactToUnit(varMap, humanId1, humanId1, humanId1, varBuffId, 0)
		end

		if nil ~= humanId2 and tonumber(-1) ~= tonumber(humanId2) then
			SendSpecificImpactToUnit(varMap, humanId2, humanId2, humanId2, varBuffId, 0)
		end
		
		if nil ~= humanId3 and tonumber(-1) ~= tonumber(humanId3) then
			SendSpecificImpactToUnit(varMap, humanId3, humanId3, humanId3, varBuffId, 0)
		end
	end
end

function x700300_CloseTheDoor(varMap, iBossIndex)
	if iBossIndex >= x700300_g_LastBossIndex then
		return
	end

	local ndoorId = -1

	if 0 == mod(iBossIndex,3) then
		ndoorId =  x700300_g_FirstDoor
	elseif 1 == mod(iBossIndex,3) then
		ndoorId = x700300_g_SecondDoor
	elseif 2 == mod(iBossIndex,3) then
		ndoorId = x700300_g_ThirdDoor
	end

	if -1 == ndoorId then
		return
	end

	local nCount = GetFuben_PlayerCount(varMap)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		LuaCallNoclosure(UTILITY_SCRIPT,"StopClientAnimEffect", varMap, nPlayerId, ndoorId)
	end
end

function x700300_ClosePotal(varMap)
	local nCount = GetFuben_PlayerCount(varMap)
	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		LuaCallNoclosure(UTILITY_SCRIPT,"StopClientAnimEffect", varMap, nPlayerId, x700300_g_Potal)
	end
end

function x700300_OpenPotal(varMap)
	local nCount = GetFuben_PlayerCount(varMap)
	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientAnimEffect",varMap, nPlayerId, x700300_g_Potal)
	end
end

function x700300_OpenTheDoor(varMap, iBossIndex)
	if iBossIndex >= x700300_g_LastBossIndex then
		return
	end

	local ndoorId = -1

	if 0 == mod(iBossIndex,3) then
		ndoorId =  x700300_g_FirstDoor
	elseif 1 == mod(iBossIndex,3) then
		ndoorId = x700300_g_SecondDoor
	elseif 2 == mod(iBossIndex,3) then
		ndoorId = x700300_g_ThirdDoor
	end

	if -1 == ndoorId then
		return
	end

	local nCount = GetFuben_PlayerCount(varMap)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientAnimEffect",varMap, nPlayerId, ndoorId)
	end
end

function x700300_ProcPlayerRelive(varMap, playerId, ReliveType)
	if 0 == ReliveType then
		x700300_ShowTips(varMap, playerId, "此副本不能原地复活")
	elseif 2 == ReliveType then
		ClearPlayerNextSceneInfo(varMap,playerId)
		x700300_DoPlayerRelive(varMap,playerId,50,0)
		local pos = x700300_g_RelivePos[random(1, 6)]
		SetPos(varMap,playerId,pos[1],pos[2])

		local iBossIndex = GetFubenData_Param(varMap, x700300_CSP_BOSS_INDEX)
		local BossId = -1

		if tonumber(iBossIndex) >= 0 then
			if nil ~= x700300_g_BossInfoTbl[iBossIndex+1] then
				BossId = x700300_g_BossInfoTbl[iBossIndex+1].BossId
			end
		end

		if -1 ~= BossId and IsTheMonsterHasThreat(varMap, BossId) > 0 then
			SendSpecificImpactToUnit(varMap, playerId, playerId, playerId, x700300_g_HideBuff, 0)
		end
	end
end

---------------------------------------------------------------------------------------------------
--执行玩家复活
---------------------------------------------------------------------------------------------------
function x700300_DoPlayerRelive( varMap, playerId, value, usehorse )
	ClearRageRecoverTick(varMap, playerId)
	RestoreHp(varMap, playerId,value)
	RestoreRage(varMap, playerId,value)
	ClearMutexState(varMap, playerId, 6)
	SendReliveResult(varMap, playerId,1)
	if tonumber(usehorse) == tonumber(1) then
		LastMount(varMap, playerId )
		RestoreHp(varMap, playerId,0)
	end
end

function x700300_ChangeThePotalState(varMap, monsterId)
	local potalState = tonumber(GetFubenData_Param(varMap, x700300_CSP_POTALSTATE))
	if (nil == monsterId or -1 == monsterId) and tonumber(2) == tonumber(potalState) then
		x700300_OpenPotal(varMap)
		SetFubenData_Param(varMap, x700300_CSP_POTALSTATE, 1)
		DelSceneTempImpassable(varMap,118,67,140,72)		--清障碍
		x700300_DelBuffToPlayerInBlockArea(varMap, x700300_g_HideBuff)
	end

	if monsterId ~= nil and tonumber(monsterId) ~= tonumber(-1) then
		if IsTheMonsterHasThreat(varMap, monsterId) > 0 then
			if tonumber(1) == tonumber(potalState) then
				x700300_ClosePotal(varMap)
				SetFubenData_Param(varMap, x700300_CSP_POTALSTATE, 2)
				AddSceneTempImpassable(varMap,118,67,140,72)			--置障碍
				x700300_AddBuffToPlayerInBlockArea(varMap, x700300_g_HideBuff)
			end
		else
			if tonumber(2) == tonumber(potalState) then
			  x700300_OpenPotal(varMap)
				SetFubenData_Param(varMap, x700300_CSP_POTALSTATE, 1)
				DelSceneTempImpassable(varMap,118,67,140,72)				--清障碍
			  x700300_DelBuffToPlayerInBlockArea(varMap, x700300_g_HideBuff)
			end
		end
	end
end

function x700300_ChangeBossState(varMap, monsterId, iBossIndex, nowTickCount)
	if nil == iBossIndex or -1 == iBossIndex or nil == monsterId or -1 == monsterId or nil == varMap or -1 == varMap then
		return
	end

	if -1 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		return
	end

	local Hp = GetHp(varMap, monsterId)
	local fullHp = GetMaxHp(varMap, x700300_g_BossInfoTbl[iBossIndex+1].BossId)
	local curHpRate = floor(Hp*100/fullHp)

	if curHpRate > x700300_g_BossHpStep[iBossIndex+1][1]  then
		x700300_g_BossInfoTbl[iBossIndex+1].BossStep = 0 			-- 第1阶段处理
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = x700300_g_MAX
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2 = x700300_g_MAX
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3 = x700300_g_MAX
	elseif curHpRate <= x700300_g_BossHpStep[iBossIndex+1][1] and curHpRate > x700300_g_BossHpStep[iBossIndex+1][2] then
		x700300_g_BossInfoTbl[iBossIndex+1].BossStep = 1 			-- 第2阶段处理
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2 = x700300_g_MAX
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3 = x700300_g_MAX
	elseif curHpRate <= x700300_g_BossHpStep[iBossIndex+1][2] and curHpRate > x700300_g_BossHpStep[iBossIndex+1][3] then
		x700300_g_BossInfoTbl[iBossIndex+1].BossStep = 2 -- 第3阶段处理
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = x700300_g_MAX
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3 = x700300_g_MAX
	elseif curHpRate <= x700300_g_BossHpStep[iBossIndex+1][3] and tonumber(curHpRate) >= tonumber(0) then
		x700300_g_BossInfoTbl[iBossIndex+1].BossStep = 3 -- 第4阶段处理
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = x700300_g_MAX
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2 = 0
		x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2 = x700300_g_MAX
	end
	
		-- 设置狂暴开始时间
	if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg) == tonumber(-1) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
		x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg = 0
		x700300_g_BossInfoTbl[iBossIndex+1].AngryTick = nowTickCount
	end

	if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg) and tonumber(IsTheMonsterHasThreat(varMap, monsterId)) == tonumber(0) then
		x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg = -1
		x700300_g_BossInfoTbl[iBossIndex+1].AngryTick = x700300_g_MAX
	end

	if tonumber(1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg) and tonumber(IsTheMonsterHasThreat(varMap, monsterId)) == tonumber(0) then
		x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg = -1
		x700300_g_BossInfoTbl[iBossIndex+1].AngryTick = x700300_g_MAX
	end

	--WriteLog(1, "change monsterstate: BossStep = "..x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
end


function x700300_ProcessBoss14Event(varMap, monsterId, iBossIndex, nowTickCount)
		-- 第一阶段
		if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) then
			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep  -- 标识boss此时的形态
			end
		-- 第二阶段
		elseif 1 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
			if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1) then
				if x700300_g_CurseRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
					local strNum = format("5秒过后boss将点名%d人", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
					LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
					x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 1
					x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = nowTickCount
				end
			end

			if tonumber(1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1) 
					and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdom then
				x700300_CallRamdom(varMap, monsterId, x700300_g_CallRamdomDistance, x700300_g_CallRamdonBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 2
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = nowTickCount
			end

			if tonumber(2) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1) 
					and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdomBlast  then
				x700300_CallRamdomBlast(varMap, x700300_g_CallRamdomBlastDistance)
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 0
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = x700300_g_MAX
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end

		-- 第三阶段
		elseif 2 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
			if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2) then
				if x700300_g_CurseRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) then
					local strNum = format("5秒过后boss将点名%d人", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
					LuaThisScenceM2Wrold (varMap,strNum, 5, 1)
					x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2 = 1
					x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2 = nowTickCount
				end
			end

			if tonumber(1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2) 
					and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdom  then
				x700300_CallRamdom(varMap, monsterId, x700300_g_CallRamdomDistance, x700300_g_CallRamdonBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2 = 2
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2 = nowTickCount
			end

			if tonumber(2) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2) 
					and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdomBlast  then
				x700300_CallRamdomBlast(varMap, x700300_g_CallRamdomBlastDistance)
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom2 = 0
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick2 = x700300_g_MAX
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end

		-- 第四阶段
		elseif 3 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
			if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3) then
				if x700300_g_CurseRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) then
					local strNum = format("5秒过后boss将点名%d人", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
					LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
					x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3 = 1
					x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3 = nowTickCount
				end
			end

			if tonumber(1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3) 
					and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdom  then
				x700300_CallRamdom(varMap, monsterId, x700300_g_CallRamdomDistance, x700300_g_CallRamdonBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3 = 2
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3 = nowTickCount
			end

			if tonumber(2) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3) 
					and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdomBlast  then
				x700300_CallRamdomBlast(varMap, x700300_g_CallRamdomBlastDistance)
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom3 = 0
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick3 = x700300_g_MAX
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end
		end
end

function x700300_ProcessBoss25Event(varMap, monsterId, iBossIndex, nowTickCount)
		-- 第一阶段
		if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) then
			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag) then
				x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end

			for i =1, x700300_g_CurseNum[iBossIndex+1][2] do
				if nil ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_1[i])
						and tonumber(-1) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_1[i]) then
					DeleteMonster(varMap, x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_1[i])
					x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_1[i] = -1
				end
			end

			for i =1, x700300_g_CurseNum[iBossIndex+1][3] do
				if nil ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i])
					and tonumber(-1) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i]) then
					DeleteMonster(varMap, x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i])
					x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i] = -1
				end
			end

			for i =1, x700300_g_CurseNum[iBossIndex+1][4] do
				if nil ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_3[i])
					and tonumber(-1) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_3[i]) then
					DeleteMonster(varMap, x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_3[i])
					x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_3[i] = -1
				end
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end
		-- 第二阶段
		elseif 1 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag) then
				x700300_SummonMonster(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag = x700300_g_BossInfoTbl[iBossIndex+1].BossStep  
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)-- 标识boss此时的形态
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end
		-- 第三阶段
		elseif 2 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag) then
				x700300_SummonMonster(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end
		-- 第四阶段
		elseif 3 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag) then
				x700300_SummonMonster(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end

			if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
				x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
				x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
			end
		end
end

function x700300_ProcessBoss36Event(varMap, monsterId, iBossIndex, nowTickCount)
	-- 第一阶段
	if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) then
		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

	-- 第二阶段
	elseif 1 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

		if x700300_g_AeroLiteRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
			local strNum = format("掉落%d颗陨石", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
			LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
			x700300_DropAeroLiteToPlayer(varMap, monsterId, x700300_g_AerLiteBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
		end

	-- 第三阶段
	elseif 2 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

		if x700300_g_AeroLiteRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
			local strNum = format("掉落%d颗陨石", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
			LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
			x700300_DropAeroLiteToPlayer(varMap, monsterId, x700300_g_AerLiteBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
		end

	-- 第四阶段
	elseif 3 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

		if x700300_g_AeroLiteRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
			local strNum = format("掉落%d颗陨石", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
			LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
			x700300_DropAeroLiteToPlayer(varMap, monsterId, x700300_g_AerLiteBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
		end
	end
end

function x700300_ProcessBoss7Event(varMap, monsterId, iBossIndex, nowTickCount)
	-- 第一阶段
	if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) then
		for i =1, x700300_g_CurseNum[iBossIndex+1][3] do
			if nil ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i]) and tonumber(-1) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i]) then
				DeleteMonster(varMap, x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i])
				x700300_g_BossInfoTbl[iBossIndex+1].SummonMonsterId_2[i] = -1
			end
		end

		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag) then
			x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

	-- 第二阶段
	elseif tonumber(1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) then

		if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1) then
			if x700300_g_CurseRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
				local strNum = format("5秒过后boss将点名%d人", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
				LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 1
				x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = nowTickCount
			end
		end

		if tonumber(1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1) 
				and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdom then
			x700300_CallRamdom(varMap, monsterId, x700300_g_CallRamdomDistance, x700300_g_CallRamdonBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
			x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 2
			x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = nowTickCount
		end

		if tonumber(2) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1) 
				and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1*x700300_g_FubenPerTime + x700300_g_TimeBeforeCallRamdomBlast  then
			x700300_CallRamdomBlast(varMap, x700300_g_CallRamdomBlastDistance)
			x700300_g_BossInfoTbl[iBossIndex+1].CallRandom1 = 0
			x700300_g_BossInfoTbl[iBossIndex+1].CallRandomTick1 = x700300_g_MAX
		end

		-- 变形
		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

	-- 第三阶段
	elseif 2 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag) then
			x700300_SummonMonster(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].SummonFlag = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end

	-- 第四阶段
	elseif 3 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		if x700300_g_AeroLiteRate[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1] > random(0,100) and IsTheMonsterHasThreat(varMap, monsterId) > 0 then
			--WriteLog(1,"掉落颗陨石")
			local strNum = format("掉落%d颗陨石", x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
			LuaThisScenceM2Wrold (varMap, strNum, 5, 1)
			x700300_DropAeroLiteToPlayer(varMap, monsterId, x700300_g_AerLiteBuff, x700300_g_CurseNum[iBossIndex+1][x700300_g_BossInfoTbl[iBossIndex+1].BossStep+1])
		end

		if tonumber(x700300_g_BossInfoTbl[iBossIndex+1].BossStep) ~= tonumber(x700300_g_BossInfoTbl[iBossIndex+1].Form) then
			x700300_ChangeBoss1Form(varMap, iBossIndex, x700300_g_BossInfoTbl[iBossIndex+1].BossStep)
			x700300_g_BossInfoTbl[iBossIndex+1].Form = x700300_g_BossInfoTbl[iBossIndex+1].BossStep
		end
	end
end


function x700300_ProcessMonsterEvent(varMap, monsterId, iBossIndex, nowTickCount)
	if nil == iBossIndex or -1 == iBossIndex or nil == monsterId or -1 == monsterId or nil == varMap or -1 == varMap then
		return
	end

	if -1 == x700300_g_BossInfoTbl[iBossIndex+1].BossStep then
		return
	end

	-- 第一个boss
	if tonumber(0) == tonumber(iBossIndex) then
		x700300_ProcessBoss14Event(varMap, monsterId, iBossIndex, nowTickCount)
	elseif tonumber(1) == tonumber(iBossIndex) then
		x700300_ProcessBoss25Event(varMap, monsterId, iBossIndex, nowTickCount) 
	elseif tonumber(2) == tonumber(iBossIndex) then
		x700300_ProcessBoss36Event(varMap, monsterId, iBossIndex, nowTickCount)
	elseif tonumber(3) == tonumber(iBossIndex) then
		x700300_ProcessBoss14Event(varMap, monsterId, iBossIndex, nowTickCount)
	elseif tonumber(4) == tonumber(iBossIndex) then
		x700300_ProcessBoss25Event(varMap, monsterId, iBossIndex, nowTickCount)
	elseif tonumber(5) == tonumber(iBossIndex) then
		x700300_ProcessBoss36Event(varMap, monsterId, iBossIndex, nowTickCount)
	elseif tonumber(6) == tonumber(iBossIndex) then
		x700300_ProcessBoss7Event(varMap, monsterId, iBossIndex, nowTickCount)
	end
	
	
	-- 狂暴
	if tonumber(0) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg) and nowTickCount*x700300_g_FubenPerTime >= x700300_g_BossInfoTbl[iBossIndex+1].AngryTick * x700300_g_FubenPerTime + x700300_g_AngryTime then
		SendSpecificImpactToUnit(varMap, monsterId, monsterId, monsterId, x700300_g_AngryBuff, 0)
		LuaThisScenceM2Wrold(varMap,"boss已经狂暴", 5, 1)
		x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg = 1
	end

	local bSpBuff = IsHaveSpecificImpact(varMap, monsterId, x700300_g_AngryBuff)
	if tonumber(-1) == tonumber(x700300_g_BossInfoTbl[iBossIndex+1].AngryFlg) and tonumber(bSpBuff)>0 then
		CancelSpecificEffect(varMap, monsterId, x700300_g_AngryBuff)
	end
end

function x700300_KickSomeOneOut(varMap, nowTickCount)
	local nCount = GetFuben_PlayerCount(varMap)
	local iFubenGroupId = GetFubenData_Param(varMap, x700300_CSP_GROUPID)

	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		local nPlayerGuid = ObjId2Guid(varMap, nPlayerId)

		if GetGroupId(varMap, nPlayerId) < 0 or iFubenGroupId ~= GetGroupId(varMap, nPlayerId) then
			if nil == x700300_g_LevFubenFlagTbl[nPlayerGuid] then
				x700300_g_LevFubenFlagTbl[nPlayerGuid] = {}
				x700300_g_LevFubenFlagTbl[nPlayerGuid] = nowTickCount
				x700300_ShowTips(varMap, nPlayerId, format("您不在团队中，将在%u秒后传出副本", x700300_g_KickOutTime/1000))
			elseif x700300_g_LevFubenFlagTbl[nPlayerGuid]*x700300_g_FubenPerTime + x700300_g_KickOutTime  < nowTickCount * x700300_g_FubenPerTime  then
				x700300_g_LevFubenFlagTbl[nPlayerGuid] = nil
        RelivePlayerNM(varMap,nPlayerId,2) --如果玩家处于死亡状态，自动复活
        SetPlayerMutexState(varMap,nPlayerId,PLAYER_STATE_DIE,0) 
        TimerCommand(varMap, nPlayerId, 1, 7010, 3, x700300_g_ScriptId, -1, -1)
        local pos = x700300_g_BackPos[random(1, 6)]
        local nBackSceneId = GetFubenData_Param(varMap, x700300_CSP_BACKSCENEID)
        NewWorld(varMap, nPlayerId, nBackSceneId, pos[1], pos[2], x700300_g_ScriptId)
			end
		elseif nil ~= x700300_g_LevFubenFlagTbl[nPlayerGuid] then
			x700300_g_LevFubenFlagTbl[nPlayerGuid] = nil
		end
	end
end

function x700300_AddBuffToPlayerInBlockArea(varMap, buffId)
	local nCount = GetFuben_PlayerCount(varMap)
	
	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		local X, Z = GetWorldPos(varMap, nPlayerId)

		if IsHaveSpecificImpact(varMap, nPlayerId, buffId) <=0 and x700300_IsPointInBlockArea(X, Z) >=1 then
			SendSpecificImpactToUnit(varMap, nPlayerId, nPlayerId, nPlayerId, buffId, 0)
		end
	end
end

function x700300_DelBuffToPlayerInBlockArea(varMap, buffId)
	local nCount = GetFuben_PlayerCount(varMap)
	
	for i = 0, nCount-1 do
		local nPlayerId =  GetFuben_PlayerObjId(varMap, i)
		local X, Z = GetWorldPos(varMap, nPlayerId)

		if IsHaveSpecificImpact(varMap, nPlayerId, buffId) >=1 and x700300_IsPointInBlockArea(X, Z) >=1 then
			CancelSpecificImpact(varMap, nPlayerId, buffId)
		end
	end
end

function x700300_IsPointInBlockArea(varX, varZ)
	if varX >= x700300_g_BlockArea[1].left and varX <= x700300_g_BlockArea[1].right and varZ >= x700300_g_BlockArea[1].top and varZ <= x700300_g_BlockArea[1].bottom then
		return 1
	end

	if varX >= x700300_g_BlockArea[2].left and varX <= x700300_g_BlockArea[2].right and varZ >= x700300_g_BlockArea[2].top and varZ <= x700300_g_BlockArea[2].bottom then
		return 1
	end
	
	return 0
end
