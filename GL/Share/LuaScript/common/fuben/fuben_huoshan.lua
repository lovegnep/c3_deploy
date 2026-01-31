











x700025_CSP_FUBENTYPE				= 	0
x700025_CSP_SCRIPTID				=	1
x700025_CSP_TICKCOUNT				= 	2
x700025_CSP_FROMSCENEID				= 	3
x700025_CSP_ISCLOSING				= 	4
x700025_CSP_LEAVECOUNTDOWN			= 	5
x700025_CSP_TEAMID					=	6
x700025_CSP_BACKSCENEX       		=   7
x700025_CSP_BACKSCENEZ      		=   8
x700025_CSP_FUBENLEVEL			=	9

x700025_CSP_KILLCOUNT				=	20
x700025_CSP_BOSS_ID					=   21
x700025_CSP_FUBEN_SCENE_ID			=	22

x700025_CSP_SMALL_BOSS1_ID			=	40
x700025_CSP_SMALL_BOSS2_ID			=	45
x700025_CSP_SMALL_BOSS3_ID			=	50
x700025_CSP_SMALL_BOSS4_ID			=	55
x700025_CSP_SMALL_BOSS5_ID			=	60

x700025_CSP_HUMAN_COUNT				=	240
x700025_CSP_OBJID_START				=	241
x700025_CSP_GUID_START              =   248


x700025_var_FileId 					= 700025

x700025_var_SubmitNPC                 =   { type =25017,guid= 150517,varX = 98, z=28, facedir =0, title="" }





function x700025_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

	
end







function x700025_ProcFubenSceneCreated( varMap )
	

	for varI=x700025_CSP_SMALL_BOSS1_ID, x700025_CSP_SMALL_BOSS1_ID+30 do
		SetFubenData_Param(varMap, varI, -1);
	end
	
	x700025_CreateBoss( varMap )
	x700025_CreateSmallBoss(varMap)
    x700025_CreateMonster( varMap )
		
	
end

function x700025_EnterTick(varMap, nowTickCount)
end


function x700025_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700025_CSP_FUBENLEVEL ) ;

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700025_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700025_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700025_var_FileId,nIndexFrom,varI)
		if idScript == x700025_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			
		    local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir)
			end
			
			SetFubenData_Param(varMap, x700025_CSP_BOSS_ID, varRet )
			break;
			
        end
	end

end

function x700025_CreateSmallBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700025_CSP_FUBENLEVEL ) ;

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700025_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700025_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700025_var_FileId,nIndexFrom,varI)
		if idScript == x700025_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    
			local varRet = 0;
			if title ~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir)
			end

			if varFlag==0 then
				SetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS1_ID, varRet )
			elseif varFlag==1 then
				SetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS2_ID, varRet )
			elseif varFlag==2 then
				SetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS3_ID, varRet )
			elseif varFlag==3 then
				SetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS4_ID, varRet )
			elseif varFlag==4 then
				SetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS5_ID, varRet )
			end
        end
	end

end

function x700025_CreateOneSubBoss(varMap,nBossIndex,varX,z)
	local fubenlevel = GetFubenData_Param(varMap, x700025_CSP_FUBENLEVEL ) ;

	local nObjId = GetFubenData_Param(varMap, nBossIndex ) ;

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700025_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700025_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700025_var_FileId,nIndexFrom,varI)
		if idScript == x700025_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			for j=1, 4 do
				local rx = random(-r,r)
                local tx = varX + rx
                local rz = random(-r,r)
                local tz = z + rz
				

				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, tx, tz, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, tx, tz, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir)
				end
			
				SetFubenData_Param(varMap, nBossIndex+j, varRet )
			
			end
        end
	end

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "怪物分裂"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end

function x700025_CreateTwoSubBoss(varMap,nBossIndex,varX,z)

	local fubenlevel = GetFubenData_Param(varMap, x700025_CSP_FUBENLEVEL ) ;

	local nObjId = GetFubenData_Param(varMap, nBossIndex ) ;

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700025_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700025_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700025_var_FileId,nIndexFrom,varI)
		if idScript == x700025_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			
			for j=1, 2 do
				local rx = random(-r,r)
				local tx = varX + rx
				local rz = random(-r,r)
				local tz = z + rz
				
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, tx, tz, ai, aiscript, -1, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, tx, tz, ai, aiscript, -1, -1, 21,-1,facedir)
				end
			
			end
        end
	end

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "怪物再次分裂"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end

function x700025_ProcSubBossDie(varMap,nBossIndex,varX,z)
	
	if nBossIndex<x700025_CSP_SMALL_BOSS1_ID or nBossIndex>x700025_CSP_SMALL_BOSS1_ID+30 then
		return
	end
	
	

	

	if mod((nBossIndex-x700025_CSP_SMALL_BOSS1_ID),5)==0 then
		
		x700025_CreateOneSubBoss(varMap,nBossIndex,varX,z)
		
	else
		x700025_CreateTwoSubBoss(varMap,nBossIndex,varX,z)
	end
		
end







function x700025_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700025_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700025_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700025_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700025_var_FileId,nIndexFrom,varI)
		if idScript == x700025_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		       
				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700025_var_FileId, -1, 21,-1,facedir)
				end
            end
        end
	end

end


function x700025_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700025_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700025_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	local objId1 = GetFubenData_Param(varMap, x700025_CSP_BOSS_ID)

	
	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700025_CSP_BOSS_ID,-1)
		x700025_ProcAllMonsterDead( varMap)		
		





























	end


	local objId1 = GetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS2_ID)
	local objId3 = GetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS3_ID)
	local objId4 = GetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS4_ID)
	local objId5 = GetFubenData_Param(varMap, x700025_CSP_SMALL_BOSS5_ID)


	for varI=x700025_CSP_SMALL_BOSS1_ID, x700025_CSP_SMALL_BOSS1_ID+30 do
		local nObjId = GetFubenData_Param(varMap, varI);
		if nObjId>=0 and IsObjValid(varMap,nObjId) == 1 then
			if nObjId==varPlayer then
				local varX,z =GetWorldPos(varMap,nObjId)
				SetFubenData_Param(varMap, varI,-1);
				x700025_ProcSubBossDie(varMap,varI,varX,z)
			end
		end
	end

	
end

function x700025_ProcAllMonsterDead( varMap)
	x700025_CreateSubmitNpc( varMap)
end

function x700025_CreateSubmitNpc( varMap)
	if x700025_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700025_var_SubmitNPC.type, x700025_var_SubmitNPC.varX, x700025_var_SubmitNPC.z, 3, 0, -1, x700025_var_SubmitNPC.guid, -1,-1, x700025_var_SubmitNPC.facedir,  "",x700025_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700025_var_SubmitNPC.type, x700025_var_SubmitNPC.varX, x700025_var_SubmitNPC.z, 3, 0, -1, x700025_var_SubmitNPC.guid, -1,-1, x700025_var_SubmitNPC.facedir)
	
	end
end






