







x700091_CSP_FUBENTYPE				= 	0
x700091_CSP_SCRIPTID				=	1
x700091_CSP_TICKCOUNT				= 	2
x700091_CSP_FROMSCENEID				= 	3
x700091_CSP_ISCLOSING				= 	4
x700091_CSP_LEAVECOUNTDOWN			= 	5
x700091_CSP_TEAMID					=	6
x700091_CSP_BACKSCENEX       		=   7
x700091_CSP_BACKSCENEZ      		=   8
x700091_CSP_FUBENLEVEL				=	9
x700091_CSP_NPCID					=   10
x700091_CSP_KILLCOUNT				=	20
x700091_CSP_FUBEN_SCENE_ID			=	21


x700091_CSP_BOSS_ID					=	22

x700091_CSP_FINALBOSS_ID			=	25
x700091_CSP_FINALBOSS_FULL_HP		=   26
x700091_CSP_AREA_ID					=	27
x700091_CSP_AREA_FLAG				=	28
x700091_CSP_ADDHP_MONSTER_ID1		=	31		
x700091_CSP_ADDHP_MONSTER_ID2		=	32		
x700091_CSP_ADDHP_MONSTER_ID3		=	33		
x700091_CSP_ADDHP_MONSTER_ID4		=	34		




x700091_CSP_BOSS_ID2_HPINDEX		=   40  
x700091_CSP_BOSS_ID3_HPINDEX		=   41

x700091_CSP_SELFEXPLODE_MONSER_NUM		=   30  
x700091_CSP_SELFEXPLODE_MONSER_STARTID	=   51  
x700091_CSP_SELFEXPLODE_MONSER_ENDID	=   80  
	
x700091_CSP_RANDOM_BOSS_ID			=	233
x700091_RANDOMBOSS_FLAG				=	234
x700091_CSP_ZHANCHE					 = 238
x700091_CSP_XIANJINBOSS				=	239

x700091_CSP_HUMAN_COUNT				=	240
x700091_CSP_PLAYER_ENTER_START		=	241

x700091_CSP_OBJID_START				=	247
x700091_CSP_GUID_START              =   248

x700091_CSP_FUBEN_TYPE				=	254	
x700091_CSP_FUBEN_MODE				=   255 


x700091_var_RandomMonsterRate			= 0.08                       
x700091_var_RandomMonsterRateZHOUSANFAN			= 67                      


x700091_var_GutMonsterArea       =   { x1 =40,z1= 60,x2 = 60, z2= 90 }

x700091_var_FileId 					= 700091
x700091_var_QuestId					= 6608

x700091_var_SubmitNPC       =   { type =28516,guid= 150560,varX = 106, z=39, facedir =0, title = "" }

x700091_var_TalkNpcID  = 150558
x700091_var_NpcTalk = 	{
												"不死战神在等待着你们！"		,	
												"谁也别想抢走我的功劳，我得不到的你们也别想得到！"			,
												"接受我不死的诅咒吧"			,
												"我的主人，别担心，只要我在就没人可以伤害到你！"		,	
												"我的守卫呢？难道都已经…我要为他们报仇！！！！！"		,	
						}
											
x700091_var_ExitPos					= { varMap = {50,50,50,50}, varX=100, z=100, varScript=x700091_var_FileId }					  
x700091_var_NextFuben					= 49


x700091_var_AddHPDeadFirst			=  0  
x700091_var_AddHPDeadFinal			=  0  
x700091_var_EnterTick					=  0  




x700091_var_Level_Limit = 70
x700091_var_Rate_Limit = 40


function x700091_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
	

end




function x700091_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700091_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700091_ProcFubenSceneCreated( varMap )
	
	
	SetFubenData_Param(varMap, x700091_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700091_CSP_ZHANCHE, -1)

	local humancount = GetFuben_PlayerCount(varMap)
	SetFubenData_Param(varMap, x700091_CSP_HUMAN_COUNT, humancount)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		SetFubenData_Param(varMap, x700091_CSP_PLAYER_ENTER_START+varI, humanId)
	end
	
	for varI = x700091_CSP_SELFEXPLODE_MONSER_STARTID, x700091_CSP_SELFEXPLODE_MONSER_STARTID+x700091_CSP_SELFEXPLODE_MONSER_NUM do
		SetFubenData_Param(varMap, varI, 0)
	end
	
	SetFubenData_Param(varMap, x700091_CSP_BOSS_ID2_HPINDEX, 9)
	SetFubenData_Param(varMap, x700091_CSP_BOSS_ID3_HPINDEX, 9)
	SetFubenData_Param(varMap, x700091_CSP_BOSS_ID, 0)	
	
	SetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID, -1)	
	SetFubenData_Param(varMap, x700091_CSP_FINALBOSS_FULL_HP, 0)	
	
	
	SetFubenData_Param(varMap, x700091_CSP_SELFEXPLODE_MONSER_NUM, 0)

	
	SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1, 0)
	SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2, 0)
	SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3, 0)
	SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4, 0)	
		
	
	x700091_CreateMonster( varMap )
	x700091_CreateAddHPMonster(varMap)
	x700091_CreateBoss( varMap )
	x700091_CreateFinalBoss( varMap )

	
		
end


function x700091_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	

	
	
	
	
	
	SetFubenData_Param(varMap, x700091_CSP_AREA_ID, varArea)
	local countryId = GetCurCountry( varMap, varPlayer )
	
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID )
		if BossId ~= -2 then
			return 
		end
		SetFubenData_Param(varMap, x700091_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700091_var_QuestId, x700091_var_FileId)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700091_var_QuestId, x700091_var_FileId)
	end

end




function x700091_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700091_CSP_AREA_ID, -1)





	
	
	
	
	
		
	

end



function x700091_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700091_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID )
		if BossId ~= -2 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700091_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700091_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700091_var_QuestId, x700091_var_FileId)
		
	else
	 	
	end
end


function x700091_EnterTick(varMap, nowTickCount)
	x700091_var_EnterTick = nowTickCount
	
	local BossID = GetFubenData_Param(varMap, x700091_CSP_BOSS_ID)
	local FinalBossID = GetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID)
	
	local addHPMonID1 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1)
	local addHPMonID2 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2)
	local addHPMonID3 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3)
	local addHPMonID4 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4)


	if addHPMonID1 == 1 and addHPMonID2 == 1 and addHPMonID3 == 1 and addHPMonID4 == 1 and FinalBossID >= 0 and NpcIsTalk == 0  then
		SetFubenData_Param( varMap, x700091_CSP_NPC_IS_TALK, 1)
		NpcTalk( varMap, FinalBossID, x700091_var_NpcTalk[5], -1)
	elseif (addHPMonID1 ~= 0 or addHPMonID2 ~= 0 or addHPMonID3 ~= 0 or addHPMonID4 ~= 0 ) and FinalBossID >= 0 then   
		
		local nCurrentHp = GetHp( varMap, FinalBossID )
		local nFullHp = GetFubenData_Param(varMap, x700091_CSP_FINALBOSS_FULL_HP )
		
		if nCurrentHp/nFullHp <= 0.9 then
			SetHp(varMap, FinalBossID, nFullHp)
			if addHPMonID1 ~= 0 then
				NpcTalk( varMap, addHPMonID1, x700091_var_NpcTalk[4], -1)
			elseif addHPMonID2 ~= 0 then
				NpcTalk( varMap, addHPMonID2, x700091_var_NpcTalk[4], -1)
			elseif addHPMonID3 ~= 0 then
				NpcTalk( varMap, addHPMonID3, x700091_var_NpcTalk[4], -1)
			elseif addHPMonID4 ~= 0 then
				NpcTalk( varMap, addHPMonID4, x700091_var_NpcTalk[4], -1)
			end
		
		end
	end
	
	

	
end	
	

function x700091_CreateFinalBoss(varMap)  
	local nFubenType = GetFubenData_Param(varMap, x700091_CSP_FUBEN_TYPE)
	local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL ) 
	local nIndexFrom = GetFubenDataPosByScriptID(x700091_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700091_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700091_var_FileId,nIndexFrom,varI)
		if idScript == x700091_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel  and varFlag3 == nFubenType then
		  	local varRet = 0
		  	
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1, facedir)
			end
				
			
			SetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID, varRet )
			local nFullHp = GetHp( varMap, varRet )
			SetFubenData_Param(varMap, x700091_CSP_FINALBOSS_FULL_HP, nFullHp )
			
			
			
			
    	end
	end
end

function x700091_CreateBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700091_CSP_FUBEN_TYPE)
	local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL ) 

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700091_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700091_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700091_var_FileId,nIndexFrom,varI)
		if idScript == x700091_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and varFlag3 == nFubenType then
			if monsterFlag == 3 then
			  	local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1, facedir)
				end
				









	
		
				
			end
		end
    end
end

function x700091_CreateAddHPMonster(varMap)
	local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL ) 
	local nFubenType = GetFubenData_Param(varMap, x700091_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700091_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700091_var_FileId )
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700091_var_FileId,nIndexFrom,varI)
		if idScript == x700091_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel  and varFlag3 == nFubenType then
			 for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local MonId = 0
				if title~="" then
					MonId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					MonId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir)
				
				end
				
				local addHPMonID1 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1)
				local addHPMonID2 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2)
				local addHPMonID3 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3)
				local addHPMonID4 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4)
				if addHPMonID1 == 0 then
					SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1,  MonId) 
				elseif addHPMonID2 == 0 then
					SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2,  MonId) 
				elseif addHPMonID3 == 0 then
					SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3,  MonId) 
				elseif addHPMonID4 == 0 then
					SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4,  MonId) 		
				end
				
            end
        end
	end
end







function x700091_CreateMonster(varMap)

	
    local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL ) 
    local nFubenType = GetFubenData_Param(varMap, x700091_CSP_FUBEN_TYPE)

	local nIndexFrom = GetFubenDataPosByScriptID(x700091_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700091_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700091_var_FileId,nIndexFrom,varI)
		
		if idScript == x700091_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel  and varFlag3 == nFubenType then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir)
				
				end
				
			end
        end
        if idScript == x700091_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel  and varFlag3 == nFubenType then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
                local selfExplodeID = 0
				if title~="" then
					selfExplodeID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					selfExplodeID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir)
				
				end
				
				local varNum = GetFubenData_Param(varMap, x700091_CSP_SELFEXPLODE_MONSER_NUM )
				SetFubenData_Param(varMap, x700091_CSP_SELFEXPLODE_MONSER_STARTID+varNum, selfExplodeID)
				SetFubenData_Param(varMap, x700091_CSP_SELFEXPLODE_MONSER_NUM, varNum + 1)
				
			end
        end
	end

end

function x700091_IsMonsterB(varMap, monsterId)
	for varI = x700091_CSP_SELFEXPLODE_MONSER_STARTID, x700091_CSP_SELFEXPLODE_MONSER_STARTID+x700091_CSP_SELFEXPLODE_MONSER_NUM do
		local varId = GetFubenData_Param(varMap, varI)
		if varId ~= -1 and varId == monsterId then
			return varI
		end
	end
	
	return -1
end

function x700091_SetAddHPMonDieTime(varMap, varPlayer)
	local addHPMonID1 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1)	
	local addHPMonID2 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2)	
	local addHPMonID3 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3)	
	local addHPMonID4 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4)	
	
	if x700091_var_AddHPDeadFirst == 0 then
		x700091_var_AddHPDeadFirst = x700091_var_EnterTick
	end
	if 	addHPMonID1 == 0 and addHPMonID2 == 0 and addHPMonID3 == 0 and addHPMonID4 == 0 then
		x700091_var_AddHPDeadFinal = x700091_var_EnterTick
	end	
end

function x700091_ProcDie(varMap, varPlayer, varKiller)
		
	--local varPlayer = GetFubenData_Param(varMap, x700091_CSP_PLAYER_ENTER_START)
	
	local BossID = GetFubenData_Param(varMap, x700091_CSP_BOSS_ID)	
	local FinalBossID = GetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID)	

	local addHPMonID1 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1)	
	local addHPMonID2 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2)	
	local addHPMonID3 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3)	
	local addHPMonID4 = GetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4)	

	local xianjinboss = GetFubenData_Param(varMap, x700091_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700091_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local varIndex = x700091_IsMonsterB(varMap, varPlayer)
	if varIndex ~= -1 then











		
	elseif BossID == varPlayer then
		SetFubenData_Param(varMap, x700091_CSP_BOSS_ID, 0)
	elseif FinalBossID == varPlayer then
		SetFubenData_Param(varMap, x700091_CSP_FINALBOSS_ID, -2)
		x700091_ProcFubenEnd( varMap)
		x700091_ShowTipsToAll(varMap, "顺利击杀圣路易，副本完成。")
	elseif addHPMonID1 == varPlayer then
		SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID1, 0)
		x700091_SetAddHPMonDieTime(varMap, varPlayer)
	elseif addHPMonID2 == varPlayer then
		SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID2, 0)
		x700091_SetAddHPMonDieTime(varMap, varPlayer)
	elseif addHPMonID3 == varPlayer then
		SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID3, 0)
		x700091_SetAddHPMonDieTime(varMap, varPlayer)
	elseif addHPMonID4 == varPlayer then
		SetFubenData_Param(varMap, x700091_CSP_ADDHP_MONSTER_ID4, 0)		
		x700091_SetAddHPMonDieTime(varMap, varPlayer)
	end
	
	
	
	local nRandomBossId = GetFubenData_Param(varMap, x700091_CSP_RANDOM_BOSS_ID)

	if nRandomBossId ~= 0 then
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

			local nHorseFlag = GetFubenData_Param(varMap, x700091_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL )
			
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



			local strMapName = "景教堂"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)
			
			
			
		end
	end
end

function x700091_ProcFubenEnd( varMap)
	
	x700091_CreateXianJinBoss(varMap)
	x700091_CreateZhanCheBoss(varMap)
	
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,60 )
	end	
end

function x700091_CreateSubmitNpc( varMap)
	if x700091_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700091_var_SubmitNPC.type, x700091_var_SubmitNPC.varX, x700091_var_SubmitNPC.z, 3, 0, -1, x700091_var_SubmitNPC.guid, -1,-1,x700091_var_SubmitNPC.facedir,  "",x700091_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700091_var_SubmitNPC.type, x700091_var_SubmitNPC.varX, x700091_var_SubmitNPC.z, 3, 0, -1, x700091_var_SubmitNPC.guid, -1,-1,x700091_var_SubmitNPC.facedir)
	
	end

	LuaCallNoclosure( 701110, "ProcSceneBossDie", varMap, 2)
	
	if x700091_var_AddHPDeadFinal - x700091_var_AddHPDeadFirst <= 10 then 
		LuaCallNoclosure( 701111, "ProcSceneBossDie", varMap, 2)
	end
	
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	

end




function x700091_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700091_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700091_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL ) 
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700091_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700091_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700091_var_FileId,nIndexFrom,varI)
		if idScript == x700091_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700091_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700091_CSP_XIANJINBOSS, varRet )
			
		end
	end

	x700091_ShowTipsToAll(varMap, "翻番宝箱出现！")
end



function x700091_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700091_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700091_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700091_CSP_FUBENLEVEL)

	if fubenlevel < x700091_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700091_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700091_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700091_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700091_var_FileId,nIndexFrom,varI)
		if idScript == x700091_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end

			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700091_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700091_ShowTipsToAll(varMap, "战车雷爪之王出现！")
	end
end

