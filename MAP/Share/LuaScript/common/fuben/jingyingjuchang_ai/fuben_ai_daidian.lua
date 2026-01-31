----带电AI-----------------

x701133_var_FileId 					= 701133

x701133_CSP_FUBENTYPE				= 0
x701133_CSP_SCRIPTID				=	1
x701133_CSP_TICKCOUNT				= 2
x701133_CSP_BACKSCENEID			= 3
x701133_CSP_ISCLOSING				= 4
x701133_CSP_LEAVECOUNTDOWN	= 5
x701133_CSP_TEAMID					=	6
x701133_CSP_TICKTIME				=	7
x701133_CSP_HOLDTIME				=	8
x701133_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701133_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701133_CSP_BOSSID = 27
x701133_CSP_PLAYERID = 28

--------------ai csp(本ai范围为60~69)---------------------
x701133_CSP_DAIDIAN_BOSS_COMBAT_START_TIME = 60 -- boss 进入战斗时间
x701133_CSP_DAIDIAN_BOSS_COMBAT_TIME_RECORD1 = 61
x701133_CSP_DAIDIAN_BOSS_STATE = 62

-----------------------------------------------------------
x701133_AI_COOLDOWN_BASE	=	2    --技能基础冷却时间

x701133_AI_Config = 
{
    {skillid = 32251, skillid2 = 32191,skillid3 = 13754,},   -- 容易
    {skillid = 32251, skillid2 = 32211,skillid3 = 13754,},   -- 中等
    {skillid = 32251, skillid2 = 32231,skillid3 = 13754,},   -- 困难
}


function x701133_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_TIME_RECORD1, 0)
    SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 0)
end

function x701133_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701133_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701133_CSP_BOSSID)
	  local playerID = GetFubenData_Param(varMap, x701133_CSP_PLAYERID)  -----玩家id
	  local difficulty = GetFubenData_Param(varMap, x701133_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_START_TIME, nowTickCount)
			      SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_START_TIME, 0)
		      SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_TIME_RECORD1, 0)
		      SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 0)
	      end
	  end
	  
      local nTimeRecord1 = GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  local timeRandom = -1
	  if GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE) == 0 then
	  	timeRandom = random(1,3)     ---随机时间
	  	SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 1)
	  end
	  --WriteLog(1, "x701133_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701133_AI_COOLDOWN_BASE + timeRandom ) then  --技能冷却时间到时
	        
		    if GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE) == 1 then
			    local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)  -----boss的坐标
				NpcTalk(varMap, BossId,"让刺裂夜空的闪电击穿你！",-1)
			    --buff带电效果
			    if IsHaveSpecificImpact(varMap,BossId,7812) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, BossId, BossId, BossId, 7812, 0)
			    end
			    --buff带电效果
			    if IsHaveSpecificImpact(varMap,BossId,x701133_AI_Config[difficulty].skillid) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, BossId, BossId, BossId, x701133_AI_Config[difficulty].skillid, 0)
			    end
			    --WriteLog(1, "x701133_EnterTick ============== UnitUseSkill")
			    -----释放带电技能-----------------------------------
			    --UnitUseSkill(varMap, BossId, x701133_AI_Config[difficulty].skillid, BossId, nTargetX, nTargetZ, -1.0, 0)
		    	SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 2)
		    end
		     if GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE) == 2 then
		    	if nPassTime1 >= x701133_AI_COOLDOWN_BASE + timeRandom+1 then
		    		local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
					local bingqiuX,bingqiuY  = GetMonsterPosition(varMap, BossId)
					if (nPlayerX-bingqiuX)^2 + (nPlayerZ-bingqiuY)^2 <=16 then
						if IsHaveSpecificImpact(varMap,playerID,x701133_AI_Config[difficulty].skillid2) ~= 1 then
					    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701133_AI_Config[difficulty].skillid2, 0)
					    end
					end
					--UnitUseSkill(varMap, BossId, x701133_AI_Config[difficulty].skillid2, BossId, nTargetX, nTargetZ, -1.0, 0)
		    		SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 3)
		    	end
		    end
		    if GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE) == 3 then
		    	if nPassTime1 >= x701133_AI_COOLDOWN_BASE + timeRandom+2 then
		    		local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
					local bingqiuX,bingqiuY  = GetMonsterPosition(varMap, BossId)
					if (nPlayerX-bingqiuX)^2 + (nPlayerZ-bingqiuY)^2 <=64 then
						if IsHaveSpecificImpact(varMap,playerID,x701133_AI_Config[difficulty].skillid2) ~= 1 then
					    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701133_AI_Config[difficulty].skillid2, 0)
					    end
					end
					--UnitUseSkill(varMap, BossId, x701133_AI_Config[difficulty].skillid3, BossId, nTargetX, nTargetZ, -1.0, 0)
		    		SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 4)
		    	end
		    end
		    if GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE) == 4 then
		    	if nPassTime1 >= x701133_AI_COOLDOWN_BASE + timeRandom+4 then
		    		SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 5)
		    	end
		    end
		     if GetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE) == 5 then
		     	
			    SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_STATE, 0)
			    SetFubenData_Param(varMap, x701133_CSP_DAIDIAN_BOSS_COMBAT_TIME_RECORD1, nowTickCount+1)
   			 end
   end
end
