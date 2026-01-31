











x700086_CSP_FUBENTYPE				= 	0
x700086_CSP_SCRIPTID				=	1
x700086_CSP_TICKCOUNT				= 	2
x700086_CSP_FROMSCENEID				= 	3
x700086_CSP_ISCLOSING				= 	4
x700086_CSP_LEAVECOUNTDOWN			= 	5
x700086_CSP_TEAMID					=	6
x700086_CSP_TICKTIME				=	7
x700086_CSP_HOLDTIME				=	8
x700086_CSP_FUBENLEVEL				=	9

x700086_CSP_KILLCOUNT				=	20
x700086_CSP_FINAL_BOSS_ID			=   21
x700086_CSP_FUBEN_SCENE_ID			=	22
x700086_CSP_AREA_TIMER				=	23
x700086_CSP_B_GROWPOINT_SHUAGUAI	=	24
x700086_CSP_B_GROWPOINT_BOSS		=	25
x700086_CSP_FINAL_BOSS2_ID			=	26
x700086_CSP_CAN_KILL_FINAL_BOSS		=	27
x700086_CSP_GROWPOINT_BOSS_ID		=	28
x700086_CSP_GP_BOXID1				=	29
x700086_CSP_GP_BOXID2				=	30

x700086_CSP_BROTHER_FULL_HP_START	=	40
x700086_CSP_BROTHER_TALK_START		=	45

x700086_CSP_GROWPOINT_MONSTER_COUNT	=	50
x700086_CSP_GROWPOINT_MONSTER_START	=	51
x700086_CSP_GROWPOINT_MONSTER_END   =   59

x700086_CSP_FINAL_BOSS_BROTHER_COUNT=   60
x700086_CSP_FINAL_BOSS_BROTHER_ID_START=	61
x700086_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START=	70

x700086_CSP_AREA_ID					=   98
x700086_CSP_AREA_FLAG				=	99
x700086_CSP_SHUAGUAI_AREA_START		=	100
x700086_CSP_OBJID_AREA				=	120
x700086_CSP_XIANJINBOSS			= 121
x700086_CSP_BOSS1_SUB_MONSTER_FLAG				=	140
x700086_CSP_BOSS1_ID							=	141
x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT		=	142
x700086_CSP_BOSS1_SUB_MONSTER_LOOP_COUNT		=	143
x700086_CSP_BOSS1_SUB_MONSTER_TICK_COUNT		=	144
x700086_CSP_BOSS1_SUB_MONSTER_ID_START			=	145	
x700086_CSP_BOSS1_SUB_MONSTER_ID_END            =	156
x700086_CSP_RANDOM_BOSS_ID						=   157	
x700086_RANDOM_BOSS_FLAG                        =   158	
x700086_CSP_ZHANCHE					 = 238
x700086_CSP_B_GROWPOINT_OVER		=	239  

x700086_CSP_HUMAN_COUNT				=	240
x700086_CSP_PLAYER_ENTER_START		=	241

x700086_CSP_LAST_TICKOUNT			=	247
x700086_CSP_GUID_START              =   248
x700086_CSP_FUBEN_TYPE				=	254	

x700086_CSP_FUBEN_MODE				=   255 





x700086_var_FileId 					= 700086
x700086_var_QuestId					= 6608


x700086_var_Buff_Id					=	14110                   

x700086_var_AreaTimer                 =   2000                    
x700086_var_RandomMonsterRateList		=	{	
											0.04,   
											0.12,  
											0.67,  
										}
x700086_var_Boss_Brother_Relive_Time	=	6*8/2                       

x700086_var_GrowpointId				=   500                     
x700086_var_nGrowpointType			=	538                     
x700086_var_nGrowpointType2			=	537                     

x700086_var_listBrotherSayText = {
								"个个击破对我们来说，是徒劳的！",
								"我不是一个人在战斗，我不是一个人！",
								"我们4个是密不可分的整体！",
								"除非你有三头六臂，能同时向我们4人发起攻击！",
								}

x700086_var_SubmitNPC                 =   { type =28509,guid= 150576,varX = 71, z=28, facedir =0, title="" }


x700086_var_Level_Limit = 70
x700086_var_Rate_Limit = 30


function x700086_ProcEventEntry(varMap,varPlayer,varTalknpc)

end





function x700086_ProcFubenSceneCreated( varMap )
	
	for varI=20,239 do
		SetFubenData_Param(varMap, varI, -1 )
	end
	
	x700086_CreateMonster( varMap )              
	x700086_CreateBoss1(varMap)	              
	x700086_CreateBoss(varMap, 0 )	              
	x700086_CreateBossBrother(varMap, -1)		  


	SetFubenData_Param(varMap, x700086_CSP_FUBEN_SCENE_ID,varMap)
		
end





function x700086_EnterTick(varMap, nowTickCount)

	x700086_ProcAreaTimer( varMap )

	local bCanKillFinalBoss = GetFubenData_Param(varMap,x700086_CSP_CAN_KILL_FINAL_BOSS)

	if bCanKillFinalBoss<=0 then
		local nBossBrotherCount = GetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS_BROTHER_COUNT )


		if nBossBrotherCount>0 then
			for varI=0, nBossBrotherCount-1 do
				local nMonsterId = GetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_ID_START+varI)
				if nMonsterId== -1 then
					local nTickCount = GetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varI)+1
					
					SetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varI, nTickCount)

					if nTickCount == x700086_var_Boss_Brother_Relive_Time then
						x700086_CreateBossBrother(varMap, varI)

						local humancount = GetFuben_PlayerCount(varMap);
						for	j = 0, humancount - 1 do
							local humanId = GetFuben_PlayerObjId(varMap, j);
							local varStr = format("金王蛮守复生！", varI);
							StartTalkTask(varMap);
							TalkAppendString(varMap, varStr);
							StopTalkTask(varMap);
							DeliverTalkTips(varMap, humanId);
						end
					end
				elseif nMonsterId>=0 then
					
					
					local nCurrentHp = GetHp( varMap, nMonsterId )
					local nFullHp = GetFubenData_Param(varMap, x700086_CSP_BROTHER_FULL_HP_START+varI )
					local bTalked = GetFubenData_Param(varMap, x700086_CSP_BROTHER_TALK_START+varI )

					if bTalked<=0 then
						if nCurrentHp/nFullHp <=0.5 then
							SetFubenData_Param(varMap, x700086_CSP_BROTHER_TALK_START+varI,1 )
							x700086_BrotherSay(varMap,nMonsterId)
						end
					end
					
					

				end


				end
			end
		end

		
		local bSubMonster = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_FLAG)
		if bSubMonster > 0 then
			local nBoss1ID = GetFubenData_Param(varMap,x700086_CSP_BOSS1_ID)
			if nBoss1ID >= 0 then
				local nSubMonsterCount = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT)
				local nSubMonsterLoopCount = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_LOOP_COUNT)
				local nSubMonsterTickCount = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_TICK_COUNT)
				local nTickPassed = nowTickCount - nSubMonsterTickCount
				local nMaxNumber = 	x700086_CSP_BOSS1_SUB_MONSTER_ID_END - x700086_CSP_BOSS1_SUB_MONSTER_ID_START + 1
				if nSubMonsterCount < nMaxNumber then
					if nSubMonsterTickCount == 0 or nTickPassed == 2 then				
						x700086_CreateBoss1SubMonster(varMap, nSubMonsterLoopCount)
						nSubMonsterLoopCount = nSubMonsterLoopCount + 1
						SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_LOOP_COUNT,nSubMonsterCount )
						SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TICK_COUNT,nowTickCount )
					end
				end
			end
		end

end




function x700086_CreateBoss(varMap, nFlag)


	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL )
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
		    local nObjId=0;
			if nFlag ==0 then
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, 7, aiscript, x700086_var_FileId, -1, -1, -1, facedir,  "",title)  
				else
					nObjId = CreateMonster(varMap, type, varX, z, 7, aiscript, x700086_var_FileId, -1, -1, -1, facedir)  
				end

				SetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS_ID, nObjId )
			else
				
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1, facedir,  "",title)  
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1, facedir)  
				end

				SetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS2_ID, nObjId )
			end
			
			
			break
			
        end
	end

	if nFlag ==1 then
		local humancount = GetFuben_PlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			local varStr = "完颜洪烈愤怒了！" ;
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap, humanId);
		end
	end

end



function x700086_CreateBossBrother(varMap, nTargetFlag)


	if nTargetFlag == nil then
		nTargetFlag = -1;
	end

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )

	local varCountBoss =0
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )

	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)

		if idScript == x700086_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
						
			if nTargetFlag == varFlag or nTargetFlag == -1 then
				local nObjId = 0
				
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21,-1,facedir, "", title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21,-1,facedir)
				
				end


				SetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS_BROTHER_ID_START+varFlag, nObjId )
				SetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varFlag, 0 )
				varCountBoss = varCountBoss +1

				local nFullHp = GetHp( varMap, nObjId )
				SetFubenData_Param(varMap, x700086_CSP_BROTHER_FULL_HP_START+varFlag, nFullHp )
				SetFubenData_Param(varMap, x700086_CSP_BROTHER_TALK_START+varFlag, 0 )

			end
			
        end
	end

	if nTargetFlag==-1 then

		SetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS_BROTHER_COUNT, varCountBoss )
	end	

end




function x700086_CreateMonster(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )

	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and (monsterFlag == 1 or monsterFlag == 2) and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
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




function x700086_CreateAreaMonster(varMap, areaId)
	
	local bCreated = GetFubenData_Param(varMap,x700086_CSP_SHUAGUAI_AREA_START+areaId)

	if bCreated>0 then
		return
	end

	SetFubenData_Param(varMap,x700086_CSP_SHUAGUAI_AREA_START+areaId, 1)

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )

	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )

	for varI = 0,nDataCount-1 do
			
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 10 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
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




function x700086_CreateBoss1(varMap)

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )

	local bCreated =0;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then

		        local nObjId = -1
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir, "", title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir)
				
				end

				if patrolid>=0 then
					SetPatrolId(varMap, nObjId, patrolid)
				end

			if nObjId >= 0 then
				SetFubenData_Param(varMap, x700086_CSP_BOSS1_ID, nObjId)
				SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_FLAG, 0)
				SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_LOOP_COUNT, 0)
				SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT, 0)
				SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TICK_COUNT, 0)
			end

		end
	end	
end




function x700086_CreateBoss1SubMonster(varMap,varIndex)



	local nCreateTotal = GetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT)
	local varMaxCount    = x700086_CSP_BOSS1_SUB_MONSTER_ID_END - x700086_CSP_BOSS1_SUB_MONSTER_ID_START +1
	if nCreateTotal >= varMaxCount  then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )
	
	 
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)

		if idScript == x700086_var_FileId and monsterFlag == 3 and varFlag == varIndex and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
			for j=0,varCount -1 do

				local nTmpTotal = GetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT)

				if nTmpTotal >= varMaxCount then
					return
				end

				local nObjId = -1
				
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir, "", title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir)
			
				end
				
				if nObjId >= 0 and patrolid >= 0 then
					SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_ID_START + nTmpTotal, nObjId)
					nTmpTotal = nTmpTotal + 1
					SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT,nTmpTotal)
					SetPatrolId(varMap, nObjId, patrolid)
				end
			end
		end
	end
end




function x700086_BrotherSay(varMap,nMonsterId)
	if nMonsterId<0 then
		return
	end

	local nTextCount = 4;
	

	local varIndex = random(1,nTextCount)

	NpcTalk(varMap, nMonsterId, x700086_var_listBrotherSayText[varIndex],  -1)


end




function x700086_CreateGrowPointMonster(varMap)
	local bCreated = GetFubenData_Param(varMap,x700086_CSP_B_GROWPOINT_SHUAGUAI)

	if bCreated>0 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )

	local varCountBoss = 0;

	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )

	local nMaxcount = x700086_CSP_GROWPOINT_MONSTER_END - x700086_CSP_GROWPOINT_MONSTER_START + 1

	for varI = 0,nDataCount-1 do
		
		if varCountBoss >= nMaxcount then
			break
		end

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 8 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
            
			for j=0,varCount -1 do

				if varCountBoss >= nMaxcount then
					break
				end

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				local nObjId = 0
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21,-1, facedir)
				end

				SetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_START+varCountBoss, nObjId)
				varCountBoss = varCountBoss +1;

			end
			
        end
	end

	SetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_COUNT, varCountBoss)
	SetFubenData_Param(varMap,x700086_CSP_B_GROWPOINT_SHUAGUAI, 1)

end




function x700086_CreateGrowPointBoss(varMap)
	local bCreated = GetFubenData_Param(varMap,x700086_CSP_B_GROWPOINT_BOSS)

	if bCreated>0 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )

	local varCountBoss = 0;

	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )

	for varI = 0,nDataCount-1 do
			
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 9 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
            
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				local nObjId = 0
				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21,-1, facedir)
				
				end
				SetFubenData_Param(varMap,x700086_CSP_GROWPOINT_BOSS_ID, nObjId)
				varCountBoss = varCountBoss +1;
				break
			end
			
        end
	end

	SetFubenData_Param(varMap,x700086_CSP_B_GROWPOINT_BOSS, 1)

end




function x700086_CreateRandomMonster(varMap)

	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )
	if fuben_type ~= 0 then
		return
	end

	local rate = random(0,100)/100;
	local nStdRate = x700086_var_RandomMonsterRateList[1]
	local nFubenMode = GetFubenData_Param(varMap, x700086_CSP_FUBEN_MODE)
	if nFubenMode ==1 then
		nStdRate = x700086_var_RandomMonsterRateList[2]
	elseif nFubenMode ==2	then
		nStdRate = x700086_var_RandomMonsterRateList[3]
	end
	

	if rate >= nStdRate then
		return
	end
	
	local nFlag = random(0,3)

	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL )
	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )
			
	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 and nFlag == varFlag then
		
			local rx = random(-r,r)
			local varX = x1 + rx
			local rz = random(-r,r)
			local z = z1 + rz
			local nObjId = -1
			
			if title~="" then
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir, "", title)
			else
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir)
			
			end

			if nObjId >=0 then

				SetFubenData_Param(varMap,x700086_CSP_RANDOM_BOSS_ID,nObjId)
				SetFubenData_Param(varMap, x700086_RANDOM_BOSS_FLAG, nFlag)

				if patrolid>=0 then
					SetPatrolId(varMap, nObjId, patrolid)	
				end
				x700086_ShowTipsToAll(varMap, "战神再现！")
				return
			end

        end
	end

end

function x700086_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end



function x700086_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700086_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end

	local zhanChe = GetFubenData_Param(varMap, x700086_CSP_ZHANCHE)
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
		local strMapName = "夏王墓穴"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local nDieCount = GetFubenData_Param(varMap, x700086_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700086_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;

	local nGrowPointMonsterCount = GetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_COUNT)

	local bGrowPoint = GetFubenData_Param(varMap,x700086_CSP_B_GROWPOINT_SHUAGUAI)

	if bGrowPoint>0 then
		if nGrowPointMonsterCount>0 then
			for varI=0, nGrowPointMonsterCount-1 do
				local nMonsterId = GetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_START+varI)
				
				if nMonsterId== varPlayer then
					SetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_START+varI, -1)
				end
			end
			
			local bAllDie=1;
			for varI=0, nGrowPointMonsterCount-1 do
				local nMonsterId = GetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_START+varI)
				if nMonsterId >= 0 then
					bAllDie = 0;
				end
			end

			if bAllDie==1 then
				SetFubenData_Param(varMap,x700086_CSP_GROWPOINT_MONSTER_COUNT, -1)
				x700086_CreateGrowPointBoss(varMap)
			end

		end
	end

	local nBossBrotherCount = GetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS_BROTHER_COUNT )
	

	if nBossBrotherCount>0 then
		for varI=0, nBossBrotherCount-1 do
			local nMonsterId = GetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_ID_START+varI)
			
			if nMonsterId== varPlayer then
				SetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_ID_START+varI, -1)
				
				
				SetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_TICKCOUNT_START+varI, 0)
			end
		end

		local bAllDie=1;
		for varI=0, nBossBrotherCount-1 do
			local nMonsterId = GetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_ID_START+varI)
			if nMonsterId~= -1 then
				bAllDie = 0;
			end
		end

		if bAllDie==1 then
			SetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_BROTHER_COUNT, -1)
			x700086_ProcAllFinalBossBrotherDie(varMap)
		end
	end

	local nFineBoss2Id = GetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS2_ID )

	if nFineBoss2Id>=0 then
		if nFineBoss2Id == varPlayer then
			SetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS2_ID, -2 )
			local humancount = GetFuben_PlayerCount(varMap);
			for ii = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, ii);
				LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,55 )
			end	
		
				
			x700086_ProcZhanShenDead( varMap)

		end
	end


	local nGrowPointId = GetFubenData_Param(varMap,x700086_CSP_GROWPOINT_BOSS_ID)

	if nGrowPointId>0 then
		if nGrowPointId== varPlayer then
		end
	end

	local nBoss1ID = GetFubenData_Param(varMap,x700086_CSP_BOSS1_ID)
	if nBoss1ID>0 then
		if nBoss1ID == varPlayer then
			SetFubenData_Param(varMap,x700086_CSP_BOSS1_ID, -1)
			SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_FLAG, 0)
			local nSubMonsterCount = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT)

			for varI = 0, nSubMonsterCount -1 do
				local nSubMonsterID = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_ID_START + varI)
				if nSubMonsterID > 0 then

					DeleteMonster( varMap,nSubMonsterID )		
				end
			end
		end
	end

	local nSubMonsterCount = GetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_TOTAL_COUNT )

	if nSubMonsterCount>0 then
		for varI = 0, nSubMonsterCount - 1 do
			local nSubMonsterID = GetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_ID_START + varI)
			
			if nSubMonsterID == varPlayer then
				SetFubenData_Param(varMap,x700086_CSP_BOSS1_SUB_MONSTER_ID_START + varI, -1)
			end
		end
	end

	x700086_ProcRandomBossDie(varMap, varPlayer, varKiller)
end




function x700086_ProcAllFinalBossBrotherDie(varMap)
	local nBossId = GetFubenData_Param(varMap,x700086_CSP_FINAL_BOSS_ID)
	
	SetFubenData_Param(varMap,x700086_CSP_CAN_KILL_FINAL_BOSS, 1)
	DeleteMonster( varMap,nBossId )
	x700086_CreateBoss(varMap, 1)

end




function x700086_ProcZhanShenDead( varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "战胜完颜洪烈， 副本完成，请退出副本。";
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end

	x700086_CreateRandomMonster(varMap)

	x700086_CreateXianJinBoss(varMap)
	x700086_CreateZhanCheBoss(varMap)
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	
	
end




function x700086_CreateSubmitNpc( varMap)

	if x700086_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700086_var_SubmitNPC.type, x700086_var_SubmitNPC.varX, x700086_var_SubmitNPC.z, 3, 0, -1, x700086_var_SubmitNPC.guid, -1, -1, x700086_var_SubmitNPC.facedir,  "",x700086_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700086_var_SubmitNPC.type, x700086_var_SubmitNPC.varX, x700086_var_SubmitNPC.z, 3, 0, -1, x700086_var_SubmitNPC.guid, -1, -1, x700086_var_SubmitNPC.facedir)
		
	end

	x700086_CreateXianJinBoss(varMap)
		
	LuaCallNoclosure( 701104, "ProcSceneBossDie", varMap, 2)
	LuaCallNoclosure( 701105, "ProcSceneBossDie", varMap, 2)
	
end





function x700086_CreateXianJinBoss(varMap)

	local nFubenMode = GetFubenData_Param(varMap, x700086_CSP_FUBEN_MODE)

	if nFubenMode ~=1 and nFubenMode ~= 2 then
	  return
	end

	local fuben_type = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE )
	if fuben_type ~= 0 then
		return
	end

    local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL ) 

	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700086_var_FileId )
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir, "", title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700086_var_FileId, -1, 21, -1,facedir)
				
				end
				SetFubenData_Param(varMap, x700086_CSP_XIANJINBOSS, varRet )
			end
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
	x700086_ShowTipsToAll(varMap, "翻番宝箱出现！")
end





function x700086_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700086_CSP_AREA_ID, varArea)
	if varArea == 18 then  
		local BossId = GetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS2_ID)
		if BossId ~= -2 then
			return 
		end
		SetFubenData_Param(varMap, x700086_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 0, x700086_var_QuestId, x700086_var_FileId,1)
		
	elseif varArea == 19 then 
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 1, x700086_var_QuestId, x700086_var_FileId)
	end
	local varScriptFileId = GetFubenData_Param(varMap, x700086_CSP_SCRIPTID);

	if varScriptFileId~=x700086_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcAreaEntered", varMap, varPlayer, varArea, varQuest)
		return
	end

	local humancount = GetFuben_PlayerCount(varMap);

	local varIndex = x700086_CSP_OBJID_AREA
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
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x700086_var_Buff_Id,0 )
	elseif varArea >=1 and varArea<=9 then
		x700086_ProcEnterShuaguaiArea(varMap, varPlayer, varArea)
	elseif varArea == 17 then
		SetFubenData_Param(varMap, x700086_CSP_BOSS1_SUB_MONSTER_FLAG, 1)
	end

end




function x700086_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	local varIndex = x700086_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )
	    if varObj == varPlayer then
	        SetFubenData_Param(varMap, idx, -1 )
	        SetFubenData_Param(varMap, idx+1, -1 )
	    end
	end
	SetFubenData_Param(varMap, x700086_CSP_AREA_ID, -1)
end




function x700086_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700086_CSP_AREA_ID)
	if varArea == 18 then  
		local BossId = GetFubenData_Param(varMap, x700086_CSP_FINAL_BOSS2_ID)
		if BossId ~= -2 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700086_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700086_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 0, x700086_var_QuestId, x700086_var_FileId,1)
		
	elseif varArea == 19 then 
	 	
	end
end




function x700086_ProcEnterShuaguaiArea(varMap, varPlayer, areaId)
	
	
	if areaId<1 or areaId>9 then
		return
	end
	
	local bCreated = GetFubenData_Param(varMap,x700086_CSP_SHUAGUAI_AREA_START+areaId)

	if bCreated>0 then
		return
	end

	x700086_CreateAreaMonster(varMap, areaId)
end




function x700086_ProcAreaTimer( varMap )
	
    local varIndex = x700086_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )

	    if varObj ~= -1 then
			
			if varArea>=10 and varArea<=16 then  
				
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







function x700086_ProcGpCreate(varMap,growPointType,varX,varY)

	return 0

end





function x700086_ProcGpProcOver(varMap,varPlayer,varTalknpc)

	return 0

end





function x700086_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	return 0

end




function x700086_ProcGpRecycle(varMap,varPlayer,varTalknpc)

	return 1

end




function x700086_ProcGrowPoint(varMap, varPlayer)

	local nFuben_SceneId = GetFubenData_Param(varMap, x700086_CSP_FUBEN_SCENE_ID);
	if nFuben_SceneId ~= varMap then
		return
	end

	x700086_CreateGrowPointMonster(varMap)

	SetFubenData_Param(varMap, x700086_CSP_B_GROWPOINT_OVER,1)

end




function x700086_ProcRandomBossDie(varMap, varPlayer, varKiller)

	local nRandomBossID = GetFubenData_Param(varMap,x700086_CSP_RANDOM_BOSS_ID)

	if nRandomBossID >= 0 then
		if nRandomBossID == varPlayer then

			

			
			local nKillerType = GetObjType(varMap, varKiller)
			local nOwnerId = varKiller
			if nKillerType == 3 then
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

			
			local nHorseFlag = GetFubenData_Param(varMap, x700086_RANDOM_BOSS_FLAG)
			local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL )
			
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
					strHorseName = "梼杌"
				elseif nHorseFlag==3 then
					strHorseName = "饕餮"
				end
			else
				if nHorseFlag==0 then
					strHorseName = "狻猊"
				elseif nHorseFlag==1 then
					strHorseName = "毕方"
				elseif nHorseFlag==2 then
					strHorseName = "梼杌"
				elseif nHorseFlag==3 then
					strHorseName = "饕餮"
				end
			end

			
			local strMapName = "夏王墓"
			
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)		
			
		end
	end
end

function x700086_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700086_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700086_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700086_CSP_FUBENLEVEL)

	if fubenlevel < x700086_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700086_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700086_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID(x700086_var_FileId )

	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700086_var_FileId,nIndexFrom,varI)
		if idScript == x700086_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700086_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700086_ShowTipsToAll(varMap, "战车风翼之王出现！")
	end
end
