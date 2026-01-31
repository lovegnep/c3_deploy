











x700212_CSP_FUBENTYPE				= 	0
x700212_CSP_SCRIPTID				=	1
x700212_CSP_TICKCOUNT				= 	2
x700212_CSP_FROMSCENEID				= 	3
x700212_CSP_ISCLOSING				= 	4
x700212_CSP_LEAVECOUNTDOWN			= 	5
x700212_CSP_TEAMID					=	6
x700212_CSP_BACKSCENEX       		=   7
x700212_CSP_BACKSCENEZ      		=   8
x700212_CSP_FUBENLEVEL			=	9
x700212_CSP_KILLCOUNT				=	20
x700212_CSP_FUBEN_SCENE_ID			=	21
x700212_CSP_BOSS1_ID				=	22
x700212_CSP_BOSS2_ID				=	23
x700212_CSP_BOSS2_FULL_HP			=   24
x700212_CSP_BOSS2_LOADMONSTER		=   25

x700212_CSP_NPC_ID					=	26
x700212_CSP_NPC_STATUS				=	27


x700212_CSP_B_GUOYUN_START			=	228
x700212_CSP_B_GATHERED_START		=	234
x700212_CSP_HUMAN_COUNT				=	240
x700212_CSP_OBJID_START				=	241
x700212_CSP_GUID_START              =   248





x700212_var_FileId 					= 700212


x700212_var_RandomBossRate			=   0                       
x700212_var_nGrowpointType	=	540                             



x700212_var_SubmitNPC                 =   { type =25021,guid= 150521,varX = 77, z=18, facedir =0, title="" }


x700212_var_BossCreate				=	{
											{levelmin =20, levelmax=100, varName ="矿工头",   type= 27724,  varX=45, z=88,  ai=9, aiscript=553, facedir = 0, title = "",varFlag=0},
											

                                            {levelmin =20, levelmax=100, varName ="半人马头领",   type= 27725,  varX=68, z=25,  ai=18, aiscript=554, facedir = 0, title = "",varFlag=1},
											


										}


x700212_var_Boss_Random_Create		=	{
											{levelmin =20, levelmax=100, varName ="隐藏boss2",   type= 25108,   varX=71, z=86, r=0,  ai=9, aiscript=637,  facedir = 0, title = "",varFlag=0},
											


										}


x700212_var_MonsterCreate				=	{

											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=108.02, z=44.79 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=115.02, z=45.23 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 11, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=110.53, z=70.15 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=110.56, z=65.52 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 11, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=115.15, z=105.48, r=0,varCount = 1, ai=9, aiscript=550, facedir = 11, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=108.49, z=105.92, r=0,varCount = 1, ai=9, aiscript=551, facedir = 7 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=108.77, z=100.65, r=0,varCount = 1, ai=9, aiscript=550, facedir = 7 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=84.55 , z=98.44 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 31, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=85.61 , z=107.43, r=0,varCount = 1, ai=9, aiscript=550, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=82.66 , z=90.72 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=80.11 , z=103.66, r=0,varCount = 1, ai=9, aiscript=550, facedir = 2 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=79.96 , z=71.20 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 2 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=82.23 , z=67.37 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 31, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=70.27 , z=61.06 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 31, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=57.91 , z=54.67 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 33, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=38.81 , z=75.00 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 2 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=56.05 , z=80.57 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 13, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=50.71 , z=65.00 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 11, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=41.66 , z=112.66, r=0,varCount = 1, ai=9, aiscript=550, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=18.38 , z=106.96, r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=23.73 , z=102.97, r=0,varCount = 1, ai=9, aiscript=550, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=15.90 , z=55.41 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=17.03 , z=75.78 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=23.55 , z=57.35 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 27, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=23.02 , z=107.33, r=0,varCount = 1, ai=9, aiscript=550, facedir = 0 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=20.77 , z=113.87, r=0,varCount = 1, ai=9, aiscript=551, facedir = 2 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=40.44 , z=108.27, r=0,varCount = 1, ai=9, aiscript=550, facedir = 6 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=54.05 , z=69.83 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=44.61 , z=72.18 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=86.09 , z=70.94 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=77.16 , z=68.76 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=79.61 , z=95.84 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 31, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=84.77 , z=103.06, r=0,varCount = 1, ai=9, aiscript=550, facedir = 0 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=112.25, z=108.14, r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=104.12, z=104.04, r=0,varCount = 1, ai=9, aiscript=550, facedir = 2 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=112.56, z=47.50 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=109.54, z=47.48 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=114.51, z=70.12 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=105.90, z=70.38 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 4 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=52.84 , z=81.55 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=12.58 , z=69.88 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=20.58 , z=68.70 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 9 , title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=45.36 , z=109.38, r=0,varCount = 1, ai=9, aiscript=550, facedir = 12, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=63.73 , z=57.11 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 31, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=15.59 , z=102.47, r=0,varCount = 1, ai=9, aiscript=550, facedir = 31, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=16.90 , z=25.08 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 27, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工1",   type= 27721,  varX=24.42 , z=14.72 , r=0,varCount = 1, ai=9, aiscript=550, facedir = 27, title = ""},
											{levelmin = 20, levelmax=100, varName ="矿工2",   type= 27722,  varX=31.82 , z=19.48 , r=0,varCount = 1, ai=9, aiscript=551, facedir = 27, title = ""},

											

										}


x700212_var_MonsterCreate_Patrol		=	{
											{levelmin =20, levelmax=100, varName ="矿工1",   type= 27721, varX=52, z=65, r=8,varCount = 0, ai=9, aiscript=550, facedir = 0, title = "", patrolid =-1},
											

											{levelmin =20, levelmax=100, varName ="矿工2",   type= 27722, varX=72, z=98, r=8,varCount = 0, ai=9, aiscript=551, facedir = 0, title = "", patrolid =-1},
											
										}


x700212_var_Sub_MonsterCreate				= {
                                            {levelmin =20, levelmax=100, varName ="半人马小弟",   type= 27723,   r=0, ai=9, aiscript=552, facedir = 0, title = ""},
											

                                            {levelmin =20, levelmax=100, varName ="半人马小弟",   type= 27723,   r=0, ai=9, aiscript=552, facedir = 0, title = ""},
											

                                          }







function x700212_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

end







function x700212_ProcFubenSceneCreated( varMap )
	
	
	
	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700212_CSP_HUMAN_COUNT, humancount);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		SetFubenData_Param(varMap, x700212_CSP_OBJID_START+varI, humanId);

		local bGuoyun = CountryIsFortuneTime(varMap,humanId,2)
		SetFubenData_Param(varMap, x700212_CSP_B_GUOYUN_START+varI, 0); 
	end
	
	x700212_CreateBoss( varMap )
	x700212_CreateRandomBoss( varMap )
    x700212_CreateMonster( varMap )
		
end






function x700212_EnterTick(varMap, nowTickCount)

	if nowTickCount >= 2 then
            local nBoss2 = GetFubenData_Param(varMap, x700212_CSP_BOSS2_ID )
			
			if nBoss2>0 then
				local humancount = GetFuben_PlayerCount(varMap);
				if humancount>0 then
					local nCurrentHp = GetHp( varMap, nBoss2 )
					local nFullHp = GetFubenData_Param(varMap, x700212_CSP_BOSS2_FULL_HP )
					local bCreatedSubMonster = GetFubenData_Param(varMap, x700212_CSP_BOSS2_LOADMONSTER )
					
					if nCurrentHp/nFullHp <0.3 then
						if bCreatedSubMonster<=0 then
							x700212_CreateSubMonster(varMap)
						end
					end
				end
			end
        end

	if nowTickCount>=6 then
		local npcStatus = GetFubenData_Param(varMap, x700212_CSP_NPC_STATUS )

		if npcStatus==1 then
			local varTalknpc = GetFubenData_Param(varMap, x700212_CSP_NPC_ID )
			NpcTalk(varMap, varTalknpc, "感谢你们除掉了这金矿洞的恶魔，不过，我们还是赶紧出去吧。",  -1)
			SetFubenData_Param(varMap, x700212_CSP_NPC_STATUS,  2 )
		end
	end
end


function x700212_CreateBoss(varMap)


	local copyscenelevel = GetFubenData_Param(varMap, x700212_CSP_FUBENLEVEL ) ;

	
	

	for varI, item in x700212_var_BossCreate do 

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
		    local varRet = 0
			
			if item.title~="" then
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1, item.facedir,  "",item.title)
			else
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1, item.facedir)
			
			end
			
			if item.varFlag == 0 then
				SetFubenData_Param(varMap, x700212_CSP_BOSS1_ID, varRet )
				SetPatrolId(varMap, varRet, -1)
			elseif item.varFlag == 1 then
				
				SetFubenData_Param(varMap, x700212_CSP_BOSS2_ID, varRet )
				local nFullHp = GetHp( varMap, varRet )
				SetFubenData_Param(varMap, x700212_CSP_BOSS2_FULL_HP, nFullHp )
				SetFubenData_Param(varMap, x700212_CSP_BOSS2_LOADMONSTER, 0 )
			end
        end
	end

end

function x700212_CreateRandomBoss(varMap)


	local rate = random(0,100)/100;
	if rate>= x700212_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,0)

	

	local copyscenelevel = GetFubenData_Param(varMap, x700212_CSP_FUBENLEVEL ) ;


	
	
	for varI, item in x700212_var_Boss_Random_Create do 
		if item.varFlag == nFlag then
			if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
				if item.title~="" then
					CreateMonster(varMap, item.type, item.varX,item.z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir,  "",item.title)
				else
					CreateMonster(varMap, item.type, item.varX,item.z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir)
				
				end
			end
		end
	end

end

function x700212_CreateSubMonster(varMap)
	local nBoss2 = GetFubenData_Param(varMap, x700212_CSP_BOSS2_ID )
	local bCreatedSubMonster = GetFubenData_Param(varMap, x700212_CSP_BOSS2_LOADMONSTER )

	if bCreatedSubMonster>0 then
		return 0;
	end

	local varX,z = GetWorldPos(varMap,nBoss2)
		
	local varStep =0.2 ; 
	local copyscenelevel = GetFubenData_Param(varMap, x700212_CSP_FUBENLEVEL ) ;

	for varI, item in x700212_var_Sub_MonsterCreate do 
		if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
			local tx = varX + random(-1*(varI+1)*varStep, (varI+1)*varStep);
			local tz = z + random(-1*(varI+1)*varStep, (varI+1)*varStep);

			if item.title~="" then
				CreateMonster(varMap, item.type, tx, tz, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir, "", item.title)
			else
				CreateMonster(varMap, item.type, tx, tz, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir)
			
			end
		end
	end

	

	SetFubenData_Param(varMap, x700212_CSP_BOSS2_LOADMONSTER, 1 )

	
end






function x700212_CreateMonster(varMap)


    local copyscenelevel = GetFubenData_Param(varMap, x700212_CSP_FUBENLEVEL ) ;

	for varI, item in x700212_var_MonsterCreate do 

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
            for j=0,item.varCount -1 do

                local rx = random(-item.r,item.r)
                local varX = item.varX + rx
                local rz = random(-item.r,item.r)
                local z = item.z + rz
				if item.title ~="" then
					CreateMonster(varMap, item.type, varX, z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir, "", item.title)
				else
					CreateMonster(varMap, item.type, varX, z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir)
				
				end
			end
        end
	end


	for varI, item in x700212_var_MonsterCreate_Patrol do 

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
            for j=0,item.varCount -1 do

                local rx = random(-item.r,item.r)
                local varX = item.varX + rx
                local rz = random(-item.r,item.r)
                local z = item.z + rz
		        local varRet = 0
				if item.title~="" then
					varRet = CreateMonster(varMap, item.type, varX, z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir, "",item.title)
				else
					varRet = CreateMonster(varMap, item.type, varX, z, item.ai, item.aiscript, x700212_var_FileId, -1, 21,-1,item.facedir)
				
				end
				SetPatrolId(varMap, varRet, 1)
            end
        end
	end

end




function x700212_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700212_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700212_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	

	local buffId1 =9011
	local buffId1_1 = 9013
	local buffId2 =9012

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		local bHaveImpact1 = IsHaveSpecificImpact( varMap, humanId, buffId1 )
		local bHaveImpact1_1 = IsHaveSpecificImpact( varMap, humanId, buffId1_1 )
		local bHaveImpact2 = IsHaveSpecificImpact( varMap, humanId, buffId2 )
			
		local nLevel = GetLevel(varMap, humanId)
		if bHaveImpact1>0 or bHaveImpact1_1 > 0 then
			local nMoney = nLevel*4
			local strMoney = x700212_GetMoneyName(varMap,nMoney)
			local varStr = format("江湖请柬使您额外获得%s的现银",strMoney)
			AddMoney(varMap, humanId, 0, nMoney)
			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, humanId);
		end

		if bHaveImpact2>0 then
			local nMoney = nLevel*2
			local strMoney = x700212_GetMoneyName(varMap,nMoney)
			local varStr = format("你有朝廷请柬，获得%s的银卡",strMoney)
			AddMoney(varMap, humanId, 1, nMoney)
			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, humanId);
		end
		
	end

	
	

	
	local objId1 = GetFubenData_Param(varMap, x700212_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700212_CSP_BOSS2_ID)
	if objId1 == varPlayer then
		
		
		SetFubenData_Param(varMap, x700212_CSP_BOSS1_ID, -1)
		
		NpcTalk(varMap, varPlayer, "#R这……这不可能……我……还没有使出全力……", -1)
		

		
		







			




		
		

		
		
		

	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700212_CSP_BOSS2_ID, -1)
		x700212_CreateSubmitNpc( varMap)

		
		NpcTalk(varMap, varPlayer, "#R我会……再回来的……", -1)
	
		for	varI = 0, 6 - 1 do
			SetFubenData_Param(varMap, x700212_CSP_B_GATHERED_START+varI,0);
		end

		local varX,z =GetWorldPos(varMap,varPlayer)
		SetGrowPointPos(varMap,x700212_var_nGrowpointType,varX,z)
		SetGrowPointIntervalContainer(varMap,x700212_var_nGrowpointType,1)
		x700212_ShowTipsToAll(varMap, "地上出现了一个奇异的箱子！")































	end
end

function x700212_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700212_ProcAllMonsterDead( varMap)
	x700212_CreateSubmitNpc( varMap)
end

function x700212_CreateSubmitNpc( varMap)

	local varRet
	if x700212_var_SubmitNPC.title~="" then
		varRet = CreateMonster(varMap, x700212_var_SubmitNPC.type, x700212_var_SubmitNPC.varX, x700212_var_SubmitNPC.z, 3, 0, -1, x700212_var_SubmitNPC.guid, -1,-1,x700212_var_SubmitNPC.facedir,  "",x700212_var_SubmitNPC.title)
	else
		varRet = CreateMonster(varMap, x700212_var_SubmitNPC.type, x700212_var_SubmitNPC.varX, x700212_var_SubmitNPC.z, 3, 0, -1, x700212_var_SubmitNPC.guid, -1,-1,x700212_var_SubmitNPC.facedir)
	
	end

	SetFubenData_Param(varMap, x700212_CSP_NPC_ID, varRet )
	SetFubenData_Param(varMap, x700212_CSP_NPC_STATUS, 1 )
end










function x700212_ProcGpCreate(varMap,growPointType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)

end



function x700212_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	return 0;
	
end

function x700212_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	
	return 0;
	
end



function x700212_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
	
	

	
	x700212_ProcAnwer(varMap,varPlayer)
	

	
end


function x700212_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end


function x700212_ProcAnwer(varMap,varPlayer)

	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)

	

	for varI=0, 5 do
        local paramidx = x700212_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
		nGUID = format("%u", nGUID)
		
		

        if nGUID == myGuid then

			local bGathered = GetFubenData_Param(varMap, x700212_CSP_B_GATHERED_START+varI);
			
			local varStr = ""

			if bGathered<=0 then
				SetFubenData_Param(varMap, x700212_CSP_B_GATHERED_START+varI,1);
				
				local bGuoyun =GetFubenData_Param(varMap, x700212_CSP_B_GUOYUN_START+varI);
				local nMoney = x700212_GetMyMoneyBonus(varMap,varPlayer,bGuoyun);
				
				
				local strMoney = x700212_GetMoneyName(varMap,nMoney)
				varStr = format("获得%s的银卡",strMoney)
				
				AddMoney(varMap, varPlayer, 1, nMoney)
			else
				varStr = "您只能采集一次！"
			end

			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			break;
           
        end
    end
end


function x700212_GetMyMoneyBonus(varMap,varPlayer,bGuoyun)

	local nLevel = GetLevel(varMap,varPlayer)

	local varCount = nLevel*400






	
	return varCount;
end


function x700212_GetMoneyName(varMap,nMoney)
	local ding = floor(nMoney/(1000*1000))
	local liang = floor((nMoney-ding*1000*1000)/1000)
	local wen = nMoney-(ding*1000*1000+liang*1000)

	local varStr=""
	if ding>0 then
		varStr = varStr..format("%d锭",ding)
	end

	if liang>0 then
		varStr = varStr..format("%d两",liang)
	end

	if wen>0 then
		varStr = varStr..format("%d文",wen)
	end

	return varStr;
	
end





function x700212_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x700212_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end







