----------------------------------------------------
--********************************
--	#define
--********************************
----------------------------------------------------

x700119_CSP_FUBENTYPE						= 0
x700119_CSP_SCRIPTID						=	1
x700119_CSP_TICKCOUNT						= 2
x700119_CSP_BACKSCENEID					= 3
x700119_CSP_ISCLOSING						= 4
x700119_CSP_LEAVECOUNTDOWN			= 5
x700119_CSP_TEAMID							=	6
x700119_CSP_BACKSCENEX       		= 7
x700119_CSP_BACKSCENEZ      		= 8
x700119_CSP_FUBENLEVEL					=	9

x700119_CSP_BOSS1_ID						=	22
x700119_CSP_BOSS2_ID						=	23

x700119_CSP_B_BOSS1_STATUS			=	25
x700119_CSP_BOSS1_TIME_COUNT		=	26
x700119_CSP_BOSS1_FULL_HP				=	27
x700119_CSP_B_BOSS2_STATUS			=	28
x700119_CSP_BOSS2_TIME_COUNT		=	29


x700119_CSP_HUMAN_COUNT					=	240
x700119_CSP_OBJID_START					=	241
x700119_CSP_GUID_START          = 248
x700119_CSP_FUBEN_TYPE				  =	254
x700119_CSP_FUBEN_MODE					= 255 
------------------------Scene System Setting -----------------------------------

x700119_g_ScriptId 					= 700119

x700119_g_SubmitNPC         =   { type =25023,guid= 150599,x = 60, z=60, facedir =0, title =""}

x700119_var_ask ={"回到后花园","确定"}
x700119_var_answer ={"\t你确认要离开此副本，返回后花园吗？"}

function x700119_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x700119_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x700119_g_ScriptId, x700119_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x700119_var_answer[1])
			TalkAppendButton(varMap, x700119_g_ScriptId, x700119_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
	    TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
	    TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			local desmapId = GetFubenData_Param(varMap, x700119_CSP_BACKSCENEID)
			local x = x700119_GetMD( varMap, varPlayer, MD_FUBEN_HUANGHOUHUAYUAN_X)
			local y = x700119_GetMD( varMap, varPlayer, MD_FUBEN_HUANGHOUHUAYUAN_Y)
			NewWorld( varMap, varPlayer, desmapId, x, y, x700119_g_ScriptId)
		end
end


function x700119_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x700119_g_ScriptId, x700119_var_ask[1],0,1)
end



function x700119_ShowTips(varMap, varPlayer, str)
	StartTalkTask(varMap);
	TalkAppendString(varMap,str);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end


function x700119_ShowTipsToAll(varMap, str)

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
function x700119_ProcFubenSceneCreated( varMap )
	x700119_CreateMonster(varMap)
	x700119_CreateBoss(varMap)
end

function x700119_EnterTick(varMap,nowTickCount)
	
end



function x700119_CreateBoss(varMap)
	local fubenlevel = GetFubenData_Param(varMap, x700119_CSP_FUBENLEVEL ) ;
	local fubenType = GetFubenData_Param(varMap, x700119_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700119_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID(x700119_g_ScriptId)
	
	for i = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x,z,r,ai,aiscript,flag,flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700119_g_ScriptId,nIndexFrom,i)
		if tonumber(idScript) == tonumber(x700119_g_ScriptId) and tonumber(monsterFlag) == tonumber(1) 
		and tonumber(fubenlevel) >= tonumber(levelmin) and  tonumber(fubenlevel) <= tonumber(levelmax) and tonumber(flag3) == tonumber(fubenType) then

			local nRet = -1

			if title ~="" then
				nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700119_g_ScriptId, -1, 21,-1, facedir,  "",title)
			else
				nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700119_g_ScriptId, -1, 21,-1, facedir)
			end

			if -1 == nRet then
					WriteLog(1, "x700119_CreateBoss failed")
			end

			if patrolid>=0 then
				SetPatrolId(varMap, nRet, patrolid)
			end

			if tonumber(flag) == tonumber(0) then
				SetFubenData_Param(varMap, x700119_CSP_BOSS1_ID, nRet )
			elseif tonumber(flag) == tonumber(1) then
				SetFubenData_Param(varMap, x700119_CSP_BOSS2_ID, nRet )
			end
		end
	end
end


---------------------------------------------------------------------------------------------------
--创建Monster
---------------------------------------------------------------------------------------------------
function x700119_CreateMonster(varMap)
  local fubenlevel = GetFubenData_Param(varMap, x700119_CSP_FUBENLEVEL ) ;
	local fubenType = GetFubenData_Param(varMap, x700119_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700119_g_ScriptId)
	local nDataCount = GetFubenDataCountByScriptID( x700119_g_ScriptId )

	for i = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,name,title,type,guid,x1,z1,r,ai,aiscript,flag, flag1,flag2,flag3,count,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700119_g_ScriptId,nIndexFrom,i)
		if tonumber(idScript) == tonumber(x700119_g_ScriptId) and tonumber(monsterFlag) == tonumber(0)
				and tonumber(fubenlevel) >= tonumber(levelmin) and  tonumber(fubenlevel) <= tonumber(levelmax) and tonumber(flag3) == tonumber(fubenType) then
				count = tonumber(count)
        for j=0,count -1 do
          local rx = random(-r,r)
          local x = x1 + rx
          local rz = random(-r,r)
          local z = z1 + rz

          local nRet = -1
					if title ~= "" then
						nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700119_g_ScriptId, -1, 21,-1,facedir,  "",title)
					else
						nRet = CreateMonster(varMap, type, x, z, ai, aiscript, x700119_g_ScriptId, -1, 21,-1,facedir)
					end

					if -1 == nRet then
						WriteLog(1, "x700119_CreateMonster failed")
					end

					if patrolid>=0 then
						SetPatrolId(varMap, nRet, patrolid)
					end					
				end
     end
	end

end


function x700119_ProcDie(varMap, varPlayer, varKiller)
	if varPlayer == GetFubenData_Param(varMap, x700119_CSP_BOSS1_ID) then

		SetFubenData_Param(varMap, x700119_CSP_BOSS1_ID, 0)
	elseif varPlayer == GetFubenData_Param(varMap, x700119_CSP_BOSS2_ID) then 

		SetFubenData_Param(varMap, x700119_CSP_BOSS2_ID, 0)
	end

	if GetFubenData_Param(varMap, x700119_CSP_BOSS1_ID) == 0 and
		 GetFubenData_Param(varMap, x700119_CSP_BOSS2_ID) == 0 then
		
		 x700119_CreateSubmitNpc( varMap)
		 SetFubenData_Param(varMap, x700119_CSP_BOSS1_ID, -1)
		 SetFubenData_Param(varMap, x700119_CSP_BOSS2_ID, -1) 
	end
end

function x700119_OnAllMonsterDead( varMap)
	x700119_CreateSubmitNpc( varMap)
end

function x700119_CreateSubmitNpc( varMap)
	x700119_ShowTipsToAll(varMap, "副本完成")
	if x700119_g_SubmitNPC.title ~="" then
		CreateMonster(varMap, x700119_g_SubmitNPC.type, x700119_g_SubmitNPC.x, x700119_g_SubmitNPC.z, 3, 0, -1, x700119_g_SubmitNPC.guid, -1,-1,x700119_g_SubmitNPC.facedir,  "",x700119_g_SubmitNPC.title)
	else
		CreateMonster(varMap, x700119_g_SubmitNPC.type, x700119_g_SubmitNPC.x, x700119_g_SubmitNPC.z, 3, 0, -1, x700119_g_SubmitNPC.guid, -1,-1,x700119_g_SubmitNPC.facedir)
	end
end
