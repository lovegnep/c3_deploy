











x700100_CSP_FUBENTYPE				= 	0
x700100_CSP_SCRIPTID				=	1
x700100_CSP_TICKCOUNT				= 	2
x700100_CSP_FROMSCENEID				= 	3
x700100_CSP_ISCLOSING				= 	4
x700100_CSP_LEAVECOUNTDOWN			= 	5
x700100_CSP_TEAMID					=	6
x700100_CSP_BACKSCENEX       		=   7
x700100_CSP_BACKSCENEZ      		=   8
x700100_CSP_FUBENLEVEL			=	9

x700100_CSP_KILLCOUNT				=	20
x700100_CSP_SPECIALMONSTER1			=   21
x700100_CSP_BOSS1					=   22
x700100_CSP_BOSS2					=   23
x700100_CSP_BOSS3					=   24
x700100_CSP_BOSS4					=   25
x700100_CSP_BOSS_COUNT				=   26

x700100_CSP_FUBEN_SCENE_ID			=	27

x700100_CSP_HUMAN_COUNT				=	240
x700100_CSP_OBJID_START				=	241
x700100_CSP_NEXT_SCENE				=   248
x700100_CSP_GUID_START              =   248

x700100_CSP_FUBEN_MODE				=   255 




x700100_var_FileId 					= 700100                    


x700100_var_RandomMonsterRate			=	0

x700100_var_SubmitNPC                 =   { type =25075,guid= 150531,varX = 57, z=101, facedir =0, title="" }








function x700100_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

end

function x700100_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700100_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700100_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700100_CSP_BOSS4, -1);

    x700100_CreateMonster( varMap )
	x700100_CreateBoss( varMap )
	x700100_CreateRandomMonster(varMap)
end

function x700100_EnterTick(varMap, nowTickCount)
end

function x700100_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700100_CSP_FUBENLEVEL ) ;
	SetFubenData_Param(varMap, x700100_CSP_BOSS_COUNT, 0 )


	local nIndexFrom = GetFubenDataPosByScriptID(x700100_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700100_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700100_var_FileId,nIndexFrom,varI)
		if idScript == x700100_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700100_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700100_var_FileId, -1, 21,-1,facedir)
			end

			if varFlag == 2 then
				SetFubenData_Param(varMap, x700100_CSP_SPECIALMONSTER1, varRet )
			end

			if varFlag==0 then
				SetFubenData_Param(varMap, x700100_CSP_BOSS1, varRet )
			elseif varFlag==1 then
				SetFubenData_Param(varMap, x700100_CSP_BOSS2, varRet )
			elseif varFlag==2 then
				SetFubenData_Param(varMap, x700100_CSP_BOSS3, varRet )
			end
        end
	end

end




function x700100_CreateBoss2(varMap,varX,z)

	local fubenlevel = GetFubenData_Param(varMap, x700100_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700100_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700100_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700100_var_FileId,nIndexFrom,varI)
		if idScript == x700100_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700100_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700100_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700100_CSP_BOSS4, varRet )
        end
	end

end





function x700100_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700100_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700100_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700100_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700100_var_FileId,nIndexFrom,varI)
		if idScript == x700100_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
            end
        end
	end

end

function x700100_CreateRandomMonster(varMap)



	local rate = random(0,100)/100;
	if rate>= x700100_var_RandomMonsterRate then
		return 0;
	end



	local fubenlevel = GetFubenData_Param(varMap, x700100_CSP_FUBENLEVEL ) ;


	
	local bCreated =0;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700100_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700100_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700100_var_FileId,nIndexFrom,varI)
		if idScript == x700100_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        
				local varRet = 0;
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


function x700100_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700100_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700100_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	if nDieCount== x700100_NeedKillMonster_Count then
		
	end

	local objId1 = GetFubenData_Param(varMap, x700100_CSP_SPECIALMONSTER1)
	local objId2 = GetFubenData_Param(varMap, x700100_CSP_BOSS1)
	local objId3 = GetFubenData_Param(varMap, x700100_CSP_BOSS2)
	local objId4 = GetFubenData_Param(varMap, x700100_CSP_BOSS3)
	local objId5 = GetFubenData_Param(varMap, x700100_CSP_BOSS4)








































	
	
	

	
	if objId1 == varPlayer then		
		local varX,z = GetWorldPos(varMap,objId1)
		x700100_CreateBoss2(varMap,varX,z)
	end

	if varPlayer ==objId2 or varPlayer ==objId3 or varPlayer ==objId4 or varPlayer ==objId5 then
		local nCurrentBossCount = GetFubenData_Param(varMap, x700100_CSP_BOSS_COUNT)
		SetFubenData_Param(varMap, x700100_CSP_BOSS_COUNT, nCurrentBossCount+1 )
		nCurrentBossCount = nCurrentBossCount +1
		if nCurrentBossCount>=2 then
			x700100_CreateSubmitNpc( varMap)
		end
	end
end

function x700100_ProcAllMonsterDead( varMap)
	x700100_CreateSubmitNpc( varMap)
end

function x700100_CreateSubmitNpc( varMap)
	 if x700100_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700100_var_SubmitNPC.type, x700100_var_SubmitNPC.varX, x700100_var_SubmitNPC.z, 3, 0, -1, x700100_var_SubmitNPC.guid, -1,-1,x700100_var_SubmitNPC.facedir,  "", x700100_var_SubmitNPC.title)
	 else
		CreateMonster(varMap, x700100_var_SubmitNPC.type, x700100_var_SubmitNPC.varX, x700100_var_SubmitNPC.z, 3, 0, -1, x700100_var_SubmitNPC.guid, -1,-1,x700100_var_SubmitNPC.facedir)
	 end

	 
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700100_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700100_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
	 
end





function x700100_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700100_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700100_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700100_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700100_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700100_var_FileId,nIndexFrom,varI)
		if idScript == x700100_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700100_ShowTipsToAll(varMap, "翻番宝箱出现！")
end




function x700100_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x700100_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end

