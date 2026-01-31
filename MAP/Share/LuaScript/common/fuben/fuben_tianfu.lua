

x710000_CSP_FUBENTYPE				= 	0
x710000_CSP_SCRIPTID				=	1
x710000_CSP_TICKCOUNT				= 	2
x710000_CSP_BACKSCENEID				= 	3
x710000_CSP_ISCLOSING				= 	4
x710000_CSP_LEAVECOUNTDOWN			= 	5
x710000_CSP_TEAMID					=	6
x710000_CSP_TICKTIME				=	7
x710000_CSP_HOLDTIME				=	8
x710000_CSP_FUBENLEVEL				=	9

x710000_CSP_FUBEN_SCENE_ID			=	10
x710000_CSP_CLOSETICK				=	11
x710000_CSP_TICKCOUNT_ADD			=	12
x710000_CSP_TICKCOUNT_SUB			=	13
x710000_CSP_B_TOPLIST_ABLE			=	14
x710000_CSP_PLAYER_DEAD				=	15


x710000_CSP_HUMAN_COUNT				=	240
x710000_CSP_PLAYER_ENTER_START		=	241

x710000_CSP_LAST_TICKOUNT			=	247
x710000_CSP_GUID_START              =   248  
x710000_CSP_FUBEN_TYPE				=	254	
x710000_CSP_FUBEN_MODE				=   255


x710000_CSP_GAME_STEP				=	50	
x710000_CSP_BOSS_TIME				=	51	
x710000_CSP_MONSTER_COUNT			=	52	
x710000_CSP_CURRENT_BOSS			=	53	

x710000_CSP_BOSS_ID					=	100 


x710000_var_FileId 					= 710000

x710000_var_SubmitNPC                 = {type =47037,guid= 150567,varX = 65, z=50, facedir =180, title = ""}
x710000_var_LeaveNPC					= 150571

x710000_var_arrArea					= {Left = 64,Top = 27,Right = 73,Bottom = 35} 



function x710000_ProcFubenSceneCreated( varMap )


	local humancount = GetFuben_PlayerCount(varMap)
	SetFubenData_Param(varMap, x710000_CSP_HUMAN_COUNT, humancount)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		SetFubenData_Param(varMap, x710000_CSP_PLAYER_ENTER_START+varI, humanId)
	end
	
	SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 0)
	SetFubenData_Param(varMap, x710000_CSP_BOSS_TIME, -1)
	SetFubenData_Param(varMap, x710000_CSP_MONSTER_COUNT, 0)
	SetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS, -1)
	
	x710000_CreateBoss(varMap)
	x710000_CreateMonsterB(varMap)
end


function x710000_EnterTick(varMap, nowTickCount)


	
	local step = GetFubenData_Param(varMap, x710000_CSP_GAME_STEP)
	
	if step == 1 then
		local varIndex = x710000_SelectBoss(varMap)
		if varIndex == -1 then
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 5)
			x710000_ShowTipsToAll(varMap, "完成任务")
		else
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 2)
			SetFubenData_Param(varMap, x710000_CSP_BOSS_TIME, nowTickCount)
			x710000_CreateOneBoss(varMap, varIndex)
		end
	elseif step == 2 then
		if GetFubenData_Param(varMap, x710000_CSP_PLAYER_DEAD) >= 6 then
			local varObj = GetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS)
			if varObj ~= -1 then
				NpcTalk(varMap, varObj, "死亡是一种懦弱，你们的表现太让人失望了！",  -1)
			end
			
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 5)
		elseif GetFubenData_Param(varMap, x710000_CSP_BOSS_TIME)+24 <= nowTickCount then
			local varObj = GetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS)
			if varObj ~= -1 then
				NpcTalk(varMap, varObj, "你们还需多加练习！",  -1)
			end
			
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 5)
		end
	elseif step == 3 then
		if random(1, 100) < 30 then
			NpcTalk(varMap, FindMonsterByGUID(varMap, x710000_var_LeaveNPC), "中场休息！中场休息！",  -1)
			
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 4)
			x710000_CreateMonsterA(varMap)
		else
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 1)
		end
	
	elseif step == 5 then
		local varObj = GetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS)
		if varObj ~= -1 then
			DeleteMonster(varMap, varObj)
			SetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS, -1)
		end
	end
end


function x710000_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
		if varIndex == 0 then
			if GetFubenData_Param(varMap, x710000_CSP_GAME_STEP) == 5 then
				StartTalkTask(varMap)
				TalkAppendButton(varMap, 710000, "回到王城",0,1)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			end
		elseif varIndex == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t你确认要离开此副本，返回王城吗？")
			TalkAppendButton(varMap, 710000, "确定",0,2)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif varIndex == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
				NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), 710000)
			elseif selfcountry ==1 then
				NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), 710000)
			elseif selfcountry ==2 then
				NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), 710000)
			elseif selfcountry ==3 then
				NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), 710000)
			end
		end
end


function x710000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	if GetFubenData_Param(varMap, x710000_CSP_GAME_STEP) == 0 then
		SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 1)
		
		x710000_CreateSubmitNpc( varMap)
		NpcTalk(varMap, FindMonsterByGUID(varMap, x710000_var_LeaveNPC), "您们将于12个技能大师进行比武, 看看你们技能修行情况, 祝你们好运！",  -1)
		
		AddSceneTempImpassable(varMap,x710000_var_arrArea.Left,x710000_var_arrArea.Top,x710000_var_arrArea.Right,x710000_var_arrArea.Bottom)
		
		local humancount = GetFuben_PlayerCount(varMap)
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI)
			LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, humanId, 30)
			LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, humanId, 31)
		end
	end
end


function x710000_ProcAreaLeaved(varMap, varPlayer, varArea, varQuest)

end



function x710000_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	
end


function x710000_ProcDie(varMap, varPlayer, varKiller)
	
	if GetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS) == varPlayer then
		if GetFubenData_Param(varMap, x710000_CSP_GAME_STEP) == 2 then
			SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 3)
			SetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS, -1)
			x710000_ShowTipsToAll(varMap, "顺利击杀")
		end
	else
		if GetFubenData_Param(varMap, x710000_CSP_GAME_STEP) == 4 then
			local varMonsterCount = GetFubenData_Param(varMap, x710000_CSP_MONSTER_COUNT)
			SetFubenData_Param(varMap, x710000_CSP_MONSTER_COUNT, varMonsterCount-1)
			
			if varMonsterCount == 1 then
				SetFubenData_Param(varMap, x710000_CSP_GAME_STEP, 1)
			end
		end
	end 
end


function x710000_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)

	for varI = 0, humancount - 1 do
	
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		Msg2Player(varMap, humanId, varStr, 8, 3)
	end
end


function x710000_CreateSubmitNpc( varMap)

	local npc = x710000_var_SubmitNPC
	
	local varRet
	if npc.title~= "" then
		varRet = CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		varRet = CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
	
	SetPatrolId(varMap, varRet, 1)
end


function x710000_CreateBoss(varMap)
	local fubentype = GetFubenData_Param(varMap, x710000_CSP_FUBEN_TYPE )
    local fubenlevel = GetFubenData_Param(varMap, x710000_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x710000_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x710000_var_FileId )
	
	local idx = 0
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x710000_var_FileId,nIndexFrom,varI)
		if idScript == x710000_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 0 and varFlag3 == fubentype then
		
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x710000_var_FileId, -1, -1,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x710000_var_FileId, -1, -1,-1,facedir)
			end
			
			SetFubenData_Param(varMap, x710000_CSP_BOSS_ID+idx, varRet )
			idx = idx+1
        end
	end
end


function x710000_SelectBoss(varMap)
	local boss = {}
	for varI = 0, 11 do
		boss[varI+1] = GetFubenData_Param(varMap, x710000_CSP_BOSS_ID+varI)
	end
	
	local varRet = -1
	local varI = random(1, 12)
	local j = varI
	repeat
		if boss[varI] ~= -1 then
			varRet = varI
			break
		end
		
		varI = varI+1
		if varI == 13 then
			varI = 1
		end
	until j ~= varI
	
	return varRet
end


function x710000_CreateOneBoss(varMap, varIndex)

	
	local obj = GetFubenData_Param(varMap, x710000_CSP_BOSS_ID+varIndex-1)
	if obj == -1 then
		return
	end
	DeleteMonster(varMap, obj)

	local fubentype = GetFubenData_Param(varMap, x710000_CSP_FUBEN_TYPE )
    local fubenlevel = GetFubenData_Param(varMap, x710000_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x710000_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x710000_var_FileId )
	
	local rnd = random(0,2)
	local idx = 1
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x710000_var_FileId,nIndexFrom,varI)
		if idScript == x710000_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == rnd and varFlag3 == fubentype then
			if  varIndex == idx then
				for j=0,varCount -1 do

					local varRet = 0;
					if title ~="" then
						varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x710000_var_FileId, -1, 21,-1,facedir, "",title)
					else
						varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x710000_var_FileId, -1, 21,-1,facedir)
					end
					
					SetFubenData_Param(varMap, x710000_CSP_CURRENT_BOSS, varRet)
					
					SetPatrolId(varMap, varRet, 0)
				end
				return
			else
				idx = idx+1
			end
        end
	end
end


function x710000_CreateMonsterA(varMap)
	local fubentype = GetFubenData_Param(varMap, x710000_CSP_FUBEN_TYPE )
    local fubenlevel = GetFubenData_Param(varMap, x710000_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x710000_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x710000_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x710000_var_FileId,nIndexFrom,varI)
		if idScript == x710000_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 3 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x710000_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x710000_var_FileId, -1, 21,-1,facedir)
				end
				
				SetPatrolId(varMap, varRet, 0)
				
				local varMonsterCount = GetFubenData_Param(varMap, x710000_CSP_MONSTER_COUNT)
				SetFubenData_Param(varMap, x710000_CSP_MONSTER_COUNT, varMonsterCount+1)
			end
        end
	end
end


function x710000_CreateMonsterB(varMap)
	local fubentype = GetFubenData_Param(varMap, x710000_CSP_FUBEN_TYPE )
    local fubenlevel = GetFubenData_Param(varMap, x710000_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x710000_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x710000_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x710000_var_FileId,nIndexFrom,varI)
		if idScript == x710000_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 4 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x710000_var_FileId, -1, -1,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x710000_var_FileId, -1, -1,-1,facedir)
				end
			end
        end
	end
end
