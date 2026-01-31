----监禁AI-----------------

x701135_var_FileId 					= 701135

x701135_CSP_FUBENTYPE				= 0
x701135_CSP_SCRIPTID				=	1
x701135_CSP_TICKCOUNT				= 2
x701135_CSP_BACKSCENEID			= 3
x701135_CSP_ISCLOSING				= 4
x701135_CSP_LEAVECOUNTDOWN	= 5
x701135_CSP_TEAMID					=	6
x701135_CSP_TICKTIME				=	7
x701135_CSP_HOLDTIME				=	8
x701135_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701135_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701135_CSP_BOSSID = 27
x701135_CSP_PLAYERID = 28

--------------ai csp(本ai范围为80~89)---------------------
x701135_CSP_JIANJIN_BOSS_COMBAT_START_TIME = 80 -- boss 进入战斗时间
x701135_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1 = 81



x701135_AI_COOLDOWN_BASE	=	10    --技能基础冷却时间

x701135_AI_Config = 
{
    {skillid = 32180, },   -- 容易
    {skillid = 32200, },   -- 中等
    {skillid = 32220, },   -- 困难
}


function x701135_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701135_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701135_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701135_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701135_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_START_TIME, nowTickCount)
			      SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  local timeRandom = random(1,3)
	  --WriteLog(1, "x701135_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701135_AI_COOLDOWN_BASE + timeRandom ) then  --技能冷却时间到时
	      --WriteLog(1, "x701135_EnterTick ============== UnitUseSkill111")
		    local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)
		    local BossId = GetFubenData_Param(varMap, x701135_CSP_BOSSID) 
		    local playerID = GetFubenData_Param(varMap, x701135_CSP_PLAYERID)  -----玩家id
		    --UnitUseSkill(varMap, BossId, x701135_AI_Config[difficulty].skillid, playerID, nTargetX, nTargetZ, -1.0, 0)
		    if IsHaveSpecificImpact(varMap,playerID,x701135_AI_Config[difficulty].skillid) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701135_AI_Config[difficulty].skillid, 0)
		    end
		    SetFubenData_Param(varMap, x701135_CSP_JIANJIN_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
   			NpcTalk(varMap, BossId,"让地狱的铁炼紧紧束缚住你！",-1)
    end
end
