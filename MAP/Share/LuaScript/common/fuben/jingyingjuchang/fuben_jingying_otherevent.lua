----精英剧场其他事件，每个精英剧场都得带此AI-----------------

x701151_var_FileId 					= 701151

x701151_CSP_FUBENTYPE				= 0
x701151_CSP_SCRIPTID				=	1
x701151_CSP_TICKCOUNT				= 2
x701151_CSP_BACKSCENEID			= 3
x701151_CSP_ISCLOSING				= 4
x701151_CSP_LEAVECOUNTDOWN	= 5
x701151_CSP_TEAMID					=	6
x701151_CSP_TICKTIME				=	7
x701151_CSP_HOLDTIME				=	8
x701151_CSP_FUBENLEVEL			=	9

-----------------20到39的csp为剧场副本和ai交互用
x701151_CSP_DIFFICULTY  =  20   ----剧场困难程度  1 为容易  2 为中等   3 为困难
x701151_CSP_BOSSID = 27
x701151_CSP_PLAYERID = 28

x701151_CSP_BOSS_X = 30
x701151_CSP_BOSS_Z = 31

--------------ai csp(本ai范围为180~189)---------------------
x701151_CSP_HUOQUAN_RADIUS = 180   ---火圈半径



x701151_AI_Config =   ----trap火球id，interval火圈半径每次变化减少码值，trapRadiusMax火圈半径最大码值（半径初始值），trapRadiusMax火圈半径最小码值(小于或等于此值，半径不再变小)
{
    {trap = 492, interval=2, trapRadiusMax = 50, trapRadiusMin = 30},   -- 容易
    {trap = 492, interval=3, trapRadiusMax = 50, trapRadiusMin = 30},   -- 中等
    {trap = 492, interval=4, trapRadiusMax = 50, trapRadiusMin = 30},   -- 困难
}


function x701151_ProcFubenSceneCreated( varMap )
    local difficulty = GetFubenData_Param(varMap, x701151_CSP_DIFFICULTY)
    SetFubenData_Param(varMap, x701151_CSP_HUOQUAN_RADIUS, x701151_AI_Config[difficulty].trapRadiusMax)
end

function x701151_EnterTick(varMap, nowTickCount)    
	if mod(nowTickCount,4) ~=0 then return end
    local BossId = GetFubenData_Param(varMap, x701151_CSP_BOSSID)
     local playerID = GetFubenData_Param(varMap, x701151_CSP_PLAYERID)
    
    if (BossId == -1) then
        return
    end
    
    WriteLog(1, "x701151_EnterTick ============== nowTickCount:"..nowTickCount)
    
	  local difficulty = GetFubenData_Param(varMap, x701151_CSP_DIFFICULTY)
	  
	  local radius = GetFubenData_Param(varMap, x701151_CSP_HUOQUAN_RADIUS)  -----火圈半径
	  local trapNum = 4*radius/5    ------火球数量
	  
	  local nIsInCombat = IsMosterInCombatState(varMap, BossId)   --获取战斗状态
	  --if (nIsInCombat == 1) then
	      local nBossX, nBossZ = GetMonsterPosition(varMap, BossId)  -----boss的坐标
	      local nTargetX = GetFubenData_Param(varMap, x701151_CSP_BOSS_X)
	      local nTargetZ = GetFubenData_Param(varMap, x701151_CSP_BOSS_Z)
	      
	      local nInc = 360/trapNum   ----角度增量
		    local nAngle = 0   ---------角度
		    local nTrapX = 0   
		    local nTrapZ = 0
		    
		    for i =1, trapNum do
		    		local incX = radius * sin(nAngle)
		        local incZ = radius * cos(nAngle)
		        
		        nTrapX = nTargetX + incX 
		        nTrapZ = nTargetZ + incZ 
		       	--创建火圈.
		       	if BossId ~= -1 then
		        --CreateTrap(varMap, BossId, nTrapX, nTrapZ, x701151_AI_Config[difficulty].trap)
		        	CreateMonster(varMap, 63067, nTrapX, nTrapZ, 3, -1, -1, -1, 20, 12000, 0, "  ",   "  ", -1)
		        end
		        --反隐buff
		    	if IsHaveSpecificImpact(varMap,playerID,32059) ~= 1 then
			    	SendSpecificImpactToUnit(varMap, playerID, playerID, playerID, 32059, 0)
			    end       
		        
		        nAngle = nAngle + nInc
		    end
		    
		    if (nIsInCombat == 1) then
		       ----检测boss是否在火圈内,不在加狂暴buff
		       if ( (nBossX-nTargetX)^ 2 + (nBossZ-nTargetZ)^ 2 > radius^2 ) then
		       		NpcTalk(varMap, BossId,"懦夫，你激怒我了，你就只会跑么！",-1)
		      		Msg2Player( varMap, playerID, "BOSS一声怒吼，狂暴了！", 8, 3 )	

		             ---狂暴buff       
		       		 if IsHaveSpecificImpact(varMap,BossId,32252) ~= 1 then
			             SendSpecificImpactToUnit(varMap, BossId, BossId, BossId, 32252, 0)
			             
						 SendSpecificImpactToUnit(varMap, BossId, BossId, BossId, 32253, 0)
			         end 
			   else      
			  		 ---取消狂暴buff       
		       		 if IsHaveSpecificImpact(varMap,BossId,32252) == 1 then
			             CancelSpecificImpact(varMap,BossId, 32252)
			             CancelSpecificImpact(varMap,BossId, 32253)
			         end  	
		       end
		    
		        ---火圈半径变化
		        local interval = x701151_AI_Config[difficulty].interval    ------火圈半径每次变化减少码值
		        local trapRadiusMin = x701151_AI_Config[difficulty].trapRadiusMin    ----火圈半径最小码值(小于或等于此值，半径不再变小)
		        if radius > trapRadiusMin then
		            if radius > trapRadiusMin + interval then
		                radius = radius - interval
		            else
		                radius = trapRadiusMin
		            end
		        end  
		    
		        SetFubenData_Param(varMap, x701151_CSP_HUOQUAN_RADIUS, radius)
		    end
	  --end
end
