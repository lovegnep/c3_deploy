











x700009_CSP_FUBENTYPE				= 	0
x700009_CSP_SCRIPTID				=	1
x700009_CSP_TICKCOUNT				= 	2
x700009_CSP_FROMSCENEID				= 	3
x700009_CSP_ISCLOSING				= 	4
x700009_CSP_LEAVECOUNTDOWN			= 	5
x700009_CSP_TEAMID					=	6
x700009_CSP_BACKSCENEX       		=   7
x700009_CSP_BACKSCENEZ      		=   8
x700009_CSP_FUBENLEVEL			=	9

x700009_CSP_KILLCOUNT				=	20
x700009_CSP_FUBEN_SCENE_ID			=	21
x700009_CSP_BOSSINDEX				=   22
x700009_CSP_BOSSCREATETIME			=	23
x700009_CSP_FORCE					=	24
x700009_CSP_GAME_STARTED            =   25
x700009_CSP_CURRENTBOSS_INDEX		=	26
x700009_CSP_CURRENTBOSS_TICK		=   27
x700009_CSP_STARTNPC_ID				=	28
x700009_CSP_B_FUBEN_STATUS			=	29

x700009_CSP_CURRENTBOSS_TIME_START	=   50
x700009_CSP_CURRENTBOSS_ID_START	=	60
x700009_CSP_MONSTER_COUNT			=	70
x700009_CSP_MONSTER_START			=	71

x700009_B_CREATE_RANDOMBOSS			=	230
x700009_CSP_RANDOM_BOSS_ID			=	231
x700009_RANDOMBOSS_FLAG				=	232

x700009_CSP_XIANJINBOSS				=	239

x700009_CSP_HUMAN_COUNT				=	240
x700009_CSP_OBJID_START				=	241

x700009_CSP_GUID_START              =   248  
x700009_CSP_FUBEN_TYPE				=	254	
x700009_CSP_FUBEN_MODE				=   255 


x700009_var_FileId 					= 700009

x700009_var_Boss_Interval = {2*12,2*12,2*12,2*12,2*12,2*12,2*12,2*12}  
x700009_var_SuccessBossInex			=	8	                         

x700009_var_MaxForce					=	50                           

x700009_var_NpcTalkText			=  { "受命于天，既寿永昌。","成吉思汗的黄金时代必将成为历史！"}
x700009_var_nTextCount			=	2


x700009_var_RandomBossRate		=	0.08


x700009_var_SubmitNPC                 =   { type =25011,guid= 150511,varX = 69, z=20,facedir=0, title="" }
x700009_var_LeaveNPC					=   { type =25011,guid= 150511,varX = 69, z=20,facedir=0, title="" }	





x700009_var_MonsterCreate_Random_Count = {2,2,2,2,2,2,2,2}




x700009_var_NpcCreate				=	{                                          
                                            {levelmin =20, levelmax=100, varName ="朱元璋",   type= 25010,  varX=65, z=19, r=0,  ai=7, aiscript=0,   facedir = 0, title = "",camp = 24},
									}










function x700009_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

end

function x700009_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700009_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700009_ProcFubenSceneCreated( varMap )
	
	
	x700009_CreateNpc( varMap)
	SetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS,0 ) ;   

end

function x700009_CheckMonsterRefresh(varMap,nowTickCount)

	local nFubenStatus = GetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS ) 

	if nFubenStatus~= 0 then
		return
	end

	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	if varCurrentStep>8 then
		return 0;
	end

	local nTargetTick = x700009_var_Boss_Interval[varCurrentStep];

	local nCurrentTick = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK) + 1;

	SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK,nCurrentTick)

	if nTargetTick ==nCurrentTick then
		if varCurrentStep<8 then
			x700009_CreateBoss(varMap,varCurrentStep)
		end
	end

	for varI = 0, varCurrentStep - 1 do
		local nBossId = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI);
		local nBossTime = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TIME_START + varI)+1;
		SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TIME_START + varI, nBossTime);

		if nBossId>=0 then
			if nBossTime>0 then
				if mod( nBossTime, 2 ) == 0 then
					x700009_var_CreateMonster(varMap,varI)
				end
			end
		end
	end
	
				
end

function x700009_EnterTick(varMap, nowTickCount)
	if nowTickCount >= 2 and  nowTickCount<= x700009_var_nTextCount+1 then
		local nNpcId = GetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID)
		
		
		NpcTalk(varMap, nNpcId, x700009_var_NpcTalkText[nowTickCount-1],  -1)
	end

	if nowTickCount == (x700009_var_nTextCount+2) then
		SetFubenData_Param( varMap ,x700009_CSP_GAME_STARTED, 1)
		x700009_CreateBoss(varMap,0)
	end

	local nStarted = GetFubenData_Param( varMap ,x700009_CSP_GAME_STARTED)
	
	if nStarted>0 then
		

		x700009_CheckMonsterRefresh(varMap,nowTickCount)
		
	end
end

function x700009_CreateBoss(varMap,varIndex)

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

            if varFlag == varIndex   then

				local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE )
				if nForce>x700009_var_MaxForce then
					
					return
				end


                local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1, facedir,  "",title);
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1, facedir);
				
				end
				if patrolid>=0 then
					SetPatrolId(varMap, varRet, patrolid)
				end

				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varIndex, varRet)
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX, varIndex+1)
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK, 0)
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TIME_START + varIndex, 0)

                
                nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) + 10
                SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )
                SetFubenData_Param(varMap, x700009_CSP_BOSSINDEX,varIndex +1 )


                
                local nTickCount = GetFubenData_Param( varMap ,x700009_CSP_TICKCOUNT );
                SetFubenData_Param(varMap, x700009_CSP_BOSSCREATETIME,nTickCount )

                
                local humancount = GetFuben_PlayerCount(varMap);

                for varI = 0, humancount - 1 do
                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    StartTalkTask(varMap);
                        TalkAppendString(varMap,"敌对势力增加10, 总势力上升至"..nForce);
                    StopTalkTask();
                    DeliverTalkTips(varMap, humanId);
                end


				if nForce>x700009_var_MaxForce then
					x700009_ProcFubenFailed(varMap,0)
					return
				end

				
               
                break
            end
        end
    end

end








function x700009_var_CreateMonster(varMap,varIndex)

	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
    local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT ) ;
	local varCount =nMonsterCount;

	local nTypeCount = x700009_var_MonsterCreate_Random_Count[varIndex+1];
	local nTypeFlag = random(0,nTypeCount-1)
	nTypeFlag = varIndex+nTypeFlag*10

	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

            if varFlag == nTypeFlag  then

				local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE )
				if nForce>x700009_var_MaxForce then
					
					return
				end

                local monsterid = 0
				if title~="" then
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1,facedir,  "",title);
                else
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1,facedir);
                
				end
				if patrolid>=0 then
					SetPatrolId(varMap, monsterid, patrolid)
				end

				SetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varCount, monsterid ) ;
				varCount = varCount +1


                
                nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) + 1
                SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )

                local humancount = GetFuben_PlayerCount(varMap);

                
                for varI = 0, humancount - 1 do
                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    StartTalkTask(varMap);
                        TalkAppendString(varMap,"敌对势力增加1, 总势力上升至"..nForce);
                    StopTalkTask();
                    DeliverTalkTips(varMap, humanId);
                end

				if nForce>x700009_var_MaxForce then
					SetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT, varCount ) ;
					x700009_ProcFubenFailed(varMap,0)
					return
				end

                break

            end
        end
    end


	SetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT, varCount ) ;

end




function x700009_CreateNpc( varMap )

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;

	for varI, item in x700009_var_NpcCreate do

        if item.levelmin <= fubenlevel and item.levelmax >= fubenlevel then
			local varRet = 0
			if item.title~="" then
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,item.camp,-1,item.facedir, "", item.title);
			else
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,item.camp,-1,item.facedir);
			
			end
			SetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID, varRet)
			break;
		end
	end

    
end


function x700009_ProcFubenFailed(varMap, nParam)
	SetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS, -1 )

	SetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS,2 ) ;   

	if nParam==0 then
		x700009_ShowTipsToAll(varMap, format("敌对势力超过%d, 副本失败",x700009_var_MaxForce))
	elseif nParam==1 then
		x700009_ShowTipsToAll(varMap, "朱五四见势不妙,落荒而逃, 副本失败")
	end


	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	

	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>= 0 then
			DeleteMonster( varMap,nBossID )
		end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varI)
		if nMonsterId>=0 then
		DeleteMonster( varMap,nMonsterId )
	end
	end

	local nNpcObjId = GetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID)

	if nNpcObjId>=0 then
		DeleteMonster( varMap,nNpcObjId )
	end

	x700009_ShowTipsToAll(varMap, "所有怪物消失")

	x700009_CreateLeaveNpc( varMap)
end


function x700009_ProcFubenSuccess(varMap)
	SetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS,1 ) ;   
	x700009_ShowTipsToAll(varMap, "出色地完成了副本")

	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)
	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>= 0 then
		DeleteMonster( varMap,nBossID )
	end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varI)
		if nMonsterId>=0 then
		DeleteMonster( varMap,nMonsterId )
		end
	end

	x700009_ShowTipsToAll(varMap, "所有怪物消失")


	x700009_CreateSubmitNpc( varMap)


	
	
	LuaCallNoclosure( 701107, "ProcSceneBossDie", varMap, 2)
	LuaCallNoclosure( 701108, "ProcSceneBossDie", varMap, 2)
	
	
end



function x700009_CreateRandomMonster(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local rate = random(0,100)/100;
	local nStdRate = x700009_var_RandomBossRate
	local nFubenMode = GetFubenData_Param(varMap, x700009_CSP_FUBEN_MODE)
	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	
	if rate>= nStdRate then
		return 0;
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;


	
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir)
				
				end

				SetFubenData_Param(varMap, x700009_B_CREATE_RANDOMBOSS, 1)
				SetFubenData_Param(varMap, x700009_RANDOMBOSS_FLAG, nFlag)

				SetFubenData_Param(varMap, x700009_CSP_RANDOM_BOSS_ID, nBossID)
			end

				
		end
	end

	x700009_ShowTipsToAll(varMap, "战神再现！")

end





function x700009_ProcDie(varMap, varPlayer, varKiller)
	
	local xianjinboss = GetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		local humancount = GetFuben_PlayerCount(varMap);

	
		for varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			if GetLevel(varMap, humanId) >= 80 then
				local refixInhExp = AddInherenceExp(varMap, humanId, 600)
				local varStr = format("你获得了%d点天赋值", refixInhExp)
				StartTalkTask(varMap);
					TalkAppendString(varMap,varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId)
			end
		end
	end

	local nDieCount = GetFubenData_Param(varMap, x700009_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700009_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700009_B_CREATE_RANDOMBOSS)

	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700009_CSP_RANDOM_BOSS_ID)
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

			local nHorseFlag = GetFubenData_Param(varMap, x700009_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL )
			
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
			elseif fubenlevel < 110 then
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
					strHorseName = "螭龙"
				elseif nHorseFlag==1 then
					strHorseName = "应龙"
				elseif nHorseFlag==2 then
					strHorseName = "暴龙"
				elseif nHorseFlag==3 then
					strHorseName = "奎龙"
				end
			else
				if nHorseFlag==0 then
					strHorseName = "螭龙"
				elseif nHorseFlag==1 then
					strHorseName = "应龙"
				elseif nHorseFlag==2 then
					strHorseName = "暴龙"
				elseif nHorseFlag==3 then
					strHorseName = "奎龙"
				end
			end



			local strMapName = "金銮殿"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)
			
			
			
		end
	end
	
	
	local nNpcObjId = GetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID)

	if nNpcObjId==varPlayer then
		SetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID,-1)
		x700009_ProcFubenFailed(varMap, 1)
		return
	end

	local bBoss  = 0;


	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	

	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>=0 then
			if nBossID== varPlayer then
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI, -1)
				local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) - 10;
				SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )

				local humancount = GetFuben_PlayerCount(varMap);

				
				for varI = 0, humancount - 1 do
					local humanId = GetFuben_PlayerObjId(varMap, varI);

					StartTalkTask(varMap);
						TalkAppendString(varMap,"敌对势力减少10, 总势力下降至"..nForce);
					StopTalkTask();
					DeliverTalkTips(varMap, humanId);
				end

				
				if nForce==0 then
					x700009_ProcAllForceDie(varMap)
				end
				

				bBoss = varI+1;
				break;
			end
		end
	end

	if bBoss==x700009_var_SuccessBossInex then






























		
		

		x700009_ProcFubenSuccess(varMap)
		return
	end


	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varI)
		if nMonsterId== varPlayer then
			for j=varI, nMonsterCount-2 do
				local nNextId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+j+1)
				SetFubenData_Param(varMap, x700009_CSP_MONSTER_START+j, nNextId)
				
			end
			SetFubenData_Param(varMap, x700009_CSP_MONSTER_START+nMonsterCount-1,0)

			SetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT,nMonsterCount-1)

			local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) - 1;
			SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )

			local humancount = GetFuben_PlayerCount(varMap);

			
			for varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI);

				StartTalkTask(varMap);
					TalkAppendString(varMap,"敌对势力减少1, 总势力下降至"..nForce);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end

			
			if nForce==0 then
				x700009_ProcAllForceDie(varMap)
			end
			

			break
		end
	end
	


	
end



function x700009_ProcAllForceDie(varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	if varCurrentStep>8 then
		return 0;
	end

	local nTargetTick = x700009_var_Boss_Interval[varCurrentStep];


	SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK,nTargetTick-1)

	local humancount = GetFuben_PlayerCount(varMap);

	









end


function x700009_ProcAllMonsterDead( varMap)
	
end

function x700009_CreateSubmitNpc( varMap)

	if x700009_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700009_var_SubmitNPC.type, x700009_var_SubmitNPC.varX, x700009_var_SubmitNPC.z, 3, 0, -1, x700009_var_SubmitNPC.guid, -1, -1,x700009_var_SubmitNPC.facedir, "", x700009_var_SubmitNPC.title )
	else
		CreateMonster(varMap, x700009_var_SubmitNPC.type, x700009_var_SubmitNPC.varX, x700009_var_SubmitNPC.z, 3, 0, -1, x700009_var_SubmitNPC.guid, -1, -1,x700009_var_SubmitNPC.facedir )
	
	end

	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)

	
	 x700009_CreateXianJinBoss(varMap)
	 

	
end

function x700009_CreateLeaveNpc( varMap)
	if x700009_var_LeaveNPC.title ~="" then
		CreateMonster(varMap, x700009_var_LeaveNPC.type, x700009_var_LeaveNPC.varX, x700009_var_LeaveNPC.z, 3, 0, -1, x700009_var_LeaveNPC.guid, -1, -1,x700009_var_LeaveNPC.facedir,  "",x700009_var_LeaveNPC.title )
	else
		CreateMonster(varMap, x700009_var_LeaveNPC.type, x700009_var_LeaveNPC.varX, x700009_var_LeaveNPC.z, 3, 0, -1, x700009_var_LeaveNPC.guid, -1, -1,x700009_var_LeaveNPC.facedir )
	end

	
	 x700009_CreateXianJinBoss(varMap)
	 

end





function x700009_CreateXianJinBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700009_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS, varRet )
		end
	end

	x700009_ShowTipsToAll(varMap, "翻番宝箱出现！")
end
