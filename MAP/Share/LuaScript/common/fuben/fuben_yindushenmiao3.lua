

x700089_CSP_FUBENTYPE				= 	0
x700089_CSP_SCRIPTID				=	1
x700089_CSP_TICKCOUNT				= 	2
x700089_CSP_BACKSCENEID				= 	3
x700089_CSP_ISCLOSING				= 	4
x700089_CSP_LEAVECOUNTDOWN			= 	5
x700089_CSP_TEAMID					=	6
x700089_CSP_TICKTIME				=	7
x700089_CSP_HOLDTIME				=	8
x700089_CSP_FUBENLEVEL				=	9

x700089_CSP_FUBEN_SCENE_ID			=	10
x700089_CSP_CLOSETICK				=	11
x700089_CSP_TICKCOUNT_ADD			=	12
x700089_CSP_TICKCOUNT_SUB			=	13
x700089_CSP_B_TOPLIST_ABLE			=	14
x700089_CSP_AREA_ID					=   20
x700089_CSP_AREA_FLAG				=	21
x700089_CSP_HUMAN_COUNT				=	240
x700089_CSP_PLAYER_ENTER_START		=	241

x700089_CSP_LAST_TICKOUNT			=	247
x700089_CSP_GUID_START              =   248  
x700089_CSP_FUBEN_TYPE				=	254	
x700089_CSP_FUBEN_MODE				=   255


x700089_CSP_BOSS_C_HP				=	25
x700089_CSP_BOSS_C2_HP				=	26
x700089_CSP_BOSS2_HP				=	27

x700089_CSP_BOSS1_FLAG				=	30
x700089_CSP_BOSS2_FLAG				=	32
x700089_CSP_BOSS2_TIME				=	33

x700089_CSP_BOSS1_ID				=	50
x700089_CSP_BOSS2_ID				=	51
x700089_CSP_BOSS_C_ID				=	52
x700089_CSP_BOSS_D_ID				=	54

x700089_CSP_MONSTER_A				=	60
x700089_CSP_MONSTER_B				=	120

x700089_B_CREATE_RANDOMBOSS			=	230
x700089_CSP_RANDOM_BOSS_ID			=	231
x700089_RANDOMBOSS_FLAG				=	232
x700089_CSP_ZHANCHE					 = 238
x700089_CSP_XIANJINBOSS				=	239

x700089_var_QuestId					= 6608
x700089_var_FileId 					= 700089




x700089_var_MonsterB_BuffId			= 13517
x700089_var_Boss2_BuffId1				= {13218,9520}
x700089_var_Boss2_BuffId2				= {13219,9561}
x700089_var_Boss2_BuffId3				= {13220,9601}
x700089_var_Boss2_BuffId4				= {13221,9641}
x700089_var_Boss2_BuffId5				= {13222,9656}


x700089_var_MonsterACount				= 60
x700089_var_MonsterBCount				= 10

x700089_var_RandomMonsterRate			= 0.08*6
x700089_var_RandomMonsterRateZHOUSANFAN			= 67                      
		
x700089_var_SubmitNPC                 = {type =28523,guid= 150567,varX = 30, z=100, facedir =180, title = ""}
x700089_var_LeaveNPC                 = 150564

x700089_var_Talk_A					= "注意那个四处游荡火夜叉，他会让真正的火夜叉魔王重生！"										
x700089_var_Talk_B					= "让你尝尝烈火焚身的滋味！"											
x700089_var_Talk_C					= "扎兰丁王子才是真正的战神！"												
x700089_var_Talk_D					= "誓死保卫扎兰丁王子！"
						  
x700089_var_Level_Limit = 70						  
x700089_var_Rate_Limit = 30

function x700089_ProcFubenSceneCreated( varMap )

	
	local humancount = GetFuben_PlayerCount(varMap)
	SetFubenData_Param(varMap, x700089_CSP_HUMAN_COUNT, humancount)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		SetFubenData_Param(varMap, x700089_CSP_PLAYER_ENTER_START+varI, humanId)
	end
	
	SetFubenData_Param(varMap, x700089_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700089_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700089_CSP_BOSS_C_HP, 0)
	SetFubenData_Param(varMap, x700089_CSP_BOSS_C2_HP, 0)
	SetFubenData_Param(varMap, x700089_CSP_BOSS2_HP, 0)
	
	SetFubenData_Param(varMap, x700089_CSP_BOSS1_FLAG, 0)
	SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 0)
	SetFubenData_Param(varMap, x700089_CSP_BOSS2_TIME, 0)
	
	SetFubenData_Param(varMap, x700089_CSP_BOSS1_ID, -1)
	SetFubenData_Param(varMap, x700089_CSP_BOSS2_ID, -1)
	
	SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID, -1)
	SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID+1, -1)
	SetFubenData_Param(varMap, x700089_CSP_BOSS_D_ID, -1)
	
	for varI = x700089_CSP_MONSTER_A, x700089_CSP_MONSTER_A+x700089_var_MonsterACount do
		SetFubenData_Param(varMap, varI, -1)
	end
	for varI = x700089_CSP_MONSTER_B, x700089_CSP_MONSTER_B+x700089_var_MonsterBCount do
		SetFubenData_Param(varMap, varI, -1)
	end
	
	SetFubenData_Param(varMap, x700089_B_CREATE_RANDOMBOSS, 0)
	SetFubenData_Param(varMap, x700089_CSP_RANDOM_BOSS_ID, -1)
	SetFubenData_Param(varMap, x700089_RANDOMBOSS_FLAG, 0)

	x700089_CreateBoss2(varMap)
	x700089_CreateMonsterA(varMap)
	x700089_CreateMonsterB(varMap)
	x700089_CreateMonsterC(varMap)
end


function x700089_EnterTick(varMap, nowTickCount)



	
	
	local objc1 = GetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID)
	local objc2 = GetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID+1)
	local boss1_flag = GetFubenData_Param(varMap, x700089_CSP_BOSS1_FLAG)
	local objd = GetFubenData_Param(varMap, x700089_CSP_BOSS_D_ID)
	
	if boss1_flag == 0 then
		if objc1 ~= -1 and objc2 ~= -1 then
			local hp1 = GetHp(varMap, objc1)
			local hp2 = GetHp(varMap, objc2)
			local max_hp1 = GetFubenData_Param(varMap, x700089_CSP_BOSS_C_HP)
			local max_hp2 = GetFubenData_Param(varMap, x700089_CSP_BOSS_C2_HP)
			if hp1 < max_hp1 or hp2 <max_hp2 then
				x700089_CreateMonsterD(varMap)
				SetFubenData_Param(varMap, x700089_CSP_BOSS1_FLAG, 1)
			end
		end
	elseif boss1_flag == 1 and objd ~= -1 then
		if mod(nowTickCount, 3) == 0 then
			NpcTalk(varMap, objd, "急报！急报！扎兰丁命我通报尔等合体抵御入侵！",  -1)
		end
			
		local varX, z = GetWorldPos( varMap, objd)
		if varX >= 56 and varX <= 66 and z >= 50 and z <= 66 then
			SetFubenData_Param(varMap, x700089_CSP_BOSS1_FLAG, 2)
			DeleteMonster(varMap, objd)
			SetFubenData_Param(varMap, x700089_CSP_BOSS_D_ID, -1)
			
			if objc1 ~= -1 and objc2 ~= -1 then
			
				DeleteMonster(varMap, objc1)
				DeleteMonster(varMap, objc2)
				
				SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID, -1)
				SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID+1, -1)
				
				x700089_CreateBoss1(varMap)
			end
		end		
	end
	
	
	local boss2 = GetFubenData_Param(varMap, x700089_CSP_BOSS2_ID)
	local boss2_flag = GetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG)
	local boss2_time = GetFubenData_Param(varMap, x700089_CSP_BOSS2_TIME)
	if boss2_flag == 0 then
		if boss2 ~= -1 then
			local hp = GetHp(varMap, boss2)
			local max_hp = GetFubenData_Param(varMap, x700089_CSP_BOSS2_HP)
			if hp < max_hp then
				SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 1)
				SetFubenData_Param(varMap, x700089_CSP_BOSS2_TIME, nowTickCount)
			end
		end
	elseif boss2_flag == 1 then
		if nowTickCount - boss2_time > 6 then
			NpcTalk(varMap, boss2, "我感觉到能量源源不断的涌出",  -1)
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId1[1],0 )
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId1[2],0 )
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 2)
		end
	elseif boss2_flag == 2 then
		if nowTickCount - boss2_time > 12 then
			NpcTalk(varMap, boss2, "我感觉到能量源源不断的涌出",  -1)
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId1[1])
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId1[2])
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId2[1],0 )
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId2[2],0 )
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 3)
		end
	elseif boss2_flag == 3 then
		if nowTickCount - boss2_time > 18 then
			NpcTalk(varMap, boss2, "我感觉到能量源源不断的涌出",  -1)
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId2[1])
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId2[2])
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId3[1],0 )
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId3[2],0 )
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 4)
		end
	elseif boss2_flag == 4 then
		if nowTickCount - boss2_time > 24 then
			NpcTalk(varMap, boss2, "我感觉到能量源源不断的涌出",  -1)
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId3[1])
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId3[2])
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId4[1],0 )
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId4[2],0 )
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 5)
		end
	elseif boss2_flag == 5 then
		if nowTickCount - boss2_time > 30 then
			NpcTalk(varMap, boss2, "我感觉到能量源源不断的涌出",  -1)
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId4[1])
			CancelSpecificImpact(varMap, boss2, x700089_var_Boss2_BuffId4[2])
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId5[1],0 )
			SendSpecificImpactToUnit(varMap, boss2,boss2,boss2, x700089_var_Boss2_BuffId5[2],0 )
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_FLAG, 6)
		end
	end
end


function x700089_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
end


function x700089_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	SetFubenData_Param(varMap, x700089_CSP_AREA_ID, varArea)
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700089_CSP_BOSS2_ID)
		if BossId ~= -1 then
			return 
		end
		SetFubenData_Param(varMap, x700089_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700089_var_QuestId, x700089_var_FileId,1)
		
	elseif varArea == 1 then
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700089_var_QuestId, x700089_var_FileId)
	end
end


function x700089_ProcAreaLeaved(varMap, varPlayer, varArea, varQuest)
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700089_CSP_AREA_ID, -1)
end



function x700089_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	local varArea = GetFubenData_Param(varMap, x700089_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700089_CSP_BOSS2_ID)
		if BossId ~= -1 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700089_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700089_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700089_var_QuestId, x700089_var_FileId,1)
		
	elseif varArea == 1 then
	 	
	end
end


function x700089_ProcDie(varMap, varPlayer, varKiller)
	
	local objId1 = GetFubenData_Param(varMap, x700089_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700089_CSP_BOSS2_ID)
	local objc1 = GetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID)
	local objc2 = GetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID+1)
	local objd = GetFubenData_Param(varMap, x700089_CSP_BOSS_D_ID)
	local boss1_flag = GetFubenData_Param(varMap, x700089_CSP_BOSS1_FLAG)


	local xianjinboss = GetFubenData_Param(varMap, x700089_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700089_CSP_ZHANCHE)
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
		local strMapName = "印度河"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700089_CSP_BOSS1_ID, -1)
		
		
		if objId2 == -1 and boss1_flag == 2 then
			LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
		end
	elseif objId2 == varPlayer then
		
		SetFubenData_Param(varMap, x700089_CSP_BOSS2_ID, -1)
		x700089_ShowTipsToAll(varMap, "扎兰丁死了，副本完成，请退出副本。")
		
		x700089_ProcFubenEnd(varMap)
		
		
		LuaCallNoclosure(701116,"ProcSceneBossDie", varMap, 2)
		LuaCallNoclosure(701117,"ProcSceneBossDie", varMap, 2)
		
		if objId1 == -1 and boss1_flag == 2 then
			LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
		end
	elseif objc1 == varPlayer then
		SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID, -1)
	elseif objc2 == varPlayer then
		SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID+1, -1)
	elseif objd == varPlayer then
		SetFubenData_Param(varMap, x700089_CSP_BOSS_D_ID, -1)
	else
	
		local varRet = x700089_IsMonsterB(varMap, varPlayer)
		if varRet ~= -1 then
			SetFubenData_Param(varMap, varRet, -1)
			x700089_ShowTipsToAll(varMap, x700089_var_Talk_B)
			
			
			local playerId = x700089_GetAnyPlayer(varMap)
			if playerId ~= -1 then
				local Num =  GetNearObjCount(varMap, playerId, 10, 0, varPlayer)  
				
				local n = 1
				for varI = 0, Num-1 do
					if n > 4 then
						break
					end
					
					local monsterId = GetNearMonster(varMap, playerId,varI)
					
					if x700089_IsMonsterA(varMap, monsterId) ~= -1 then
						n = n+1
						SendSpecificImpactToUnit(varMap, monsterId,monsterId,monsterId, x700089_var_MonsterB_BuffId,0 )
					end
				end
			end
			return
		end
	end
	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700089_B_CREATE_RANDOMBOSS)
	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700089_CSP_RANDOM_BOSS_ID)
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

			local nHorseFlag = GetFubenData_Param(varMap, x700089_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )
			
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


			local strMapName = "印度河"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)

		end
	end
end


function x700089_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)

	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		Msg2Player(varMap, humanId, varStr, 8, 3)
	end
end


function x700089_CreateBoss1(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 1 and varFlag3 == fubentype then
		
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
			end
			
			x700089_ShowTipsToAll(varMap, "枷楼罗合体完成")
			
			SetFubenData_Param(varMap, x700089_CSP_BOSS1_ID, varRet )
        end
	end
end


function x700089_CreateBoss2(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 2 and varFlag3 == fubentype then
		
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
			end
			
			local hp = GetHp(varMap, varRet)
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_HP, hp )
			SetFubenData_Param(varMap, x700089_CSP_BOSS2_ID, varRet )
        end
	end
end


function x700089_CreateMonsterA(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	local idx = 0
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 3 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700089_CSP_MONSTER_A+idx, varRet )
				idx = idx + 1
			end
        end
	end
end


function x700089_CreateMonsterB(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	local idx = 0
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 4 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700089_CSP_MONSTER_B+idx, varRet )
				idx = idx + 1
			end
        end
	end
end


function x700089_CreateMonsterC(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	
	local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	local idx = 0
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 5 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700089_CSP_BOSS_C_ID+idx, varRet )
				
				local hp = GetHp(varMap, varRet)
				SetFubenData_Param(varMap, x700089_CSP_BOSS_C_HP+idx, hp )
				idx = idx + 1
			end
        end
	end
end


function x700089_CreateMonsterD(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	
	local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	local idx = 0
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 6 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700089_CSP_BOSS_D_ID+idx, varRet )
				
				SetPatrolId(varMap, varRet, 0)
				idx = idx + 1
			end
        end
	end
end

function x700089_GetAnyPlayer(varMap)

	local humancount = GetFuben_PlayerCount(varMap)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		varPlayer = GetFubenData_Param(varMap, x700089_CSP_PLAYER_ENTER_START+varI)
		if varPlayer ~= -1 and IsPlayerStateNormal(varMap,varPlayer) == 1 then
			return varPlayer
		end
	end
	return -1
end

function x700089_IsMonsterA(varMap, monsterId)
	for varI = x700089_CSP_MONSTER_A, x700089_CSP_MONSTER_A+x700089_var_MonsterACount do
		local varId = GetFubenData_Param(varMap, varI)
		if varId ~= -1 and varId == monsterId then
			return varI
		end
	end
	
	return -1
end

function x700089_IsMonsterB(varMap, monsterId)
	for varI = x700089_CSP_MONSTER_B, x700089_CSP_MONSTER_B+x700089_var_MonsterBCount do
		local varId = GetFubenData_Param(varMap, varI)
		if varId ~= -1 and varId == monsterId then
			return varI
		end
	end
	
	return -1
end

function x700089_ProcFubenEnd(varMap)
	
		
	x700089_CreateXianJinBoss(varMap)
	x700089_CreateZhanCheBoss(varMap)
	 
	x700089_CreateRandomMonster(varMap)
	
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,67 )
	end	

end


function x700089_CreateSubmitNpc( varMap)

	local npc = x700089_var_SubmitNPC
	
	if npc.title~= "" then
		CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
end


function x700089_CreateXianJinBoss(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	if fubentype ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700089_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700089_CSP_XIANJINBOSS, varRet )
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
	x700089_ShowTipsToAll(varMap, "翻番宝箱出现！")
end

function x700089_CreateRandomMonster(varMap)
	local fubentype = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE )
	if fubentype ~= 0 then
		return
	end
	
	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700089_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,fubentype,nFubenMode )

	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	
	if(nFubenMode ~= 2) then
		if rate>= nStdRate then
			return 0
		end
	else
		rate = random(1,100)
		if(rate > x700089_var_RandomMonsterRateZHOUSANFAN) then
			return 0
		end
	end
	

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700089_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		
		if idScript == x700089_var_FileId and monsterFlag == 8+nFlag and levelmin <= fubenlevel and levelmax >= fubenlevel then
			local nBossID =0;
			if title~="" then
				nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700089_var_FileId, -1, 21,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700089_B_CREATE_RANDOMBOSS, 1)
			SetFubenData_Param(varMap, x700089_RANDOMBOSS_FLAG, nFlag)
			SetFubenData_Param(varMap, x700089_CSP_RANDOM_BOSS_ID, nBossID)
		end
	end

	x700089_ShowTipsToAll(varMap, "战神再现！")

end


function x700089_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700089_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700089_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700089_CSP_FUBENLEVEL)

	if fubenlevel < x700089_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700089_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700089_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID(x700089_var_FileId )

	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700089_var_FileId,nIndexFrom,varI)
		if idScript == x700089_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2  then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700089_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700089_ShowTipsToAll(varMap, "战车风翼之王出现！")
	end
end
