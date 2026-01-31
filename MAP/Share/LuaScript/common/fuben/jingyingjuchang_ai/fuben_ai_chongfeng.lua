----冰洁AI-----------------

x701132_var_FileId 					= 701132

x701132_CSP_FUBENTYPE				= 0
x701132_CSP_SCRIPTID				=	1
x701132_CSP_TICKCOUNT				= 2
x701132_CSP_BACKSCENEID			= 3
x701132_CSP_ISCLOSING				= 4
x701132_CSP_LEAVECOUNTDOWN	= 5
x701132_CSP_TEAMID					=	6
x701132_CSP_TICKTIME				=	7
x701132_CSP_HOLDTIME				=	8
x701132_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701132_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701132_CSP_BOSSID = 27
x701132_CSP_PLAYERID = 28

--------------ai csp(本ai范围为50~59)---------------------
x701132_CSP_CHONGFENG_BOSS_COMBAT_START_TIME = 50 -- boss 进入战斗时间
x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_RECORD1 = 51 --冷却时间
x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE = 52	--技能施放状态
x701132_CSP_CHONGFENG_BOSS_COMBAT_NPC = 53					--空NPC



x701132_AI_COOLDOWN_BASE	=	3    --技能基础冷却时间

x701132_AI_Config = 
{
		--skillid1为流星坠落buff，skillid2为冲锋技能
    {skillid1 = 13764, skillid2 = 13750, skillid3 = 13751, skillid4 = 32184 },   -- 容易
    {skillid1 = 13764, skillid2 = 13750, skillid3 = 13751, skillid4 = 32184 },   -- 中等
    {skillid1 = 13764, skillid2 = 13750, skillid3 = 13751, skillid4 = 32184 },   -- 困难
}


function x701132_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_RECORD1, 0)
    SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 0)
    
end

function x701132_EnterTick(varMap,nowTickCount)
	-- 战斗状态判定
	--WriteLog(1, "x701132_EnterTick ============== nowTickCount:"..nowTickCount)
	local BossId = GetFubenData_Param(varMap, x701132_CSP_BOSSID)
	local difficulty = GetFubenData_Param(varMap, x701132_CSP_DIFFICULTY)
	local nTimeRecord = GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_START_TIME)
	local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	if ( nIsInCombat == 1 ) then
	    if (nTimeRecord == 0) then
	    	SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_START_TIME, nowTickCount)
		    SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	    end
	else
	    if (nTimeRecord ~= 0) then
	        SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_START_TIME, 0)
		    SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_RECORD1, 0)
	    end
	end

	local nTimeRecord1 = GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_RECORD1)
	local nPassTime1 = nowTickCount - nTimeRecord1
	local timeRandom = -1
	local stateskill = GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE)
	if stateskill == 0 then
		timeRandom = random(3)
		SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 1)
	end
	--技能冷却时间到时
	--WriteLog(1, "x701132_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	--WriteLog(1, "x701132_EnterTick =nPassTime1:"..nPassTime1)
	if ( nIsInCombat == 1 and nPassTime1 >= x701132_AI_COOLDOWN_BASE + timeRandom ) then
	  		--print(GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE))
		if GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE) == 1 then
		--设置技能状态开始计时
		SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 2)
		end
		--WriteLog(1, "x701132_EnterTick ============== UnitUseSkill111")
		local BossId = GetFubenData_Param(varMap, x701132_CSP_BOSSID) 
	    local playerID = GetFubenData_Param(varMap, x701132_CSP_PLAYERID)  -----玩家id
		--获取位置
		local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
		local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)

		--创建空NPC
		if GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE) == 2 then
			local tempobj = CreateMonster(varMap,63063,nPlayerX,nPlayerZ,3,-1,-1,-1,24,30000,0,"  ","  ")
			--WriteLog(1, "x701132_EnterTick ============== 创建空npc")
			--MonsterDoAction(varMap, BossId,27,-1)
			UnitUseSkill(varMap, BossId, x701132_AI_Config[difficulty].skillid1, playerID, nTargetX, nTargetZ, -1.0, 0)
			SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_NPC,tempobj)
			SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 3)
		end
		--等待2秒时间
		if GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE) == 3 then
			--WriteLog(1, "x701132_EnterTick ============== 等待5秒时间")
			if nPassTime1 >= x701132_AI_COOLDOWN_BASE + timeRandom + 1 then
				
				SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 4)
			end
		end
		--冲锋
		if GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE) == 4 then
			WriteLog(1, "x701132_EnterTick ============== 冲锋")
			local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
			local kongnpc =GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_NPC)
			local kongnpcX, kongnpcZ = GetMonsterPosition(varMap,kongnpc)
			local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)
			--print(playerID,kongnpc, kongnpcX, kongnpcZ)
			UnitUseSkill(varMap, BossId, x701132_AI_Config[difficulty].skillid2, kongnpc, kongnpcX, kongnpcZ, -1.0, 0)
			--UnitUseSkill(varMap, BossId, 13701, BossId, nTargetX, nTargetZ, -1.0, 0)
			SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 5)
		end
		
	  --UnitUseSkill(varMap, BossId, x701132_AI_Config[difficulty].skillid, playerID, nTargetX, nTargetZ, -1.0, 0)
	   if GetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE) == 5 then
	   	  --进入冷却CD
	      --WriteLog(1, "x701132_EnterTick ============== 进入冷却")
	      SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	      SetFubenData_Param(varMap, x701132_CSP_CHONGFENG_BOSS_COMBAT_TIME_STATE, 0)
	   end
	end
end
