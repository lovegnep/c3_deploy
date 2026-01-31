----瘟疫AI-----------------

x701139_var_FileId 					= 701139

x701139_CSP_FUBENTYPE				= 0
x701139_CSP_SCRIPTID				=	1
x701139_CSP_TICKCOUNT				= 2
x701139_CSP_BACKSCENEID			= 3
x701139_CSP_ISCLOSING				= 4
x701139_CSP_LEAVECOUNTDOWN	= 5
x701139_CSP_TEAMID					=	6
x701139_CSP_TICKTIME				=	7
x701139_CSP_HOLDTIME				=	8
x701139_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701139_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701139_CSP_BOSSID = 27
x701139_CSP_PLAYERID = 28

--------------ai csp(本ai范围为120~129)---------------------
x701139_CSP_WENYI_BOSS_COMBAT_START_TIME = 120 -- boss 进入战斗时间
x701139_CSP_WENYI_BOSS_COMBAT_TIME_RECORD1 = 121

x701139_CSP_WENYI_BOSS_TRAP_NUM = 122   ---陷阱池计数


-----------------------------------------------------------
x701139_AI_COOLDOWN_BASE	=	5    --技能基础冷却时间

x701139_AI_Config = 
{
    {trap = 493, },   -- 容易
    {trap = 496, },   -- 中等
    {trap = 499, },   -- 困难
}


function x701139_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_TIME_RECORD1, 0)
    SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_TRAP_NUM, 0)
end

function x701139_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701139_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701139_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701139_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_START_TIME, nowTickCount)
			      SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  
	  local trapNum = GetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_TRAP_NUM)
	  
	  local timeRandom = 0
	  if trapNum == 0 or trapNum == 3 then  ---不处于连续释放状态
        timeRandom = random(3)
	  end
	  
	  --WriteLog(1, "x701139_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701139_AI_COOLDOWN_BASE + timeRandom ) then  --技能冷却时间到时
	      --WriteLog(1, "x701139_EnterTick ============== UnitUseSkill")
		    local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)  -----boss的坐标
		    local playerID = GetFubenData_Param(varMap, x701139_CSP_PLAYERID)  -----玩家id
		    local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID) ---玩家坐标
		    
		    trapNum = trapNum + 1
		    if trapNum < 4 then 
		    	if IsHaveSpecificImpact(varMap,playerID,32059) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, 32059, 0)
			    end
		    		--创建陷阱
		        CreateTrap(varMap, BossId, nPlayerX, nPlayerZ, x701139_AI_Config[difficulty].trap)
		        SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_TRAP_NUM, trapNum)
		    else
		        SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
		        SetFubenData_Param(varMap, x701139_CSP_WENYI_BOSS_TRAP_NUM, 0)
		    end
		    
    end
end
