----召唤喽啰  每隔30秒召唤一堆小怪-----------------

x701143_var_FileId 					= 701143

x701143_CSP_FUBENTYPE				= 0
x701143_CSP_SCRIPTID				=	1
x701143_CSP_TICKCOUNT				= 2
x701143_CSP_BACKSCENEID			= 3
x701143_CSP_ISCLOSING				= 4
x701143_CSP_LEAVECOUNTDOWN	= 5
x701143_CSP_TEAMID					=	6
x701143_CSP_TICKTIME				=	7
x701143_CSP_HOLDTIME				=	8
x701143_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701143_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701143_CSP_BOSSID = 27
x701143_CSP_PLAYERID = 28

--------------ai csp(本ai范围为160~169)---------------------
x701143_CSP_ZHAOHUAN_BOSS_COMBAT_START_TIME = 160 -- boss 进入战斗时间
x701143_CSP_ZHAOHUAN_BOSS_COMBAT_TIME_RECORD1 = 169


-----------------------------------------------------------
x701143_AI_COOLDOWN_BASE	=	10    --技能基础冷却时间

x701143_AI_RADIUS	=	7    --半径30码

x701143_AI_Config = 
{
    {skillid = 13701, monsterNum = 7},   -- 容易
    {skillid = 13701, monsterNum = 9},   -- 中等
    {skillid = 13701, monsterNum = 11},   -- 困难
}


function x701143_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701143_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701143_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701143_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701143_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_START_TIME, GetCurrentTime())
			      SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_TIME_RECORD1, GetCurrentTime())
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
      local nTimeRecord1 = GetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = GetCurrentTime() - nTimeRecord1
	  --WriteLog(1, "x701143_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701143_AI_COOLDOWN_BASE+random(3)  ) then  --技能冷却时间到时 小怪出来
	  
	      --WriteLog(1, "x701143_EnterTick ============== UnitUseSkill")
	      
	      local playerID = GetFubenData_Param(varMap, x701143_CSP_PLAYERID)  -----玩家id
		    local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID)
		    
		    local nMonsterNum = x701143_AI_Config[difficulty].monsterNum
		    local nInc = 360/nMonsterNum   ----角度增量
		    local nAngle = 0
		    local nMostersX = 0
		    local nMostersZ = 0
		    for i =1, nMonsterNum do
		        local incX = x701143_AI_RADIUS * sin(nAngle)
		        local incZ = x701143_AI_RADIUS * cos(nAngle)
		        nMostersX = nPlayerX + incX
		        nMostersZ = nPlayerZ + incZ

		        ---创建小怪怪
		        local monsterID = CreateMonster(varMap, 63066, nMostersX, nMostersZ, 19,-1, x701143_var_FileId, -1, 21, 20000, 180, "魔君小兵", "")
		        if monsterID == -1 then  
		            -----加buff----
		        end
		        NpcTalk(varMap, BossId,"小的们！一拥而上砍死他！",-1)
		        SendSpecificImpactToUnit( varMap, monsterID, monsterID, monsterID, 7810, 0)
		        nAngle = nAngle + nInc
		    end
		    SetFubenData_Param(varMap, x701143_CSP_ZHAOHUAN_BOSS_COMBAT_TIME_RECORD1, GetCurrentTime())
		    
    end
end

function x701143_ProcDie(varMap, varPlayer, varKiller)

end
