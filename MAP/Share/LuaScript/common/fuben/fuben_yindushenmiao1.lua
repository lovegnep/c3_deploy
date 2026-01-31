

x700087_CSP_FUBENTYPE				= 	0
x700087_CSP_SCRIPTID				=	1
x700087_CSP_TICKCOUNT				= 	2
x700087_CSP_BACKSCENEID				= 	3
x700087_CSP_ISCLOSING				= 	4
x700087_CSP_LEAVECOUNTDOWN			= 	5
x700087_CSP_TEAMID					=	6
x700087_CSP_TICKTIME				=	7
x700087_CSP_HOLDTIME				=	8
x700087_CSP_FUBENLEVEL				=	9

x700087_CSP_FUBEN_SCENE_ID			=	10
x700087_CSP_CLOSETICK				=	11
x700087_CSP_TICKCOUNT_ADD			=	12
x700087_CSP_TICKCOUNT_SUB			=	13
x700087_CSP_B_TOPLIST_ABLE			=	14

x700087_CSP_AREA_ID					=	20
x700087_CSP_AREA_FLAG				=	21
x700087_CSP_ZHANCHE					 = 237
x700087_CSP_FUBEN_START				=	238
x700087_CSP_XIANJINBOSS				=	239
x700087_CSP_HUMAN_COUNT				=	240
x700087_CSP_PLAYER_ENTER_START		=	241

x700087_CSP_LAST_TICKOUNT			=	247
x700087_CSP_GUID_START              =   248  
x700087_CSP_FUBEN_TYPE				=	254	
x700087_CSP_FUBEN_MODE				=   255


x700087_CSP_GAME_STEP				=	27
x700087_CSP_BOSS1_HP				=	28
x700087_CSP_BOSS2_HP				=	29

x700087_CSP_BOSS1_ID				=	50
x700087_CSP_BOSS2_ID				=	51
x700087_CSP_MONSTER_A				=	60
x700087_CSP_MONSTER_B				=	90
x700087_CSP_MONSTER_B_HP			=	120


x700087_var_FileId 					= 700087
x700087_var_QuestId					= 6608

x700087_var_NextFuben					= 45

x700087_var_DestPos					= { {left=154, top=157, right=156, bottom=159}, {left=183, top=131, right=185, bottom=133} }


x700087_var_MonsterB_BuffId			= 13517

x700087_var_MonsterACount				= 21
x700087_var_MonsterBCount				= 4

x700087_var_SubmitNPC                 = {type =28521,guid= 150565,varX = 80, z=209, facedir =135, title = ""}
x700087_var_LeaveNPC                 = 150562

x700087_var_Talk_A					= "扎兰丁的印度神庙就在这北印度丛林中，请速去讨伐！"										
x700087_var_Talk_B					= "印度是诸神保佑的国度，你们必将失败！"										
x700087_var_Talk_C					= "擅入谷内者死！"										
x700087_var_Talk_D					= "在我面前，你就是一个丑陋的侏儒！"										
x700087_var_Talk_E					= "夜叉之地，有来无去！"										
x700087_var_Level_Limit  = 70
x700087_var_Rate_Limit = 50

function x700087_ProcFubenSceneCreated( varMap )


	local humancount = GetFuben_PlayerCount(varMap)
	SetFubenData_Param(varMap, x700087_CSP_HUMAN_COUNT, humancount)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		SetFubenData_Param(varMap, x700087_CSP_PLAYER_ENTER_START+varI, humanId)
	end
	
	SetFubenData_Param(varMap, x700087_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700087_CSP_ZHANCHE, -1)
	
	SetFubenData_Param(varMap, x700087_CSP_FUBEN_START, 0 )
	SetFubenData_Param(varMap, x700087_CSP_GAME_STEP, 0)
	SetFubenData_Param(varMap, x700087_CSP_BOSS1_HP, 0)
	SetFubenData_Param(varMap, x700087_CSP_BOSS2_HP, 0)
	SetFubenData_Param(varMap, x700087_CSP_BOSS2_HP+1, 0)
	
	SetFubenData_Param(varMap, x700087_CSP_BOSS1_ID, -1)
	SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID, -1)
	for varI = 1, 6 do
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+varI, -1)
	end
	
	for varI = x700087_CSP_MONSTER_A, x700087_CSP_MONSTER_A+x700087_var_MonsterACount do
		SetFubenData_Param(varMap, varI, -1)
	end
	for varI = x700087_CSP_MONSTER_B, x700087_CSP_MONSTER_B+x700087_var_MonsterBCount do
		SetFubenData_Param(varMap, varI, -1)
	end
	for varI = x700087_CSP_MONSTER_B_HP, x700087_CSP_MONSTER_B_HP+x700087_var_MonsterBCount do
		SetFubenData_Param(varMap, varI, 0)
	end
	
	x700087_CreateBoss1(varMap)
	x700087_CreateBoss2(varMap)
	x700087_CreateMonsterA(varMap)
	x700087_CreateMonsterB(varMap)
end


function x700087_EnterTick(varMap, nowTickCount)


	
	if random(1,10) == 1 then
		local boss1 = GetFubenData_Param(varMap, x700087_CSP_BOSS1_ID)
		if boss1 ~= -1 then
		
			local hp = GetFubenData_Param(varMap, x700087_CSP_BOSS1_HP)
			local curhp = GetHp(varMap, boss1)
			if curhp < hp then
				SetFubenData_Param(varMap, x700087_CSP_BOSS1_HP, curhp)
		
				local varPlayer = x700087_GetAnyPlayer(varMap)
				if varPlayer ~= -1  and IsPlayerStateNormal(varMap,varPlayer) == 1 then
				
					local Num =  GetNearObjCount(varMap, varPlayer,10,1, boss1)  
					
					for varI = 0, Num-1 do
						local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI)
						
						if humanObjId ~= -1 and IsPlayerStateNormal(varMap,varPlayer) == 1  then
						
							
							
								local pos = x700087_var_DestPos[random(1,2)]
								NpcTalk(varMap, boss1, x700087_var_Talk_D,  -1)
								SetPos(varMap, humanObjId,random(pos.left, pos.right), random(pos.top, pos.bottom))
								break
							
						end
					end
				end
			end
		end
	end
	
	
	local boss2 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID)
	if boss2 ~= -1 then
		local max_hp = GetFubenData_Param(varMap, x700087_CSP_BOSS2_HP)
		local hp = GetHp(varMap, boss2)
		if hp < max_hp*0.5 then
			x700087_CreateSubBoss(varMap, boss2)
		end
	end
	
	for varI = 1, 2 do
		local subboss2 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+varI)
		if subboss2 ~= -1 then
			local max_hp = GetFubenData_Param(varMap, x700087_CSP_BOSS2_HP+1)
			local hp = GetHp(varMap, subboss2)
			if hp < max_hp*0.25 then
				x700087_CreateSubBoss2(varMap, subboss2, varI)
			end
		end
	end
	
	
	for varI = 0, x700087_var_MonsterBCount do
		local mb = GetFubenData_Param(varMap, x700087_CSP_MONSTER_B+varI)
		if mb ~= -1 then
			local hp = GetFubenData_Param(varMap, x700087_CSP_MONSTER_B_HP+varI)
			local curhp = GetHp(varMap, mb)
			
			if curhp < hp then
				SetFubenData_Param(varMap, x700087_CSP_MONSTER_B_HP+varI, curhp)
				if random(1,20) == 1 then
					local varPlayer = x700087_GetAnyPlayer(varMap)
					
					if varPlayer ~= -1 then
						local Num =  GetNearObjCount(varMap, varPlayer, 10, 0, mb)  
						
						for varI = 0, Num-1 do
				
							local monsterId = GetNearMonster(varMap, varPlayer,varI)
							
							if x700087_IsMonsterA(varMap, monsterId) ~= -1 then
								NpcTalk(varMap, monsterId, x700087_var_Talk_B,  -1)
								break
							end
						end
					end
				end
			end
		end
	end
end


function x700087_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
end

function x700087_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700087_CSP_AREA_ID, varArea)
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700087_CSP_FUBEN_START)
		if BossId ~= 1 then
			return 
		end
		SetFubenData_Param(varMap, x700087_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700087_var_QuestId, x700087_var_FileId)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700087_var_QuestId, x700087_var_FileId)
	end
end	



function x700087_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700087_CSP_AREA_ID, -1)
end



function x700087_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	local varArea = GetFubenData_Param(varMap, x700087_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700087_CSP_FUBEN_START)
		if BossId ~= 1 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700087_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700087_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700087_var_QuestId, x700087_var_FileId)
		
	else
	 	
	end
end


function x700087_ProcDie(varMap, varPlayer, varKiller)
	
	local objId1 = GetFubenData_Param(varMap, x700087_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID)
	local subboss1 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+1)
	local subboss2 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+2)
	local subboss3 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+3)
	local subboss4 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+4)
	local subboss5 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+5)
	local subboss6 = GetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+6)
	
	local is_end = 0
	
	local xianjinboss = GetFubenData_Param(varMap, x700087_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end

	local zhanChe = GetFubenData_Param(varMap, x700087_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end

	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS1_ID, -1)
		
		objId1 = -1
	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID, -1)
		objId2 = -1
		is_end = 1
	elseif subboss1  == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+1, -1)
		subboss1 = -1
		is_end = 1
	elseif subboss2  == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+2, -1)
		subboss2 = -1
		is_end = 1
	elseif subboss3  == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+3, -1)
		subboss3 = -1
		is_end = 1
	elseif subboss4  == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+4, -1)
		subboss4 = -1
		is_end = 1
	elseif subboss5  == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+5, -1)
		subboss5 = -1
		is_end = 1
	elseif subboss6  == varPlayer then
		SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+6, -1)
		subboss6 = -1
		is_end = 1
	else
		local idx = x700087_IsMonsterB(varMap, varPlayer)
		if idx ~= -1 then
			SetFubenData_Param(varMap, idx, -1)
			x700087_ShowTipsToAll(varMap, x700087_var_Talk_C)
			
			
			local varPlayer = x700087_GetAnyPlayer(varMap)
			if varPlayer ~= -1 then
				local Num =  GetNearObjCount(varMap, varPlayer, 10, 0, varPlayer)  
				
				local n = 1
				for varI = 0, Num-1 do
					if n > 4 then
						break
					end
					
					local monsterId = GetNearMonster(varMap, varPlayer,varI)
					
					if x700087_IsMonsterA(varMap, monsterId) ~= -1 then
					
						n = n+1
						SendSpecificImpactToUnit(varMap, monsterId,monsterId,monsterId, x700087_var_MonsterB_BuffId,0 )
					end
				end
			end
		end
	end 
	
	if is_end == 1 and objId2 == -1 and subboss1 == -1 and subboss2 == -1 and subboss3 == -1 
		and subboss4 == -1  and subboss5 == -1 and subboss6 == -1 then
		
		x700087_ShowTipsToAll(varMap, "顺利击杀沙陀罗，副本完成。")
		
		x700087_ProcFubenEnd(varMap)
		
		
		LuaCallNoclosure(701116,"ProcSceneBossDie", varMap, 0)
		LuaCallNoclosure(701117,"ProcSceneBossDie", varMap, 0)
	end
end















function x700087_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)

	for varI = 0, humancount - 1 do
	
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		Msg2Player(varMap, humanId, varStr, 8, 3)
	end
end


function x700087_CreateBoss1(varMap)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 1 and varFlag3 == fubentype then
		
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
			end
			
			SetFubenData_Param(varMap, x700087_CSP_BOSS1_ID, varRet )
			local hp = GetHp(varMap, varRet)
			SetFubenData_Param(varMap, x700087_CSP_BOSS1_HP, hp)
        end
	end
end


function x700087_CreateBoss2(varMap)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 2 and varFlag3 == fubentype then
		
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
			end
			
			SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID, varRet )
			local hp = GetHp(varMap, varRet)
			SetFubenData_Param(varMap, x700087_CSP_BOSS2_HP, hp )
        end
	end
end


function x700087_CreateMonsterA(varMap)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	local idx = 0
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 3 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700087_CSP_MONSTER_A+idx, varRet )
				idx = idx + 1
			end
        end
	end
end


function x700087_CreateMonsterB(varMap)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	local idx = 0
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 4 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700087_CSP_MONSTER_B+idx, varRet )
				
				local hp = GetHp(varMap, varRet)
				SetFubenData_Param(varMap, x700087_CSP_MONSTER_B_HP+idx, hp )
				idx = idx + 1
			end
        end
	end
end


function x700087_CreateSubBoss(varMap, varObj)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	
	local varX, z = GetWorldPos( varMap, varObj)
	
	NpcTalk(varMap, varObj, x700087_var_Talk_E,  -1)
	DeleteMonster(varMap, varObj)
	
	local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	local idx = 0
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 5 and varFlag3 == fubentype then
			for j=0,varCount -1 do

				local rx = random(-r,r)
				varX = varX + rx
				local rz = random(-r,r)
				z = z + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+1+idx, varRet)
				
				local hp = GetHp(varMap, varRet)
				SetFubenData_Param(varMap, x700087_CSP_BOSS2_HP+1, hp )
			
				idx = idx + 1
			end
        end
	end
	
	SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID, -1)
	
end

function x700087_CreateSubBoss2(varMap, varObj, ii)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	
	local varX, z = GetWorldPos( varMap, varObj)
	
	NpcTalk(varMap, varObj, x700087_var_Talk_E,  -1)
	DeleteMonster(varMap, varObj)
	
	local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	local idx = 0
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 6 and varFlag3 == fubentype then
			for j=0,varCount -1 do

				local rx = random(-r,r)
				varX = varX + rx
				local rz = random(-r,r)
				z = z + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+1+2*ii+idx, varRet)
				idx = idx + 1
			end
        end
	end
	
	SetFubenData_Param(varMap, x700087_CSP_BOSS2_ID+ii, -1)
	
end

function x700087_GetAnyPlayer(varMap)

	local humancount = GetFuben_PlayerCount(varMap)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		varPlayer = GetFubenData_Param(varMap, x700087_CSP_PLAYER_ENTER_START+varI)
		if varPlayer ~= -1 and IsPlayerStateNormal(varMap,varPlayer) == 1 then
			return varPlayer
		end
	end
	return -1
end

function x700087_IsMonsterA(varMap, monsterId)
	for varI = x700087_CSP_MONSTER_A, x700087_CSP_MONSTER_A+x700087_var_MonsterACount do
		local varId = GetFubenData_Param(varMap, varI)
		if varId ~= -1 and varId == monsterId then
			return varI
		end
	end
	
	return -1
end

function x700087_IsMonsterB(varMap, monsterId)
	for varI = x700087_CSP_MONSTER_B, x700087_CSP_MONSTER_B+x700087_var_MonsterBCount do
		local varId = GetFubenData_Param(varMap, varI)
		if varId ~= -1 and varId == monsterId then
			return varI
		end
	end
	
	return -1
end

function x700087_ProcFubenEnd(varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,65 )
	end	
	
	SetFubenData_Param(varMap, x700087_CSP_FUBEN_START, 1 )
	
		
	 x700087_CreateXianJinBoss(varMap)
	 x700087_CreateZhanCheBoss(varMap)
	 
end


function x700087_CreateSubmitNpc( varMap)

	local npc = x700087_var_SubmitNPC
	
	if npc.title~= "" then
		CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
end


function x700087_CreateXianJinBoss(varMap)
	local fubentype = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE )
	if fubentype ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700087_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700087_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700087_CSP_XIANJINBOSS, varRet )
		end
	end

	x700087_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700087_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700087_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700087_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700087_CSP_FUBENLEVEL)

	if fubenlevel < x700087_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700087_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700087_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700087_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700087_var_FileId,nIndexFrom,varI)
		if idScript == x700087_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2  then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700087_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
		x700087_ShowTipsToAll(varMap, "战车独冲之王出现！")
	end
end
