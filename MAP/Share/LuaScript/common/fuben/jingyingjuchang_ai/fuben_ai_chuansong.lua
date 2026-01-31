----传送AI-----------------

x701144_var_FileId 					= 701144

x701144_CSP_FUBENTYPE				= 0
x701144_CSP_SCRIPTID				=	1
x701144_CSP_TICKCOUNT				= 2
x701144_CSP_BACKSCENEID			= 3
x701144_CSP_ISCLOSING				= 4
x701144_CSP_LEAVECOUNTDOWN	= 5
x701144_CSP_TEAMID					=	6
x701144_CSP_TICKTIME				=	7
x701144_CSP_HOLDTIME				=	8
x701144_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701144_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701144_CSP_BOSSID = 27
x701144_CSP_PLAYERID = 28

--------------ai csp(本ai范围为170~179)---------------------
x701144_CSP_CHUANSONG_BOSS_COMBAT_START_TIME = 170 -- boss 进入战斗时间
x701144_CSP_CHUANSONG_BOSS_COMBAT_TIME_RECORD1 = 171



x701144_AI_COOLDOWN_BASE	=	3    --技能基础冷却时间

x701144_AI_Config = 
{
    {skillid = 7808, },   -- 容易
    {skillid = 7808, },   -- 中等
    {skillid = 7808, },   -- 困难
}


function x701144_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701144_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701144_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701144_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701144_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_START_TIME, nowTickCount)
			      SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  local timeRandom = random(1,3)
	  --WriteLog(1, "x701144_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701144_AI_COOLDOWN_BASE + timeRandom ) then  --技能冷却时间到时
	      --WriteLog(1, "x701144_EnterTick ============== UnitUseSkill111")
		    local playerID = GetFubenData_Param(varMap, x701144_CSP_PLAYERID)  -----玩家id
        local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID) ---玩家坐标
        
        local randomValue1 = random(0,10)
        local randomValue2 = random(0,10)
        
        local addValue1 = 0
        local addValue2 = 0
        
        if randomValue1 > 5 then
            nPlayerX = nPlayerX + randomValue1- 10
        else
            nPlayerX = nPlayerX + randomValue1
        end

        if randomValue2 > 5 then
            nPlayerZ = nPlayerZ + randomValue2 - 10
        else
            nPlayerZ = nPlayerZ + randomValue2
        end
        
        ------释放传送特效buff
		    if IsHaveSpecificImpact(varMap,playerID,x701144_AI_Config[difficulty].skillid) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, BossId, BossId, BossId, x701144_AI_Config[difficulty].skillid, 0)
		    end
		    -----设置boss位置
		    SetPos(varMap, BossId, nPlayerX, nPlayerZ)
		    
		    SetFubenData_Param(varMap, x701144_CSP_CHUANSONG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
    end
end
