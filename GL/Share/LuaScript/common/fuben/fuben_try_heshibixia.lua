











x700209_CSP_FUBENTYPE				= 	0
x700209_CSP_SCRIPTID				=	1
x700209_CSP_TICKCOUNT				= 	2
x700209_CSP_FROMSCENEID				= 	3
x700209_CSP_ISCLOSING				= 	4
x700209_CSP_LEAVECOUNTDOWN			= 	5
x700209_CSP_TEAMID					=	6
x700209_CSP_BACKSCENEX       		=   7
x700209_CSP_BACKSCENEZ      		=   8
x700209_CSP_FUBENLEVEL			=	9
x700209_CSP_KILLCOUNT				=	20
x700209_CSP_FUBEN_SCENE_ID			=	21
x700209_CSP_BOSSINDEX				=   22
x700209_CSP_BOSSCREATETIME			=	23
x700209_CSP_FORCE					=	24
x700209_CSP_GAME_STARTED            =   25
x700209_CSP_CURRENTBOSS_INDEX		=	26
x700209_CSP_CURRENTBOSS_TICK		=   27
x700209_CSP_STARTNPC_ID				=	28
x700209_CSP_B_FUBEN_STATUS			=	29

x700209_CSP_CURRENTBOSS_TIME_START	=   50
x700209_CSP_CURRENTBOSS_ID_START	=	60
x700209_CSP_MONSTER_COUNT			=	70
x700209_CSP_MONSTER_START			=	71

x700209_B_CREATE_RANDOMBOSS			=	230
x700209_CSP_RANDOM_BOSS_ID			=	231
x700209_RANDOMBOSS_FLAG				=	232

x700209_CSP_HUMAN_COUNT				=	240
x700209_CSP_OBJID_START				=	241
x700209_CSP_GUID_START              =   248





x700209_var_FileId 					= 700209


x700209_var_Boss_Interval = {2*12,2*12,2*12,2*12,2*12,2*12,2*12,2*12}  
x700209_var_SuccessBossInex			=	8	                         

x700209_var_MaxForce					=	50                           

x700209_var_NpcTalkText			=  { "受命于天，既寿永昌。","成吉思汗的黄金时代必将成为历史！"}
x700209_var_nTextCount			=	2


x700209_var_RandomBossRate		=	0



x700209_var_SubmitNPC                 =   { type =25011,guid= 150511,varX = 69, z=20,facedir=0, title="" }
x700209_var_LeaveNPC					=   { type =25011,guid= 150511,varX = 69, z=20,facedir=0, title="" }	




x700209_var_Monster_Random_Create		=	{
											{levelmin =20, levelmax=100, varName ="坐骑boss",   type= 27353,   varX=65, z=31, r=0,  ai=18, aiscript=635,  facedir = 0, title = "",varFlag=0},
											                                          
											{levelmin =20, levelmax=100, varName ="坐骑boss",   type= 27361,   varX=65, z=31, r=0,  ai=18, aiscript=635,  facedir = 0, title = "",varFlag=1},
											                                      
											{levelmin =20, levelmax=100, varName ="坐骑boss",   type= 27369,   varX=65, z=31, r=0,  ai=18, aiscript=635,  facedir = 0, title = "",varFlag=2},
											                      
											{levelmin =20, levelmax=100, varName ="坐骑boss",   type= 27377,   varX=65, z=31, r=0,  ai=18, aiscript=635,  facedir = 0, title = "",varFlag=3},
											

										}


x700209_var_BossCreate                =   {

                                            {levelmin =20, levelmax=100, varName ="盐帮头目1",   type= 27802,   varX=29, z=48, r=0,  ai=9, aiscript=563, varCount=1, facedir = 0, title = "",patrolid=0,varFlag=0 },
                                           
                                            {levelmin =20, levelmax=100, varName ="盐帮头目2",   type= 27803,   varX=29, z=63, r=0,  ai=9, aiscript=564, varCount=1, facedir = 0, title = "",patrolid=1,varFlag=1 },
                                           
                                            {levelmin =20, levelmax=100, varName ="盐帮头目3",   type= 27804,   varX=29, z=79, r=0,  ai=9, aiscript=565, varCount=1, facedir = 0, title = "",patrolid=2,varFlag=2 },
                                           
                                            {levelmin =20, levelmax=100, varName ="丐帮头目1",   type= 27805,   varX=99, z=48, r=0,  ai=9, aiscript=566, varCount=1, facedir = 0, title = "",patrolid=4,varFlag=4 },
                                           
                                            {levelmin =20, levelmax=100, varName ="丐帮头目2",   type= 27806,   varX=99, z=63, r=0,  ai=9, aiscript=567, varCount=1, facedir = 0, title = "",patrolid=5,varFlag=5 },
                                            
                                            {levelmin =20, levelmax=100, varName ="丐帮头目3",   type= 27807,   varX=99, z=79, r=0,  ai=9, aiscript=568, varCount=1, facedir = 0, title = "",patrolid=6,varFlag=6 },
                                            
                                            {levelmin =20, levelmax=100, varName ="张士诚",   type= 27808,   varX=29, z=95, r=0,  ai=9, aiscript=569, varCount=1, facedir = 0, title = "",patrolid=3,varFlag=3 },
                                            
                                            {levelmin =20, levelmax=100, varName ="陈友谅",   type= 27809,   varX=99, z=95, r=0,  ai=9, aiscript=570, varCount=1, facedir = 0, title = "",patrolid=7,varFlag=7 },
                                            

                                        }


x700209_var_MonsterCreate_Random_Count = {2,2,2,2,2,2,2,2}

x700209_var_MonsterCreate             =   {

                                            {levelmin =20, levelmax=100, varName ="盐帮弟子1",   type= 27794,   varX=29, z=48, r=0,  ai=9, aiscript=555, varCount=1, facedir = 0, title = "",patrolid=0,varFlag=0 },
                                            
                                            {levelmin =20, levelmax=100, varName ="盐帮弟子2",   type= 27795,   varX=29, z=63, r=0,  ai=9, aiscript=556, varCount=1, facedir = 0, title = "",patrolid=1,varFlag=1 },
												
                                            {levelmin =20, levelmax=100, varName ="盐帮弟子3",   type= 27796,   varX=29, z=79, r=0,  ai=9, aiscript=557, varCount=1, facedir = 0, title = "",patrolid=2,varFlag=2 },
                                            
                                            {levelmin =20, levelmax=100, varName ="盐帮弟子4",   type= 27797,   varX=29, z=95, r=0,  ai=9, aiscript=558, varCount=1, facedir = 0, title = "",patrolid=3,varFlag=3 },
                                            
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子1",   type= 27798,   varX=99, z=48, r=0,  ai=9, aiscript=559, varCount=1, facedir = 0, title = "",patrolid=4,varFlag=4 },
												
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子2",   type= 27799,   varX=99, z=63, r=0,  ai=9, aiscript=560, varCount=1, facedir = 0, title = "",patrolid=5,varFlag=5 },
												
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子3",   type= 27800,   varX=99, z=79, r=0,  ai=9, aiscript=561, varCount=1, facedir = 0, title = "",patrolid=6,varFlag=6 },
                                            
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子4",   type= 27801,   varX=99, z=95, r=0,  ai=9, aiscript=562, varCount=1, facedir = 0, title = "",patrolid=7,varFlag=7 },
                                            
											{levelmin =20, levelmax=100, varName ="盐帮弟子12",  type= 27794,   varX=29, z=63, r=0,  ai=9, aiscript=555, varCount=1, facedir = 0, title = "",patrolid=1,varFlag=11 },
                                            														     
                                            {levelmin =20, levelmax=100, varName ="盐帮弟子2",   type= 27795,   varX=29, z=48, r=0,  ai=9, aiscript=556, varCount=1, facedir = 0, title = "",patrolid=0,varFlag=10 },
																									     
                                            {levelmin =20, levelmax=100, varName ="盐帮弟子3",   type= 27796,   varX=29, z=95, r=0,  ai=9, aiscript=557, varCount=1, facedir = 0, title = "",patrolid=3,varFlag=13 },
                                            														     
                                            {levelmin =20, levelmax=100, varName ="盐帮弟子4",   type= 27797,   varX=29, z=79, r=0,  ai=9, aiscript=558, varCount=1, facedir = 0, title = "",patrolid=2,varFlag=12 },
																									     
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子1",   type= 27798,   varX=99, z=63, r=0,  ai=9, aiscript=559, varCount=1, facedir = 0, title = "",patrolid=5,varFlag=15 },
																									     
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子2",   type= 27799,   varX=99, z=48, r=0,  ai=9, aiscript=560, varCount=1, facedir = 0, title = "",patrolid=4,varFlag=14 },
                                            														     
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子3",   type= 27800,   varX=99, z=95, r=0,  ai=9, aiscript=561, varCount=1, facedir = 0, title = "",patrolid=7,varFlag=17 },
                                            														     
                                            {levelmin =20, levelmax=100, varName ="丐帮弟子4",   type= 27801,   varX=99, z=79, r=0,  ai=9, aiscript=562, varCount=1, facedir = 0, title = "",patrolid=6,varFlag=16 },
                                           

                                        }





x700209_var_NpcCreate				=	{                                          
                                            {levelmin =20, levelmax=100, varName ="朱元璋",   type= 25010,  varX=65, z=19, r=0,  ai=7, aiscript=0,   facedir = 0, title = "",camp = 24},
									}








function x700209_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)
	
end






function x700209_ProcFubenSceneCreated( varMap )
	
	
	x700209_CreateNpc( varMap)
	SetFubenData_Param(varMap, x700209_CSP_B_FUBEN_STATUS,0 ) ;   


	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700209_CSP_HUMAN_COUNT, humancount);
	
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		SetFubenData_Param(varMap, x700209_CSP_OBJID_START+varI, humanId);
	end
end






function x700209_EnterTick(varMap, nowTickCount)
		
	if nowTickCount >= 2 and  nowTickCount<= x700209_var_nTextCount+1 then
		local nNpcId = GetFubenData_Param(varMap, x700209_CSP_STARTNPC_ID)
		
		
		NpcTalk(varMap, nNpcId, x700209_var_NpcTalkText[nowTickCount-1],  -1)
	end

        if nowTickCount == (x700209_var_nTextCount+2) then
		SetFubenData_Param( varMap ,x700209_CSP_GAME_STARTED, 1)
		x700209_CreateBoss(varMap,0)
        end
	local humancount = GetFuben_PlayerCount(varMap);
	local nStarted = GetFubenData_Param( varMap ,x700209_CSP_GAME_STARTED)
	
	if nStarted>0 then
		
		if humancount>0 then
			x700209_CheckMonsterRefresh(varMap,nowTickCount)
		end
	end
end

function x700209_CheckMonsterRefresh(varMap,nowTickCount)

	local nFubenStatus = GetFubenData_Param(varMap, x700209_CSP_B_FUBEN_STATUS ) 

	if nFubenStatus~= 0 then
		return
	end

	local varCurrentStep = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_INDEX)

	if varCurrentStep>8 then
		return 0;
	end

	local nTargetTick = x700209_var_Boss_Interval[varCurrentStep];

	local nCurrentTick = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TICK) + 1;

	SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TICK,nCurrentTick)

	if nTargetTick ==nCurrentTick then
		if varCurrentStep<8 then
			x700209_CreateBoss(varMap,varCurrentStep)
		end
	end

	for varI = 0, varCurrentStep - 1 do
		local nBossId = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_ID_START + varI);
		local nBossTime = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TIME_START + varI)+1;
		SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TIME_START + varI, nBossTime);

		if nBossId>=0 then
			if nBossTime>0 then
				if mod( nBossTime, 2 ) == 0 then
					x700209_var_CreateMonster(varMap,varI)
				end
			end
		end
	end
	
				
end


function x700209_CreateBoss(varMap,varIndex)

	local copyscenelevel = GetFubenData_Param(varMap, x700209_CSP_FUBENLEVEL ) ;
	for varI, item in x700209_var_BossCreate do

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then

            if item.varFlag == varIndex   then

				local nForce = GetFubenData_Param(varMap, x700209_CSP_FORCE )
				if nForce>x700209_var_MaxForce then
					
					return
				end


                local varRet = 0
				if item.title~="" then
					varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700209_var_FileId,-1,21,-1, item.facedir,  "",item.title);
				else
					varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700209_var_FileId,-1,21,-1, item.facedir);
				
				end
				if item.patrolid>=0 then
					SetPatrolId(varMap, varRet, item.patrolid)
				end

				SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_ID_START + varIndex, varRet)
				SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_INDEX, varIndex+1)
				SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TICK, 0)
				SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TIME_START + varIndex, 0)

                
                nForce = GetFubenData_Param(varMap, x700209_CSP_FORCE ) + 10
                SetFubenData_Param(varMap,x700209_CSP_FORCE,nForce )
                SetFubenData_Param(varMap, x700209_CSP_BOSSINDEX,varIndex +1 )


                
                local nTickCount = GetFubenData_Param( varMap ,x700209_CSP_TICKCOUNT );
                SetFubenData_Param(varMap, x700209_CSP_BOSSCREATETIME,nTickCount )

                
                local humancount = GetFuben_PlayerCount(varMap);

                for varI = 0, humancount - 1 do
                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    StartTalkTask(varMap);
                        TalkAppendString(varMap,"敌对势力增加10, 总势力上升至"..nForce);
                    StopTalkTask();
                    DeliverTalkTips(varMap, humanId);
                end


				if nForce>x700209_var_MaxForce then
					x700209_ProcFubenFailed(varMap,0)
					return
				end

				
               
                break
            end
        end
    end

end








function x700209_var_CreateMonster(varMap,varIndex)


    local copyscenelevel = GetFubenData_Param(varMap, x700209_CSP_FUBENLEVEL ) ;

	local nMonsterCount = GetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT ) ;
	local varCount =nMonsterCount;

	local nTypeCount = x700209_var_MonsterCreate_Random_Count[varIndex+1];
	local nTypeFlag = random(0,nTypeCount-1)
	nTypeFlag = varIndex+nTypeFlag*10

	for varI, item in x700209_var_MonsterCreate do

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then

            if item.varFlag == nTypeFlag  then

				local nForce = GetFubenData_Param(varMap, x700209_CSP_FORCE )
				if nForce>x700209_var_MaxForce then
					
					return
				end

                local monsterid = 0
				if item.title~="" then
					monsterid = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700209_var_FileId,-1,21,-1,item.facedir,  "",item.title);
                else
					monsterid = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700209_var_FileId,-1,21,-1,item.facedir);
                
				end
				if item.patrolid>=0 then
					SetPatrolId(varMap, monsterid, item.patrolid)
				end

				SetFubenData_Param(varMap, x700209_CSP_MONSTER_START+varCount, monsterid ) ;
				varCount = varCount +1


                
                nForce = GetFubenData_Param(varMap, x700209_CSP_FORCE ) + 1
                SetFubenData_Param(varMap,x700209_CSP_FORCE,nForce )

                local humancount = GetFuben_PlayerCount(varMap);

                
                for varI = 0, humancount - 1 do
                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    StartTalkTask(varMap);
                        TalkAppendString(varMap,"敌对势力增加1, 总势力上升至"..nForce);
                    StopTalkTask();
                    DeliverTalkTips(varMap, humanId);
                end

				if nForce>x700209_var_MaxForce then
					SetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT, varCount ) ;
					x700209_ProcFubenFailed(varMap,0)
					return
				end

                break

            end
        end
    end


	SetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT, varCount ) ;

end




function x700209_CreateNpc( varMap )

	local copyscenelevel = GetFubenData_Param(varMap, x700209_CSP_FUBENLEVEL ) ;

	for varI, item in x700209_var_NpcCreate do

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
			local varRet = 0
			if item.title~="" then
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,item.camp,-1,item.facedir, "", item.title);
			else
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,item.camp,-1,item.facedir);
			
			end
			SetFubenData_Param(varMap, x700209_CSP_STARTNPC_ID, varRet)
			break;
		end
	end

    
end


function x700209_ProcFubenFailed(varMap, nParam)
	SetFubenData_Param(varMap, x700209_CSP_B_FUBEN_STATUS,2 ) ;   

	if nParam==0 then
		x700209_ShowTipsToAll(varMap, format("敌对势力超过%d, 副本失败",x700209_var_MaxForce))
	elseif nParam==1 then
		x700209_ShowTipsToAll(varMap, "朱五四见势不妙,落荒而逃, 副本失败")
	end


	local varCurrentStep = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_INDEX)

	

	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>= 0 then
			DeleteMonster( varMap,nBossID )
		end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700209_CSP_MONSTER_START+varI)
		if nMonsterId>=0 then
		DeleteMonster( varMap,nMonsterId )
	end
	end

	local nNpcObjId = GetFubenData_Param(varMap, x700209_CSP_STARTNPC_ID)

	if nNpcObjId>=0 then
		DeleteMonster( varMap,nNpcObjId )
	end

	x700209_ShowTipsToAll(varMap, "所有怪物消失")

	x700209_CreateLeaveNpc( varMap)
end


function x700209_ProcFubenSuccess(varMap)
	SetFubenData_Param(varMap, x700209_CSP_B_FUBEN_STATUS,1 ) ;   
	x700209_ShowTipsToAll(varMap, "出色地完成了副本")

	local varCurrentStep = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_INDEX)
	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>= 0 then
		DeleteMonster( varMap,nBossID )
	end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700209_CSP_MONSTER_START+varI)
		if nMonsterId>=0 then
		DeleteMonster( varMap,nMonsterId )
		end
	end

	x700209_ShowTipsToAll(varMap, "所有怪物消失")


	x700209_CreateSubmitNpc( varMap)


	x700209_CreateRandomMonster(varMap)
	
	
	
end



function x700209_CreateRandomMonster(varMap)


	local rate = random(0,100)/100;
	if rate>= x700209_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,3)

	

	local copyscenelevel = GetFubenData_Param(varMap, x700209_CSP_FUBENLEVEL ) ;


	
	
	for varI, item in x700209_var_Monster_Random_Create do 
		if item.varFlag == nFlag then
			if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
				local nBossID =0;
				if item.title~="" then
					nBossID = CreateMonster(varMap, item.type, item.varX,item.z, item.ai, item.aiscript, x700209_var_FileId, -1, 21,-1,item.facedir,  "",item.title)
				else
					nBossID = CreateMonster(varMap, item.type, item.varX,item.z, item.ai, item.aiscript, x700209_var_FileId, -1, 21,-1,item.facedir)
				
				end

				SetFubenData_Param(varMap, x700209_B_CREATE_RANDOMBOSS, 1)
				SetFubenData_Param(varMap, x700209_RANDOMBOSS_FLAG, nFlag)

				SetFubenData_Param(varMap, x700209_CSP_RANDOM_BOSS_ID, nBossID)
			end

				
		end
	end

	x700209_ShowTipsToAll(varMap, "战神再现！")

end


function x700209_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end


function x700209_ProcDie(varMap, varPlayer, varKiller)
	
	

	local nDieCount = GetFubenData_Param(varMap, x700209_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700209_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700209_B_CREATE_RANDOMBOSS)

	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700209_CSP_RANDOM_BOSS_ID)
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

			local nHorseFlag = GetFubenData_Param(varMap, x700209_RANDOMBOSS_FLAG);

			if nHorseFlag==0 then
				strHorseName = "烈狮"
			elseif nHorseFlag==1 then
				strHorseName = "驯鹿"
			elseif nHorseFlag==2 then
				strHorseName = "瑞鹤"
			elseif nHorseFlag==3 then
				strHorseName = "铁犀"
			end


			local strMapName = "金銮殿"
			
			
			
			
			
		end
	end
	
	
	local nNpcObjId = GetFubenData_Param(varMap, x700209_CSP_STARTNPC_ID)

	if nNpcObjId==varPlayer then
		SetFubenData_Param(varMap, x700209_CSP_STARTNPC_ID,-1)
		x700209_ProcFubenFailed(varMap, 1)
		return
	end

	local bBoss  = 0;


	local varCurrentStep = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_INDEX)

	

	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>=0 then
			if nBossID== varPlayer then
				SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_ID_START + varI, -1)
				local nForce = GetFubenData_Param(varMap, x700209_CSP_FORCE ) - 10;
				SetFubenData_Param(varMap,x700209_CSP_FORCE,nForce )

				local humancount = GetFuben_PlayerCount(varMap);

				
				for varI = 0, humancount - 1 do
					local humanId = GetFuben_PlayerObjId(varMap, varI);

					StartTalkTask(varMap);
						TalkAppendString(varMap,"敌对势力减少10, 总势力下降至"..nForce);
					StopTalkTask();
					DeliverTalkTips(varMap, humanId);
				end

				
				if nForce==0 then
					x700209_ProcAllForceDie(varMap)
				end
				

				bBoss = varI+1;
				break;
			end
		end
	end

	if bBoss==x700209_var_SuccessBossInex then






























		
		

		x700209_ProcFubenSuccess(varMap)
		return
	end


	local nMonsterCount = GetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700209_CSP_MONSTER_START+varI)
		if nMonsterId== varPlayer then
			for j=varI, nMonsterCount-2 do
				local nNextId = GetFubenData_Param(varMap, x700209_CSP_MONSTER_START+j+1)
				SetFubenData_Param(varMap, x700209_CSP_MONSTER_START+j, nNextId)
				
			end
			SetFubenData_Param(varMap, x700209_CSP_MONSTER_START+nMonsterCount-1,0)

			SetFubenData_Param(varMap, x700209_CSP_MONSTER_COUNT,nMonsterCount-1)

			local nForce = GetFubenData_Param(varMap, x700209_CSP_FORCE ) - 1;
			SetFubenData_Param(varMap,x700209_CSP_FORCE,nForce )

			local humancount = GetFuben_PlayerCount(varMap);

			
			for varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI);

				StartTalkTask(varMap);
					TalkAppendString(varMap,"敌对势力减少1, 总势力下降至"..nForce);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end

			
			if nForce==0 then
				x700209_ProcAllForceDie(varMap)
			end
			

			break
		end
	end
	


	
end



function x700209_ProcAllForceDie(varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_INDEX)

	if varCurrentStep>8 then
		return 0;
	end

	local nTargetTick = x700209_var_Boss_Interval[varCurrentStep];


	SetFubenData_Param(varMap, x700209_CSP_CURRENTBOSS_TICK,nTargetTick-1)

	local humancount = GetFuben_PlayerCount(varMap);

	









end


function x700209_ProcAllMonsterDead( varMap)
	
end

function x700209_CreateSubmitNpc( varMap)

	if x700209_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700209_var_SubmitNPC.type, x700209_var_SubmitNPC.varX, x700209_var_SubmitNPC.z, 3, 0, -1, x700209_var_SubmitNPC.guid, -1, -1,x700209_var_SubmitNPC.facedir, "", x700209_var_SubmitNPC.title )
	else
		CreateMonster(varMap, x700209_var_SubmitNPC.type, x700209_var_SubmitNPC.varX, x700209_var_SubmitNPC.z, 3, 0, -1, x700209_var_SubmitNPC.guid, -1, -1,x700209_var_SubmitNPC.facedir )
	
	end
end

function x700209_CreateLeaveNpc( varMap)
	if x700209_var_LeaveNPC.title ~="" then
		CreateMonster(varMap, x700209_var_LeaveNPC.type, x700209_var_LeaveNPC.varX, x700209_var_LeaveNPC.z, 3, 0, -1, x700209_var_LeaveNPC.guid, -1, -1,x700209_var_LeaveNPC.facedir,  "",x700209_var_LeaveNPC.title )
	else
		CreateMonster(varMap, x700209_var_LeaveNPC.type, x700209_var_LeaveNPC.varX, x700209_var_LeaveNPC.z, 3, 0, -1, x700209_var_LeaveNPC.guid, -1, -1,x700209_var_LeaveNPC.facedir )
	end

end






function x700209_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x700209_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end






