











x700021_CSP_FUBENTYPE				= 	0
x700021_CSP_SCRIPTID				=	1
x700021_CSP_TICKCOUNT				= 	2
x700021_CSP_FROMSCENEID				= 	3
x700021_CSP_ISCLOSING				= 	4
x700021_CSP_LEAVECOUNTDOWN			= 	5
x700021_CSP_TEAMID					=	6
x700021_CSP_BACKSCENEX       		=   7
x700021_CSP_BACKSCENEZ      		=   8
x700021_CSP_FUBENLEVEL			=	9

x700021_CSP_KILLCOUNT				=	20
x700021_CSP_FINAL_BOSS_ID			=   21
x700021_CSP_FUBEN_SCENE_ID			=	22
x700021_CSP_AREA_TIMER				=	23
x700021_CSP_B_GROWPOINT_SHUAGUAI	=	24
x700021_CSP_B_GROWPOINT_BOSS		=	25
x700021_CSP_FINAL_BOSS2_ID			=	26
x700021_CSP_CAN_KILL_FINAL_BOSS		=	27
x700021_CSP_GROWPOINT_BOSS_ID		=	28
x700021_CSP_GP_BOXID1				=	29
x700021_CSP_GP_BOXID2				=	30

x700021_CSP_BROTHER_FULL_HP_START	=	40
x700021_CSP_BROTHER_TALK_START		=	45

x700021_CSP_GROWPOINT_MONSTER_COUNT	=	50
x700021_CSP_GROWPOINT_MONSTER_START	=	51

x700021_CSP_FINAL_BOSS_BROTHER_COUNT=   60
x700021_CSP_FINAL_BOSS_BROTHER_ID_START=	61
x700021_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START=	70

x700021_CSP_SHUAGUAI_AREA_START		=	100
x700021_CSP_OBJID_AREA				=	120


x700021_CSP_B_GUOYUN_START			=	221
x700021_CSP_B_GATHERED2_START		=	227
x700021_CSP_B_GATHERED_START		=	233

x700021_CSP_B_GROWPOINT_OVER		=	239
x700021_CSP_HUMAN_COUNT				=	240
x700021_CSP_OBJID_START				=	241
x700021_CSP_GUID_START              =   248

x700021_CSP_FUBEN_MODE				=   255 





x700021_var_FileId 					= 700021



x700021_var_Buff_Id					=	14110                   

x700021_var_AreaTimer                 =   2000                    
x700021_var_RandomMonsterRate			=	0                       
x700021_var_Boss_Brother_Relive_Time	=	6*5/2                       

x700021_var_nGrowpointType			=	538                     
x700021_var_nGrowpointType2			=	537                     


x700021_var_SubmitNPC                 =   { type =25027,guid= 150527,varX = 71, z=28, facedir =0, title="" }










function x700021_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

	
end


function x700021_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700021_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700021_ProcFubenSceneCreated( varMap )
	
	
	local varIndex = x700021_CSP_OBJID_AREA
	for varI=varIndex,varIndex+11 do

		SetFubenData_Param(varMap, varI, -1 )
	end

	
	x700021_CreateBoss( varMap, 0 )
	x700021_CreateBossBrother(varMap, -1)
	x700021_CreateMonster( varMap )
	x700021_CreateRandomMonster(varMap)

	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700021_CSP_HUMAN_COUNT, humancount);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		

		local bGuoyun = CountryIsFortuneTime(varMap,humanId,4)
		SetFubenData_Param(varMap, x700021_CSP_B_GUOYUN_START+varI, 0);
	end

	SetFubenData_Param(varMap, x700021_CSP_FUBEN_SCENE_ID,varMap)


		
end



function x700021_EnterTick(varMap, nowTickCount)

	x700021_ProcAreaTimer( varMap )

	local bCanKillFinalBoss = GetFubenData_Param(varMap,x700021_CSP_CAN_KILL_FINAL_BOSS)

	if bCanKillFinalBoss<=0 then
		local nBossBrotherCount = GetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS_BROTHER_COUNT )


		if nBossBrotherCount>0 then
			for varI=0, nBossBrotherCount-1 do
				local nMonsterId = GetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_ID_START+varI)
				if nMonsterId== -1 then
					local nTickCount = GetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varI)+1
					
					SetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varI, nTickCount)

					if nTickCount == x700021_var_Boss_Brother_Relive_Time then
						x700021_CreateBossBrother(varMap, varI)

						local humancount = GetFuben_PlayerCount(varMap);
						for	j = 0, humancount - 1 do
							local humanId = GetFuben_PlayerObjId(varMap, j);
							local varStr = format("盗墓寻宝师复生！", varI);
							StartTalkTask(varMap);
							TalkAppendString(varMap, varStr);
							StopTalkTask(varMap);
							DeliverTalkTips(varMap, humanId);
						end
					end
				elseif nMonsterId>=0 then
					
					
					local nCurrentHp = GetHp( varMap, nMonsterId )
					local nFullHp = GetFubenData_Param(varMap, x700021_CSP_BROTHER_FULL_HP_START+varI )
					local bTalked = GetFubenData_Param(varMap, x700021_CSP_BROTHER_TALK_START+varI )

					if bTalked<=0 then
						if nCurrentHp/nFullHp <=0.5 then
							SetFubenData_Param(varMap, x700021_CSP_BROTHER_TALK_START+varI,1 )
							x700021_BrotherSay(varMap,nMonsterId)
						end
					end
					
					

				end


				end
			end
		end
end

function x700021_BrotherSay(varMap,nMonsterId)
	if nMonsterId<0 then
		return
	end

	local nTextCount = 4;
	
	local listNpcTalkText = {
		"个个击破对我们来说，是徒劳的！",
		"我不是一个人在战斗，我不是一个人！",
		"我们4个是密不可分的整体！",
		"除非你有三头六臂，能同时向我们4人发起攻击！",
	}

	local varIndex = random(1,nTextCount)

	NpcTalk(varMap, nMonsterId, listNpcTalkText[varIndex],  -1)


end

function x700021_CreateBoss(varMap, nFlag)


	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local varRet=0;
			if nFlag ==0 then
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, 7, aiscript, x700021_var_FileId, -1, -1, -1, facedir,  "",title)  
				else
					varRet = CreateMonster(varMap, type, varX, z, 7, aiscript, x700021_var_FileId, -1, -1, -1, facedir)  
				end

				SetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS_ID, varRet )
			else
				
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21, -1, facedir,  "",title)  
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21, -1, facedir)  
				end

				SetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS2_ID, varRet )
			end
			
			
			break
			
        end
	end

	if nFlag ==1 then
		local humancount = GetFuben_PlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			local varStr = "古察愤怒了！" ;
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap, humanId);
		end
	end

end

function x700021_CreateRandomMonster(varMap)



	local rate = random(0,100)/100;
	if rate>= x700021_var_RandomMonsterRate then
		return 0;
	end



	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;


	
	local bCreated =0;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local varRet = 0
				
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21, -1,facedir, "", title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21, -1,facedir)
				
				end

				if patrolid>=0 then
					SetPatrolId(varMap, varRet, patrolid)
					
				end
            end
        end
	end

	

end

function x700021_CreateBossBrother(varMap, nTargetFlag)


	if nTargetFlag == nil then
		nTargetFlag = -1;
	end

	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;


	local nCount =0
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )

	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			
			
			if nTargetFlag == varFlag or nTargetFlag == -1 then
				local varRet = 0
				
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21,-1,facedir, "", title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21,-1,facedir)
				
				end


				SetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS_BROTHER_ID_START+varFlag, varRet )
				SetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varFlag, 0 )
				nCount = nCount +1

				
				
				local nFullHp = GetHp( varMap, varRet )
				SetFubenData_Param(varMap, x700021_CSP_BROTHER_FULL_HP_START+varFlag, nFullHp )
				SetFubenData_Param(varMap, x700021_CSP_BROTHER_TALK_START+varFlag, 0 )
				

			end
			
        end
	end

	if nTargetFlag==-1 then

		SetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS_BROTHER_COUNT, nCount )
	end

	

end






function x700021_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21, -1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21, -1,facedir)
				
				end
			end
        end
	end

end

function x700021_CreateAreaMonster(varMap, areaId)
	
	local bCreated = GetFubenData_Param(varMap,x700021_CSP_SHUAGUAI_AREA_START+areaId)


	if bCreated>0 then
		return
	end

	SetFubenData_Param(varMap,x700021_CSP_SHUAGUAI_AREA_START+areaId, 1)

	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )

	for varI = 0,nDataCount-1 do
			
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            if areaId == varFlag1 then
				for j=0,varCount -1 do

					local rx = random(-r,r)
					local varX = varX + rx
					local rz = random(-r,r)
					local z = z + rz

					if title~="" then
						CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1, facedir,  "",title)
					else
						CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1, facedir)
					
					end
				end
			end
        end
	end













end


function x700021_CreateGrowPointMonster(varMap)
	local bCreated = GetFubenData_Param(varMap,x700021_CSP_B_GROWPOINT_SHUAGUAI)

	if bCreated>0 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;

	local nCount = 0;

	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )

	for varI = 0,nDataCount-1 do
			
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21,-1, facedir)
				end

				SetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_START+nCount, varRet)
				nCount = nCount +1;

			end
			
        end
	end

	SetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_COUNT, nCount)

	SetFubenData_Param(varMap,x700021_CSP_B_GROWPOINT_SHUAGUAI, 1)










end

function x700021_CreateGrowPointBoss(varMap)
	local bCreated = GetFubenData_Param(varMap,x700021_CSP_B_GROWPOINT_BOSS)

	if bCreated>0 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;

	local nCount = 0;

	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )

	for varI = 0,nDataCount-1 do
			
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700021_var_FileId, -1, 21,-1, facedir)
				
				end
				SetFubenData_Param(varMap,x700021_CSP_GROWPOINT_BOSS_ID, varRet)
				nCount = nCount +1;
				break
			end
			
        end
	end



	SetFubenData_Param(varMap,x700021_CSP_B_GROWPOINT_BOSS, 1)










end

function x700021_ProcEnterShuaguaiArea(varMap, varPlayer, areaId)
	
	
	if areaId<1 or areaId>9 then
		return
	end

	
	local bCreated = GetFubenData_Param(varMap,x700021_CSP_SHUAGUAI_AREA_START+areaId)

	if bCreated>0 then
		return
	end

	x700021_CreateAreaMonster(varMap, areaId)
end


function x700021_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700021_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700021_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	

	local nGrowPointMonsterCount = GetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_COUNT)

	local bGrowPoint = GetFubenData_Param(varMap,x700021_CSP_B_GROWPOINT_SHUAGUAI)

	if bGrowPoint>0 then
		if nGrowPointMonsterCount>0 then
			for varI=0, nGrowPointMonsterCount-1 do
				local nMonsterId = GetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_START+varI)
				
				if nMonsterId== varPlayer then
					SetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_START+varI, -1)
				end
			end
			
			local bAllDie=1;
			for varI=0, nGrowPointMonsterCount-1 do
				local nMonsterId = GetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_START+varI)
				if nMonsterId~= -1 then
					bAllDie = 0;
				end
			end

			if bAllDie==1 then
				SetFubenData_Param(varMap,x700021_CSP_GROWPOINT_MONSTER_COUNT, -1)
				x700021_CreateGrowPointBoss(varMap)
			end

		end
	end




	local nBossBrotherCount = GetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS_BROTHER_COUNT )
	

	if nBossBrotherCount>0 then
		for varI=0, nBossBrotherCount-1 do
			local nMonsterId = GetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_ID_START+varI)
			
			if nMonsterId== varPlayer then
				SetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_ID_START+varI, -1)
				
				
				SetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varI, 0)
			end
		end

		local bAllDie=1;
		for varI=0, nBossBrotherCount-1 do
			local nMonsterId = GetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_ID_START+varI)
			if nMonsterId~= -1 then
				bAllDie = 0;
			end
		end

		if bAllDie==1 then
			SetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_BROTHER_COUNT, -1)
			x700021_ProcAllFinalBossBrotherDie(varMap)
		end
	end

	local nFineBoss2Id = GetFubenData_Param(varMap, x700021_CSP_FINAL_BOSS2_ID )

	if nFineBoss2Id>0 then
		if nFineBoss2Id == varPlayer then
			x700021_ProcZhanShenDead( varMap)








































		end
	end


	local nGrowPointId = GetFubenData_Param(varMap,x700021_CSP_GROWPOINT_BOSS_ID)

	if nGrowPointId>0 then
		if nGrowPointId== varPlayer then










			
			







				












			
			

			
			
			
			
		end
	end

	
	 
end

function x700021_ProcAllFinalBossBrotherDie(varMap)
	local nBossId = GetFubenData_Param(varMap,x700021_CSP_FINAL_BOSS_ID)
	
	SetFubenData_Param(varMap,x700021_CSP_CAN_KILL_FINAL_BOSS, 1)
	DeleteMonster( varMap,nBossId )
	x700021_CreateBoss(varMap, 1)

end

function x700021_ProcZhanShenDead( varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "战胜古察， 副本完成";
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
	x700021_CreateSubmitNpc( varMap)
end

function x700021_CreateSubmitNpc( varMap)

	if x700021_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700021_var_SubmitNPC.type, x700021_var_SubmitNPC.varX, x700021_var_SubmitNPC.z, 3, 0, -1, x700021_var_SubmitNPC.guid, -1, -1, x700021_var_SubmitNPC.facedir,  "",x700021_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700021_var_SubmitNPC.type, x700021_var_SubmitNPC.varX, x700021_var_SubmitNPC.z, 3, 0, -1, x700021_var_SubmitNPC.guid, -1, -1, x700021_var_SubmitNPC.facedir)
		
	end

	
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700021_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700021_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
end





function x700021_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700021_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700021_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700021_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700021_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700021_var_FileId,nIndexFrom,varI)
		if idScript == x700021_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700021_ShowTipsToAll(varMap, "翻番宝箱出现！")
end











function x700021_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	
	local varScriptFileId = GetFubenData_Param(varMap, x700021_CSP_SCRIPTID);

	if varScriptFileId~=x700021_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcAreaEntered", varMap, varPlayer, varArea, varQuest)
		return
	end
	
	
	

	local humancount = GetFuben_PlayerCount(varMap);









	 
    local nFind = 1
    local guid = GetPlayerGUID( varMap,varPlayer )



    
    if nFind == 0 then
		return
    end

	local varIndex = x700021_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    if varObj == varPlayer then

	    	SetFubenData_Param(varMap, idx, varPlayer )
			SetFubenData_Param(varMap, idx+1, varArea )

	    	break
	    elseif varObj == -1 then

	        SetFubenData_Param(varMap, idx, varPlayer )
	        SetFubenData_Param(varMap, idx+1, varArea )
	        break
		end
	end

	

	if varArea ==0 then
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x700021_var_Buff_Id,0 )




	elseif varArea >=1 and varArea<=9 then
		x700021_ProcEnterShuaguaiArea(varMap, varPlayer, varArea)
	end

end




function x700021_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )

	
	local varScriptFileId = GetFubenData_Param(varMap, x700021_CSP_SCRIPTID);

	if varScriptFileId~=x700021_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcAreaLeaved", varMap, varPlayer, varArea, varQuest)
		return
	end
	

    local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);





	end

	local varIndex = x700021_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )
	    if varObj == varPlayer then
	        SetFubenData_Param(varMap, idx, -1 )
	        SetFubenData_Param(varMap, idx+1, -1 )
	    end
	end
end




function x700021_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	
end



function x700021_ProcAreaTimer( varMap )







	
    local varIndex = x700021_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )

		
	    if varObj ~= -1 then
			
			if varArea>=10 and varArea<=17 then  
				
				local ErrorCode = LuaCallNoclosure( FUBEN_COMMON_SCRIPT_CALL, "IsPlayerErrorState", varMap, varObj)
				
				if ErrorCode == 0 then

					local hurt = 500
				   
					

					local havehp = GetHp( varMap, varObj )

					
					local hp = havehp - hurt
					if hp < 0 then
						hp = havehp -1
						hp = -hp
					else
						hp = -hurt
					end
					
					SetHp(varMap,varObj, hp )
				end
			end
        end
	end
end




function x700021_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
end





function x700021_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end








function x700021_OpenCheck( varMap, varPlayer, varTalknpc )
end

function x700021_CloseTimer( varMap, TimerIndex )




end

function x700021_ProcGrowPoint(varMap, varPlayer)
	local nFuben_SceneId = GetFubenData_Param(varMap, x700021_CSP_FUBEN_SCENE_ID);
	if nFuben_SceneId ~= varMap then
		return
	end

	x700021_CreateGrowPointMonster(varMap)

	SetFubenData_Param(varMap, x700021_CSP_B_GROWPOINT_OVER,1);
end









function x700021_ProcGpCreate(varMap,growPointType,varX,varY)
	







	

end



function x700021_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	
	
end

function x700021_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	
	
	
end



function x700021_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	











	
	
	
	

	
end


function x700021_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end

































































































































































