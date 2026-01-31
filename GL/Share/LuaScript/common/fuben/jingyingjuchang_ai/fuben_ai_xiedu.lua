----亵渎AI-----------------

x701140_var_FileId 					= 701140

x701140_CSP_FUBENTYPE				= 0
x701140_CSP_SCRIPTID				=	1
x701140_CSP_TICKCOUNT				= 2
x701140_CSP_BACKSCENEID			= 3
x701140_CSP_ISCLOSING				= 4
x701140_CSP_LEAVECOUNTDOWN	= 5
x701140_CSP_TEAMID					=	6
x701140_CSP_TICKTIME				=	7
x701140_CSP_HOLDTIME				=	8
x701140_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701140_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701140_CSP_BOSSID = 27
x701140_CSP_PLAYERID = 28

--------------ai csp(本ai范围为130~139)---------------------
x701140_CSP_XIEDU_BOSS_COMBAT_START_TIME = 130 -- boss 进入战斗时间
x701140_CSP_XIEDU_BOSS_COMBAT_TIME_RECORD1 = 139


-----------------------------------------------------------
x701140_AI_COOLDOWN_BASE	=	2    --技能基础冷却时间

x701140_AI_Config = 
{
    {skillid = 494, },   -- 容易
    {skillid = 497, },   -- 中等
    {skillid = 500, },   -- 困难
}


function x701140_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701140_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701140_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701140_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701140_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_START_TIME, nowTickCount)
			      SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  local timeRandom = random(1,2)
	  --WriteLog(1, "x701140_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701140_AI_COOLDOWN_BASE + timeRandom ) then  --技能冷却时间到时
	      --WriteLog(1, "x701140_EnterTick ============== UnitUseSkill")

		    local playerID = GetFubenData_Param(varMap, x701140_CSP_PLAYERID)  -----玩家id
		    local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID) ----玩家坐标
		    --反隐buff
	    	if IsHaveSpecificImpact(varMap,playerID,32059) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, 32059, 0)
		    end
		    --创建陷阱
		    CreateTrap(varMap, BossId, nPlayerX, nPlayerZ, x701140_AI_Config[difficulty].skillid)
		     
		    SetFubenData_Param(varMap, x701140_CSP_XIEDU_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
    end
end
