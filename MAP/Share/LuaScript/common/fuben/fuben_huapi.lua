

x700107_CSP_FUBENTYPE				= 	0
x700107_CSP_SCRIPTID				=	1
x700107_CSP_TICKCOUNT				= 	2
x700107_CSP_BACKSCENEID				= 	3
x700107_CSP_ISCLOSING				= 	4
x700107_CSP_LEAVECOUNTDOWN			= 	5
x700107_CSP_TEAMID					=	6
x700107_CSP_TICKTIME				=	7
x700107_CSP_HOLDTIME				=	8
x700107_CSP_FUBENLEVEL				=	9

x700107_CSP_FUBEN_SCENE_ID			=	10
x700107_CSP_CLOSETICK				=	11
x700107_CSP_TICKCOUNT_ADD			=	12
x700107_CSP_TICKCOUNT_SUB			=	13
x700107_CSP_B_TOPLIST_ABLE			=	14
x700107_CSP_PLAYER_DEAD				=	15


x700107_CSP_HUMAN_COUNT				=	240
x700107_CSP_PLAYER_ENTER_START		=	241

x700107_CSP_LAST_TICKOUNT			=	247
x700107_CSP_GUID_START              =   248  
x700107_CSP_FUBEN_TYPE				=	254	
x700107_CSP_FUBEN_MODE				=   255


x700107_CSP_GAME_NPC				=	49  
x700107_CSP_GAME_STEP				=	50	
x700107_CSP_BOSS_ID					=	51	
x700107_CSP_MONSTER_COUNT			=	52	
x700107_CSP_BOSS_HP					=	53
x700107_CSP_CALL_MONSTER			=	54

x700107_CSP_MONSTER_ID				=	100 


x700107_var_FileId 					= 700107

x700107_var_SubmitNPC                 = {type =55105,guid =150587,varX = 70, z=54, facedir =180, title = ""}
x700107_var_SubmitNPC2                 = {type =55107,guid =150592,varX = 70, z=54, facedir =180, title = ""} 
x700107_var_LeaveNPC					= 150586




x700107_var_BonusTab	= 	{
							{varExp = 40 , shenwang = 0.2 , inh = 0.5 , },		
							{varExp = 400, shenwang = 2,    inh = 5, },       
						}


x700107_var_BackMenu = {"回到大都·南", "确定"}
x700107_var_BackInfo = "\t你确认要离开此副本，返回大都·南吗？"
x700107_var_BackPos = {
						{128, 70},
						{128, 70},
						{128, 70},
						{128, 70},
						{128, 70},
						{128, 70}
					}
					

function x700107_ProcFubenSceneCreated( varMap )


	local humancount = GetFuben_PlayerCount(varMap)
	SetFubenData_Param(varMap, x700107_CSP_HUMAN_COUNT, humancount)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		SetFubenData_Param(varMap, x700107_CSP_PLAYER_ENTER_START+varI, humanId)
	end
	
	SetFubenData_Param(varMap, x700107_CSP_GAME_STEP, 0)
	SetFubenData_Param(varMap, x700107_CSP_BOSS_ID, -1)
	SetFubenData_Param(varMap, x700107_CSP_MONSTER_COUNT, 0)
	SetFubenData_Param(varMap, x700107_CSP_BOSS_HP, 0)
	SetFubenData_Param(varMap, x700107_CSP_CALL_MONSTER, -1)
	
	local weekIndex = GetWeekIndex()
	local varHumanCount = GetScenePlayerCount( varMap)
	if varHumanCount > 0 then
	    for varI = 0, varHumanCount do
	        local varObj = GetScenePlayerObjId( varMap,varI)
	        if varObj >= 0 then
	        	SetPlayerGameData(varMap, varObj, MD_FUBEN_HUAPI_FLAG[1], MD_FUBEN_HUAPI_FLAG[2], MD_FUBEN_HUAPI_FLAG[3], 0)
	        end
		end
	end
	
	x700107_CreateSubmitNpc2(varMap)
end


function x700107_EnterTick(varMap, nowTickCount)


	
	if nowTickCount == 1 then
		NpcTalk(varMap, FindMonsterByGUID(varMap, x700107_var_LeaveNPC), "挑战分三个阶段，四周的通道内会涌出各种喽罗阻碍你对BOSS的进攻，不提防特殊怪物可能会吃亏哦！",  -1)
	end
	
	local step = GetFubenData_Param(varMap, x700107_CSP_GAME_STEP)
	local varObj = GetFubenData_Param(varMap, x700107_CSP_BOSS_ID)
	
	if nowTickCount == 2 then
		SetFubenData_Param(varMap, x700107_CSP_CALL_MONSTER, 0)
		x700107_CreateBoss(varMap, 0)
	end
	
	if GetFubenData_Param(varMap, x700107_CSP_CALL_MONSTER) == 0 and varObj ~= -1 then
		local maxhp = GetFubenData_Param(varMap, x700107_CSP_BOSS_HP)
		local hp = GetHp(varMap, varObj)
		if hp/maxhp < 0.7 then
		
			SetFubenData_Param(varMap, x700107_CSP_CALL_MONSTER, 1)
			x700107_CreateMonster(varMap, step)
			
			if step == 0 then
				NpcTalk(varMap, varObj, "小的们，来人了！",  -1)
			elseif step == 1 then
				NpcTalk(varMap, varObj, "小的们，带上武器吧！",  -1)
			elseif step == 2 then
				NpcTalk(varMap, varObj, "小的们，我快扛不住了！",  -1)
			end
		end
	end
	
	if step == 1 and varObj ~= -1 then
	
	
		local objId1 = GetFubenData_Param(varMap, x700107_CSP_GAME_NPC)
		local objId2 = FindMonsterByGUID(varMap, x700107_var_LeaveNPC)
	
	
		local humancount = GetFuben_PlayerCount(varMap)
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI)
			if humanId ~= -1 and IsPlayerStateNormal(varMap,humanId) == 1 and IsInDist(varMap, humanId, varObj, 10) == 1 then
				
				local Num = GetNearObjCount(varMap, humanId, 5, 0, humanId)
				if Num > 0 then
					for j = 0, Num-1 do
						local monsterId = GetNearMonster(varMap, humanId,j)
						if monsterId ~= varObj and IsObjValid(varMap,monsterId) == 1 and GetHp(varMap,monsterId) > 0 and objId1 ~= monsterId and objId2 ~= monsterId then
						
							
							local hp = GetHp(varMap, humanId)
							SetHp(varMap, humanId, -3000)
							
							DeleteMonster(varMap, monsterId)
							break
						end
					end
				end
			end
		end
	end
	
	if step == 2 and varObj ~= -1 then
		local objId1 = GetFubenData_Param(varMap, x700107_CSP_GAME_NPC)
		local objId2 = FindMonsterByGUID(varMap, x700107_var_LeaveNPC)
		local maxhp = GetFubenData_Param(varMap, x700107_CSP_BOSS_HP)
		local hp = GetHp(varMap, varObj)
		if hp/maxhp < 0.7 then
			local humancount = GetFuben_PlayerCount(varMap)
			for	varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI)
				if humanId ~= -1 and IsPlayerStateNormal(varMap,humanId) == 1 then
				
					local Num = GetNearObjCount(varMap, humanId, 10, 0, varObj)
					if Num > 0 then
						for j = 0, Num-1 do
							local monsterId = GetNearMonster(varMap, humanId,j)
							if monsterId ~= varObj and IsObjValid(varMap,monsterId) == 1 and GetHp(varMap,monsterId) > 0 and monsterId ~= objId1 and monsterId ~= objId2 then
								local addhp = maxhp*0.3
								if hp+addhp > maxhp*0.8 then
									addhp = maxhp*0.8-hp
								end
								
								SetHp(varMap, varObj, addhp)
								
								break
							end
						end
					end
					break
				end
			end
		end	
	end
end

function x700107_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x700107_var_FileId, x700107_var_BackMenu[1],0,1)
end


function x700107_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
	if varIndex == 0 then
		StartTalkTask(varMap)
			TalkAppendButton(varMap, x700107_var_FileId, x700107_var_BackMenu[1],0,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif varIndex == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x700107_var_BackInfo)
			TalkAppendButton(varMap, x700107_var_FileId, x700107_var_BackMenu[2],0,2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif varIndex == 2 then
        TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
        TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
        local pos = x700107_var_BackPos[random(1, 6)]
		NewWorld( varMap, varPlayer, 36, pos[1], pos[2], 700107)
	end
end


function x700107_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	
end


function x700107_ProcAreaLeaved(varMap, varPlayer, varArea, varQuest)

end



function x700107_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	
end


function x700107_ProcDie(varMap, varPlayer, varKiller)
	
	if GetFubenData_Param(varMap, x700107_CSP_BOSS_ID) == varPlayer then
		local varMonsterCount = GetFubenData_Param(varMap, x700107_CSP_MONSTER_COUNT)
		for varI = 0, varMonsterCount-1 do
			local varObj = GetFubenData_Param(varMap, x700107_CSP_MONSTER_ID+varI)
			if varObj ~= -1 then
				DeleteMonster(varMap, varObj)
			end
		end
		
		SetFubenData_Param(varMap, x700107_CSP_MONSTER_COUNT, 0)
		
		local step = GetFubenData_Param(varMap, x700107_CSP_GAME_STEP)
		if step ~= 2 then
			SetFubenData_Param(varMap, x700107_CSP_GAME_STEP, step+1)
			x700107_CreateBoss(varMap, step+1)
			SetFubenData_Param(varMap, x700107_CSP_CALL_MONSTER, 0)
		else
			SetFubenData_Param(varMap, x700107_CSP_BOSS_ID, -1)
			x700107_CreateSubmitNpc(varMap)
			
			x700107_ShowTipsToAll(varMap, "顺利击杀牛魔，副本完成，请退出副本。")
		end
		
		local humancount = GetFuben_PlayerCount(varMap)
		for varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI)
			local varLevel =GetLevel( varMap, humanId)
			local mutli = 1
			if IsHaveSpecificImpact( varMap, humanId, 7510) == 1 or IsHaveSpecificImpact( varMap, humanId, 7511) == 1
				or IsHaveSpecificImpact( varMap, humanId, 9007) == 1 then 
				mutli = mutli+1
			end
			if IsHaveSpecificImpact( varMap, humanId, 9015) == 1 then
				mutli = mutli+1
			end
			if IsHaveSpecificImpact( varMap, humanId, 9012) == 1 then 
				mutli =  mutli + 0.20
			end
			local inh =  floor(varLevel*x700107_var_BonusTab[2].inh*mutli)
			local refixInh = AddInherenceExp(varMap, humanId, inh)
			local varMsg = format("你获得了%d点天赋值。",refixInh)
			Msg2Player(varMap, humanId, varMsg, 0, 2)
			Msg2Player(varMap, humanId, varMsg, 0, 3)
		end
        					
		
	else
		local varMonsterCount = GetFubenData_Param(varMap, x700107_CSP_MONSTER_COUNT)
		for varI = 0, varMonsterCount-1 do
			local varObj = GetFubenData_Param(varMap, x700107_CSP_MONSTER_ID+varI)
			if varObj ~= -1 and varObj == varPlayer then
				SetFubenData_Param(varMap, x700107_CSP_MONSTER_ID+varI, -1)
				
				local humancount = GetFuben_PlayerCount(varMap)
				for varI = 0, humancount - 1 do
					local humanId = GetFuben_PlayerObjId(varMap, varI)
					local varLevel =GetLevel( varMap, humanId)
					local mutli = 1
					if IsHaveSpecificImpact( varMap, humanId, 7510) == 1 or IsHaveSpecificImpact( varMap, humanId, 7511) == 1
						or IsHaveSpecificImpact( varMap, humanId, 9007) == 1 then 
						mutli = mutli+1
					end
					if IsHaveSpecificImpact( varMap, humanId, 9015) == 1 then
						mutli = mutli+1
					end
					if IsHaveSpecificImpact( varMap, humanId, 9012) == 1 then 
						mutli =  mutli + 0.20
					end
					local inh =  floor(varLevel*x700107_var_BonusTab[1].inh*mutli)
					local refixInh = AddInherenceExp(varMap, humanId, inh)
					local varMsg = format("你获得了%d点天赋值。",refixInh)
					Msg2Player(varMap, humanId, varMsg, 0, 2)
					Msg2Player(varMap, humanId, varMsg, 0, 3)
				end
				return
			end
		end
	end 
end


function x700107_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)

	for varI = 0, humancount - 1 do
	
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		Msg2Player(varMap, humanId, varStr, 8, 3)
	end
end


function x700107_CreateSubmitNpc(varMap)

	local varObj = GetFubenData_Param(varMap, x700107_CSP_GAME_NPC)
	if varObj ~= -1 then
		DeleteMonster(varMap, varObj)
	end

	local npc = x700107_var_SubmitNPC
	
	local varRet
	if npc.title~= "" then
		varRet = CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		varRet = CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
	
	x700107_CreateXianJinBoss(varMap)
end


function x700107_CreateSubmitNpc2(varMap)

	local npc = x700107_var_SubmitNPC2
	
	local varRet
	if npc.title~= "" then
		varRet = CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		varRet = CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
	
	SetFubenData_Param(varMap, x700107_CSP_GAME_NPC, varRet)
end


function x700107_CreateBoss(varMap, step)
	local fubentype = GetFubenData_Param(varMap, x700107_CSP_FUBEN_TYPE )
    local fubenlevel = GetFubenData_Param(varMap, x700107_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x700107_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700107_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700107_var_FileId,nIndexFrom,varI)
		if idScript == x700107_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == step and varFlag3 == fubentype then
		
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700107_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700107_var_FileId, -1, 21,-1,facedir)
			end
			
			SetFubenData_Param(varMap, x700107_CSP_BOSS_ID, varRet )
			
			local hp = GetHp(varMap, varRet)
			SetFubenData_Param(varMap, x700107_CSP_BOSS_HP, hp )
					local humancount = GetFuben_PlayerCount(varMap);
					if humancount >= 1 then
						local varPlayer = GetFuben_PlayerObjId(varMap, 0);
						GamePlayScriptLog(varMap, varPlayer, 1204)
					end
        end
	end
end


function x700107_CreateMonster(varMap, step)
	local fubentype = GetFubenData_Param(varMap, x700107_CSP_FUBEN_TYPE )
    local fubenlevel = GetFubenData_Param(varMap, x700107_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x700107_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700107_var_FileId )
	
	local varMonsterCount = 0
	
	local varIndex = 0
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700107_var_FileId,nIndexFrom,varI)
		if idScript == x700107_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 3+step and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				
				local varRet = 0
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700107_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700107_var_FileId, -1, 21,-1,facedir)
				end
				
				SetFubenData_Param(varMap, x700107_CSP_MONSTER_ID+varIndex, varRet )
				varIndex = varIndex+1
				SetPatrolId(varMap, varRet, 0)
				varMonsterCount = varMonsterCount+1
				local humancount = GetFuben_PlayerCount(varMap);
					if humancount >= 1 then
						local varPlayer = GetFuben_PlayerObjId(varMap, 0);
						GamePlayScriptLog(varMap, varPlayer, 1203)
					end
			end
        end
	end
	
	SetFubenData_Param(varMap, x700107_CSP_MONSTER_COUNT, varMonsterCount)
end


function x700107_CreateXianJinBoss(varMap)
	local fubentype = GetFubenData_Param(varMap, x700107_CSP_FUBEN_TYPE )
	if fubentype ~= 0 then
		
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700107_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
		
	end

	local fubenlevel = GetFubenData_Param(varMap, x700107_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700107_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700107_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700107_var_FileId,nIndexFrom,varI)
		if idScript == x700107_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700107_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700107_var_FileId, -1, 21,-1,facedir)
			end
					local humancount = GetFuben_PlayerCount(varMap);
					if humancount >= 1 then
						local varPlayer = GetFuben_PlayerObjId(varMap, 0);
						GamePlayScriptLog(varMap, varPlayer, 1205)
					end
			
		end
	end

	
end
