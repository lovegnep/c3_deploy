----吸血AI-----------------

x701141_var_FileId 					= 701141

x701141_CSP_FUBENTYPE				= 0
x701141_CSP_SCRIPTID				=	1
x701141_CSP_TICKCOUNT				= 2
x701141_CSP_BACKSCENEID			= 3
x701141_CSP_ISCLOSING				= 4
x701141_CSP_LEAVECOUNTDOWN	= 5
x701141_CSP_TEAMID					=	6
x701141_CSP_TICKTIME				=	7
x701141_CSP_HOLDTIME				=	8
x701141_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701141_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701141_CSP_BOSSID = 27
x701141_CSP_PLAYERID = 28

--------------ai csp(本ai范围为140~149)---------------------
x701141_CSP_XIXUE_BOSS_COMBAT_START_TIME = 140 -- boss 进入战斗时间
x701141_CSP_XIXUE_BOSS_COMBAT_TIME_RECORD1 = 141


-----------------------------------------------------------
x701141_AI_COOLDOWN_BASE	=	20   --技能基础冷却时间

x701141_AI_Config = 
{
    {skillid = 32189, },   -- 容易
    {skillid = 32209, },   -- 中等
    {skillid = 32229, },   -- 困难
}


function x701141_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701141_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701141_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701141_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701141_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_START_TIME, GetCurrentTime())
			      SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_TIME_RECORD1, GetCurrentTime())
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = GetCurrentTime() - nTimeRecord1
	 -- local timeRandom = random(1,10)
	  --WriteLog(1, "x701141_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if  nIsInCombat == 1  then  --技能冷却时间到时
	      --WriteLog(1, "x701141_EnterTick ============== UnitUseSkill")
		    local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)  -----boss的坐标
			if IsHaveSpecificImpact(varMap,BossId,x701141_AI_Config[difficulty].skillid) ~= 1 then
		   	    --加吸血buff
		    	SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x701141_AI_Config[difficulty].skillid, 0)
		    end
		   -- SetFubenData_Param(varMap, x701141_CSP_XIXUE_BOSS_COMBAT_TIME_RECORD1, GetCurrentTime())
    end
end
