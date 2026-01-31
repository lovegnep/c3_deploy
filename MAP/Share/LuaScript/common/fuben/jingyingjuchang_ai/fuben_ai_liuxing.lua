----流星AI-----------------

x701137_var_FileId 					= 701137

x701137_CSP_FUBENTYPE				= 0
x701137_CSP_SCRIPTID				=	1
x701137_CSP_TICKCOUNT				= 2
x701137_CSP_BACKSCENEID			= 3
x701137_CSP_ISCLOSING				= 4
x701137_CSP_LEAVECOUNTDOWN	= 5
x701137_CSP_TEAMID					=	6
x701137_CSP_TICKTIME				=	7
x701137_CSP_HOLDTIME				=	8
x701137_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701137_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701137_CSP_BOSSID = 27
x701137_CSP_PLAYERID = 28

--------------ai csp(本ai范围为100~109)---------------------
x701137_CSP_LIUXING_BOSS_COMBAT_START_TIME = 100 -- boss 进入战斗时间
x701137_CSP_LIUXING_BOSS_COMBAT_TIME_RECORD1 = 101 --冷却时间
x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE = 102	--技能施放状态
x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC1 = 103 --空NPC1
x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC2 = 104 --空NPC2
x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC3 = 105 --空NPC3

x701137_AI_COOLDOWN_BASE	=	4    --技能基础冷却时间

x701137_AI_Config = 
{
		--skillid1为流星坠落buff，skillid2为爆炸buff
    {skillid1 = 7805, skillid2 = 7806,trap = 492 , skillid4 = 32192},   -- 容易
    {skillid1 = 7805, skillid2 = 7806,trap = 492 , skillid4 = 32212},   -- 中等
    {skillid1 = 7805, skillid2 = 7806,trap = 492 , skillid4 = 32232},   -- 困难
}


function x701137_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_RECORD1, 0)
    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 0)
    
end

function x701137_EnterTick(varMap,nowTickCount)
	-- 战斗状态判定
	--WriteLog(1, "x701137_EnterTick ============== nowTickCount:"..nowTickCount)
	local BossId = GetFubenData_Param(varMap, x701137_CSP_BOSSID)
	local difficulty = GetFubenData_Param(varMap, x701137_CSP_DIFFICULTY)
	local nTimeRecord = GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_START_TIME)
	local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	if ( nIsInCombat == 1 ) then
	    if (nTimeRecord == 0) then
	    	SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_START_TIME, nowTickCount)
		    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	    end
	else
	    if (nTimeRecord ~= 0) then
	        SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_START_TIME, 0)
		    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_RECORD1, 0)
	    end
	end
	  
	local nTimeRecord1 = GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_RECORD1)
	local nPassTime1 = nowTickCount - nTimeRecord1
	--print(nPassTime1)
	local timeRandom = -1
	local stateskill = GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE)
	if stateskill == 0 then
		timeRandom = random(3)
		SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 1)
	end
	--技能冷却时间到时
	--WriteLog(1, "x701137_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	if ( nIsInCombat == 1 and nPassTime1 >= x701137_AI_COOLDOWN_BASE + timeRandom ) then  
		if GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE) == 1 then
			--设置技能状态开始计时
			SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 2)
		end
		--WriteLog(1, "x701137_EnterTick ============== UnitUseSkill111")
		local BossId = GetFubenData_Param(varMap, x701137_CSP_BOSSID) 
	    local playerID = GetFubenData_Param(varMap, x701137_CSP_PLAYERID)  -----玩家id
		--获取位置
		local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
		local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)
		
		local eventPos = {{x=1,y=1},{x=1,y=1},{x=1,y=1}}
		local tempobj = {}
		--状态为创建空NPC，播放流星坠落特效
		if GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE) == 2 then
			--随机挑出3个位置
			--print(nPlayerX, nPlayerZ)
			eventPos[1].x = nPlayerX+random(-10,10)
			eventPos[2].x = nPlayerX+random(-10,10)
			eventPos[3].x = nPlayerX+random(-10,10)
			eventPos[1].y = nPlayerZ+random(-10,10)
			eventPos[2].y = nPlayerZ+random(-10,10)
			eventPos[3].y = nPlayerZ+random(-10,10)
			NpcTalk(varMap, BossId,"天外陨石听从我的召唤吧！",-1)
			--在该位置创建空npc
			tempobj[1] = CreateMonster(varMap,63063,eventPos[1].x,eventPos[1].y,3,-1,x701137_var_FileId,-1,20,6000,0,"  ","  ")
			tempobj[2] = CreateMonster(varMap,63063,eventPos[2].x,eventPos[2].y,3,-1,x701137_var_FileId,-1,20,6000,0,"  ","  ")
			tempobj[3] = CreateMonster(varMap,63063,eventPos[3].x,eventPos[3].y,3,-1,x701137_var_FileId,-1,20,6000,0,"  ","  ")
		    WriteLog(1, "x701137_EnterTick ============== 在该位置创建空npc")
		    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC1, tempobj[1])
		    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC2, tempobj[2])
		    SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC3, tempobj[3])	
		    for k , v in tempobj do
		    	if IsHaveSpecificImpact(varMap,v,x701137_AI_Config[difficulty].skillid1) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, v, v, v, x701137_AI_Config[difficulty].skillid1, 0)
			    end
		    end
		    --设置技能状态开始计时
			SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 3)
		end
		--等待2秒时间
		if GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE) == 3 then
			if nPassTime1 >= x701137_AI_COOLDOWN_BASE + timeRandom+1  then
				WriteLog(1, "x701137_EnterTick ============== 等待2秒时间")
				SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 4)
			end
		end
		
		--创建播放爆炸特效创建陷阱
		if GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE) == 4 then
			local kongobj1 = GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC1) 
		    local kongobj2 = GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC2) 
		    local kongobj3 = GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC3) 
			--print(kongobj1,kongobj2,kongobj3)
		    if IsHaveSpecificImpact(varMap,kongobj1,x701137_AI_Config[difficulty].skillid2) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, kongobj1, kongobj1, kongobj1, x701137_AI_Config[difficulty].skillid2, 0)
		    end
		    if IsHaveSpecificImpact(varMap,kongobj2,x701137_AI_Config[difficulty].skillid2) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, kongobj2, kongobj2, kongobj2, x701137_AI_Config[difficulty].skillid2, 0)
		    end
		    if IsHaveSpecificImpact(varMap,kongobj3,x701137_AI_Config[difficulty].skillid2) ~= 1 then
		    	SendSpecificImpactToUnit(varMap, kongobj3, kongobj3, kongobj3, x701137_AI_Config[difficulty].skillid2, 0)
		    end
--		    --创建陷阱
--	    	if IsHaveSpecificImpact(varMap,playerID,32059) ~= 1 then
--		    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, 32059, 0)
--		    end
			--WriteLog(1, "x701137_EnterTick ============== 创建陷阱")
			
			local x1,y1 =GetMonsterPosition(varMap,kongobj1)
			local x2,y2 =GetMonsterPosition(varMap,kongobj2)
			local x3,y3 =GetMonsterPosition(varMap,kongobj3)
			--print(x1,y1,kongobj1)
			if (nPlayerX- x1)*(nPlayerX- x1) +  (nPlayerZ-y1) * (nPlayerZ-y1) <36  then
				if IsHaveSpecificImpact(varMap,playerID,x701137_AI_Config[difficulty].skillid4) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701137_AI_Config[difficulty].skillid4, 0)
			    end
			end
			
			if (nPlayerX- x2)*(nPlayerX- x2) +  (nPlayerZ-y2) * (nPlayerZ-y2) <36  then
				if IsHaveSpecificImpact(varMap,playerID,x701137_AI_Config[difficulty].skillid4) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701137_AI_Config[difficulty].skillid4, 0)
			    end
			end
			if (nPlayerX- x3)*(nPlayerX- x3) +  (nPlayerZ-y3) * (nPlayerZ-y3) <36  then
				if IsHaveSpecificImpact(varMap,playerID,x701137_AI_Config[difficulty].skillid4) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701137_AI_Config[difficulty].skillid4, 0)
			    end
			end
--		    CreateTrap(varMap,BossId,x1,y1,x701137_AI_Config[difficulty].trap)
--		    CreateTrap(varMap,BossId,x2,y2,x701137_AI_Config[difficulty].trap)
--		    CreateTrap(varMap,BossId,x3,y3,x701137_AI_Config[difficulty].trap)
		    	--print(BossId,x1,y1,x701137_AI_Config[difficulty].trap)
			SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 5)
		end
		
	  --UnitUseSkill(varMap, BossId, x701137_AI_Config[difficulty].skillid, playerID, nTargetX, nTargetZ, -1.0, 0)
	   if GetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE) == 5 then
	   	  --进入冷却CD
	      WriteLog(1, "x701137_EnterTick ============== 进入冷却")
	      SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_RECORD1, nowTickCount+1)
	      SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_STATE, 0)
          SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC1,0)
	      SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC2,0)
	      SetFubenData_Param(varMap, x701137_CSP_LIUXING_BOSS_COMBAT_TIME_EMPTYNPC3,0)	
	   end
	end
end
