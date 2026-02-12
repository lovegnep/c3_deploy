











x700032_CSP_FUBENTYPE				= 	0
x700032_CSP_SCRIPTID				=	1
x700032_CSP_TICKCOUNT				= 	2
x700032_CSP_FROMSCENEID				= 	3
x700032_CSP_ISCLOSING				= 	4
x700032_CSP_LEAVECOUNTDOWN			= 	5
x700032_CSP_TEAMID					=	6
x700032_CSP_BACKSCENEX       		=   7
x700032_CSP_BACKSCENEZ      		=   8
x700032_CSP_FUBENLEVEL				=	9

x700032_CSP_KILLCOUNT				=	20
x700032_CSP_FUBEN_SCENE_ID			=	21

x700032_CSP_BIG_BOSS_ID				=	22
x700032_CSP_BOSS1_ID				=	23
x700032_CSP_BOSS2_ID				=	24
x700032_CSP_BOSS3_ID				=	25

x700032_CSP_GAME_STEP				=	26
x700032_B_CREATE_RANDOMBOSS			=	27
x700032_RANDOMBOSS_FLAG				=	28
x700032_CSP_RANDOM_BOSS_ID			=	29
x700032_CSP_BIG_BOSS_FULLHP			=	30
x700032_CSP_B_SUB_MONSTER			=	31
x700032_CSP_MONSTER_RUN_COUNT		=	32


x700032_CSP_TALK_NPC1_ID			=	33
x700032_CSP_TALK_NPC1_STEP			=	34
x700032_CSP_TALK_NPC2_ID			=	35
x700032_CSP_TALK_NPC2_STEP			=	36

x700032_CSP_OBJID_AREA				=	37

x700032_CSP_MONSTER_ID_COUNT		=	49
x700032_CSP_MONSTER_ID_START		=	50
x700032_CSP_MONSTER_FULLHP_START	=	110
x700032_CSP_MONSTER_B_RUN_START		=	170






x700032_CSP_ZHANCHE					 = 238
x700032_CSP_XIANJINBOSS				=	239
x700032_CSP_HUMAN_COUNT				=	240
x700032_CSP_OBJID_START				=	241

x700032_CSP_GUID_START              =   248  
x700032_CSP_FUBEN_TYPE				=	254	
x700032_CSP_FUBEN_MODE				=   255 



x700032_var_FileId 					= 700032

x700032_var_RandomMonsterRate		=	{0.728,0.736,0.744,0.752}

x700032_var_Level_Limit = 70
x700032_var_Rate_Limit = 30

x700032_var_SubmitNPC                 =   { type =25081,guid= 150555,varX = 129, z=23, facedir =0, title ="" }

x700032_var_TalkNPCList					= {
											{ type =25091,varX = 146, z=204,	facedir =178, varFlag =0, title ="黑旋风" },
											{ type =25090,varX = 0,	z=0,	facedir =178, varFlag =1, title ="矮脚虎" },
										  }











function x700032_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)
	
end

function x700032_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700032_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700032_ProcFubenSceneCreated( varMap )
	
	
	
	for varI=20,239 do

		SetFubenData_Param(varMap, varI, -1 )
	end

	SetFubenData_Param(varMap, x700032_CSP_GAME_STEP, 0 )
	

	x700032_CreateMonsterNormal(varMap)

	x700032_CreateTalkNpc( varMap, 0 )
	x700032_CreateBoss( varMap )

    x700032_CreateMonster( varMap )
		
end

function x700032_EnterTick(varMap,nowTickCount)

	

	local nBossId = GetFubenData_Param(varMap, x700032_CSP_BIG_BOSS_ID )

	if nBossId>=0 then

		local bCreated = GetFubenData_Param(varMap, x700032_CSP_B_SUB_MONSTER )
		if bCreated<=0 then
			local nBossFullHp = GetFubenData_Param(varMap, x700032_CSP_BIG_BOSS_FULLHP )
			local nHp = GetHp(varMap, nBossId)

			
			if (nHp/nBossFullHp)<=0.5 then
				
				local nMonsterRunCount = GetFubenData_Param(varMap, x700032_CSP_MONSTER_RUN_COUNT )

				local varX,z =GetWorldPos(varMap,nBossId)

				x700032_CreateSubMonster(varMap, varX,z, nMonsterRunCount)
			end
		end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_COUNT )

	local varRunCount =0 

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_START+varI )
		if nMonsterId>=0 then
			local bRun = GetFubenData_Param(varMap, x700032_CSP_MONSTER_B_RUN_START+varI )
			if bRun<=0 then 
				local nFullHp = GetFubenData_Param(varMap, x700032_CSP_MONSTER_FULLHP_START+varI )
				local nHp = GetHp(varMap,nMonsterId)
				if (nHp/nFullHp)<=0.5 then
					SetMonsterAIType(varMap,nMonsterId,7)
					SetPatrolId(varMap, nMonsterId, 1)
					SetFubenData_Param(varMap, x700032_CSP_MONSTER_B_RUN_START+varI, 1 )
				end
			elseif bRun==1 then
				local area = {125,84,136,90}
				local varX,z = GetWorldPos(varMap,nMonsterId)
				if varX>=area[1] and varX<=area[3] then
					if z>=area[2] and z<=area[4] then
						if x700032_ProcOneMonsterInArea(varMap,varI)>0 then
							varRunCount= varRunCount+1
						end
					end
				end
			end

			
		end
	end


	local nRunOverCount = GetFubenData_Param(varMap, x700032_CSP_MONSTER_RUN_COUNT )+varRunCount
	SetFubenData_Param(varMap, x700032_CSP_MONSTER_RUN_COUNT, nRunOverCount )


				
	
	local nTalkStep1 = GetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_STEP )
	local nTalkStep2 = GetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_STEP )

	if nTalkStep1>0 then
		local nTalkNpc1 = GetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_ID )
			
		local talklen =2
		local talklist = {"众家兄弟，神行太保戴宗送来了公明哥哥的口信，祝家勾结官府，欺压百姓！","今日梁山就要替天行道！"};

		if nTalkStep1<= talklen then
			NpcTalk(varMap, nTalkNpc1, talklist[nTalkStep1],  -1)
			SetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_STEP, nTalkStep1+1 )
		else
			if nTalkNpc1>=0 then
				DeleteMonster( varMap,nTalkNpc1 )
				SetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_ID, -1 )
			end
			SetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_STEP, -1 )
		end
	end

	if nTalkStep2>0 then
		local nTalkNpc2 = GetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_ID )
		local talklen =1
		local talklist = {"小娘子，随我回山去，我一定请公明哥哥做媒，娶你为妻！"};

		if nTalkStep2<= talklen then
			NpcTalk(varMap, nTalkNpc2, talklist[nTalkStep2],  -1)
			SetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_STEP, nTalkStep2+1 )
		else
			if nTalkNpc2>=0 then
				DeleteMonster( varMap,nTalkNpc2 )
				SetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_ID, -1 )
			end
			SetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_STEP, -1 )
		end
	end
	


				
				


end

function x700032_ProcOneMonsterInArea(varMap, iIndex)
	local nMonsterId = GetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_START+iIndex )
	local bRun = GetFubenData_Param(varMap, x700032_CSP_MONSTER_B_RUN_START+iIndex )

	if nMonsterId<0 then
		return 0
	end

	if bRun~=1 then
		return 0
	end

	DeleteMonster( varMap,nMonsterId )

	x700032_DeleteOneMonterData(varMap, iIndex)



	return 1

	


end

function x700032_CreateTalkNpc( varMap, nFlag, x1,z1 )
	for varI, item in x700032_var_TalkNPCList do

		if item.varFlag == nFlag then

			local varRet = 0
			
				


			if item.varFlag==0 then
				if item.title ~="" then
					varRet = CreateMonster(varMap, item.type, item.varX, item.z, 7, -1, -1, -1, -1,-1, item.facedir,  "",item.title)
					
				else
					varRet = CreateMonster(varMap, item.type, item.varX, item.z, 7, -1, -1, item.guid, -1,-1, item.facedir)
				
				end
				SetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_ID, varRet )
				SetFubenData_Param(varMap, x700032_CSP_TALK_NPC1_STEP, 1 )
					
			elseif item.varFlag==1 then
				local nRandom1 = random(-2,2)
				local nRandom2 = random(-2,2)
				if item.title ~="" then
					varRet = CreateMonster(varMap, item.type, x1+nRandom1, z1+nRandom2, 7, -1, -1, -1, -1,-1, item.facedir,  "",item.title)
					
				else
					varRet = CreateMonster(varMap, item.type, x1+nRandom1, z1+nRandom2, 7, -1, -1, item.guid, -1,-1, item.facedir)
				
				end
				SetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_ID, varRet )
				SetFubenData_Param(varMap, x700032_CSP_TALK_NPC2_STEP, 1 )
			
			end
		end
	end
end



function x700032_CreateSubMonster(varMap, varX,z, varRunCount)

	local bCreated = GetFubenData_Param(varMap, x700032_CSP_B_SUB_MONSTER )

	if bCreated>0 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )
	local varRunCount = 0
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varRunCount -1 do

				if title ~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
				varRunCount = varRunCount + 1
			end
        end
	end

	if varRunCount>0 then
		x700032_ShowTipsToAll( varMap, format("召集%d个逃跑怪",varRunCount))
	end

	SetFubenData_Param(varMap, x700032_CSP_B_SUB_MONSTER, 1 )
end

function x700032_CreateBoss(varMap)
 	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
                local nObjId = -1
				if title ~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir, "", title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir)
				
				end
				if nObjId >= 0 then
					if varFlag==0 then
						SetFubenData_Param(varMap, x700032_CSP_BOSS1_ID, nObjId )
					elseif varFlag==1 then
						SetFubenData_Param(varMap, x700032_CSP_BOSS2_ID, nObjId )
					elseif varFlag==2 then
						SetFubenData_Param(varMap, x700032_CSP_BOSS3_ID, nObjId )
					elseif varFlag==3 then
						SetFubenData_Param(varMap, x700032_CSP_BIG_BOSS_ID, nObjId )
						local nFullHp = GetHp( varMap, nObjId )
						SetFubenData_Param(varMap, x700032_CSP_BIG_BOSS_FULLHP, nFullHp )
					end

					break
				end
			end
        end
	end
	
	


end






function x700032_CreateMonster(varMap)
	

 	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )

	
	local nCount =0

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
                local varRet =0
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir, "", title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir)
				
				end
				SetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_START+nCount, varRet )
				local nFullHp = GetHp( varMap, varRet )
				SetFubenData_Param(varMap, x700032_CSP_MONSTER_FULLHP_START+nCount, nFullHp )
					

				nCount = nCount+1
			end
        end
	end
	
	SetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_COUNT, nCount )

end





function x700032_CreateMonsterNormal(varMap)
	

	

    local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title ~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end

	

end


function x700032_ProcDie(varMap, varPlayer, varKiller)
	
	local nDieCount = GetFubenData_Param(varMap, x700032_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700032_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	local objId1 = GetFubenData_Param(varMap, x700032_CSP_BIG_BOSS_ID)
	local objId2 = GetFubenData_Param(varMap, x700032_CSP_BOSS1_ID)
	local objId3 = GetFubenData_Param(varMap, x700032_CSP_BOSS2_ID)
	local objId4 = GetFubenData_Param(varMap, x700032_CSP_BOSS3_ID)

	local xianjinboss = GetFubenData_Param(varMap, x700032_CSP_XIANJINBOSS)
	
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end

	local zhanChe = GetFubenData_Param(varMap, x700032_CSP_ZHANCHE)
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
		local strMapName = "祝家庄"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end

	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700032_CSP_BIG_BOSS_ID, -1)

			




























		
		x700032_ProcBigBossDie(varMap, varPlayer)
		
		local varX,z = GetWorldPos(varMap,objId1)
		
		x700032_CreateTalkNpc( varMap, 1,varX,z )
		
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)

		LuaCallNoclosure( 701119, "ProcSceneBossDie", varMap, 1)
		
		if objId2>=0 and objId3>=0 and objId4>=0 then
			LuaCallNoclosure( 701120, "ProcSceneBossDie", varMap, 1)
		end
		x700032_ShowTipsToAll(varMap, "顺利击杀扈三娘，副本完成，请退出副本。")
		
	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700032_CSP_BOSS1_ID, -1)
		
	elseif objId3 == varPlayer then
		SetFubenData_Param(varMap, x700032_CSP_BOSS2_ID, -1)
	
	elseif objId4 == varPlayer then
		SetFubenData_Param(varMap, x700032_CSP_BOSS3_ID, -1)
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_COUNT )

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_START+varI )
		if nMonsterId == varPlayer then
			x700032_DeleteOneMonterData(varMap, varI)
			

			break;
		end
	end


	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700032_B_CREATE_RANDOMBOSS)

	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700032_CSP_RANDOM_BOSS_ID)
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

			local nHorseFlag = GetFubenData_Param(varMap, x700032_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL )
			
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



			local strMapName = "祝家庄"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)
			
			
			
		end
	end
	
end

function x700032_DeleteOneMonterData(varMap, iIndex)
	local iLen = GetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_COUNT )

	
	local paramStart = x700032_CSP_MONSTER_ID_START
	
	for varI=iIndex+1, iLen-1 do
		local nValue = GetFubenData_Param(varMap, paramStart+varI )
		SetFubenData_Param(varMap, paramStart+varI-1, nValue )
	end
	SetFubenData_Param(varMap, paramStart+iLen-1, -1 )


	paramStart = x700032_CSP_MONSTER_FULLHP_START
	for varI=iIndex+1, iLen-1 do
		local nValue = GetFubenData_Param(varMap, paramStart+varI )
		SetFubenData_Param(varMap, paramStart+varI-1, nValue )
	end
	SetFubenData_Param(varMap, paramStart+iLen-1, -1 )

	paramStart = x700032_CSP_MONSTER_B_RUN_START
	for varI=iIndex+1, iLen-1 do
		local nValue = GetFubenData_Param(varMap, paramStart+varI )
		SetFubenData_Param(varMap, paramStart+varI-1, nValue )
	end
	SetFubenData_Param(varMap, paramStart+iLen-1, -1 )

	SetFubenData_Param(varMap, x700032_CSP_MONSTER_ID_COUNT, iLen-1 )
	
end




function x700032_CreateRandomMonster(varMap,varCount)

	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE )
	if nFubenType ~= 0 then
		return
	end

	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700032_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,FUBEN_ZHUJIAZHUANG3,nFubenMode )/100

	if nFubenMode ==1 or nFubenMode == 2 then
		nStdRate = nStdRate*3
	end

	if rate>= nStdRate then
		return 0;
	end

	local nFlag = random(0,3)

	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL ) ;


	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				local nBossID = -1
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir)
				
				end

				if nBossID >= 0 then

					SetFubenData_Param(varMap, x700032_B_CREATE_RANDOMBOSS, 1)
					SetFubenData_Param(varMap, x700032_RANDOMBOSS_FLAG, nFlag)

					SetFubenData_Param(varMap, x700032_CSP_RANDOM_BOSS_ID, nBossID)

					break
				end
			end

				
		end
	end


	x700032_ShowTipsToAll(varMap, "战神再现！")

end



function x700032_CreateBonusMonster(varMap,nFlag)

	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE )
	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and varFlag == nFlag and nFubenType == varFlag3 then
            for j=0,varCount -1 do

				local nObjId = -1
				if title ~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end

				if nObjId >=0 then
					return
				end

			end
        end
	end
end


function x700032_ProcAllMonsterDead( varMap)
	
end

function x700032_ProcBigBossDie(varMap,varPlayer)

	
	local objId1 = GetFubenData_Param(varMap, x700032_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700032_CSP_BOSS2_ID)
	local objId3 = GetFubenData_Param(varMap, x700032_CSP_BOSS3_ID)

	local varCount =0
	
	if objId1>=0 then
		DeleteMonster( varMap,objId1 )
		varCount = varCount+1
	end
	if objId2>=0 then
		varCount = varCount+1
		DeleteMonster( varMap,objId2 )
	end
	if objId3>=0 then
		varCount = varCount+1
		DeleteMonster( varMap,objId3 )
	end

	x700032_CreateBonusMonster(varMap,varCount)

	x700032_CreateRandomMonster(varMap,varCount)


	x700032_CreateSubmitNpc( varMap)


	
end


function x700032_CreateSubmitNpc( varMap)
	
	if x700032_var_SubmitNPC.title~= "" then
		CreateMonster(varMap, x700032_var_SubmitNPC.type, x700032_var_SubmitNPC.varX, x700032_var_SubmitNPC.z, 3, 0, -1, x700032_var_SubmitNPC.guid, -1,-1,x700032_var_SubmitNPC.facedir, "", x700032_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700032_var_SubmitNPC.type, x700032_var_SubmitNPC.varX, x700032_var_SubmitNPC.z, 3, 0, -1, x700032_var_SubmitNPC.guid, -1,-1,x700032_var_SubmitNPC.facedir)
		
	end

	
	 x700032_CreateXianJinBoss(varMap)
	 x700032_CreateZhanCheBoss(varMap)

end





function x700032_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	
	local nFubenMode = GetFubenData_Param(varMap, x700032_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700032_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700032_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700032_CSP_XIANJINBOSS, varRet )
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
	x700032_ShowTipsToAll(varMap, "翻番宝箱出现！")
end



function x700032_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBENTYPE);

	if nFubenType~=x700032_var_FubenType then
		return
	end


	

end




function x700032_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )

	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBENTYPE);

	if nFubenType~=x700032_var_FubenType then
		return
	end

  
end




function x700032_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	
end



function x700032_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700032_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700032_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700032_CSP_FUBENLEVEL)

	if fubenlevel < x700032_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700032_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700032_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID(x700032_var_FileId )

	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700032_var_FileId,nIndexFrom,varI)
		if idScript == x700032_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700032_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700032_ShowTipsToAll(varMap, "战车风翼之王出现！")
	end
end
