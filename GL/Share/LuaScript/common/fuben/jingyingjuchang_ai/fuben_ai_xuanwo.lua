----漩涡AI-----------------

x701142_var_FileId 					= 701142

x701142_CSP_FUBENTYPE				= 0
x701142_CSP_SCRIPTID				=	1
x701142_CSP_TICKCOUNT				= 2
x701142_CSP_BACKSCENEID			= 3
x701142_CSP_ISCLOSING				= 4
x701142_CSP_LEAVECOUNTDOWN	= 5
x701142_CSP_TEAMID					=	6
x701142_CSP_TICKTIME				=	7
x701142_CSP_HOLDTIME				=	8
x701142_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701142_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701142_CSP_BOSSID = 27
x701142_CSP_PLAYERID = 28

--------------ai csp(本ai范围为150~159)---------------------
x701142_CSP_XUANWO_BOSS_COMBAT_START_TIME = 150 -- boss 进入战斗时间
x701142_CSP_XUANWO_BOSS_COMBAT_TIME_RECORD1 = 151


-----------------------------------------------------------
x701142_AI_COOLDOWN_BASE	=	2    --技能基础冷却时间

x701142_AI_Config = 
{
    {skillid1 = 7809, skillid2 = 32185,},   -- 容易
    {skillid1 = 7809, skillid3 = 32185,},   -- 中等
    {skillid1 = 7809, skillid3 = 32185,},   -- 困难
}


function x701142_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701142_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701142_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701142_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701142_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_START_TIME, nowTickCount)
			    SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_START_TIME, 0)
			  SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  local timeRandom = random(1,3)
	  --WriteLog(1, "x701142_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701142_AI_COOLDOWN_BASE + timeRandom ) then  --技能冷却时间到时
	      --WriteLog(1, "x701142_EnterTick ============== UnitUseSkill")
		    local nBossX, nBossZ = GetMonsterPosition(varMap, BossId)  -----boss的坐标
		    local playerID = GetFubenData_Param(varMap, x701142_CSP_PLAYERID)  -----玩家id
		    local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID)
		    
		    -----释放拉人buff
		    SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x701142_AI_Config[difficulty].skillid1, 0)
		    
		    if (nPlayerX < nBossX + 30) and (nPlayerZ < nBossZ + 30) then
		        ---拉人
		        SetPos(varMap, playerID, nBossX, nBossZ)
		        -----释放定身buff
		    	SendSpecificImpactToUnit( varMap, playerID, playerID, playerID, x701142_AI_Config[difficulty].skillid2, 0)
		        NpcTalk(varMap, BossId,"哪里走！",-1)
		    end
		    
		    SetFubenData_Param(varMap, x701142_CSP_XUANWO_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
    end
end
