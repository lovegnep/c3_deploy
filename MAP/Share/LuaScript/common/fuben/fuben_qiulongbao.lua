
x700004_CSP_FUBENTYPE				= 	0
x700004_CSP_SCRIPTID				=	1
x700004_CSP_TICKCOUNT				= 	2
x700004_CSP_FROMSCENEID				= 	3
x700004_CSP_ISCLOSING				= 	4
x700004_CSP_LEAVECOUNTDOWN			= 	5
x700004_CSP_TEAMID					=	6
x700004_CSP_BACKSCENEX       		=   7
x700004_CSP_BACKSCENEZ      		=   8
x700004_CSP_FUBENLEVEL				=	9
x700004_CSP_AREA_FLAG				=	19
x700004_CSP_AREA_ID					=	20
x700004_CSP_SLEEPDRAGON_ID			=	21		
x700004_CSP_DRAGON_ID				=	22		

x700004_CSP_EFFIGY_ID1				=	32		
x700004_CSP_EFFIGY_ID2				=	33		
x700004_CSP_EFFIGY_ID3				=	34		
x700004_CSP_EFFIGY_ID4				=	35		
x700004_CSP_EFFIGY_ID5				=	36		
x700004_CSP_EFFIGY_ID6				=	37		

x700004_CSP_BOSS_ID					=	38		
x700004_CSP_PATROL_MONSTER_COUNT    =   40
x700004_CSP_DRAGONEGG_NUM			=	49    	
x700004_CSP_DRAGONEGG_STARTID		=	50		
x700004_CSP_FUBEN_FINISH			=	100		

x700004_CSP_DRAGONEGG_TICK			=	108		
x700004_CSP_DRAGONEGG_FLAG			=	109		
x700004_CSP_EFFIGYDRAGON_FLAG1			=	110		
x700004_CSP_EFFIGYDRAGON_FLAG2			=	111		
x700004_CSP_EFFIGYDRAGON_FLAG3			=	112	

x700004_CSP_BOSS_SPLIT_FLAG		  	= 	113	-- boss 一变为三的标记	
x700004_CSP_BOSS_KUANGBAO_FLAG		=	114	-- boss 狂暴标记
x700004_CSP_BOSS_TO_LITTLEBOSS_NUM	=	115 -- boss 分裂成小怪后的数量 (最大为5)

x700004_CSP_LITTILEBOSS_ID_START 	= 116 -- 记录 boss分裂成小怪后的小怪的id
x700004_CSP_LITTILEBOSS_ALIVE_NUM	= 121 -- 记录 boss分裂成小怪后小怪的生存数
x700004_CSP_LITTILEBOSS_KUANGBAO_START = 126 -- 记录 boss分裂成小怪后小怪的狂暴标记
x700004_CSP_LITTILEBOSS_REFRESH_TIME_RECORD = 131 -- 记录 boss分裂成小怪重置状态的时间
x700004_CSP_BOSS_HP_STEP_FLAG_START	= 132	-- 记录boss由血量触发boss行为的状态 
x700004_CSP_LITTILEBOSS_HP_STEP_FLAG_START = 137 -- 137 - 162 -- 记录boss分裂成的小怪由血量触发boss行为的状态 
x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD	= 170	-- 分裂的小boss死亡的时间记录

x700004_CSP_LAST_BOSS_ID			= 171	-- 记录分裂的小boss死亡后创建出来的bossID

x700004_RANDOM_BOSS_ID				=	233
x700004_RANDOMBOSS_FLAG				=	234
x700004_CSP_CREATE_EGG_FLAG			=	236
x700004_CSP_ZHANCHE					 = 238
x700004_CSP_XIANJINBOSS				=	239


x700004_CSP_HUMAN_COUNT				=	240
x700004_CSP_OBJID_START				=	241

x700004_CSP_GUID_START              =   248  
x700004_CSP_FUBEN_TYPE				=	254	

x700004_CSP_FUBEN_MODE				=   255 

x700004_var_FileId 					= 700004
x700004_var_QuestId					= 6608


x700004_var_ProceTime_Child_Count		=	2                       
x700004_var_Max_Child_Count			=	20                      
x700004_var_BuffId					=	13503                   

x700004_var_RandomMonsterRate						= 0.08*6
x700004_var_RandomMonsterRateZHOUSANFAN			= 67                      

x700004_var_TimeDriverList			= {2,2,2,12,12,12,12,12,12,1}

x700004_var_Level_Limit = 70
x700004_var_Rate_Limit = 30


x700004_var_boss_hp_step = { -- 由小到大
								-- 血量比例，技能ID，技能类型0单攻1群攻
								{hp=0.2,skillid=13702,skilltype=1},
								{hp=0.5,skillid=13702,skilltype=1},
								{hp=0.8,skillid=13702,skilltype=1},
						   }
x700004_var_boss_kuangba_buffID = 32071;	-- 战斗15分钟后boss狂暴 buffid
x700004_var_boss_kuangba_time = 300;	-- 战斗开始 xx 后boss狂暴
x700004_var_boss_random_buff_id = {32077,32079,32078} 	-- boss随机buff 进攻免疫，魔攻免疫，远攻免疫
x700004_var_boss_threeBoss_refresh_time = 45; 	-- 三头凶蛟分离开的3个小boss没隔 xx 秒 清空一下仇恨，重新随机下buff
x700004_var_boss_threeBoss_kuangbao_time = 5; -- 三个小boss中的一个被杀后 xx 秒后 剩余的boss狂暴
x700004_var_boss_create_threeBoss_hp = 0.75;	-- 三头凶蛟血量在 xx 时一分为3
x700004_var_boss_threeBoss_monster_type = 201; 	-- 小3头凶蛟的monster标记
x700004_var_boss_die_kuangbao_buffid = 32071; 	-- 由小3头凶蛟死亡导致的狂暴buffid
x700004_var_LastBoss_CreateMonsterType = 202;		-- 分裂出来的小boss死亡后创建出来的boss的monstertype
x700004_var_boss_to_littleboss_num = 5;	-- 三头凶蛟分裂为小怪后小怪的最大数量(目前需求一变三，预留5个)
x700004_var_boss_threeBoss_Talk = "卑微的人类，你们无法承受龙的愤怒"	-- 分裂出来的凶蛟死亡后其他凶蛟狂暴时的喊话

function x700004_TeleportWangCheng(varMap, varPlayer)
		local selfcountry =GetCurCountry( varMap, varPlayer)
        TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
        TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
		if selfcountry == 0 then
        	NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), x700004_var_FileId)
		elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), x700004_var_FileId)
		elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), x700004_var_FileId)
		elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), x700004_var_FileId)
		end
end
			

function x700004_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	if nFlag == 2 then
		x700004_TeleportWangCheng(varMap, varPlayer)
	end
end


function x700004_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700004_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700004_ProcFubenSceneCreated( varMap )

	SetFubenData_Param(varMap, x700004_CSP_AREA_ID, 0 )
	
	SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1, -1 )
	SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID2, -1 )
	SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID3, -1 )
	SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID4, -1 )
	SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID5, -1 )
	SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID6, -1 )
	SetFubenData_Param(varMap, x700004_CSP_SLEEPDRAGON_ID, -1 )

	SetFubenData_Param(varMap, x700004_CSP_BOSS_ID, -1 )
	
	SetFubenData_Param(varMap, x700004_CSP_CREATE_EGG_FLAG, 0 )
	SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_NUM, 0) 
	
	SetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG1, 0) 
	SetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG2, 0) 
	SetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG3, 0) 
	
	SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_FLAG, 0) 
	SetFubenData_Param(varMap,x700004_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700004_CSP_XIANJINBOSS, -1 )
	
	SetFubenData_Param(varMap, x700004_CSP_BOSS_SPLIT_FLAG, 0)
	SetFubenData_Param(varMap, x700004_CSP_BOSS_KUANGBAO_FLAG, 0)
	SetFubenData_Param(varMap, x700004_CSP_BOSS_TO_LITTLEBOSS_NUM, 0)
	SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_REFRESH_TIME_RECORD, 0)
	SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM, 0)
	SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD, 0)
		
	SetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID, 0)
	
	local nHpStepNum = getn(x700004_var_boss_hp_step) 
	for i = 0,x700004_var_boss_to_littleboss_num - 1 do
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + i, 0)
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_KUANGBAO_START + i, 0)
		for j = 0,nHpStepNum - 1 do
			SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_HP_STEP_FLAG_START + (i * nHpStepNum) + j, 0)
		end
	end
    
	for k = 0,nHpStepNum - 1 do
		SetFubenData_Param(varMap, x700004_CSP_BOSS_HP_STEP_FLAG_START + k, 0)		
	end
	
	for varI = 0,x700004_var_Max_Child_Count-1 do
		SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_STARTID + varI, -1) 
	end			

	x700004_CreateMonster( varMap )
	x700004_CreatePatrolMonster( varMap )
	x700004_CreateEffigy(varMap)
	x700004_CreateSleepDragonBoss(varMap)
	x700004_CreateBoss( varMap )
    
end

function x700004_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	SetFubenData_Param(varMap, x700004_CSP_AREA_ID, varArea)
	
	if varArea == 1 then  
	
		local BossId = GetFubenData_Param(varMap, x700004_CSP_BOSS_ID )
		if BossId ~= -1 then
			return
		end
		
		BossId = GetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID )
		local ntype = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
		if BossId ~= -1 and ntype == 2 then
			return
		end
		
		SetFubenData_Param(varMap, x700004_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 0, x700004_var_QuestId, x700004_var_FileId, 1) 
		
	elseif varArea == 2 then   
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 1, x700004_var_QuestId, x700004_var_FileId)
	elseif varArea == 3 then   
		SetFubenData_Param(varMap, x700004_CSP_AREA_ID, 3 )
		
		if GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_FLAG) ~= 2 then
			SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_FLAG,1)
		end
	elseif varArea == 4 then   
		SetFubenData_Param(varMap, x700004_CSP_AREA_ID, 4 )
		local varFlag = GetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG1) 
		if varFlag == 1 then
			return
		end
		
		SetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG1, 1) 
		x700004_CreateEffigyDragon(varMap,12)
		
	elseif varArea == 5 then   
		SetFubenData_Param(varMap, x700004_CSP_AREA_ID, 5 )
		local varFlag = GetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG2) 
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG2, 1) 
		x700004_CreateEffigyDragon(varMap,13)
		
	elseif varArea == 6 then   
		SetFubenData_Param(varMap, x700004_CSP_AREA_ID, 6 )
		local varFlag = GetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG3) 
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700004_CSP_EFFIGYDRAGON_FLAG3, 1) 
		x700004_CreateEffigyDragon(varMap,14)
	end
end	



function x700004_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	
	SetFubenData_Param(varMap, x700004_CSP_AREA_ID, -1 )

end

function x700004_EnterTick(varMap, nowTickCount)

	if ( GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE) == 2 ) then
	-- 三头凶蛟 血量处理
	x700004_ProcBossTick(varMap)
	-- 分裂出来的小boss 血量处理
	x700004_ProcSubBossTick(varMap)
	end

	local varFlag = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_FLAG)
	if varFlag == 1 then
	
		
		
		local alldead = 1
		local varNum = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_NUM)
		
		if varNum >= 10 then
			local sleepDragonId = GetFubenData_Param(varMap, x700004_CSP_SLEEPDRAGON_ID)
			if sleepDragonId ~= -1 and sleepDragonId ~= -2 then
				SetFubenData_Param(varMap, x700004_CSP_SLEEPDRAGON_ID, -2)
				DeleteMonster(varMap,sleepDragonId)
				x700004_CreateDragonBoss(varMap)
				SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_FLAG,2)
			end
		end
		for varI = 0,varNum-1 do
			local varId = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_STARTID + varI)
			if varId ~= -1 and varId ~= -2 then
				alldead = 0
				break
			end
		end
		
		local drageonId = GetFubenData_Param(varMap, x700004_CSP_DRAGON_ID) 		
		if drageonId < 0 then
			return
		end
		if alldead == 1 then
			SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_TICK, nowTickCount )
			x700004_CreateDragonEgg(varMap)
		else
			local prevTick = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_TICK)
			if nowTickCount - prevTick >= 2 then		
				x700004_CreateDragonEgg(varMap)
				SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_TICK, nowTickCount )
			end
		end
		
	end
end



function x700004_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700004_CSP_AREA_ID )
	if varArea == 1 then  
	
		local BossId = GetFubenData_Param(varMap, x700004_CSP_BOSS_ID )
		if BossId ~= -1 then
			return
		end
		
		BossId = GetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID )
		local ntype = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
		if BossId ~= -1 and ntype == 2 then
			return
		end
		
		local varFlag = GetFubenData_Param(varMap, x700004_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		
		SetFubenData_Param(varMap, x700004_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 0, x700004_var_QuestId, x700004_var_FileId, 1) 
		
	elseif varArea == 2 then   
		
	end
end


function x700004_CreateBoss(varMap)  
	
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;

	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	--WriteLog(1, format("创建大boss"));
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
				
			end
			SetFubenData_Param(varMap, x700004_CSP_BOSS_ID  , varRet ) 
			
        end
	end

end

function x700004_CreateLastBoss(varMap)  
	--WriteLog(1, format("创建最后一个boss"));
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )

	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == x700004_var_LastBoss_CreateMonsterType and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID, varRet ) 
        end
	end
end

function x700004_CreateEffigy(varMap)    


	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;

	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, camp,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, camp,-1,facedir)
			end
			
			
			for j = 0,6-1 do
				local eff = GetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1 + j  ) 
				
				if eff == -1 then
					
					SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1 + j , varRet ) 
					break
				end
			end
		end
	end

end




function x700004_CreateSleepDragonBoss(varMap)   
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, camp,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, camp,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700004_CSP_SLEEPDRAGON_ID, varRet ) ;
		
			return
		
        end
	end
end
function x700004_CreateDragonBoss(varMap)   

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700004_CSP_DRAGON_ID, varRet ) ;
		
			return
		
        end
	end
end
function x700004_CreateLittleDragon(varMap, nflag)   
	if varFlag == nil then
		varFlag = 3
	end
	
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		
		if idScript == x700004_var_FileId and monsterFlag == nflag and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
			
			end
			
			
		end
	end

end
function x700004_CreateDragonEgg(varMap)   


	local EggPosTab = {
					 	{ varX = 66.4123, z= 69.5},
 						{ varX = 68.4852, z= 69.5},
 						{ varX = 70.4854, z= 69.5},
 						{ varX = 72.5395, z= 69.5},
 						{ varX = 74.5973, z= 69.5},
					}
	local ranIndex = random(1,5)
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	local varIndex = 0
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
	
			local eggNum = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_NUM ) 
			
			if varIndex == eggNum then
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_STARTID + eggNum, varRet ) 
				eggNum = eggNum + 1
				SetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_NUM, eggNum) 
				return
			end
			varIndex = varIndex + 1
			
		
        end
	end


end

function x700004_CreateEffigyDragon(varMap,varFlag)  

	local nStart = GetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1)
	local nID = 0
	local varIndex = 0
	for varI=0, 6 - 1 do
		nID = GetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1 + varI)
		if nID ~= -1 then
			varIndex = varI
			break
		end
	end
	
	
	if nID ~= -1 then
		
		DeleteMonster(varMap, nID)
		SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1 + varIndex, -1)
		
		local nID2 = GetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1 + varIndex + 1)
		DeleteMonster(varMap, nID2)
		SetFubenData_Param(varMap, x700004_CSP_EFFIGY_ID1 + varIndex + 1, -1)
		
		x700004_CreateLittleDragon(varMap,varFlag)
		
		
	end
end


function x700004_GetDragonEggID(varMap)  
	local eggNum = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_NUM ) 
	local nStart = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_STARTID)
	local nID = 0
	for varI=0, eggNum - 1 do
		nID = GetFubenData_Param(varMap, x700004_CSP_DRAGONEGG_STARTID + varI)
		if nID ~= -1 then
			return x700004_CSP_DRAGONEGG_STARTID + varI
		end
	end
	return 0
end

function x700004_CreatePatrolMonster(varMap)
	
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;

	local nCount =0;
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
				
				end
				SetPatrolId(varMap, varRet, varFlag2)
				
            end
        end
	end
	
	SetFubenData_Param(varMap, x700004_CSP_PATROL_MONSTER_COUNT, nCount ) 

end

function x700004_CreateMonster(varMap)

	
    local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )

	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId then
			
		end
		if idScript == x700004_var_FileId  and monsterFlag == 0  and nFubenType == varFlag3 then
			
		end
		if idScript == x700004_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, 9, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, 9, aiscript, -1, -1, 21,-1,facedir)
									
				end
			end
        end
	end

end


function x700004_CreateRandomMonster(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end

	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700004_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,FUBEN_DONGHAIHAIYAN,nFubenMode )/100

	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	
	if(nFubenMode ~= 2) then
		if rate>= nStdRate then
			return 0;
		end
	else			
		rate = random(1,100)
		if(rate > x700004_var_RandomMonsterRateZHOUSANFAN) then
			return 0;
		end
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
	
			if idScript == x700004_var_FileId and monsterFlag == 8+nFlag and levelmin <= fubenlevel and levelmax >= fubenlevel  and varFlag3 == nFubenType then
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
				
				end
				
				SetFubenData_Param(varMap, x700004_RANDOMBOSS_FLAG, nFlag)
				SetFubenData_Param(varMap, x700004_RANDOM_BOSS_ID, nBossID)
			end
		
	end

	x700004_ShowTipsToAll(varMap, "战神再现！")

end

function x700004_ProcFubenEnd( varMap)
	x700004_CreateXianJinBoss(varMap)
	x700004_CreateZhanCheBoss(varMap)
	x700004_CreateRandomMonster(varMap)


	
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,52 )
		
		--设置本周最大次数
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT,"SetMaxEnterCount", varMap, humanId) 
	end	
	
	x700004_ShowTipsToAll(varMap, "战胜三头凶蛟，副本完成，请退出副本。")
end

function x700004_ProcDie(varMap, varPlayer, varKiller)


	local drageonId = GetFubenData_Param(varMap, x700004_CSP_DRAGON_ID) 
	if drageonId == varPlayer then
		SetFubenData_Param(varMap, x700004_CSP_DRAGON_ID, -2) 
	end


	for varI = x700004_CSP_DRAGONEGG_STARTID,x700004_CSP_DRAGONEGG_STARTID+x700004_CSP_DRAGONEGG_NUM do
		local eggId = GetFubenData_Param(varMap, varI)
		if eggId == varPlayer then
			SetFubenData_Param(varMap, varI, -2)
		end
	end
	
	
	local xianjinboss = GetFubenData_Param(varMap, x700004_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700004_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		
		local strPlayerName = GetName( varMap, varKiller)
		local varCountry = GetCurCountry( varMap, varKiller )
		local strCountryName = "";
		if varCountry==0 then
			strCountryName = "楼兰"
		elseif varCountry==1 then
			strCountryName = "天山"
		elseif varCountry==2 then
			strCountryName = "昆仑"
		elseif varCountry==3 then
			strCountryName = "敦煌"
		end
		local strMapName = "囚龙堡"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
		
	local nMonId = GetFubenData_Param(varMap, x700004_CSP_BOSS_ID)
	if nMonId == varPlayer then
		-- 这里正常不会进入 只有boss被秒时进入
		SetFubenData_Param(varMap, x700004_CSP_BOSS_ID, -1)
		x700004_ProcFubenEnd( varMap)
	end
	
	if (GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE) == 2) then
		-- boss 分裂的小boss死亡
		local nMonsterIsSplit = GetFubenData_Param(varMap, x700004_CSP_BOSS_SPLIT_FLAG);
		if (nMonsterIsSplit == 1) then
			local nSubMonsterId = 0;
			local nSubMonsterNum = GetFubenData_Param(varMap, x700004_CSP_BOSS_TO_LITTLEBOSS_NUM);
			for nMonsterIdx = 0, nSubMonsterNum - 1 do
				nSubMonsterId = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + nMonsterIdx);
				if (nSubMonsterId > 0 and nSubMonsterId == varPlayer) then
					local nAliveNum = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM) - 1;
					SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM, nAliveNum);
					SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + nMonsterIdx, -1);
					x700004_ProcSubBossDie(varMap)
				end
			end
		end
		-- 分裂的小boss死亡后创建出来的boss死亡处理
		local nLastBossId = GetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID);
		if (varPlayer == nLastBossId) then
			--WriteLog(1, format("都死了吗 ？"));
			x700004_ProcLastBossDie(varMap)
			SetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID, -1)
		end
		
	end
	
	local nRandomBossId = GetFubenData_Param(varMap, x700004_RANDOM_BOSS_ID)

	if nRandomBossId >= 0 then
		if nRandomBossId==varPlayer then

			local nKillerType = GetObjType(varMap, varKiller)
			local nOwnerId = varKiller
			if nKillerType== 3 then
				nOwnerId = GetOwnerID(varMap, varKiller)
				
			end
			
			local strPlayerName = GetName(varMap, nOwnerId)
			
			local varCountry = GetCurCountry( varMap, nOwnerId )
			local strCountryName = "";
			if varCountry==0 then
				strCountryName = "楼兰"
			elseif varCountry==1 then
				strCountryName = "天山"
			elseif varCountry==2 then
				strCountryName = "昆仑"
			elseif varCountry==3 then
				strCountryName = "敦煌"
			end

			local strHorseName = ""

			local nHorseFlag = GetFubenData_Param(varMap, x700004_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
			
			if fubenlevel < 50 then
				if nHorseFlag==0 then
					strHorseName = "凶豹"
				elseif nHorseFlag==1 then
					strHorseName = "奔羚"
				elseif nHorseFlag==2 then
					strHorseName = "天鹅"
				elseif nHorseFlag==3 then
					strHorseName = "河马"
				end
			elseif fubenlevel < 70 then
				if nHorseFlag==0 then
					strHorseName = "烈狮"
				elseif nHorseFlag==1 then
					strHorseName = "驯鹿"
				elseif nHorseFlag==2 then
					strHorseName = "瑞鹤"
				elseif nHorseFlag==3 then
					strHorseName = "铁犀"
				end
			elseif fubenlevel < 80 then
				if nHorseFlag==0 then
					strHorseName = "剑齿虎"
				elseif nHorseFlag==1 then
					strHorseName = "蛮牛"
				elseif nHorseFlag==2 then
					strHorseName = "凤凰"
				elseif nHorseFlag==3 then
					strHorseName = "巨象"
				end
			elseif fubenlevel < 95 then
				if nHorseFlag==0 then
					strHorseName = "螭龙"
				elseif nHorseFlag==1 then
					strHorseName = "应龙"
				elseif nHorseFlag==2 then
					strHorseName = "暴龙"
				elseif nHorseFlag==3 then
				strHorseName = "奎龙"
				end
			elseif fubenlevel < 130 then
				if nHorseFlag==0 then
					strHorseName = "狻猊"
				elseif nHorseFlag==1 then
					strHorseName = "毕方"
				elseif nHorseFlag==2 then
					strHorseName = "??杌"
				elseif nHorseFlag==3 then
					strHorseName = "饕餮"
				end
			else
				if nHorseFlag==0 then
					strHorseName = "狻猊"
				elseif nHorseFlag==1 then
					strHorseName = "毕方"
				elseif nHorseFlag==2 then
					strHorseName = "??杌"
				elseif nHorseFlag==3 then
					strHorseName = "饕餮"
				end
			end

			local strMapName = "囚龙堡"
		
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)

		end
	end

end

-- 三头凶蛟一变为三的boss死亡
function x700004_ProcSubBossDie(varMap)
	local nAliveNum = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM);
	if (nAliveNum > 0) then
		-- 尚有存活
		if ( GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD) <= 0 ) then
			--WriteLog(1, format("x700004_ProcSubBossDie --- 分身死了一个"));
			SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD, GetCurrentTime())
		end
	else
		-- 全部死亡,副本结束了
		--x700004_ProcFubenEnd(varMap);
		x700004_CreateLastBoss(varMap);
	end
end

-- 分裂的小boss死亡后创建出来的boss死亡处理
function x700004_ProcLastBossDie(varMap)
	--  最后boss死亡,副本结束了
	x700004_ProcFubenEnd(varMap);
end

-- Boss三头凶蛟 血量处理
function x700004_ProcBossTick(varMap)

	local nBossID = GetFubenData_Param(varMap, x700004_CSP_BOSS_ID) 
	if (nBossID <= 0) then
		return 
	end
	
	-- 判断是否实在战斗状态
	local nIsInCombat = IsMosterInCombatState(varMap, nBossID);
	local nBeginCombatTime = GetFubenData_Param(varMap,x700004_CSP_BOSS_KUANGBAO_FLAG)
	if(nIsInCombat == 1) then
		if (nBeginCombatTime == 0) then
			SetFubenData_Param(varMap,x700004_CSP_BOSS_KUANGBAO_FLAG, GetCurrentTime());
			for k = 0,getn(x700004_var_boss_hp_step) - 1 do
				SetFubenData_Param(varMap, x700004_CSP_BOSS_HP_STEP_FLAG_START + k, 0)		
			end
		end
	else
		if nBeginCombatTime ~= 0 then
			SetFubenData_Param(varMap,x700004_CSP_BOSS_KUANGBAO_FLAG, 0);
		end
		return
	end
	
	-- 血量触发行为
	local nCurHp = GetHp(varMap,nBossID);
	local nMaxHp = GetMaxHp(varMap,nBossID);
	local nHp = 0
	if (nMaxHp > 0) then
		nHp = nCurHp / nMaxHp
	end
	
	-- 分裂为3
	if (nHp <= x700004_var_boss_create_threeBoss_hp) then
		local x,z = GetMonsterPosition(varMap, nBossID)
		DeleteMonster(varMap, nBossID);
		SetFubenData_Param(varMap, x700004_CSP_BOSS_ID, -1)
		x700004_CreateLittleBoss(varMap,x,z)
		--WriteLog(1, format("x700004_ProcBossTick --- 一变为三 变变变。。。。。"));
		return
	end
	
	-- 血量触发行为
	for i,item in x700004_var_boss_hp_step do
		if item.hp >= nHp then
			if (GetFubenData_Param(varMap, x700004_CSP_BOSS_HP_STEP_FLAG_START + i - 1) == 0) then
				x700004_MonsterUseSkill(varMap,nBossID,item.skillid,item.skilltype)
				SetFubenData_Param(varMap, x700004_CSP_BOSS_HP_STEP_FLAG_START + i - 1, 1)
				--WriteLog(1, format("x700004_ProcBossTick --- nHp %d id %d",nHp,i));
			end
			break
		end
	end
	
	-- 15分钟狂暴计算
	nBeginCombatTime = GetFubenData_Param(varMap,x700004_CSP_BOSS_KUANGBAO_FLAG)
	if (nBeginCombatTime ~= -1 and (GetCurrentTime() - nBeginCombatTime) >= x700004_var_boss_kuangba_time ) then
		SetFubenData_Param(varMap, x700004_CSP_BOSS_KUANGBAO_FLAG, -1);
		SendSpecificImpactToUnit( varMap, nBossID, nBossID, nBossID, x700004_var_boss_kuangba_buffID, 0);
		--WriteLog(1, format("x700004_ProcBossTick --- 大boss加入15分钟后的狂暴buff buffid %d time %d", x700004_var_boss_kuangba_buffID,nBeginCombatTime));
	end
end

-- 分裂出来的boss 血量处理
function x700004_ProcSubBossTick(varMap)
	-- 判断是否boss已经分裂
	if (GetFubenData_Param(varMap, x700004_CSP_BOSS_SPLIT_FLAG) ~= 1) then
		return
	end

	-- 判断是否有存活的小boss
	local nAliveNum = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM);
	if (nAliveNum <= 0) then
		return
	end

	-- 有小boss死亡导致的狂暴计时
	local nDieTimeRecord = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD)
	local nDieBuff = 0;
	if (nDieTimeRecord > 0 and (GetCurrentTime() - nDieTimeRecord) > x700004_var_boss_threeBoss_kuangbao_time) then
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD, 0);
		nDieBuff = 1;
	end
	
	local nSubMonsterNum = GetFubenData_Param(varMap, x700004_CSP_BOSS_TO_LITTLEBOSS_NUM);
	local nAllNotInCombatNum = 1;
	local nHasBossChgCombatToFree = 0;
	for idx=0,nSubMonsterNum-1 do
		local nBossID = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + idx) 
		if (nBossID > 0) then
			-- 判断是否实在战斗状态
			local nIsInCombat = IsMosterInCombatState(varMap, nBossID);
			local nBeginCombatTime = GetFubenData_Param(varMap,x700004_CSP_LITTILEBOSS_KUANGBAO_START + idx)
			if(nIsInCombat == 1) then
				nAllNotInCombatNum = 0;
				if (nBeginCombatTime == 0) then
					SetFubenData_Param(varMap,x700004_CSP_LITTILEBOSS_KUANGBAO_START + idx, GetCurrentTime());
					local nHpStep = getn(x700004_var_boss_hp_step);
					for k = 0,nHpStep - 1 do
						SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_HP_STEP_FLAG_START + idx * nHpStep + k, 0)		
					end
				end
			else
				if (nBeginCombatTime ~= 0) then
					nHasBossChgCombatToFree = 1
					SetFubenData_Param(varMap,x700004_CSP_LITTILEBOSS_KUANGBAO_START + idx, 0);
				end
			end

			if(nIsInCombat == 1) then
				-- 血量触发行为
				local nCurHp = GetHp(varMap,nBossID);
				local nMaxHp = GetMaxHp(varMap,nBossID);
				local nHp = 0
				if (nMaxHp > 0) then
					nHp = nCurHp / nMaxHp
				end
				
				-- 血量触发行为
				local nHpStep = getn(x700004_var_boss_hp_step);
				for i,item in x700004_var_boss_hp_step do
					if item.hp >= nHp then
						if (GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_HP_STEP_FLAG_START + nHpStep * idx + i - 1) == 0) then
							x700004_MonsterUseSkill(varMap,nBossID,item.skillid,item.skilltype)
							SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_HP_STEP_FLAG_START + nHpStep * idx + i - 1, 1)
							--WriteLog(1, format("x700004_ProcSubBossTick ---小boss血量触发idx %d nHp %f id %f",idx,nHp,i));
						end
						break
					end
				end
				
				-- 15分钟狂暴计算
				nBeginCombatTime = GetFubenData_Param(varMap,x700004_CSP_LITTILEBOSS_KUANGBAO_START + idx)
				if (nBeginCombatTime ~= -1 and (GetCurrentTime() - nBeginCombatTime) >= x700004_var_boss_kuangba_time ) then
					SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_KUANGBAO_START + idx, -1);
					SendSpecificImpactToUnit( varMap, nBossID, nBossID, nBossID, x700004_var_boss_kuangba_buffID, 0);
					--WriteLog(1, format("x700004_ProcSubBossTick --- 小boss加入15分钟后的狂暴buff buffid %d", x700004_var_boss_kuangba_buffID,nBeginCombatTime));
				end
				
				if (nDieBuff == 1) then
					SendSpecificImpactToUnit( varMap, nBossID, nBossID, nBossID, x700004_var_boss_die_kuangbao_buffid, 0);
					NpcTalk(varMap, nBossID, x700004_var_boss_threeBoss_Talk,  -1)
					--WriteLog(1, format("x700004_ProcSubBossTick --- idx %d 小boss加入死亡15分钟后的狂暴buff buffid %d",idx, x700004_var_boss_die_kuangbao_buffid));
				end
			end
		end
	end
	
	-- 处理buff仇恨的重置
	local nResetTime = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_REFRESH_TIME_RECORD);
	if (nResetTime == 0 or (GetCurrentTime() - nResetTime) >  x700004_var_boss_threeBoss_refresh_time) then
		x700004_ResetSubBossState(varMap)
		--WriteLog(1, format("x700004_ProcSubBossTick --- 小boss buff重置"));
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_REFRESH_TIME_RECORD, GetCurrentTime());
	end
	
	-- 全部脱离战斗处理
	if (nAllNotInCombatNum == 1 and nHasBossChgCombatToFree ~= 0) then
		-- 清理数据
		for idx=0,nSubMonsterNum-1 do
			local nBossID1 = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + idx) 
			if (nBossID1 > 0) then
				DeleteMonster(varMap,nBossID1)
				SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + idx, 0);
			end
		end
		SetFubenData_Param(varMap, x700004_CSP_BOSS_SPLIT_FLAG, 0)
		SetFubenData_Param(varMap, x700004_CSP_BOSS_KUANGBAO_FLAG, 0)
		SetFubenData_Param(varMap, x700004_CSP_BOSS_TO_LITTLEBOSS_NUM, 0)
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_REFRESH_TIME_RECORD, 0)
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM, 0)
		SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_DIE_TIME_RECORD, 0)
		SetFubenData_Param(varMap, x700004_CSP_LAST_BOSS_ID, 0)
		
		local nHpStepNum = getn(x700004_var_boss_hp_step) 
		for i = 0,x700004_var_boss_to_littleboss_num - 1 do
			SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + i, 0)
			SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_KUANGBAO_START + i, 0)
			for j = 0,nHpStepNum - 1 do
				SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_HP_STEP_FLAG_START + (i * nHpStepNum) + j, 0)
			end
		end
		
		for k = 0,nHpStepNum - 1 do
			SetFubenData_Param(varMap, x700004_CSP_BOSS_HP_STEP_FLAG_START + k, 0)		
		end	
		-- 重新创建boss
		x700004_CreateBoss( varMap )
	end
	
end

-- 重置分裂出来的boss的buff和仇恨值
function x700004_ResetSubBossState(varMap)
	local nSubMonsterNum = GetFubenData_Param(varMap, x700004_CSP_BOSS_TO_LITTLEBOSS_NUM);
	local nBuffId = 0;
	
	local buffTable = {};
	for i,j in x700004_var_boss_random_buff_id do
		buffTable[i] = x700004_var_boss_random_buff_id[i]
	end
	local buffNum = getn(buffTable);
	
	for idx=0,nSubMonsterNum-1 do
		local nBossID = GetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + idx)
		if (nBossID > 0) then
		
			-- 清空boss的仇恨
			local playerid = GetThreatTargetID(varMap, varPlayer);
			if (playerid > 0) then
				--WriteLog(1, format("x700004_ResetSubBossState --- idx = %d Playerid = %d",idx,GetThreatTargetID(varMap, varPlayer)));
				SetMonsterThreat(varMap,nBossID,GetThreatTargetID(varMap, varPlayer),0);
			end
			
			-- 设置随机buff
			local nrand = 0;
			local nrandMax = 0;
			nrandMax = buffNum - idx - 1;
			if (buffNum > 0) then
				nrand = random(0, nrandMax)
			end
				
			local ncount = 0;
			----WriteLog(1, format("随机数-------%d 0-%d",nrand,nrandMax));
			for k,item in buffTable do
				if ncount == nrand then
					nBuffId = buffTable[k]
					----WriteLog(1, format("-------buffTable[...] = idx = %d k=%d buffid=%d, ncount = %d, nrand = %d",idx,k,buffTable[k], ncount,nrand));
					buffTable[k] = nil
					break
				end
				ncount = ncount + 1;
			end
			
			SendSpecificImpactToUnit( varMap, nBossID, nBossID, nBossID, nBuffId, 0);
			--WriteLog(1, format("x700004_ResetSubBossState --- set buff idx %d,buffid %d",idx,nBuffId));
			-- 删除除了nBuffId之外的buff效果
			for i,j in x700004_var_boss_random_buff_id do
				if (x700004_var_boss_random_buff_id[i] ~= nBuffId and IsHaveSpecificImpact(varMap, nBossID, x700004_var_boss_random_buff_id[i]) == 1) then
					CancelSpecificImpact(varMap, nBossID, x700004_var_boss_random_buff_id[i]);
				end
			end
			
		end
	end
end

-- 三头凶蛟一变为三的boss创建
function x700004_CreateLittleBoss(varMap,x,z)

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	local nMonsterNum = 0
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,varZ,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == x700004_var_boss_threeBoss_monster_type and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			local Posx,Posz;
			Posx = random(0,10)
			Posz = random(0,10)
			Posx = Posx - 5 + x;
			Posz = Posz - 5 + z;
			if title~="" then
				varRet = CreateMonster(varMap, type, Posx, Posz, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, Posx, Posz, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ID_START + nMonsterNum, varRet)
			nMonsterNum = nMonsterNum + 1;
			--WriteLog(1, format("x700004_ResetSubBossState --- num %d,monsterid %d",nMonsterNum,varRet));
        end
	end
	SetFubenData_Param(varMap, x700004_CSP_BOSS_TO_LITTLEBOSS_NUM, nMonsterNum) 
	SetFubenData_Param(varMap, x700004_CSP_LITTILEBOSS_ALIVE_NUM, nMonsterNum)
	SetFubenData_Param(varMap, x700004_CSP_BOSS_SPLIT_FLAG, 1) 
	--WriteLog(1, format("创建分身 success or fail ???? --- num %d,",nMonsterNum));
end


function x700004_CreateXianJinBoss(varMap)
	--WriteLog(1, format("创建了宝箱 哈哈 ,"));
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700004_CSP_FUBEN_MODE)

	if nFubenMode ==0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 20 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700004_CSP_XIANJINBOSS, varRet )
		end
	end
		local humancount = GetFuben_PlayerCount(varMap);
	if humancount >= 1 then
		for i = 0,humancount - 1 do
			local varPlayer = GetFuben_PlayerObjId(varMap, i);
			if IsHaveQuest(varMap,varPlayer, 1718) > 0 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1718)
				if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 2 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
					Msg2Player(varMap, varPlayer, format("你挑战了一次三番副本 %d/3", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)			
				else
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,3)
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				end
			end	 
		end
	end
	x700004_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700004_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700004_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL)

	if fubenlevel < x700004_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700004_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID(x700004_var_FileId )

	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700004_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700004_ShowTipsToAll(varMap, "战车风翼之王出现！")
	end
end


function x700004_MonsterUseSkill(varMap, varPlayer, nSkillID, nSkillType)

	local nTargetID, nTargetX, nTargetZ, nTargetDir;
	nTargetID = GetThreatTargetID(varMap, varPlayer);
	nTargetX, nTargetZ	= GetThreatTargetPos(varMap, varPlayer);
	
	-- 使用技能
	if (nSkillType == 0) then
		-- 单体技能
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,1);
	else
		-- 群攻技能
		nTargetX, nTargetZ = GetMonsterPosition(varMap, varPlayer);
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,1);
	end
	--
	----WriteLog(1, format("x700023_EnterTick --- UseSpell spellid %d", nSkillID));
end
