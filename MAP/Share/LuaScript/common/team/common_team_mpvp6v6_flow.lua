----------------------------------------------------------------------------------------------
-- 跨服6V6战场脚本
----------------------------------------------------------------------------------------------

x303110_var_FileId 					=   303110

--------------------------------------------------------------------------------
-- 以下是配置信息，策划可根据需要修改
--------------------------------------------------------------------------------

-- 双方临时阵营
x303110_var_CampFlag					= 	{5, 6}

-- 双方名称
x303110_var_TeamName = { "蓝方", "红方" }

-- 战场地图相关信息
x303110_var_SceneMapNavPath =
{
	{ "zhanchang_zuduizhanchang/zhanchang_zuduizhanchang.scn", 1} -- 场景地图路径，索引
}

-- 战场前30秒的临时栅栏的位置（可设置多个）
x303110_var_TempImpassable =
{
	{Left = 183, Top = 41,Right = 208, Bottom = 61},
	{Left = 43, Top = 188,Right = 61, Bottom = 207},
}

-- 玩家进入战场的坐标
x303110_var_EnterScenePos =
{
	{218, 32}, -- Team A
	{32, 218} -- Team B
}

-- 采集点ID（旗子）
x303110_var_GroupPoint = {
	{910, 911, 912}, -- 1星旗子
	{913, 914, 915}, -- 2星旗子
	{916, 917, 918}, -- 3星旗子
	{919, 920, 921}, -- 4星旗子
	{922, 923, 924}  -- 5星旗子
}
-- 旗子随机坐标(第一面旗子的坐标请放在前2位)
x303110_varFlagPos =
{
{PosX=78,PosY=77},
{PosX=158,PosY=158},
{PosX=123,PosY=78},
{PosX=78,PosY=123},
{PosX=87,PosY=25},
{PosX=25,PosY=87},
{PosX=114,PosY=40},
{PosX=40,PosY=114},
{PosX=142,PosY=25},
{PosX=25,PosY=142},
{PosX=140,PosY=64},
{PosX=64,PosY=140},
{PosX=168,PosY=26},
{PosX=26,PosY=168},
{PosX=168,PosY=63},
{PosX=63,PosY=168},
{PosX=203,PosY=98},
{PosX=98,PosY=203},
{PosX=170,PosY=92},
{PosX=92,PosY=170},
{PosX=142,PosY=93},
{PosX=93,PosY=142},
{PosX=173,PosY=125},
{PosX=125,PosY=173},
{PosX=216,PosY=127},
{PosX=127,PosY=216},
{PosX=191,PosY=142},
{PosX=142,PosY=191},
{PosX=218,PosY=169},
{PosX=169,PosY=218},
{PosX=202,PosY=185},
{PosX=185,PosY=202},
{PosX=140,PosY=122},
{PosX=122,PosY=140},
{PosX=131,PosY=131},
{PosX=194,PosY=193}
}

-- 旗子星级相应的分值(1-5星)
x303110_var_FlagBonus = { 4, 6, 9, 13, 18 }

-- 不同时段刷新旗子星级范围与最大个数
x303110_var_FlagRefreshInfo =
{
	{MinLevel=1, MaxLevel=2, Cnt=1}, -- 前5分钟
	{MinLevel=1, MaxLevel=3, Cnt=1}, -- 5-10分钟
	{MinLevel=1, MaxLevel=4, Cnt=1}, -- 10-15分钟
	{MinLevel=1, MaxLevel=5, Cnt=2} -- 15-20分钟
}

-- 奖励
x303110_var_BonusInfo =
{	-- 战场积分，荣誉，道具
	{BattleMark=400, BattleHonour=160}, -- 胜利
	{BattleMark=100, BattleHonour=40}, -- 平局
	{BattleMark=100, BattleHonour=40}, -- 失败
}

x303110_var_MaxFlagRefreshSegment	= 100 -- 旗子最大刷新间隔（秒）
x303110_var_MaxFlagCount		= 3	-- 同时存在旗子的最大数量
x303110_var_CloseTick				= 10 -- 关闭倒计时
x303110_var_LimitTotalHoldTime		= 1200 -- 战场最长时间
x303110_var_MaxFlagDistance			= 100 -- 得分最大值，任何一方得分高于此值时战斗结束
x303110_var_MinReliveCD				= 10 -- 复活最小时间间隔
x303110_var_Kick_Down				= 4

-- 状态常量，不要修改
x303110_var_State_Invalid				= 	-1
x303110_var_State_Signup				=  	100
x303110_var_State_SignupFinished		=  	101
x303110_var_State_Begin					=  	102
x303110_var_State_End					=  	103

x303110_var_Winner = 1
x303110_var_Normal = 2
x303110_var_Loser  = 3

--------------------------------------------------------------------------------
-- 以上是配置信息
--------------------------------------------------------------------------------


-- A队成员
x303110_var_TeamA = {}
-- B队成员
x303110_var_TeamB = {}

-- 场景信息
x303110_SceneInfo = {}

-- 场景当前状态
x303110_var_CurrentState = {}

-- 玩家信息
x303110_var_PlayerInfo = {}

x303110_var_FlagInfo = {} -- 保存刷新的旗子的相关信息
x303110_var_LastRefreshTime = {} -- 最后一个旗子的刷新时间
x303110_var_LastGatherFlagPos = {} -- 最后一次采集旗子的位置索引
x303110_var_MaxPharseCnt = 0 -- 时段划分数量
x303110_var_CurrFlagCnt = {} -- 当前存在的旗子数量

-- 2队旗子得分
x303110_var_TeamAFlag = {}
x303110_var_TeamBFlag = {}

-- 2队当前在战场的玩家数量
x303110_var_TeamMemCount = {}


----------------------------------------------------------------------------------------------
-- 战场创建时调用
----------------------------------------------------------------------------------------------
function x303110_ProcMapCreate(varMap)

	WriteLog(1, format("MPVPBATTLE:x303110_ProcMapCreate varMap=%d", varMap))
	
	x303110_var_TeamA[varMap] = {
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0}
						}
	x303110_var_TeamB[varMap] = {
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0}
						}
	
	x303110_SceneInfo[varMap]			= {
											TICKCOUNT = 0,
											ISCLOSING = 0,
											LEAVECOUNTDOWN = 0,
											RESULT = 0
										  }
										  
	x303110_InitFlagInfo(varMap)
	
	x303110_var_PlayerInfo[varMap] = {}
	
	x303110_var_TeamMemCount[varMap] = {0, 0}
	
end


----------------------------------------------------------------------------------------------
-- 战场状态
----------------------------------------------------------------------------------------------
function x303110_ProcMBattleState(varMap, varState)

	if GetSceneType(varMap) ~= 7 then
		return
	end    
    
    if x303110_IsBattleSceneValid(varMap) == 0 then
    	return
    end

	-- 报名
    if varState == x303110_var_State_Signup then
    	
    	
    	if x303110_var_CurrentState[varMap] == x303110_var_State_Begin then
    		return
    	end
    	
        if x303110_var_CurrentState[varMap] ~= x303110_var_State_Signup then
            WriteLog(1, format("MPVPBATTLE:x303110_var_State_Signup, varMap=%d", varMap))
        end
        
        
        x303110_var_CurrentState[varMap] = x303110_var_State_Signup
        MPVP6v6RegisterScene(varMap)
       
	-- 战场开始
    elseif varState == x303110_var_State_Begin then

        --if x303110_var_CurrentState[varMap] ~= x303110_var_State_Begin then
            --WriteLog(1, format("MPVPBATTLE:x303110_var_State_Begin, varMap=%d", varMap))
        --end

        
        x303110_var_CurrentState[varMap] = x303110_var_State_Begin
        x303110_ProcBattleSceneReady(varMap, x303110_var_LimitTotalHoldTime)

	-- 战场结束
    elseif varState == x303110_var_State_End then

		
        if x303110_var_CurrentState[varMap] > x303110_var_State_Begin or x303110_var_CurrentState[varMap] < x303110_var_State_Signup then
            
            WriteLog(1, format("MPVPBATTLE:x303110_var_State_End,Result:nState > x303110_var_State_Begin or nState < x303110_var_State_Signup varMap=%d, varState=%d", 
            	varMap, x303110_var_CurrentState[varMap]))

            x303110_ProcBattleSceneClose(varMap, 0)
            WriteLog(1, format("MPVPBATTLE:x303110_var_State_End, varMap=%d", varMap))
            return
        end

        
		x303110_var_CurrentState[varMap] = x303110_var_State_End
        x303110_ProcBattleSceneClose(varMap, 1)

        WriteLog(1, format("MPVPBATTLE:x303110_var_State_End, varMap=%d", varMap))
    end
end


----------------------------------------------------------------------------------------------
--战场匹配队伍信息回调
----------------------------------------------------------------------------------------------
function x303110_ProcMBattleMatchInfo(varMap, varGuid1, varGuid2, varGuid3, varGuid4, varGuid5, varGuid6, varTeamFlag)

	--WriteLog(1, format("MPVPBATTLE:x303110_ProcMBattleMatchInfo, varMap=%d, Team=%d, GUID1 = %x, GUID2 = %x, GUID3 = %x, GUID4 = %x, GUID5 = %x", varMap, varTeamFlag, varGuid1, varGuid2, varGuid3, varGuid4, varGuid5))
						
	if (varTeamFlag == 1) then
		x303110_var_TeamA[varMap] = {
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0}
						}
						
		x303110_var_TeamA[varMap][1].GUID = varGuid1
		x303110_var_TeamA[varMap][2].GUID = varGuid2
		x303110_var_TeamA[varMap][3].GUID = varGuid3
		x303110_var_TeamA[varMap][4].GUID = varGuid4
		x303110_var_TeamA[varMap][5].GUID = varGuid5
		x303110_var_TeamA[varMap][6].GUID = varGuid6
		
	elseif (varTeamFlag == 2) then
	
		x303110_var_TeamB[varMap] = {
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0},
						{GUID=0, ENTER = 0, LEAVE=0}
						}
	
		x303110_var_TeamB[varMap][1].GUID = varGuid1
		x303110_var_TeamB[varMap][2].GUID = varGuid2
		x303110_var_TeamB[varMap][3].GUID = varGuid3
		x303110_var_TeamB[varMap][4].GUID = varGuid4
		x303110_var_TeamB[varMap][5].GUID = varGuid5
		x303110_var_TeamB[varMap][6].GUID = varGuid6
		
	end
	
end


----------------------------------------------------------------------------------------------
--时间同步回调
----------------------------------------------------------------------------------------------
function x303110_ProcMSyncBattleTime(varMap, nTime)

    if x303110_IsBattleSceneValid(varMap) == 0 then
    	return
    end
    
    --x303110_SceneInfo[varMap].TICKCOUNT = NumberCastIntToUInt(nTime)
    local DownTickCount = x303110_var_LimitTotalHoldTime - NumberCastIntToUInt(nTime)
    x303110_SyncBattleTimeToAllPlayer(varMap, DownTickCount)
	
end


----------------------------------------------------------------------------------------------
--玩家进入战场时的处理
----------------------------------------------------------------------------------------------
function x303110_ProcPlayerEnter(varMap, varPlayer)

	if x303110_IsBattleSceneValid(varMap) == 0 then
    	return	
    end
    
    x303110_LearnGatherSkill(varMap, varPlayer)
    Msg2Player(varMap, varPlayer, "欢迎进入跨服六人战场 ", 0, 3)
		Msg2Player(varMap, varPlayer, "本战场持续时间为20分钟", 0, 3)
		Msg2Player(varMap, varPlayer, "在战场中会持续的刷新出各种分值的战旗", 0, 3)
		Msg2Player(varMap, varPlayer, "红蓝双方获得更多战旗分数的一方获胜", 0, 3)
		Msg2Player(varMap, varPlayer, "战斗即将开始，请双方做好准备", 0, 3)
	
	-- 记录进入战场前的位置（场景，坐标）
    local scenePre = GetPlayerRuntimeData(varMap,varPlayer, RD_HUMAN_SCENE_PRE) - 1
    if scenePre >= 0 then    
        local CurX = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE)
        SetPlayerBakSceneInfo(varMap, varPlayer, scenePre, CurX, CurZ)
        
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE, 0)
    end
    
	-- 检测场景状态
	if x303110_SceneInfo[varMap].ISCLOSING > 0 then
		x303110_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303110_ProcPlayerEnterFinished kick 0 varMap=%d ", varMap))
		return
	end
	
	-- 取得所在小队
	local nTeamIndex = x303110_GetPlayerTeamIndex(varMap, varPlayer)
	if nTeamIndex == -1 then
		x303110_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303110_ProcPlayerEnterFinished kick 1 varMap=%d ", varMap))
		return
	end
	
	-- 是否进入过
	--if x303110_GetPlayerEnterFlag(varMap, varPlayer) == 1 then
	--	x303110_SetPlayerNeedKick(varMap, varPlayer)
	--	WriteLog(1, format("MPVPBATTLE:x303110_ProcPlayerEnterFinished kick 2 varMap=%d ", varMap))
	--	return
	--end
	
	-- 是否离开过
	--if x303110_GetPlayerLeaveFlag(varMap, varPlayer) == 1 then
	--	x303110_SetPlayerNeedKick(varMap, varPlayer)
	--	WriteLog(1, format("MPVPBATTLE:x303110_ProcPlayerEnterFinished kick 3 varMap=%d ", varMap))
	--	return
	--end
	
	x303110_AddTeamMemberCount(varMap, nTeamIndex, 1)
	-- 设置进入标记
	x303110_SetPlayerEnterFlag(varMap, varPlayer)
	-- 设置阵营
	SetCurCamp(varMap, varPlayer, x303110_var_CampFlag[nTeamIndex])
	-- 设置坐标
	SetPos(varMap, varPlayer, x303110_var_EnterScenePos[nTeamIndex][1], x303110_var_EnterScenePos[nTeamIndex][2])
	
	WriteLog(1, format("MPVPBATTLE:x303110_ProcPlayerEnterFinished playerEnter varMap=%d varX = %d, z = %d varFlag = %d varName=%s", 
		varMap, x303110_var_EnterScenePos[nTeamIndex][1], x303110_var_EnterScenePos[nTeamIndex][2], nTeamIndex, GetName(varMap, varPlayer)))	
	
	SetMPVP6v6BattleDisable(varMap, varPlayer, 0, nTeamIndex-1)
	
	SendKingBattleInfo( varMap, varPlayer, x303110_var_TeamName[1], x303110_var_TeamName[2] )
	
	if x303110_SceneInfo[varMap].TICKCOUNT < 31 then
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientMapColor", varMap, varPlayer, 0, 0)
	end
	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,0)
	
end


----------------------------------------------------------------------------------------------
--玩家离开场景
----------------------------------------------------------------------------------------------
function x303110_ProcPlayerLeave(varMap, varPlayer)

	local nTeamIndex = x303110_GetPlayerTeamIndex(varMap, varPlayer)
	if nTeamIndex ~= -1 then
		x303110_AddTeamMemberCount(varMap, nTeamIndex, -1)
	end
	x303110_SetPlayerLeaveFlag(varMap, varPlayer)
	x303110_KickPlayer(varMap, varPlayer)
	
end


----------------------------------------------------------------------------------------------
--战场定时器
----------------------------------------------------------------------------------------------
function x303110_ProcMapTimerTick(varMap, nowTime)
	
	if x303110_IsBattleSceneValid(varMap) == 0 then
    	return	
    end
	
	if x303110_SceneInfo[varMap] == nil then
		return
	end
	
	x303110_UpdatePlayerKickState(varMap)
	x303110_UpdatePlayerReliveDownCount(varMap)
	
	if x303110_SceneInfo[varMap].ISCLOSING > 0 then

		local leaveCountDown = x303110_SceneInfo[varMap].LEAVECOUNTDOWN + 1
		x303110_SceneInfo[varMap].LEAVECOUNTDOWN = leaveCountDown
		
		if leaveCountDown >= x303110_var_CloseTick then
			local humanCount = GetScenePlayerCount(varMap)
			for	varI = 0, humanCount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI)
                TimerCommand(varMap, humanId, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303110_var_FileId, -1, -1)	

                x303110_SetPlayerNeedKick(varMap, humanId)
                WriteLog(1, format("MPVPBATTLE:x303110_ProcMapTimerTick kick 1 varMap=%d ", varMap))
			end
		elseif leaveCountDown < x303110_var_CloseTick then  
		
			local humanCount = GetScenePlayerCount(varMap)
			for	varI = 0, humanCount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI)
  				Msg2Player(varMap, humanId, format("本场战斗将在%d秒后关闭", x303110_var_CloseTick - leaveCountDown), 8, 3)
			end
		end
	else
		if x303110_var_CurrentState[varMap] ~= x303110_var_State_Begin then
			return
		end
		
		local nowTickCount = x303110_SceneInfo[varMap].TICKCOUNT + 1;
		x303110_SceneInfo[varMap].TICKCOUNT = nowTickCount
		
		-- 清除临时栅栏
		if nowTickCount == 31 then
			WriteLog(1, format("MPVPBATTLE:ClearTempImpassable, varMap=%d", varMap))
			x303110_ClearTempImpassable(varMap)
		end
			
		-- 刷新旗子
		x303110_UpdateFlag(varMap, nowTickCount)
		-- 客户端大地图刷新
		x303110_UpdateSceneDataFlag(varMap)
		-- 比分提示
		x303110_SyncBattlePower(varMap)
		
		-- 检测战场是否达到结束条件
		if x303110_IsBattleEnd(varMap, nowTickCount) == 1 then
			local humanCount = GetScenePlayerCount(varMap)
			for varI = 0, humanCount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI)
  				Msg2Player(varMap, humanId, format("本场战斗时间已到，将于%d秒后关闭！", x303110_var_CloseTick), 8, 3)
			end
			
            x303110_ProcBattleSceneClose(varMap, 3)
            WriteLog(1, format("MPVPBATTLE:x303110_ProcMapTimerTick varMap=%d, nowTickCount=%d 001", varMap, nowTickCount))
		end
	end
end


----------------------------------------------------------------------------------------------
--玩家死亡
----------------------------------------------------------------------------------------------
function x303110_ProcPlayerDie(varMap, varPlayer, varKiller)	
	
	local nBattleSceneValid = x303110_IsBattleSceneValid(varMap)
    if nBattleSceneValid == 0 then
    	return	
    end
    
	x303110_SetPVP6v6PlayerReliveDownCount( varMap ,varPlayer)
	
end


----------------------------------------------------------------------------------------------
--玩家复活
----------------------------------------------------------------------------------------------
function x303110_ProcPlayerRelive(varMap, varPlayer, varReliveOp)
	
	local nBattleSceneValid = x303110_IsBattleSceneValid(varMap)
    if nBattleSceneValid == 0 then
    	return	
    end
	
	local leaveFlag = x303110_SceneInfo[varMap].ISCLOSING;
	if leaveFlag > 0 then
		return
	end
	
	local varCount = x303110_GetPVP6v6PlayerReliveDownCount(varMap,varPlayer)
	if varCount > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, format("%s秒之后自动复活",varCount));
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	else
		x303110_DoPlayerRelive( varMap, varPlayer, 100 )
		
		local varX, varZ = x303110_GetEnterPos( varMap,varPlayer)
		SetPos(varMap, varPlayer, varX, varZ)
	end
	
end


function x303110_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 0
end



function x303110_ProcAccept( varMap, varPlayer )
end



function x303110_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)	
end



function x303110_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x303110_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end


----------------------------------------------------------------------------------------------
-- 创建采集点
----------------------------------------------------------------------------------------------
function x303110_ProcGpCreate(varMap, growPointType, varX, varY)

	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)
	x303110_RecordGrowPointObj(varMap, growPointType, varBoxId)
	--WriteLog(1, format("MPVPBATTLE:x303110_ProcGpCreate varMap=%d, Gp=%d, X=%d, Y=%d", varMap, growPointType, varX, varY))
	
end


----------------------------------------------------------------------------------------------
-- 开始采集
-- 返回值：0 成功，1 失败
----------------------------------------------------------------------------------------------
function x303110_ProcGpOpen( varMap, varPlayer, varTalknpc)
   
	return 0
			
end


----------------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------------
function x303110_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


----------------------------------------------------------------------------------------------
-- 采集成功，回收相关物品
-- 返回值：0 失败，1 成功。
----------------------------------------------------------------------------------------------
function x303110_ProcGpRecycle( varMap, varPlayer, varTalknpc )
	
	x303110_CalculateBonus(varMap, varPlayer, x303110_GetFlagLevel(varMap, varTalknpc))
	x303110_RecycleFlag(varMap, varTalknpc)
	--if x303110_var_CurrFlagCnt[varMap] == 0 then
	--	x303110_RefreshFlag(varMap)
	--end
	
	return 1
end

function x303110_IsBattleSceneValid(varMap)

    local varName = GetBattleSceneName(varMap)
    for varI, item in x303110_var_SceneMapNavPath do
        if varName == item[1] then
            return 1
        end
    end
    return 0
end


function x303110_SyncBattleTimeToAllPlayer(varMap, nTime)

	local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            TimerCommand(varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303110_var_FileId, -1, -1)
            if nTime > 0 then
                TimerCommand(varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303110_var_FileId, nTime, nTime)
            end
        end
    end
	
end

function x303110_ProcBattleSceneReady(varMap, nTotalTime)
	
	
	x303110_SceneInfo[varMap] = {
						TICKCOUNT = 0,
						ISCLOSING = 0,
						LEAVECOUNTDOWN = 0,
						RESULT = 0
				  	  }
										  
	x303110_InitFlagInfo(varMap)
	x303110_ResetTeamMemberCount(varMap)
	x303110_SetTempImpassable(varMap)
	
end

----------------------------------------------------------------------------------------------
-- 设置临时栅栏
----------------------------------------------------------------------------------------------
function x303110_SetTempImpassable(varMap)
	
	for varI,itm in x303110_var_TempImpassable do
		AddSceneTempImpassable(varMap, itm.Left, itm.Top, itm.Right, itm.Bottom)
	end
	
end

----------------------------------------------------------------------------------------------
-- 清除临时栅栏
----------------------------------------------------------------------------------------------
function x303110_ClearTempImpassable(varMap)
	
	LuaThisScenceM2Wrold(varMap, "战斗开始", 5, 1)
	
	for varI,itm in x303110_var_TempImpassable do
		DelSceneTempImpassable(varMap, itm.Left, itm.Top, itm.Right, itm.Bottom)
	end
	
	local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            LuaCallNoclosure(UTILITY_SCRIPT, "StopClientMapColor", varMap, varObj, 0)
        end
    end
end

----------------------------------------------------------------------------------------------
-- 关闭战场
----------------------------------------------------------------------------------------------
function x303110_ProcBattleSceneClose(varMap, varFlag)
	
	if x303110_SceneInfo[varMap].ISCLOSING == 1 then
		return
	end
	
	-- 回收已刷新的旗子
	x303110_RecycleAllFlag(varMap)
	
	-- 结算奖励
	x303110_GenBonus(varMap)
	
	x303110_SceneInfo[varMap].ISCLOSING = 1	
	x303110_SceneInfo[varMap].TICKCOUNT = 0
	
	--local varMsg = format("MPVPBATTLE:x303110_ProcBattleSceneClose varMap=%d varFlag=%d", varMap, varFlag)
	--WriteLog(1, varMsg)
end


function x303110_GetPlayerTeamIndex(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	--WriteLog(1, format("MPVPBATTLE:x303110_GetPlayerTeamIndex GUID=%x", GUID))
	
	for varI, itm in x303110_var_TeamA[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			return 1
		end
	end
	
	for varI, itm in x303110_var_TeamB[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			return 2
		end
	end
	
	return -1
end

----------------------------------------------------------------------------------------------
-- 取得玩家离开标志
----------------------------------------------------------------------------------------------
function x303110_GetPlayerLeaveFlag(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	--WriteLog(1, format("MPVPBATTLE:x303110_GetPlayerLeave GUID=%x", GUID))
	
	for varI, itm in x303110_var_TeamA[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			return itm.LEAVE
		end
	end
	
	for varI, itm in x303110_var_TeamB[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			return itm.LEAVE
		end
	end
	
	return 0
end
----------------------------------------------------------------------------------------------
-- 设置玩家离开标志
----------------------------------------------------------------------------------------------
function x303110_SetPlayerLeaveFlag(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	--WriteLog(1, format("MPVPBATTLE:x303110_SetPlayerLeave GUID=%x", GUID))
	
	for varI, itm in x303110_var_TeamA[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			itm.LEAVE = 1
			return
		end
	end
	
	for varI, itm in x303110_var_TeamB[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			itm.LEAVE = 1
			return
		end
	end
	
end

----------------------------------------------------------------------------------------------
-- 取得玩家进入标志
----------------------------------------------------------------------------------------------
function x303110_GetPlayerEnterFlag(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	--WriteLog(1, format("MPVPBATTLE:x303110_GetPlayerEnterFlag GUID=%x", GUID))
	
	for varI, itm in x303110_var_TeamA[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			return itm.ENTER
		end
	end
	
	for varI, itm in x303110_var_TeamB[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			return itm.ENTER
		end
	end
	
	return 0
end
----------------------------------------------------------------------------------------------
-- 设置玩家进入标志
----------------------------------------------------------------------------------------------
function x303110_SetPlayerEnterFlag(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	--WriteLog(1, format("MPVPBATTLE:x303110_SetPlayerEnterFlag GUID=%x", GUID))
	
	for varI, itm in x303110_var_TeamA[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			itm.ENTER = 1
			return
		end
	end
	
	for varI, itm in x303110_var_TeamB[varMap] do
		if NumberCastIntToUInt(itm.GUID) == GUID then
			itm.ENTER = 1
			return
		end
	end
	
end

function x303110_SetPlayerNeedKick(varMap, varPlayer)
	
	local KickDown = GetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN) 
    if KickDown <= 0 or KickDown > x303110_var_Kick_Down then                
        SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, x303110_var_Kick_Down) 
    end
end

----------------------------------------------------------------------------------------------
-- 检测玩家状态并踢出战场
----------------------------------------------------------------------------------------------
function x303110_UpdatePlayerKickState(varMap)
    
    local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN) 
            if KickDown > 0 then                
                KickDown = KickDown - 1 
                if KickDown == 0 then
                    
                    SetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN, -1) 
                    x303110_KickPlayer(varMap,varObj )                    
                else
                    
                    SetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN, KickDown)
                end
            end
        end
    end
end

----------------------------------------------------------------------------------------------
-- 将玩家踢出战场
----------------------------------------------------------------------------------------------
function x303110_KickPlayer(varMap, varPlayer)
	
    x303110_DoPlayerRelive(varMap, varPlayer, 100)
    SetCurCamp(varMap, varPlayer, GetCurCountry(varMap, varPlayer))
    SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, 0)
    SetMPVP6v6BattleDisable(varMap, varPlayer, 1, 0)
    
    local nBakSceneId, varX, z = GetPlayerBakSceneInfo(varMap, varPlayer)
   
    if nBakSceneId >= 0 then
        NewWorld(varMap, varPlayer, nBakSceneId, varX, z, x303110_var_FileId)
        return
    end

    -- 没有记录合适的地图，就传送到王城
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        NewWorld(varMap, varPlayer, 50, 123, 57, x303110_var_FileId)
    elseif varCountry == 1 then
        NewWorld(varMap, varPlayer, 150, 123, 57, x303110_var_FileId)
    elseif varCountry == 2 then
        NewWorld(varMap, varPlayer, 250, 123, 57, x303110_var_FileId)
    elseif varCountry == 3 then
        NewWorld(varMap, varPlayer, 350, 123, 57, x303110_var_FileId)
    end
end


----------------------------------------------------------------------------------------------
-- 旗子相关函数
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- 初始化旗子相关信息
----------------------------------------------------------------------------------------------
function x303110_InitFlagInfo(varMap)
	--WriteLog(1, format("MPVPBATTLE:x303110_InitFlagInfo, varMap=%d", varMap))
	
	if x303110_var_FlagInfo[varMap] == nil then
		x303110_var_FlagInfo[varMap] = {}
	end
	
	for i=1, x303110_var_MaxFlagCount do
		x303110_var_FlagInfo[varMap][i] = {GpID=0, GpObjID=-1, PosIndex=0, FlagLevel=0}
	end
	
	x303110_var_TeamAFlag[varMap] = 0
	x303110_var_TeamBFlag[varMap] = 0
	x303110_var_LastRefreshTime[varMap] = 0
	x303110_var_CurrFlagCnt[varMap] = 0
	x303110_var_LastGatherFlagPos[varMap] = 0
	x303110_var_MaxPharseCnt = getn(x303110_var_FlagRefreshInfo)

end
----------------------------------------------------------------------------------------------
-- 旗子状态检测，在心跳函数内调用
----------------------------------------------------------------------------------------------
function x303110_UpdateFlag(varMap, varTime)
	
	--WriteLog(1, format("MPVPBATTLE:refresh flag, varMap=%d, time=%d", varMap, varTime))
	
	-- 开场60秒刷新旗子
	if varTime == 60 then
		x303110_RefreshFirstFlag(varMap)
		return
	end
	
	if (varTime >61) then
	
		if (x303110_var_CurrFlagCnt[varMap]==0 or varTime - x303110_var_LastRefreshTime[varMap]>= x303110_var_MaxFlagRefreshSegment) then
			x303110_RefreshFlag(varMap)
		end
		
	end
end
----------------------------------------------------------------------------------------------
-- 刷新旗子
----------------------------------------------------------------------------------------------
function x303110_RefreshFirstFlag(varMap)

	local varPharse = 1
	local varMinLevel = x303110_var_FlagRefreshInfo[varPharse].MinLevel
	local varMaxLevel = x303110_var_FlagRefreshInfo[varPharse].MaxLevel
	local varFlagCnt = x303110_var_FlagRefreshInfo[varPharse].Cnt
	
	-- 随机旗子等级
	local varLevel = varMinLevel
	if varMinLevel < varMaxLevel then
		varLevel = random(varMinLevel, varMaxLevel)
	end
	local varGpId = x303110_var_GroupPoint[varLevel][1]
	
	
	-- 随机旗子位置.	
	local varPosIdx = random(1, 2)
	-- 记录等级
	x303110_RecordGrowPoint(varMap, varGpId, varLevel, varPosIdx)
	-- 记录刷新时间
	x303110_var_LastRefreshTime[varMap] = x303110_SceneInfo[varMap].TICKCOUNT;
	-- 刷新
	x303110_var_CurrFlagCnt[varMap] = x303110_var_CurrFlagCnt[varMap] + 1
	RecycleGrowPointByType(varMap, varGpId, 0)
	SetGrowPointPos(varMap, varGpId, x303110_varFlagPos[varPosIdx].PosX, x303110_varFlagPos[varPosIdx].PosY)
	LuaThisScenceM2Wrold (varMap, "战场中".. x303110_varFlagPos[varPosIdx].PosX.."，"..x303110_varFlagPos[varPosIdx].PosY.."附近出现了一面战旗", 1, 1)
	LuaThisScenceM2Wrold (varMap, "战场中".. x303110_varFlagPos[varPosIdx].PosX.."，"..x303110_varFlagPos[varPosIdx].PosY.."附近出现了一面战旗", 1, 3)
	--WriteLog(1, format("MPVPBATTLE:refresh flag, varMap=%d, Gp=%d, X=%d, Y=%d", varMap, varGpId, x303110_varFlagPos[varPosIdx].PosX, x303110_varFlagPos[varPosIdx].PosY))
	
end
----------------------------------------------------------------------------------------------
-- 刷新旗子
----------------------------------------------------------------------------------------------
function x303110_RefreshFlag(varMap)

	if x303110_var_CurrFlagCnt[varMap] >= x303110_var_MaxFlagCount then
		return
	end
	
	local nowTickCount = x303110_SceneInfo[varMap].TICKCOUNT;
	local varPharse = floor(nowTickCount/(5*60)) + 1
	if (varPharse < 1) then varPharse = 1 end
	if (varPharse > x303110_var_MaxPharseCnt) then varPharse = x303110_var_MaxPharseCnt end
	--WriteLog(1, format("MPVPBATTLE:refresh flag, varMap=%d, pharse=%d, max=%d", varMap, varPharse, getn(x303110_var_FlagRefreshInfo)))
	local varMinLevel = x303110_var_FlagRefreshInfo[varPharse].MinLevel
	local varMaxLevel = x303110_var_FlagRefreshInfo[varPharse].MaxLevel
	local varFlagCnt = x303110_var_FlagRefreshInfo[varPharse].Cnt
	
	-- 随机个数
	if (varFlagCnt>1) then
		varFlagCnt = random(1, varFlagCnt)
	end
	
	for i=1, varFlagCnt do
	
		-- 检查当前旗子数量
		if x303110_var_CurrFlagCnt[varMap] >= x303110_var_MaxFlagCount then
			return
		end
			
		-- 随机旗子等级
		local varLevel = varMinLevel
		local varGpId = 0
		if varMinLevel < varMaxLevel then
			varLevel = random(varMinLevel, varMaxLevel)
		end
		for i=1, getn(x303110_var_GroupPoint[varLevel]) do
			if x303110_IsGrowPointExist(varMap, x303110_var_GroupPoint[varLevel][i]) == 0 then
				varGpId = x303110_var_GroupPoint[varLevel][i]
				break
			end
		end
		if varGpId == 0 then
			return
		end
				
		-- 随机旗子位置.
		-- 如果一个位置的旗子没有被采集，不能在此位置再次刷新
		-- 所以要先把未刷新的旗子摘出来
		local varTmp = {}
		local varIdx = 0
		for varI=1, getn(x303110_varFlagPos) do
			if varI ~= x303110_var_LastGatherFlagPos[varMap] and x303110_IsFlagPosExist(varMap, varI) == 0 then
				varIdx = varIdx + 1
				varTmp[varIdx] = varI
			end
		end
		
		x303110_var_LastRefreshTime[varMap] = nowTickCount
		
		if varIdx > 0 then
			local varPosIdx = varTmp[random(1, varIdx)]
			
			-- 记录等级
			x303110_RecordGrowPoint(varMap, varGpId, varLevel, varPosIdx)
			-- 记录刷新时间
			x303110_var_LastRefreshTime[varMap] = nowTickCount
			-- 刷新
			x303110_var_CurrFlagCnt[varMap] = x303110_var_CurrFlagCnt[varMap] + 1
			RecycleGrowPointByType(varMap, varGpId, 0)
			SetGrowPointPos(varMap, varGpId, x303110_varFlagPos[varPosIdx].PosX, x303110_varFlagPos[varPosIdx].PosY)
			LuaThisScenceM2Wrold (varMap, "战场中".. x303110_varFlagPos[varPosIdx].PosX.."，"..x303110_varFlagPos[varPosIdx].PosY.."附近出现了一面战旗", 1, 1)
			LuaThisScenceM2Wrold (varMap, "战场中".. x303110_varFlagPos[varPosIdx].PosX.."，"..x303110_varFlagPos[varPosIdx].PosY.."附近出现了一面战旗", 1, 3)			
			--WriteLog(1, format("MPVPBATTLE:refresh flag, varMap=%d, Gp=%d, X=%d, Y=%d", varMap, varGpId, x303110_varFlagPos[varPosIdx].PosX, x303110_varFlagPos[varPosIdx].PosY))
	
		end
	end

end
----------------------------------------------------------------------------------------------
-- 回收全部刷新的旗子(当关闭战场是调用)
----------------------------------------------------------------------------------------------
function x303110_RecycleAllFlag(varMap)
	
	WriteLog(1, "MPVPBATTLE:x303110_RecycleAllFlag")
	
	if x303110_var_FlagInfo[varMap] == nil then
		return
	end
	
	for varI, itm in x303110_var_FlagInfo[varMap] do
		if itm.GpID > 0 then
			RecycleGrowPointByType(varMap, itm.GpID, -1)
			itm.GpID = 0
			itm.GpObjID = 0
			itm.PosIndex = 0
			itm.FlagLevel = 0
			--x303110_RecycleFlag(varMap, itm.GpObjID)
		end
	end
	x303110_var_CurrFlagCnt[varMap] = 0
end
----------------------------------------------------------------------------------------------
-- 根据ObjID回收采集点
----------------------------------------------------------------------------------------------
function x303110_RecycleFlag(varMap, varObjID)
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for i=1, x303110_var_MaxFlagCount do
		if x303110_var_FlagInfo[varMap][i].GpObjID == varObjID then
			--WriteLog(1, format("MPVPBATTLE:x303110_RecycleFlag Map=%d, Obj=%d, Gp=%d", varMap, varObjID, x303110_var_FlagInfo[varMap][i].GpID))
			-- 记录旗子位置索引
			x303110_var_LastGatherFlagPos[varMap] = x303110_var_FlagInfo[varMap][i].PosIndex
			--删除生长点
			SetGrowPointIntervalContainer(varMap, x303110_var_FlagInfo[varMap][i].GpID, -1)
			x303110_var_FlagInfo[varMap][i] = {GpID=0, GpObjID=-1, PosIndex=0, FlagLevel=0}
			x303110_var_CurrFlagCnt[varMap] = x303110_var_CurrFlagCnt[varMap] - 1
			break
		end
	end
end
----------------------------------------------------------------------------------------------
-- 判断指定的位置索引是否存在
----------------------------------------------------------------------------------------------
function x303110_IsFlagPosExist(varMap, varIndex)
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for varI, itm in x303110_var_FlagInfo[varMap] do
		if itm.PosIndex == varIndex then
			return 1
		end
	end
	return 0
end
----------------------------------------------------------------------------------------------
-- 判断指定星级的旗子是否存在
----------------------------------------------------------------------------------------------
function x303110_IsGrowPointExist(varMap, varGp)
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for varI, itm in x303110_var_FlagInfo[varMap] do
		if itm.GpID == varGp then
			return 1
		end
	end
	return 0
end
----------------------------------------------------------------------------------------------
-- 根据采集点ObjID取得星级
----------------------------------------------------------------------------------------------
function x303110_GetFlagLevel(varMap, varObj)
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for varI, itm in x303110_var_FlagInfo[varMap] do
		if itm.GpObjID == varObj then
			return itm.FlagLevel
		end
	end
	return 0
end
----------------------------------------------------------------------------------------------
-- 记录采集点ID与星级
----------------------------------------------------------------------------------------------
function x303110_RecordGrowPoint(varMap, varGp, varLevel, varPos)
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for i=1, x303110_var_MaxFlagCount do
		if x303110_var_FlagInfo[varMap][i].GpID == 0 then
			x303110_var_FlagInfo[varMap][i].GpID = varGp
			x303110_var_FlagInfo[varMap][i].FlagLevel = varLevel
			x303110_var_FlagInfo[varMap][i].PosIndex = varPos
			break
		end
	end
end
----------------------------------------------------------------------------------------------
-- 记录采集点ObjID
----------------------------------------------------------------------------------------------
function x303110_RecordGrowPointObj(varMap, varGp, varObjID)
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for i=1, x303110_var_MaxFlagCount do
		if x303110_var_FlagInfo[varMap][i].GpID == varGp then
			x303110_var_FlagInfo[varMap][i].GpObjID = varObjID
			break
		end
	end
end
----------------------------------------------------------------------------------------------
-- 向客户端刷新旗子位置，显示在大地图上
----------------------------------------------------------------------------------------------
function x303110_UpdateSceneDataFlag( varMap )

    ClearSceneMapDataFlag( varMap )
	
	-- {GpID=0, GpObjID=0, PosIndex=0, FlagLevel=0}
	for varI, itm in x303110_var_FlagInfo[varMap] do
		if itm.GpID > 0 and itm.GpObjID ~= -1 then
			SetSceneMapDataFlag( varMap, itm.GpObjID, 9+itm.FlagLevel, format("%d分战旗", x303110_var_FlagBonus[itm.FlagLevel]), x303110_varFlagPos[itm.PosIndex].PosX, x303110_varFlagPos[itm.PosIndex].PosY, -1)
		end
	end
	
end
----------------------------------------------------------------------------------------------
-- 向客户端刷新得分
----------------------------------------------------------------------------------------------
function x303110_SyncBattlePower( varMap )

	--WriteLog(1, format("MPVPBATTLE:x303110_SyncBattlePower Map=%d, A=%d, B=%d", varMap, x303110_var_TeamAFlag[varMap], x303110_var_TeamBFlag[varMap]))
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            SyncKingBattlePowerInfo(varMap, varObj, x303110_var_TeamAFlag[varMap], x303110_var_TeamBFlag[varMap])
        end
    end

end
----------------------------------------------------------------------------------------------
-- 计算得分
----------------------------------------------------------------------------------------------
function x303110_CalculateBonus(varMap, varPlayer, varFlagLevel)
	
	if varFlagLevel < 1 or varFlagLevel > getn(x303110_var_FlagBonus) then
		return
	end
	
	local varTeamIdx = x303110_GetPlayerTeamIndex(varMap, varPlayer)
	if varTeamIdx == 1 then -- team A
		x303110_var_TeamAFlag[varMap] = x303110_var_TeamAFlag[varMap] + x303110_var_FlagBonus[varFlagLevel]
		Msg2Player(varMap, varPlayer, format("你的小队现在的得分是%d", x303110_var_TeamAFlag[varMap]), 8, 3)
		Msg2Player(varMap, varPlayer, format("你的小队现在的得分是%d", x303110_var_TeamAFlag[varMap]), 8, 2)
	elseif varTeamIdx == 2 then -- team B
		x303110_var_TeamBFlag[varMap] = x303110_var_TeamBFlag[varMap] + x303110_var_FlagBonus[varFlagLevel]
		Msg2Player(varMap, varPlayer, format("你的小队现在的得分是%d", x303110_var_TeamBFlag[varMap]), 8, 3)
		Msg2Player(varMap, varPlayer, format("你的小队现在的得分是%d", x303110_var_TeamBFlag[varMap]), 8, 2)
	end
	
end
----------------------------------------------------------------------------------------------
-- 奖励
----------------------------------------------------------------------------------------------
function x303110_GenBonus(varMap)
	-- 判断人数
	if x303110_var_TeamMemCount[varMap][1] <=0 and x303110_var_TeamMemCount[varMap][2] <=0 then
		return
	end
	
	-- B队无人，A队赢
	if x303110_var_TeamMemCount[varMap][2] <=0 then
		local humanCount = GetScenePlayerCount(varMap)
		
		for	i = 0, humanCount - 1 do
			
			local humanId = GetScenePlayerObjId(varMap, i)
			local teamIdx = x303110_GetPlayerTeamIndex(varMap, humanId)
			if teamIdx == 1 then												
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Winner)
			elseif teamIdx == 2 then
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Loser)
			end
			
		end
		return
	end
	
	-- A队无人，B队赢
	if x303110_var_TeamMemCount[varMap][1] <=0 then
		local humanCount = GetScenePlayerCount(varMap)
		
		for	i = 0, humanCount - 1 do
			
			local humanId = GetScenePlayerObjId(varMap, i)
			local teamIdx = x303110_GetPlayerTeamIndex(varMap, humanId)
			if teamIdx == 1 then												
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Loser)
			elseif teamIdx == 2 then
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Winner)
			end
			
		end
		return
	end
	
	-- 判断得分
	if x303110_var_TeamAFlag[varMap] == x303110_var_TeamBFlag[varMap] then -- 平局
		local humanCount = GetScenePlayerCount(varMap)
		
		for	i = 0, humanCount - 1 do
			
			local humanId = GetScenePlayerObjId(varMap, i)
			
			local teamIdx = x303110_GetPlayerTeamIndex(varMap, humanId)
			if teamIdx ~= -1 then
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Normal)
			end
		end
	elseif x303110_var_TeamAFlag[varMap] > x303110_var_TeamBFlag[varMap] then -- A队赢
		local humanCount = GetScenePlayerCount(varMap)
		
		for	i = 0, humanCount - 1 do
			
			local humanId = GetScenePlayerObjId(varMap, i)
			local teamIdx = x303110_GetPlayerTeamIndex(varMap, humanId)
			if teamIdx == 1 then												
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Winner)
			elseif teamIdx == 2 then
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Loser)
			end
			
		end
	elseif x303110_var_TeamAFlag[varMap] < x303110_var_TeamBFlag[varMap] then -- B队赢
		local humanCount = GetScenePlayerCount(varMap)
		
		for	i = 0, humanCount - 1 do
			
			local humanId = GetScenePlayerObjId(varMap, i)
			local teamIdx = x303110_GetPlayerTeamIndex(varMap, humanId)
			if teamIdx == 1 then												
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Loser)
			elseif teamIdx == 2 then
				x303110_GivePlayerBonus(varMap, humanId, x303110_var_Winner)
			end
			
		end
	end
end
----------------------------------------------------------------------------------------------
-- 给玩家奖励
----------------------------------------------------------------------------------------------
function x303110_GivePlayerBonus(varMap, varPlayer, varFlag)
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 1,4)
	-- 检测玩家是否离开过
	--if x303110_GetPlayerLeaveFlag(varMap, varPlayer) == 1 then
	--	return
	--end
	
	-- 积分
	AddPVP2V2Mark(varMap, varPlayer, x303110_var_BonusInfo[varFlag].BattleMark)
	Msg2Player(varMap, varPlayer, "获得"..x303110_var_BonusInfo[varFlag].BattleMark.."点战场积分", 0, 2)
	Msg2Player(varMap, varPlayer, "获得"..x303110_var_BonusInfo[varFlag].BattleMark.."点战场积分", 0, 3)
	-- 荣誉
	LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303110_var_BonusInfo[varFlag].BattleHonour)

	
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,11)

end


----------------------------------------------------------------------------------------------
-- 玩家死亡复活相关函数与变量
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- 设置复活CD
----------------------------------------------------------------------------------------------
function x303110_SetPVP6v6PlayerReliveDownCount( varMap ,varPlayer)
	
	if x303110_SceneInfo[varMap].ISCLOSING == 1	then
		return
	end
	
	SetPlayerRuntimeData( varMap,varPlayer,RD_PVP6V6_RELIVE_DOWNCOUNT, x303110_var_MinReliveCD )

end
----------------------------------------------------------------------------------------------
-- 得到复活CD
----------------------------------------------------------------------------------------------
function x303110_GetPVP6v6PlayerReliveDownCount( varMap,varPlayer)
	
	
	if x303110_SceneInfo[varMap].ISCLOSING == 1	then
		return 0
	end
	
	return GetPlayerRuntimeData( varMap,varPlayer,RD_PVP6V6_RELIVE_DOWNCOUNT );
end
----------------------------------------------------------------------------------------------
-- 复活心跳
----------------------------------------------------------------------------------------------
function x303110_UpdatePlayerReliveDownCount( varMap )
	
	if x303110_SceneInfo[varMap] == nil then
		return
	end
	
	if x303110_SceneInfo[varMap].ISCLOSING == 1	then
		return
	end
	
	
	local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nReliveDownCount = GetPlayerRuntimeData( varMap,varObj,RD_PVP6V6_RELIVE_DOWNCOUNT ) 
            if nReliveDownCount > 0 then                
                nReliveDownCount = nReliveDownCount - 1 
                SetPlayerRuntimeData( varMap,varObj,RD_PVP6V6_RELIVE_DOWNCOUNT ,nReliveDownCount) 
                
                
                x303110_PlayerAutoRelive(varMap,varObj,0)
            end
        end
    end
	
	return 0
	
end
----------------------------------------------------------------------------------------------
-- 自动复活
----------------------------------------------------------------------------------------------
function x303110_PlayerAutoRelive(varMap, varPlayer, varReliveOp)
	    
    local nBattleSceneValid = x303110_IsBattleSceneValid(varMap)
    if nBattleSceneValid == 0 then
    	return	
    end
	
	local leaveFlag = x303110_SceneInfo[varMap].ISCLOSING;
	if leaveFlag > 0 then
		return
	end
	
	local nTeamIndex = x303110_GetPlayerTeamIndex(varMap, varPlayer)
	if (nTeamIndex == -1) then
		return
	end
	
	local varCount = x303110_GetPVP6v6PlayerReliveDownCount(varMap,varPlayer)
	if varCount <= 0 then
		x303110_DoPlayerRelive( varMap, varPlayer, 100 )

		SetPos(varMap, varPlayer, x303110_var_EnterScenePos[nTeamIndex][1], x303110_var_EnterScenePos[nTeamIndex][2])
	end
end
----------------------------------------------------------------------------------------------
-- 复活玩家
----------------------------------------------------------------------------------------------
function x303110_DoPlayerRelive(varMap, varPlayer, value)

	local nHp = GetHp(varMap, varPlayer)
	if nHp <= 0 then
	
		ClearRageRecoverTick(varMap, varPlayer)
		RestoreHp(varMap, varPlayer, value)
		RestoreRage(varMap, varPlayer, value)
		ClearMutexState(varMap, varPlayer, 6)
		SendReliveResult(varMap, varPlayer,1)
	end

	LastMount(varMap, varPlayer)
	RestoreHp(varMap, varPlayer, 0)
end
----------------------------------------------------------------------------------------------
-- 取得复活点（也是进入点）
----------------------------------------------------------------------------------------------
function x303110_GetEnterPos(varMap, varPlayer)
	-- 取得所在小队
	local nTeamIndex = x303110_GetPlayerTeamIndex(varMap, varPlayer)
	if nTeamIndex == -1 then
		return 100, 100
	end
	return x303110_var_EnterScenePos[nTeamIndex][1], x303110_var_EnterScenePos[nTeamIndex][2]
end
----------------------------------------------------------------------------------------------
-- 学习必须的采集技能
----------------------------------------------------------------------------------------------
function x303110_LearnGatherSkill(varMap, varPlayer)
	if QueryPlayerAbility(varMap, varPlayer, 27) ~= 1 then
		SetPlayerAbilityLevel(varMap, varPlayer, 27, 1)
	end
end
----------------------------------------------------------------------------------------------
-- 重置队伍玩家数量
----------------------------------------------------------------------------------------------
function x303110_ResetTeamMemberCount(varMap)
	x303110_var_TeamMemCount[varMap][1] = 0
	x303110_var_TeamMemCount[varMap][2] = 0
end
----------------------------------------------------------------------------------------------
-- 增加队伍玩家数量
-- 当参数varCnt为负数时，也就代表减人
----------------------------------------------------------------------------------------------
function x303110_AddTeamMemberCount(varMap, varTeam, varCnt)
	local nCur = x303110_var_TeamMemCount[varMap][varTeam]
	x303110_var_TeamMemCount[varMap][varTeam] = nCur + varCnt
end
----------------------------------------------------------------------------------------------
-- 判断是否有队伍人员数量为0
----------------------------------------------------------------------------------------------
function x303110_IsAnyTeamEmpty(varMap)
	if x303110_var_TeamMemCount[varMap][1] <= 0 or x303110_var_TeamMemCount[varMap][2] <= 0 then
		return 1
	end
	return 0
end
----------------------------------------------------------------------------------------------
-- 判断战场是否达到结束条件
----------------------------------------------------------------------------------------------
function x303110_IsBattleEnd(varMap, varTime)
	-- 有一方无人
	if varTime > 60 and x303110_IsAnyTeamEmpty(varMap) == 1 then
		LuaThisScenceM2Wrold (varMap, "由于您的对手未进入此战场，您获得了本轮的胜利。", 1, 1)
		LuaThisScenceM2Wrold (varMap, "由于您的对手未进入此战场，您获得了本轮的胜利。", 1, 3)
		return 1
	end
	
	-- 超过战场时间
	if varTime >= x303110_var_LimitTotalHoldTime then
		return 1
	end
	
	-- 超过得分上限
	if x303110_var_TeamAFlag[varMap] >= x303110_var_MaxFlagDistance or x303110_var_TeamBFlag[varMap] >= x303110_var_MaxFlagDistance then
		return 1
	end
	
	return 0
end
