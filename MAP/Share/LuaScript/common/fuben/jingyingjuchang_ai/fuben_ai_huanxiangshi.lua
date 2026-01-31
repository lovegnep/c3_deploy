---------幻象师生成2个幻像.幻像会造成本体20%的伤害-----------------

x701134_var_FileId 					= 701134

x701134_CSP_FUBENTYPE				= 0
x701134_CSP_SCRIPTID				=	1
x701134_CSP_TICKCOUNT				= 2
x701134_CSP_BACKSCENEID			= 3
x701134_CSP_ISCLOSING				= 4
x701134_CSP_LEAVECOUNTDOWN	= 5
x701134_CSP_TEAMID					=	6
x701134_CSP_TICKTIME				=	7
x701134_CSP_HOLDTIME				=	8
x701134_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701134_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701134_CSP_AI_NUM	=  21
x701134_CSP_AI_1	=  22
x701134_CSP_AI_2	=  23
x701134_CSP_AI_3	=  24
--x701134_CSP_AI_4	=  25
--x701134_CSP_AI_5	=  26

x701134_CSP_BOSSID = 27
x701134_CSP_PLAYERID = 28
x701134_CSP_BOSS_TYPE = 29

--------------ai csp(本ai范围为70~79)---------------------
x701134_CSP_HUANXIANG_BOSS_COMBAT_START_TIME = 70 -- boss 进入战斗时间
x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1 = 79


-----------------------------------------------------------
x701134_AI_COOLDOWN_BASE	=	7    --技能基础冷却时间

x701134_AI_RADIUS	=	2    --左右2码

x701134_AI_Config =  
{
    {skillid = 32187, monsterNum = 7},   -- 容易
    {skillid = 32207, monsterNum = 9},   -- 中等
    {skillid = 32227, monsterNum = 11},   -- 困难
}
x701134_var_boss_title = 
{
  [701131] =  "#G+冰结+#W",
  [701133] =  "#G+霹雳+#W",
  [701134] =  "#G+分身+#W",
  [701135] =  "#G+监禁+#W",
  [701136] =  "#G+快速+#W",
  [701137] =  "#G+流星+#W",
  [701138] =  "#G+强命+#W",
  [701139] =  "#G+瘟疫+#W",
  [701140] =  "#G+烈焰+#W",
  [701141] =  "#G+血族+#W",
  [701142] =  "#G+磁力+#W",
  [701143] =  "#G+召唤+#W",
  [701144] =  "#G+瞬闪+#W",
  --[701132] =  "#G+霹雳+#W",        
}



function x701134_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1, 0)
end

function x701134_EnterTick(varMap,nowTickCount)
	  -- 战斗状态判定
	  --WriteLog(1, "x701134_EnterTick ============== nowTickCount:"..nowTickCount)
	  local BossId = GetFubenData_Param(varMap, x701134_CSP_BOSSID)
	  local difficulty = GetFubenData_Param(varMap, x701134_CSP_DIFFICULTY)
	  local nTimeRecord = GetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_START_TIME)
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  if ( nIsInCombat == 1 ) then
	      if (nTimeRecord == 0) then
	      		SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_START_TIME, nowTickCount)
			      SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      end
	  else
	      if (nTimeRecord ~= 0) then
	          SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_START_TIME, 0)
			      SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1, 0)
	      end
	  end
	  
    local nTimeRecord1 = GetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1)
	  local nPassTime1 = nowTickCount - nTimeRecord1
	  local timeRandom = random(1,3)
	  --WriteLog(1, "x701134_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	  if ( nIsInCombat == 1 and nPassTime1 >= x701134_AI_COOLDOWN_BASE + timeRandom  ) then  --技能冷却时间到时 小怪出来
	  
	      local rate = random(1,2)
	      if rate == 1 then
	          SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	          return
	      end      
	      
	      --WriteLog(1, "x701134_EnterTick ============== UnitUseSkill")
	      
	      local playerID = GetFubenData_Param(varMap, x701134_CSP_PLAYERID)  -----玩家id
	      
	      local nBossX, nBossZ = GetMonsterPosition(varMap, BossId)  -----boss的坐标
		    local nPlayerX, nPlayerZ = GetWorldPos(varMap, playerID)
		    
		    --计算偏移坐标
		    local nRandom1 = random()*x701134_AI_RADIUS
		    local nRandom2 = random()*x701134_AI_RADIUS
		    local leftX = 0
		    local leftZ = 0
		    
		    local rightX = 0
		    local rightZ = 0
		    
		    if nBossX == nPlayerX then
		        leftX = nBossX - x701134_AI_RADIUS
		        rightX = nBossX + x701134_AI_RADIUS
		        leftZ =  nBossZ
		        rightZ = nBossZ
		    elseif nBossZ == nPlayerZ then
		    		leftX = nBossX 
		        rightX = nBossX 
		        leftZ =  nBossZ - x701134_AI_RADIUS
		        rightZ = nBossZ + x701134_AI_RADIUS
		    elseif (nBossX > nPlayerX  and nBossZ > nPlayerZ) or (nBossX < nPlayerX  and nBossZ < nPlayerZ) then
		    		leftX = nBossX - nRandom1
		        rightX = nBossX + nRandom1
		        leftZ =  nBossZ + nRandom2
		        rightZ = nBossZ - nRandom2
		    else
		    		leftX = nBossX - nRandom1
		        rightX = nBossX + nRandom1
		        leftZ =  nBossZ - nRandom2
		        rightZ = nBossZ + nRandom2
		    end
		    
		    --拼接标题
		    local bossTitle = " "
		    local AIScriptID1 = GetFubenData_Param(varMap, x701134_CSP_AI_1  )
        if AIScriptID1 ~= 0 then
            bossTitle = x701134_var_boss_title[AIScriptID1]
        end
       
        local AIScriptID2 = GetFubenData_Param(varMap, x701134_CSP_AI_2  )
        if AIScriptID2~= 0 then
            bossTitle = bossTitle..x701134_var_boss_title[AIScriptID2].." "
        end
       
        local AIScriptID3 = GetFubenData_Param(varMap, x701134_CSP_AI_3  )
        if AIScriptID3 ~= 0 then
            bossTitle = bossTitle..x701134_var_boss_title[AIScriptID3]
        end
		    NpcTalk(varMap, BossId,"迷失在现实与虚幻中吧！",-1)
		    local bossName = GetName(varMap, BossId)  -----获取boss名称
		    --创建左边boss幻象
		    local monsterID1 = CreateMonster(varMap, GetFubenData_Param(varMap, x701134_CSP_BOSS_TYPE), leftX, leftZ, 19, -1, -1, -1, 21, 30000, 180, bossName, bossTitle, -1)
		    if monsterID1 ~= -1 then
		        SendSpecificImpactToUnit( varMap, monsterID1, monsterID1, monsterID1, x701134_AI_Config[difficulty].skillid, 0)  --添加 削弱的buff  
		    end
		    
		    
		    --创建右边boss幻象
		    local monsterID2 = CreateMonster(varMap, GetFubenData_Param(varMap, x701134_CSP_BOSS_TYPE), rightX, rightZ, 19, -1, -1, -1, 21, 30000, 180, bossName, bossTitle, -1)
		    if monsterID1 ~= -2 then
		        SendSpecificImpactToUnit( varMap, monsterID2, monsterID2, monsterID2, x701134_AI_Config[difficulty].skillid, 0)  --添加 削弱的buff  
		    end		   
			local nCurHp = GetHp(varMap, BossId)
			local maxHp = GetMaxHp(varMap,BossId)
			
			SetHp( varMap, monsterID1, nCurHp-maxHp )
			SetHp( varMap, monsterID2, nCurHp-maxHp )
			
		    SetFubenData_Param(varMap, x701134_CSP_HUANXIANG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
    end
end
