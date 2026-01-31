----------------------------------------------------
--********************************
--	#define
--********************************
----------------------------------------------------

x700117_CSP_FUBENTYPE						= 0
x700117_CSP_SCRIPTID						=	1
x700117_CSP_TICKCOUNT						= 2
x700117_CSP_FROMSCENEID					= 3
x700117_CSP_ISCLOSING						= 4
x700117_CSP_LEAVECOUNTDOWN			= 5
x700117_CSP_TEAMID							=	6
x700117_CSP_BACKSCENEX       		= 7
x700117_CSP_BACKSCENEZ      		= 8
x700117_CSP_FUBENLEVEL					=	9

x700117_CSP_BOSS1_ID						=	22
x700117_CSP_BOSS2_ID						=	23

x700117_CSP_B_BOSS1_STATUS			=	25
x700117_CSP_BOSS1_TIME_COUNT		=	26
x700117_CSP_BOSS1_FULL_HP				=	27
x700117_CSP_B_BOSS2_STATUS			=	28
x700117_CSP_BOSS2_TIME_COUNT		=	29


x700117_CSP_HUMAN_COUNT					=	240
x700117_CSP_OBJID_START					=	241
x700117_CSP_GUID_START          = 248

x700117_CSP_FUBEN_MODE					= 255 
------------------------Scene System Setting -----------------------------------

x700117_g_ScriptId 					= 700117

x700117_g_SubmitNPC         =   { type =25023,guid= 150523,x = 60, z=60, facedir =0, title =""}



-------------------------
--***********************
--ProcEventEntry
--***********************
-------------------------
function x700117_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

end


function x700117_ShowTips(varMap, varPlayer, str)
	StartTalkTask(varMap);
		TalkAppendString(varMap,str);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end


function x700117_ShowTipsToAll(varMap, str)

	local humancount = GetFuben_PlayerCount(varMap);

	--通知玩家
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,str);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

-----------------------------------------------------------
--*********************************************************
--OnFubenSceneCreated  :  当副本创建成功时， 开始刷怪和npc
--*********************************************************
-----------------------------------------------------------
function x700117_ProcFubenSceneCreated ( varMap )

	x700117_CreateMonster( varMap )
	x700117_CreateBoss( varMap, 3 )
end

function x700117_EnterTick(varMap,nowTickCount)
	
end



function x700117_CreateBoss(varMap, nFlag)

	local fubenlevel = GetFubenData_Param(varMap, x700117_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700117_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID(x700117_g_ScriptId)
	
	for i = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x,z,r,ai,aiscript,flag,flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700117_g_ScriptId,nIndexFrom,i)
		if idScript == x700117_g_ScriptId and monsterFlag == 1 then
			if nFlag== flag or nFlag>=3 then
				local nRet = 0
				if title ~="" then
					nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700117_g_ScriptId, -1, 21,-1, facedir,  "",title)
				else
					nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700117_g_ScriptId, -1, 21,-1, facedir)
				
				end
					if patrolid>=0 then
						SetPatrolId(varMap, nRet, patrolid)
					end				
				if flag == 0 then
				
					SetFubenData_Param(varMap, x700117_CSP_BOSS1_ID, nRet )
					SetFubenData_Param(varMap, x700117_CSP_B_BOSS1_STATUS, 1 )
					SetFubenData_Param(varMap, x700117_CSP_BOSS1_TIME_COUNT, 0 )
				elseif flag == 1 then
					
					SetFubenData_Param(varMap, x700117_CSP_BOSS2_ID, nRet )
					SetFubenData_Param(varMap, x700117_CSP_B_BOSS2_STATUS, 1 )
					SetFubenData_Param(varMap, x700117_CSP_BOSS2_TIME_COUNT, 0 )
				end
				
			end
		end
	end

end


---------------------------------------------------------------------------------------------------
--创建Monster
---------------------------------------------------------------------------------------------------
function x700117_CreateMonster(varMap)

  local fubenlevel = GetFubenData_Param(varMap, x700117_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700117_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID( x700117_g_ScriptId )
	
	for i = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x1,z1,r,ai,aiscript,flag, flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700117_g_ScriptId,nIndexFrom,i)
		if idScript == x700117_g_ScriptId and monsterFlag == 0 then
				
        for j=0,count -1 do
          local rx = random(-r,r)
          local x = x1 + rx
          local rz = random(-r,r)
          local z = z1 + rz
          
          local nRet = 0
					if title ~= "" then
						nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700117_g_ScriptId, -1, 21,-1,facedir,  "",title)
					else
						nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700117_g_ScriptId, -1, 21,-1,facedir)
					end
					if patrolid>=0 then
						SetPatrolId(varMap, nRet, patrolid)
					end					
				end
     end
	end

end


function x700117_ProcDie(varMap, varPlayer, varKiller)

	if varPlayer == GetFubenData_Param(varMap, x700117_CSP_BOSS1_ID) then

		SetFubenData_Param(varMap, x700117_CSP_BOSS1_ID, 0)
	elseif varPlayer == GetFubenData_Param(varMap, x700117_CSP_BOSS2_ID) then 

		SetFubenData_Param(varMap, x700117_CSP_BOSS2_ID, 0)
	end
	
	if GetFubenData_Param(varMap, x700117_CSP_BOSS1_ID) == 0 and
		 GetFubenData_Param(varMap, x700117_CSP_BOSS2_ID) == 0 then
		
		 x700117_CreateSubmitNpc( varMap)
		 SetFubenData_Param(varMap, x700117_CSP_BOSS1_ID, -1)
		 SetFubenData_Param(varMap, x700117_CSP_BOSS2_ID, -1) 
	end
	
end

function x700117_OnAllMonsterDead( varMap)
	x700117_CreateSubmitNpc( varMap)
end

function x700117_CreateSubmitNpc( varMap)
	x700117_ShowTipsToAll(varMap, "副本完成")
	if x700117_g_SubmitNPC.title ~="" then
		CreateMonster(varMap, x700117_g_SubmitNPC.type, x700117_g_SubmitNPC.x, x700117_g_SubmitNPC.z, 3, 0, -1, x700117_g_SubmitNPC.guid, -1,-1,x700117_g_SubmitNPC.facedir,  "",x700117_g_SubmitNPC.title)
	else
		CreateMonster(varMap, x700117_g_SubmitNPC.type, x700117_g_SubmitNPC.x, x700117_g_SubmitNPC.z, 3, 0, -1, x700117_g_SubmitNPC.guid, -1,-1,x700117_g_SubmitNPC.facedir)
	end

end
