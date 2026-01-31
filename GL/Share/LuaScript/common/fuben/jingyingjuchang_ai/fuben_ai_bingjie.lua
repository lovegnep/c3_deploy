----冰洁AI-----------------

x701131_var_FileId 					= 701131

x701131_CSP_FUBENTYPE				= 0
x701131_CSP_SCRIPTID				=	1
x701131_CSP_TICKCOUNT				= 2
x701131_CSP_BACKSCENEID			= 3
x701131_CSP_ISCLOSING				= 4
x701131_CSP_LEAVECOUNTDOWN	= 5
x701131_CSP_TEAMID					=	6
x701131_CSP_TICKTIME				=	7
x701131_CSP_HOLDTIME				=	8
x701131_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701131_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701131_CSP_BOSSID = 27
x701131_CSP_PLAYERID = 28

--------------ai csp(本ai范围为40~49)---------------------
x701131_CSP_BINGJIE_BOSS_COMBAT_START_TIME = 40 -- boss 进入战斗时间
x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_RECORD1 = 41 --冷却时间
x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE = 42	--技能施放状态
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC1 = 43 --空NPC1
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC2 = 44 --空NPC2                                     
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC3 = 45 --空NPC3
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC4 = 46 --空NPC4                                       
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC5 = 47 --空NPC5  
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC6 = 48 --空NPC6  
x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC7 = 49 --空NPC7  



x701131_AI_COOLDOWN_BASE	=	7    --技能基础冷却时间

x701131_AI_Config = 
{
	--skillid1为冰球伤害buff，skillid2为爆炸buff,skillid3为冰冻buff
    {skillid1 = 32184, skillid2 = 7807, skillid3 = 32183 },   -- 容易
    {skillid1 = 32204, skillid2 = 7807, skillid3 = 32203 },   -- 中等
    {skillid1 = 32224, skillid2 = 7807, skillid3 = 32223 },   -- 困难
}


function x701131_ProcFubenSceneCreated( varMap )
    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_START_TIME, 0)
    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_RECORD1, 0)
    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 0)
    
end

function x701131_EnterTick(varMap,nowTickCount)
	--print("aaaaaaaaa========="..nowTickCount)
	-- 战斗状态判定
	--WriteLog(1, "x701131_EnterTick ============== nowTickCount:"..nowTickCount)
	local BossId = GetFubenData_Param(varMap, x701131_CSP_BOSSID)
	local difficulty = GetFubenData_Param(varMap, x701131_CSP_DIFFICULTY)
	local nTimeRecord = GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_START_TIME)
	local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	if ( nIsInCombat == 1 ) then
	    if (nTimeRecord == 0) then
	    	SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_START_TIME, nowTickCount)
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_RECORD1, nowTickCount)
	    end
	else
	    if (nTimeRecord ~= 0) then
	        SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_START_TIME, 0)
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_RECORD1, 0)
	    end
	end
	  
	local nTimeRecord1 = GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_RECORD1)
	local nPassTime1 = nowTickCount - nTimeRecord1
	local timeRandom = -1
	local stateskill = GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE)
	if stateskill == 0 then
		timeRandom = random(7)
		SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 1)
	end
	--技能冷却时间到时
	--WriteLog(1, "x701131_EnterTick ============== nTimeRecord1:"..nTimeRecord1.." nPassTime1:"..nPassTime1.." nIsInCombat:"..nIsInCombat)
	--WriteLog(1, "x701131_EnterTick =nPassTime1:"..nPassTime1)
	--print(nPassTime1)
	if ( nIsInCombat == 1 and nPassTime1 >= x701131_AI_COOLDOWN_BASE + timeRandom ) then
		if   GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE) == 1 then
		--设置技能状态开始计时
		SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 2)
		end
		--WriteLog(1, "x701131_EnterTick ============== UnitUseSkill111")
		local BossId = GetFubenData_Param(varMap, x701131_CSP_BOSSID) 
	    local playerID = GetFubenData_Param(varMap, x701131_CSP_PLAYERID)  -----玩家id
		--获取位置
		local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
		local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId)
		
		local eventPos = {{x=1,y=1},{x=1,y=1},{x=1,y=1},{x=1,y=1},{x=1,y=1},{x=1,y=1},{x=1,y=1}}
		local tempobj = {}
		--创建冰球
		if GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE) == 2 then
			--print("nononononono"..GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE))
			--随机挑出3个位置
			for i=1,7,1 do
				eventPos[i].x = nPlayerX+random(-10,10)
				eventPos[i].y = nPlayerZ+random(-10,10)
			end
			
			--在该位置创建空npc
			for j=1,7,1 do
				tempobj[j] = CreateMonster(varMap,63064,eventPos[j].x,eventPos[j].y,3,-1,x701131_var_FileId,-1,20,2500,0,"  ","  ")
				--print(tempobj[j])
			end
		    --WriteLog(1, "x701131_EnterTick ============== 在该位置创建空npc")
		    --print( tempobj[1], tempobj[2], tempobj[3], tempobj[4], tempobj[5], tempobj[6], tempobj[7])
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC1, tempobj[1])
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC2, tempobj[2])
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC3, tempobj[3])	
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC4, tempobj[4])
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC5, tempobj[5])
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC6, tempobj[6])		    	    
		    SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC7, tempobj[7])	
		    
		    NpcTalk(varMap, BossId,"让寒冷侵蚀掉你的躯壳！",-1)
		    --设置技能状态开始计时
			SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 3)
		end
		--等待4秒时间
		if GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE) == 3 then
			if nPassTime1 >= x701131_AI_COOLDOWN_BASE + timeRandom + 1 then
				--WriteLog(1, "x701131_EnterTick ============== 等待 1秒时间")
				SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 4)
			end
		end
		
		--创建播放爆炸特效创建陷阱
		if GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE) == 4 then
			local kongobj = {}
			local tempbingqiuobj = {
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC1,
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC2,
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC3,
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC4,
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC5,
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC6,
				x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC7,
			}
			for a = 1 ,7 ,1 do
				kongobj[a]= GetFubenData_Param(varMap, tempbingqiuobj[a])
				--print(kongobj[a])
				if IsHaveSpecificImpact(varMap,kongobj[a],x701131_AI_Config[difficulty].skillid2) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, kongobj[a], kongobj[a], kongobj[a], x701131_AI_Config[difficulty].skillid2, 0)
			    end
			   	--冰球爆炸
				--WriteLog(1, "x701131_EnterTick ============== 冰球爆炸")
			    local nPlayerX, nPlayerZ = GetWorldPos(varMap,playerID)
			    if kongobj[a] ~= -1 then
			   
					local bingqiuX,bingqiuY  = GetMonsterPosition(varMap, kongobj[a])
					--print(a,kongobj[a])
					if (nPlayerX-bingqiuX)*(nPlayerX-bingqiuX)+(nPlayerZ-bingqiuY)*(nPlayerZ-bingqiuY)<=36 then
						if IsHaveSpecificImpact(varMap,playerID,x701131_AI_Config[difficulty].skillid3) ~= 1 then
					    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, x701131_AI_Config[difficulty].skillid3, 0)
					    end
			    	if IsHaveSpecificImpact(varMap,v,x701131_AI_Config[difficulty].skillid1) ~= 1 then
				    	SendSpecificImpactToUnit(varMap, v, v, v, x701131_AI_Config[difficulty].skillid1, 0)
				    end
					end
					if kongobj[a] ~= -1 then
						DeleteMonsterEx(varMap,kongobj[a])
					end
					
				end
		    end
			SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 5)
		end
		
	  --UnitUseSkill(varMap, BossId, x701131_AI_Config[difficulty].skillid, playerID, nTargetX, nTargetZ, -1.0, 0)
	   if GetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE) == 5 then
	   	  --进入冷却CD
	      --WriteLog(1, "x701131_EnterTick ============== 进入冷却")
	      SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_RECORD1, nowTickCount+1)
	      SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_TIME_STATE, 0)
	      SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC1, -1)
		  SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC2, -1)
		  SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC3, -1)	
		  SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC4, -1)
		  SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC5, -1)
		  SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC6, -1)		    	    
		  SetFubenData_Param(varMap, x701131_CSP_BINGJIE_BOSS_COMBAT_EMPTYNPC7, -1)	
	   end
	end
end
