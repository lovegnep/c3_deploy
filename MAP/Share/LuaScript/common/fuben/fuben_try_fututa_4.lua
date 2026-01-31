











x700222_CSP_FUBENTYPE				= 	0
x700222_CSP_SCRIPTID				=	1
x700222_CSP_TICKCOUNT				= 	2
x700222_CSP_FROMSCENEID				= 	3
x700222_CSP_ISCLOSING				= 	4
x700222_CSP_LEAVECOUNTDOWN			= 	5
x700222_CSP_TEAMID					=	6
x700222_CSP_BACKSCENEX       		=   7
x700222_CSP_BACKSCENEZ      		=   8
x700222_CSP_FUBENLEVEL			=	9

x700222_CSP_KILLCOUNT				=	20
x700222_CSP_FUBEN_SCENE_ID			=	21

x700222_CSP_NPC_ID					=	22
x700222_CSP_CURRENTSTEP				=	23
x700222_CSP_CURRENTSTEP_TICKCOUNT	=	24
x700222_CSP_MONSTER_COUNT			=	25
x700222_CSP_BOSS_ID					=	26
x700222_CSP_FUBENLEVEL_DUP		=	27

x700222_CSP_TWO_TYPE_START			=	30
x700222_CSP_THREE_TYPE_START		=	35

x700222_CSP_HUMAN_TALKPARAM_START	=	230
x700222_CSP_HUMAN_COUNT				=	240
x700222_CSP_OBJID_START				=	241
x700222_CSP_NEXT_SCENE				=   248
x700222_CSP_GUID_START              =   248




x700222_var_FileId 					= 700222                    



x700222_var_nTextCount				= 4
x700222_var_NpcTalkText				= { "它们会从四面八方涌来","出现的怪物要及时杀掉","不要手软，勇士！","它们的出现威胁到王国的安危！"}

x700222_var_TimeDriverList			= {2,3,3,3,10,3,3,3,10,3,3,3,10,3,3,3,10,5,5,5,16,5,5,5,16,5,5,5,16,5,5,5,16,1,12,1,30,1,12,1,30,1,12,1,30,1,12,1,30,1,12,1,30,1,12,1,30,1,12,1,30,1,12,1,30}




x700222_var_SubmitNPC                 =   { type =25024,guid= 150525,varX = 65, z=60, facedir =0, title="" }

x700222_var_GameNPC                 =   { type =25024,guid= 150525,varX = 54, z=48, facedir=0, title="" }


x700222_var_BossCreate				=	{
                                            {levelmin =20, levelmax=100, varName ="巨掌玄冰",   type= 27743,  varX=65,  z=21,  r=0,  ai=9, aiscript=511, varFlag = 0, varCount=1, facedir = 0, patrolid = 0, title = ""},
                                           

                                            
										}
										











x700222_var_PointList	=		{
								{varFlag=1,	varX=65, 	z= 21 ,	patrolid = 0},
								{varFlag=2,	varX=58, 	z= 21 ,	patrolid = 1},
								{varFlag=3,	varX=71, 	z= 21 ,	patrolid = 2},
								{varFlag=4,	varX=25, 	z= 59 ,	patrolid = 3},
								{varFlag=5,	varX=25, 	z= 53 ,	patrolid = 4},
								{varFlag=6,	varX=25, 	z= 66 ,	patrolid = 5},
								{varFlag=7,	varX=65, 	z= 102,	patrolid = 0},
								{varFlag=8,	varX=58, 	z= 102,	patrolid = 1},
								{varFlag=9,	varX=71, 	z= 102,	patrolid = 2},
								{varFlag=10,	varX=108, 	z= 59 ,	patrolid = 3},
								{varFlag=11,	varX=108, 	z= 53 ,	patrolid = 4},
								{varFlag=12,	varX=108, 	z= 66 ,	patrolid = 5},
							}


x700222_var_C42 = {{1,2},{1,3},{1,4},{2,3},{2,4},{3,4}}

x700222_var_C43 = {{1,2,3},{2,3,4},{1,3,4},{1,2,4}};	


x700222_var_Monster_ObjList = {

                                {varFlag=1, levelmin =20, levelmax=100, type= 27739, ai=9, aiscript=504},
                               
                                {varFlag=2, levelmin =20, levelmax=100, type= 27740, ai=9, aiscript=505},
                                
                                {varFlag=3, levelmin =20, levelmax=100, type= 27741, ai=9, aiscript=506},
                                

                                {varFlag=4, levelmin =20, levelmax=100, type= 27742, ai=9, aiscript=510},
                                

							}

	

x700222_var_MonsterCreate =	{
								
								{timeflag=1, pointlist = {1},	objflag = 1},
								{timeflag=2, pointlist = {4},	objflag = 1},
								{timeflag=3, pointlist = {7},	objflag = 1},
								{timeflag=4, pointlist = {10},	objflag = 1},

								
								{timeflag=5, pointlist = {1},	objflag = 2},
								{timeflag=6, pointlist = {4},	objflag = 2},
								{timeflag=7, pointlist = {7},	objflag = 2},
								{timeflag=8, pointlist = {10},	objflag = 2},

								
								{timeflag=9,  pointlist = {1},	objflag = 3},
								{timeflag=10, pointlist = {4},	objflag = 3},
								{timeflag=11, pointlist = {7},	objflag = 3},
								{timeflag=12, pointlist = {10},	objflag = 3},

								
								{timeflag=13, pointlist = {1},	objflag = 4},
								{timeflag=14, pointlist = {4},	objflag = 4},
								{timeflag=15, pointlist = {7},	objflag = 4},
								{timeflag=16, pointlist = {10},	objflag = 4},

								
								{timeflag=17, pointlist = {2,3},	objflag = 5},
								{timeflag=18, pointlist = {5,6},	objflag = 5},
								{timeflag=19, pointlist = {8,9},	objflag = 5},
								{timeflag=20, pointlist = {11,12},	objflag = 5},

								
								{timeflag=21, pointlist = {2,3},	objflag = 6},
								{timeflag=22, pointlist = {5,6},	objflag = 6},
								{timeflag=23, pointlist = {8,9},	objflag = 6},
								{timeflag=24, pointlist = {11,12},	objflag = 6},

								
								{timeflag=25, pointlist = {2,3},	objflag = 7},
								{timeflag=26, pointlist = {5,6},	objflag = 7},
								{timeflag=27, pointlist = {8,9},	objflag = 7},
								{timeflag=28, pointlist = {11,12},	objflag = 7},

								
								{timeflag=29, pointlist = {2,3},	objflag = 8},
								{timeflag=30, pointlist = {5,6},	objflag = 8},
								{timeflag=31, pointlist = {8,9},	objflag = 8},
								{timeflag=32, pointlist = {11,12},	objflag = 8},

								
								{timeflag=33, pointlist = {1,2,3},		objflag = 9},
								{timeflag=34, pointlist = {4,5,6},		objflag = 9},
								{timeflag=35, pointlist = {7,8,9},		objflag = 9},
								{timeflag=36, pointlist = {10,11,12},	objflag = 9},

								
								{timeflag=37, pointlist = {1,2,3},		objflag = 10},
								{timeflag=38, pointlist = {4,5,6},		objflag = 10},
								{timeflag=39, pointlist = {7,8,9},		objflag = 10},
								{timeflag=40, pointlist = {10,11,12},	objflag = 10},

								
								{timeflag=41, pointlist = {1,2,3},		objflag = 11},
								{timeflag=42, pointlist = {4,5,6},		objflag = 11},
								{timeflag=43, pointlist = {7,8,9},		objflag = 11},
								{timeflag=44, pointlist = {10,11,12},	objflag = 11},

								
								{timeflag=45, pointlist = {1,2,3},		objflag = 12},
								{timeflag=46, pointlist = {4,5,6},		objflag = 12},
								{timeflag=47, pointlist = {7,8,9},		objflag = 12},
								{timeflag=48, pointlist = {10,11,12},	objflag = 12},

								
								{timeflag=49, pointlist = {1,2,3},		objflag = 13},
								{timeflag=50, pointlist = {4,5,6},		objflag = 13},
								{timeflag=51, pointlist = {7,8,9},		objflag = 13},
								{timeflag=52, pointlist = {10,11,12},	objflag = 13},
								
								
								{timeflag=53, pointlist = {1,2,3},		objflag = 14},
								{timeflag=54, pointlist = {4,5,6},		objflag = 14},
								{timeflag=55, pointlist = {7,8,9},		objflag = 14},
								{timeflag=56, pointlist = {10,11,12},	objflag = 14},
								
								
								{timeflag=57, pointlist = {1,2,3},		objflag = 15},
								{timeflag=58, pointlist = {4,5,6},		objflag = 15},
								{timeflag=59, pointlist = {7,8,9},		objflag = 15},
								{timeflag=60, pointlist = {10,11,12},	objflag = 15},
								
								
								{timeflag=61, pointlist = {1,2,3},		objflag = 16},
								{timeflag=62, pointlist = {4,5,6},		objflag = 16},
								{timeflag=63, pointlist = {7,8,9},		objflag = 16},
								{timeflag=64, pointlist = {10,11,12},	objflag = 16},
								
						    }








function x700222_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

end







function x700222_ProcFubenSceneCreated( varMap )
	

	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700222_CSP_HUMAN_COUNT, humancount);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		SetFubenData_Param(varMap, x700222_CSP_OBJID_START+varI, humanId);
	end

	SetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP, 1)
	SetFubenData_Param( varMap, x700222_CSP_BOSS_ID, -1)

	local copyscenelevel = GetFubenData_Param(varMap, x700222_CSP_FUBENLEVEL ) ;
	SetFubenData_Param( varMap, x700222_CSP_FUBENLEVEL_DUP, copyscenelevel)
	
	
	x700222_InitRandomType(varMap)

    x700222_CreateNpc(varMap)
	
		
end

function x700222_InitRandomType(varMap)
	local objList={random(1,6)};

	for varI=2, 4 do
		local j = random(1,6)

		while j== objList[varI-1] do
			j = random(1,6)
		end
		
		objList[varI] = j
	end

	for varI=1, 4 do
		SetFubenData_Param(varMap, x700222_CSP_TWO_TYPE_START+varI, objList[varI]);
	end

	objList={random(1,4)};

	for varI=2, 4 do
		local j = random(1,4)

		while j== objList[varI-1] do
			j = random(1,4)
		end
		
		objList[varI] = j
	end

	for varI=1, 4 do
		SetFubenData_Param(varMap, x700222_CSP_THREE_TYPE_START+varI, objList[varI]);
	end

end

function x700222_CreateNpc( varMap)
	
	 local varRet = 0;
	 if x700222_var_GameNPC.title~="" then
		varRet = CreateMonster(varMap, x700222_var_GameNPC.type, x700222_var_GameNPC.varX, x700222_var_GameNPC.z, 3, 0, -1, x700222_var_GameNPC.guid, -1,-1,x700222_var_GameNPC.facedir,  "",x700222_var_GameNPC.title)
	 else
		varRet = CreateMonster(varMap, x700222_var_GameNPC.type, x700222_var_GameNPC.varX, x700222_var_GameNPC.z, 3, 0, -1, x700222_var_GameNPC.guid, -1,-1,x700222_var_GameNPC.facedir)
	 end

	 SetFubenData_Param(varMap, x700222_CSP_NPC_ID, varRet )
end







function x700222_EnterTick(varMap, nowTickCount)

	if nowTickCount >= 2 and  nowTickCount<= x700222_var_nTextCount+1 then
		local nNpcId = GetFubenData_Param(varMap, x700222_CSP_NPC_ID )
		
		
		NpcTalk(varMap, nNpcId, x700222_var_NpcTalkText[nowTickCount-1],  -1)
	end

	local varCurrentStep = GetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP);

	
	if varCurrentStep<=0 then
		return
	end



	local nLen = 0;
	for varI,item in x700222_var_TimeDriverList do
		nLen = nLen+1
	end

	if varCurrentStep> nLen then
		return
	end

	local nCurrentStepTickCount = GetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP_TICKCOUNT)+1;
	SetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP_TICKCOUNT, nCurrentStepTickCount)
	
	local nNextStepTime = x700222_var_TimeDriverList[varCurrentStep];

	if nCurrentStepTickCount>=nNextStepTime then
		SetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP_TICKCOUNT, 0)
		SetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP,varCurrentStep+1 );
		
		if varCurrentStep< nLen then
			x700222_CreateMonster( varMap, varCurrentStep )
		else
			x700222_CreateBoss(varMap)
		end
    
	end
end





function x700222_CreateMonster(varMap, varStep)

	
	local varCount = GetFubenData_Param(varMap, x700222_CSP_MONSTER_COUNT ) 
    
	local nCreateCount = 0;

	for varI, item in x700222_var_MonsterCreate do

		if item.timeflag == varStep then
			
			

			local tpointlist = item.pointlist;
			local j=0
			for k,pointIndex in tpointlist do
				j = j+1;

				
				local varX,z,patrolid = x700222_GetPointInfo(varMap, pointIndex)
				local nType, ai,aiscript = x700222_GetMonsterInfo(varMap, item.objflag, j); 
				
				local varRet = CreateMonster(varMap, nType, varX, z, ai, aiscript, x700222_var_FileId, -1, 21,-1,0)

				if patrolid>=0 then
					SetPatrolId(varMap, varRet, patrolid)
				end
				
				nCreateCount = nCreateCount+1
				varCount = varCount+1
				
			end
		end

       
	end

	
	if mod(varStep,4) ==1 then
		local varStr = ""
		if varStep==1 then
			varStr = "#G第一批怪兽出现了！"
		else
			local strList = {	"#G又一批怪兽蜂拥而出……",
								"#G四周同时出现了怪物的身影……",
								"#G四面都传来沉重的脚步声……"}

			varStr = strList[random(1,3)]

		end

		
		x700222_ShowTipsToAll(varMap,varStr);
	end

	SetFubenData_Param(varMap, x700222_CSP_MONSTER_COUNT, varCount ) 

end





function x700222_GetPointInfo(varMap, pointIndex)
	for varI,item in x700222_var_PointList do
		if item.varFlag == pointIndex then
			return item.varX, item.z, item.patrolid;
		end
	end

	return -1;
end




function x700222_GetMonsterInfo(varMap, objflag, varExt)

	local copyscenelevel = GetFubenData_Param(varMap, x700222_CSP_FUBENLEVEL ) ;

	
	
	local varIndex;

	if objflag<=4 then 
		varIndex = objflag
	elseif objflag<=8 then
		local twoType = GetFubenData_Param(varMap, x700222_CSP_TWO_TYPE_START+objflag-4);
		local tempList = x700222_var_C42[twoType]
		varIndex = tempList[varExt];
	elseif objflag<=12 then
		local threeType = GetFubenData_Param(varMap, x700222_CSP_THREE_TYPE_START+objflag-8);
		local tempList = x700222_var_C43[threeType]
		varIndex = tempList[varExt];
	elseif objflag<=16 then
		varIndex = random(1,4);
	else
		return -1;
	end

	for varI,item in x700222_var_Monster_ObjList do
		if item.varFlag == varIndex then
			if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
				return item.type, item.ai, item.aiscript;
			end
		end
	end

	
	
end



function x700222_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700222_CSP_KILLCOUNT)
	local varCountry = GetCurCountry(varMap, varPlayer)
	SetFubenData_Param(varMap, x700222_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	


	local bossid = GetFubenData_Param(varMap, x700222_CSP_BOSS_ID)
	
	if bossid== varPlayer then
		x700222_ShowTipsToAll(varMap, "随着巨兽的倒下，轮回台渐渐恢复了平静。")
	if  varCountry == 0 then
    	LuaCallNoclosure( 203782, "FinishLunhuitai", varMap, varKiller)
    elseif varCountry == 1 then 
   		LuaCallNoclosure( 203783, "FinishLunhuitai", varMap, varKiller)
    elseif varCountry == 2 then 
    	LuaCallNoclosure( 203784, "FinishLunhuitai", varMap, varKiller)
    elseif varCountry == 3 then 
    	LuaCallNoclosure( 203785, "FinishLunhuitai", varMap, varKiller)
    end
    
    	
		local nNpcId = GetFubenData_Param(varMap, x700222_CSP_NPC_ID )
		NpcTalk(varMap, nNpcId, "来我这里，我帮你们回到王城！",  -1)

		
































	else
		local nCurMonsterCount = GetFubenData_Param(varMap, x700222_CSP_MONSTER_COUNT)-1 
		
		SetFubenData_Param(varMap, x700222_CSP_MONSTER_COUNT, nCurMonsterCount)
		if nCurMonsterCount==0 then
			x700222_ProcAllMonsterDead( varMap)
		end
	end

	

	
end

function x700222_ProcAllMonsterDead( varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP);

	
	if varCurrentStep<=0 then
		return
	end



	local nLen = 0;
	for varI,item in x700222_var_TimeDriverList do
		nLen = nLen+1
	end

	if varCurrentStep> nLen then
		return
	end
	
	local nNextStepTime = x700222_var_TimeDriverList[varCurrentStep];
	
	SetFubenData_Param(varMap, x700222_CSP_CURRENTSTEP_TICKCOUNT, nNextStepTime-1)
	
	


end

function x700222_CreateSubmitNpc( varMap)
	 if x700222_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700222_var_SubmitNPC.type, x700222_var_SubmitNPC.varX, x700222_var_SubmitNPC.z, 3, 0, -1, x700222_var_SubmitNPC.guid, -1,-1,x700222_var_SubmitNPC.facedir,  "", x700222_var_SubmitNPC.title)
	 else
		CreateMonster(varMap, x700222_var_SubmitNPC.type, x700222_var_SubmitNPC.varX, x700222_var_SubmitNPC.z, 3, 0, -1, x700222_var_SubmitNPC.guid, -1,-1,x700222_var_SubmitNPC.facedir)
	 end
	 
end








function x700222_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x700222_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end



function x700222_ShowTipsToAll(varMap, varStr)
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);

		DeliverTalkTips(varMap, humanId);
	end
end
