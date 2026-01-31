
x700024_CSP_FUBENTYPE				= 	0
x700024_CSP_SCRIPTID				=	1
x700024_CSP_TICKCOUNT				= 	2
x700024_CSP_FROMSCENEID				= 	3
x700024_CSP_ISCLOSING				= 	4
x700024_CSP_LEAVECOUNTDOWN			= 	5
x700024_CSP_TEAMID					=	6
x700024_CSP_BACKSCENEX       		=   7
x700024_CSP_BACKSCENEZ      		=   8
x700024_CSP_FUBENLEVEL				=	9
x700024_CSP_AREA_FLAG				=	19
x700024_CSP_AREA_ID					=	20
x700024_CSP_BOSS_ID					=   21
x700024_CSP_BOSS1_ID				=   22
x700024_CSP_BOSS2_ID				=   23


x700024_CSP_FUBEN_SCENE_ID			=	24


x700024_CSP_GUTMONSTER1_ID			=	25
x700024_CSP_GUTMONSTER2_ID			=	26

x700024_CSP_GUTMONSTER1_TALK		=	28
x700024_CSP_GUTMONSTER2_TALK		=	29

x700024_CSP_XIAOBIN_COUNT			=	39
x700024_CSP_XIAOBIN_LEAVECOUNT		=	40
x700024_CSP_XIAOBIN_ID_START		=	41		
x700024_CSP_XIAOBIN2_COUNT			=	99
x700024_CSP_XIAOBIN2_LEAVECOUNT		=	100
x700024_CSP_XIAOBIN2_ID_START		=	101		

x700024_CSP_BOSS1_FLAG				=	200
x700024_CSP_BOSS2_FLAG				=	201

x700024_CSP_BOSS_KUANGBAO_FLAG		= 	202	-- boss狂暴标记
x700024_CSP_BOSS_HP_STEP_FLAG_START =	203 -- boss由血量触发的行为标记 203 - 223

x700024_CSP_ZHANCHE					 = 238
x700024_CSP_XIANJINBOSS				=	239

x700024_CSP_HUMAN_COUNT				=	240
x700024_CSP_OBJID_START				=	241

x700024_CSP_GUID_START              =   248  
x700024_CSP_FUBEN_TYPE				=	254	
x700024_CSP_FUBEN_MODE				=   255 

x700024_var_FileId 					= 700024
x700024_var_QuestId					= 6608

x700024_var_SubmitNPC                 =   { type =25007,guid= 150507,varX = 54, z=71, facedir =0, title="" }
				
x700024_var_Shark_FinalX					=	55
x700024_var_Shark_FinalZ					=	60

x700024_var_Level_Limit 					= 70
x700024_var_Rate_Limit						= 50

x700024_var_Skill_Use = {
							--使用几率x%,技能id,技能类型0单体1群攻
							{pre=5,	        skillID=13700,		skilltype=0}, 
							{pre=2,	        skillID=13701,		skilltype=1}, 
							{pre=93,	      skillID=0,		skilltype=0}, 
						}

x700024_var_skill_Trap = {488,489,490}--{13709,13708,13711} -- 陷阱技能id
x700024_var_hp_step = 	{	-- 血量由小变大
							-- 血量百分比，技能id，技能类型0单攻1群攻
							{hp=0.2, skillid = 1, skilltype =0},
							{hp=0.4, skillid = 2, skilltype =0},
							{hp=0.6, skillid = 3, skilltype =0},
							{hp=0.8, skillid = 4, skilltype =0},
						}

x700024_var_boss_kuangbao_time = 300	-- boss战斗开始后xx秒后狂暴
x700024_var_boss_kuangbao_buffid = 32071	-- boss战斗开始后xx秒后狂暴的buffid

function x700024_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
end


function x700024_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700024_CSP_AREA_ID, varArea)
	
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID)
		if BossId ~= -2 then
			return 
		end
		SetFubenData_Param(varMap, x700024_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700024_var_QuestId, x700024_var_FileId)

	elseif varArea == 1 then
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700024_var_QuestId, x700024_var_FileId)
	elseif varArea == 2 then
		local monId = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID) 
		if monId == -1 then
			x700024_CreateGutMonster2(varMap)
		end
	elseif varArea == 3 then
		local monId = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID) 
		if monId == -1 then
			x700024_CreateGutMonster1(varMap)
		end
	end

end	

function x700024_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700024_CSP_AREA_ID, -1)

end

function x700024_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700024_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID)
		if BossId ~= -2 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700024_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700024_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700024_var_QuestId, x700024_var_FileId)

	elseif varArea == 1 then
		
	end
end

function x700024_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700024_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);
	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700024_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_COUNT, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_ID_START, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_COUNT, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_ID_START, -1 ) 

	SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID, -1 ) 
	
	SetFubenData_Param(varMap, x700024_CSP_BOSS1_ID, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_BOSS2_ID, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_BOSS_ID, -1 ) 
	SetFubenData_Param(varMap, x700024_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700024_CSP_XIANJINBOSS, -1 )
	
	SetFubenData_Param(varMap, x700024_CSP_BOSS1_FLAG, 0 ) 
	SetFubenData_Param(varMap, x700024_CSP_BOSS2_FLAG, 0 ) 
	
	SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_TALK, 0 ) 
	SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_TALK, 0 ) 

	SetFubenData_Param(varMap, x700024_CSP_BOSS_KUANGBAO_FLAG, 0)
	
	for i = 0, getn(x700024_var_hp_step) - 1 do
		SetFubenData_Param(varMap, x700024_CSP_BOSS_HP_STEP_FLAG_START + i, 0)
	end
	
   	x700024_CreateMonster( varMap )
   	x700024_CreateMonster1( varMap )
   	x700024_CreateMonster2( varMap )

end

function x700024_EnterTick(varMap, nowTickCount)
	
	
	local xiaobinCount = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN_LEAVECOUNT ) 
	local varFlag1 = GetFubenData_Param(varMap, x700024_CSP_BOSS1_FLAG ) 
	local bossId1 = GetFubenData_Param(varMap, x700024_CSP_BOSS1_ID ) 
	local nGutId1 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID ) 
	
	local talk1 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_TALK) 
	if nGutId1 >= 0 and talk1 == 0 then
		NpcTalk(varMap, nGutId1, "要速去通报张士诚将军，有人前来阻挠我们夺取玉玺。",  -1)
		SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_TALK, 1) 
	end
	
	if nGutId1 >= 0 and bossId1 == -1 then
		
		local varX,z = GetWorldPos(varMap,nGutId1)
		if varFlag1 == 0 then
			
			if z <= 155 then
				if xiaobinCount == 0 then
					
					SetMonsterCamp(varMap,nGutId1,21)
					
					
				else
					SetFubenData_Param(varMap, x700024_CSP_BOSS1_FLAG, 1 ) 
				end
			else
				if xiaobinCount == 0 then
					SetMonsterCamp(varMap,nGutId1,21)
				end
			end
		else
			if z <= 60 then
				DeleteMonster(varMap,nGutId1)
				SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID, -2) 
				x700024_CreateBoss1(varMap)
			end
		end
	end

	local xiaobin2Count = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_LEAVECOUNT ) 
	
	
	local varFlag2 = GetFubenData_Param(varMap, x700024_CSP_BOSS2_FLAG ) 
	local bossId2 = GetFubenData_Param(varMap, x700024_CSP_BOSS2_ID ) 
	local nGutId2 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID ) 
	
	local talk2 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_TALK, 0 ) 
	if nGutId2 >= 0 and talk2 == 0 then
		NpcTalk(varMap, nGutId2, "要速去通报张士诚将军，有人前来阻挠我们夺取玉玺。",  -1)
		SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_TALK, 1) 
	end
	
	
	if nGutId2 >= 0 and bossId2 == -1 then
		local varX,z = GetWorldPos(varMap,nGutId2)
		if varFlag2 == 0 then
			if z <= 78 then
				if xiaobin2Count == 0 then
					SetMonsterCamp(varMap,nGutId2,21)
					
				else
					SetFubenData_Param(varMap, x700024_CSP_BOSS2_FLAG, 1 ) 
				end
			else
				if xiaobin2Count == 0 then
					SetMonsterCamp(varMap,nGutId2,21)
				end
			end
		else
			if z <= 60 then
				DeleteMonster(varMap,nGutId2)
				SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID, -2 ) 
				x700024_CreateBoss2(varMap)
			end
		end
	end       

	-- 处理boss的tick
	if(GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE) == 2) then
		x700024_ProcBossTick(varMap)
	end
	
end
function x700024_CreateGutMonster1(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
		    
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 20,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 20,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID, varRet ) ;
			SetPatrolId(varMap, varRet, 0)
			
			return
        end
	end

end
function x700024_CreateGutMonster2(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
		    
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 20,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 20,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID, varRet ) ;
			SetPatrolId(varMap, varRet, 1)
			
			return
        end
	end

end
function x700024_CreateBoss(varMap)
	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )

	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 8 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir)
			end
			if (nFubenType == 2) then
				SetMonsterUseSkillByScript(varMap, varRet, 1);
			end
			SetFubenData_Param(varMap, x700024_CSP_BOSS_ID, varRet )
		end
	end

end

function x700024_CreateBoss1(varMap)

	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )

	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700024_CSP_BOSS1_ID, varRet )
			
        end
	end

end
function x700024_CreateBoss2(varMap)
	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )

	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700024_CSP_BOSS2_ID, varRet )
			
        end
	end

end



function x700024_CreateMonster(varMap) 


    local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) ;

	local varCount = 0
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir)
				
				end
				
            end
        end
	end

end


function x700024_CreateMonster1(varMap) 


    local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) ;

	local nCount = 0
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir)
				
				end
				SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_ID_START+nCount, varRet ) ;
				nCount = nCount+1
            end
        end
	end
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_COUNT, nCount ) 
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_LEAVECOUNT, nCount ) 

end

function x700024_CreateMonster2(varMap) 


    local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) ;

	local nCount = 0
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir)
				
				end
				SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_ID_START+nCount, varRet ) ;
				nCount = nCount+1
            end
        end
	end
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_LEAVECOUNT, nCount ) ;
	SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_COUNT, nCount ) 
	

end


function x700024_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700024_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700024_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local nXiaobinCount = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN_COUNT ) ;
	local nLeaveXiaobinCount = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN_LEAVECOUNT ) ;
	for varI=0, nXiaobinCount-1 do
		local nObjMonsterId = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN_ID_START+varI );
		if nObjMonsterId>=0 then
			if nObjMonsterId== varPlayer then
				SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_ID_START+varI, -1 );
				nLeaveXiaobinCount = nLeaveXiaobinCount - 1
				SetFubenData_Param(varMap, x700024_CSP_XIAOBIN_LEAVECOUNT, nLeaveXiaobinCount )
				break
			end
		end
	end

	local nXiaobin2Count = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_COUNT ) ;
	local nLeaveXiaobin2Count = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_LEAVECOUNT ) ;
	for varI=0, nXiaobin2Count-1 do
		local nObjMonsterId = GetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_ID_START+varI );
		if nObjMonsterId>=0 then
			if nObjMonsterId== varPlayer then
				SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_ID_START+varI, -1 );
				nLeaveXiaobin2Count = nLeaveXiaobin2Count - 1
				SetFubenData_Param(varMap, x700024_CSP_XIAOBIN2_LEAVECOUNT, nLeaveXiaobin2Count )
				break
			end
		end
	end

	local bossId1 = GetFubenData_Param(varMap, x700024_CSP_BOSS1_ID )
	local bossId2 = GetFubenData_Param(varMap, x700024_CSP_BOSS2_ID )
	local bossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID )
	local gut1 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID )
	local gut2 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID )
	if bossId1 == varPlayer then
		SetFubenData_Param(varMap, x700024_CSP_BOSS1_ID, -2 )
		if bossId2 == -1 and gut2 == -2 then
			x700024_CreateBoss(varMap)
		end
	elseif bossId2 == varPlayer then
		SetFubenData_Param(varMap, x700024_CSP_BOSS2_ID, -2 )
		if bossId1 == -1 and gut1 == -2 then
			x700024_CreateBoss(varMap)
		end
	elseif gut1 == varPlayer then
		SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID, -2 )
		if bossId2 == -2 then
			x700024_CreateBoss(varMap)
		end
	elseif gut2 == varPlayer then
		SetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID, -2 )
		if bossId1 == -2 then
			x700024_CreateBoss(varMap)
		end
	end
	
	bossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID )
	bossId1 = GetFubenData_Param(varMap, x700024_CSP_BOSS1_ID )
	bossId2 = GetFubenData_Param(varMap, x700024_CSP_BOSS2_ID )
	if bossId1 == -2 and bossId2 == -2 and bossId == -1 then
		x700024_CreateBoss(varMap)
	end
	
	bossId1 = GetFubenData_Param(varMap, x700024_CSP_BOSS1_ID )
	bossId2 = GetFubenData_Param(varMap, x700024_CSP_BOSS2_ID )
	bossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID )
	gut1 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER1_ID )
	gut2 = GetFubenData_Param(varMap, x700024_CSP_GUTMONSTER2_ID )
	
	if gut1 == -2 and gut2 == -2 and bossId1 == -1 and bossId2 == -1 and bossId == -1 then
		x700024_CreateBoss(varMap)
	end
	
	
	if bossId == varPlayer then
		SetFubenData_Param(varMap, x700024_CSP_BOSS_ID, -2 )
		x700024_ShowTipsToAll(varMap, "顺利击杀盐帮帮主张士诚，副本完成。")
		x700024_ProcFubenEnd( varMap)
	end

end

function x700024_ProcFubenEnd( varMap)
	x700024_CreateXianJinBoss(varMap)
	x700024_CreateZhanCheBoss(varMap)

	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,56 )
	end	
end

function x700024_CreateSubmitNpc( varMap)
	if x700024_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700024_var_SubmitNPC.type, x700024_var_SubmitNPC.varX, x700024_var_SubmitNPC.z, 3, 0, -1, x700024_var_SubmitNPC.guid, -1,-1,x700024_var_SubmitNPC.facedir,  "",x700024_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700024_var_SubmitNPC.type, x700024_var_SubmitNPC.varX, x700024_var_SubmitNPC.z, 3, 0, -1, x700024_var_SubmitNPC.guid, -1,-1,x700024_var_SubmitNPC.facedir)
	
	end
	 

	 LuaCallNoclosure( 701107, "ProcSceneBossDie", varMap, 0)

	 local bKillShark = GetFubenData_Param(varMap, x700024_CSP_B_KILL_SHARK);

	 if bKillShark<=0 then
		LuaCallNoclosure( 701108, "ProcSceneBossDie", varMap, 0)
	 end
end

function x700024_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700024_CSP_FUBEN_MODE)

	if nFubenMode ==0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700024_CSP_XIANJINBOSS, varRet )
		end
	end

	x700024_ShowTipsToAll(varMap, "翻番宝箱出现！")
end

function x700024_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700024_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL)

	if fubenlevel < x700024_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700024_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700024_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
		x700024_ShowTipsToAll(varMap, "战车独冲之王出现！")
	end
end


function x700024_ProcMonsterUseSkill(varMap, varPlayer)

	local nSkillID, nSkillType, nTargetID, nTargetX, nTargetZ;
	nTargetID 	= GetThreatTargetID(varMap, varPlayer);
	nTargetX,nTargetZ	= GetThreatTargetPos(varMap, varPlayer);
	
	local nRand = 0;
	local nMaxRand = 0;
	
	-- 计算要使用的技能及类型
	for varIRand,itemRand in x700024_var_Skill_Use do
		nMaxRand = nMaxRand + itemRand.pre;
	end
	
	nRand = random(0,nMaxRand);
	
	for varI,item in x700024_var_Skill_Use do
		if item.pre < nRand then
			nRand = nRand - item.pre
		else
			nSkillID = item.skillID;
			nSkillType = item.skilltype;
			break
		end
	end
	
	-- 使用技能
	if (nSkillType == 0) then
		-- 单体技能
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,0);
	else
		-- 群攻技能
		nTargetX, nTargetZ = GetMonsterPosition(varMap, varPlayer);
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,0);
	end
	--
	----WriteLog(1, format("x700023_ProcMonsterUseSkill --- 使用技能 spellid %d", nSkillID));
end

-- 处理boss的tick
function x700024_ProcBossTick(varMap)
	local BossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID)
	if (BossId <= 0) then
		return
	end
	
	-- 处理boss的战斗状态
	local nIsInCombat = IsMosterInCombatState(varMap, BossId);
	local nKuangbaoFlag = GetFubenData_Param(varMap, x700024_CSP_BOSS_KUANGBAO_FLAG)
	if (nIsInCombat == 1) then
		if (nKuangbaoFlag == 0) then
			SetFubenData_Param(varMap, x700024_CSP_BOSS_KUANGBAO_FLAG, GetCurrentTime())
			for i=0, getn(x700024_var_hp_step)-1 do
				SetFubenData_Param(varMap, x700024_CSP_BOSS_HP_STEP_FLAG_START + i, 0)
			end
		end
	else
		if (nKuangbaoFlag ~= 0) then
			SetFubenData_Param(varMap, x700024_CSP_BOSS_KUANGBAO_FLAG, 0)
		end
		return
	end
	
	-- boss狂暴
	local nKuangbaoFlag = GetFubenData_Param(varMap, x700024_CSP_BOSS_KUANGBAO_FLAG)
	local nPassTime = GetCurrentTime() - nKuangbaoFlag;
	if (nKuangbaoFlag > 0 and nPassTime > x700024_var_boss_kuangbao_time) then
		SetFubenData_Param(varMap, x700024_CSP_BOSS_KUANGBAO_FLAG, -1)
		SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700024_var_boss_kuangbao_buffid, 0);
		WriteLog(1, format("x700024_ProcBossTick 加入15分钟后的狂暴buff buffid %d", x700024_var_boss_kuangbao_buffid));
	end
		
	-- boss血量触发处理
	local nCurBossHp = GetHp(varMap, BossId);
	local nMaxBossHp = GetMaxHp(varMap, BossId);
	if (nMaxBossHp > 0) then
		local fHp = nCurBossHp / nMaxBossHp;
		for i=1, getn(x700024_var_hp_step) do
			local nflag = GetFubenData_Param(varMap, x700024_CSP_BOSS_HP_STEP_FLAG_START + i - 1 );
			if (x700024_var_hp_step[i].hp > fHp and nflag ~= 1) then
				--WriteLog(1, format("x700024_ProcBossTick --- 血量触发boss行为 %f ", fHp));
				
				--血量触发行为处理
				x700024_ProcBossHpAction(varMap, BossId);
				--
				
				SetFubenData_Param(varMap, x700024_CSP_BOSS_HP_STEP_FLAG_START + i - 1, 1 )
			break
			end
		end
	end
	
end

function x700024_ProcBossHpAction(varMap, BossId)
	if (BossId <= 0) then
		return
	end

	-- 获取到player集合
	local playerset = {}
	local playersettmp = {}
	local varX,z = GetWorldPos(varMap,BossId)
	local Num =  GetNearPlayerCountForMonster(varMap, BossId,varX,z,50)
	for playeridx = 1, Num do
		local ObjId = GetNearPlayerMemberForMonster(varMap, BossId, playeridx - 1);
		playerset[playeridx] = ObjId
		playersettmp[playeridx] = ObjId
	end
	
	-- 对玩家添加buff
	local buffid = 0;
	local nNoBuffPlayerNum = getn(playersettmp);
	local nPlayerNum = getn(playerset);
	if (nNoBuffPlayerNum <= 0) then
		return
	end
	
	for buffidx = 1,getn(x700024_var_skill_Trap) do
		buffid = x700024_var_skill_Trap[buffidx];
		nNoBuffPlayerNum = getn(playersettmp);
			
		-- 开始查找目标玩家
		local count = 0;
		local nRand = 0;
		local playerid = 0;
		if (nNoBuffPlayerNum <= 0) then
			-- 所有人都加了buff但buff比人还要多
			nRand = random(0,nPlayerNum - 1);
			for idx,item in playerset do
				if (count == nRand) then
					playerid = playerset[idx]
					break
				end
				count = count + 1;
			end
		else
			-- 在没有加buff的人中随机找个人
			nRand = random(0,nNoBuffPlayerNum - 1);
			for idx,item in playersettmp do
				--WriteLog(1, format("x700024_ProcBossHpAction -陷阱Random = %d count =%d idx =%d,playerid=%d",nRand,count, idx, playersettmp[idx]));
				if (count == nRand) then
					playerid = playersettmp[idx]
					playersettmp[idx] = nil
					break
				end
				count = count + 1;
			end
		end
		
		-- 找到一个playerid，对其坐标点释放带陷阱的aoe技能
		if (playerid > 0) then
			local posx = GetPlayerWorldX(varMap,playerid);
			local posz = GetPlayerWorldZ(varMap,playerid);
			--UnitUseSkill(varMap, BossId, buffid,playerid,posx,posz,-1.0,0);
			--WriteLog(1, format("x700024_ProcBossHpAction ---设置陷阱 playerid = %d, BUffid = %d",playerid, buffid));
			CreateTrap(varMap, BossId, posx, posz, buffid)
		end
		
	end
end




