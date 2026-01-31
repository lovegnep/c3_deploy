











x700023_CSP_FUBENTYPE				= 	0
x700023_CSP_SCRIPTID				=	1
x700023_CSP_TICKCOUNT				= 	2
x700023_CSP_FROMSCENEID				= 	3
x700023_CSP_ISCLOSING				= 	4
x700023_CSP_LEAVECOUNTDOWN			= 	5
x700023_CSP_TEAMID					=	6
x700023_CSP_BACKSCENEX       		=   7
x700023_CSP_BACKSCENEZ      		=   8
x700023_CSP_FUBENLEVEL			=	9

x700023_CSP_KILLCOUNT				=	20
x700023_CSP_FUBEN_SCENE_ID			=	21
x700023_CSP_BOSS1_ID				=	22
x700023_CSP_BOSS2_ID				=	23
x700023_CSP_BOSS1_FULL_HP			=	24
x700023_CSP_BOSS1_LOADMONSTER		=   25
x700023_CSP_BOSS3_ID				=	26
x700023_CSP_BOSS3_FLAG				=	27

x700023_CSP_CHILD_COUNT				=	40
x700023_CSP_CHILD_ID_START			=	41

x700023_CSP_PATROL_MONSTER_COUNT	=	70
x700023_CSP_PATROL_MONSTER_FULL_HP	=	71
x700023_CSP_PATROL_MONSTER_START	=	72

x700023_CSP_HUMAN_COUNT				=	240
x700023_CSP_OBJID_START				=	241

x700023_CSP_GUID_START              =   248  
x700023_CSP_FUBEN_TYPE				=	254	

x700023_CSP_FUBEN_MODE				=   255 



x700023_var_FileId 					= 700023


x700023_var_ProceTime_Child_Count		=	2                       
x700023_var_Max_Child_Count			=	20                      
x700023_var_BuffId					=	13503                   


x700023_var_SubmitNPC                 =   { type =25003,guid= 150503,varX = 98, z=25, facedir =0, title = "" }










function x700023_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
end


function x700023_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700023_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700023_ProcFubenSceneCreated( varMap )
	

	SetFubenData_Param(varMap, x700023_CSP_BOSS3_FLAG,-1) 

	x700023_CreateMonster( varMap )
	x700023_CreateBoss( varMap )
    x700023_CreatePatrolMonster( varMap )

	
		
end



function x700023_EnterTick(varMap,nowTickCount)

	if nowTickCount >= 2 then
		local nBoss1 = GetFubenData_Param(varMap, x700023_CSP_BOSS1_ID )
		
		if nBoss1>=0 then
			local humancount = GetFuben_PlayerCount(varMap);
			if humancount>0 then
				local nCurrentHp = GetHp( varMap, nBoss1 )
				local nFullHp = GetFubenData_Param(varMap, x700023_CSP_BOSS1_FULL_HP )
				
				local bCreatedSubMonster = GetFubenData_Param(varMap, x700023_CSP_BOSS1_LOADMONSTER )
				
				if nFullHp>0 then
					if nCurrentHp/nFullHp <0.9 then
						if bCreatedSubMonster<=0 then
							x700023_CreateBoss2(varMap)
						end
					end
				end
			end
		end
	end

	local nBoss3Flag = GetFubenData_Param(varMap, x700023_CSP_BOSS3_FLAG) ;
	if nBoss3Flag>0 then
		if mod(nowTickCount,6) ==0 then  
			x700023_CreateChildDragon(varMap, x700023_var_ProceTime_Child_Count)
		end
	end

	local varCount = GetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_COUNT)
	local nCount_dup = varCount;
	local nFullHp = GetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_FULL_HP)
	for varI=0, varCount-1 do
		local nObjId = GetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_START+varI)
		if nObjId>=0 then
			local nCurrentHp = GetHp( varMap, nObjId )
			if nCurrentHp/nFullHp<=0.2 then
				SetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_START+varI,-1)
				
				local varX,z =GetWorldPos(varMap,nObjId)
				DeleteMonster( varMap,nObjId )
				x700023_CreateChangeMonster(varMap,varX,z)
				
			end
		end
	end

	for varI=0, varCount-1 do
		local nObjId = GetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_START+varI)
		
		if nObjId ==-1 then
		
			x700023_ArrayDeleteByIndex(varMap,x700023_CSP_PATROL_MONSTER_START,varCount,varI)
			nCount_dup = nCount_dup -1;
			
		end
	end

	SetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_COUNT,nCount_dup )

	
end

function x700023_ArrayDeleteByIndex(varMap,arrayId,arrayLen, varIndex)
	if arrayLen< varIndex+1 then
		return
	end

	if arrayLen<=0 or varIndex<0 then
		return
	end

	for varI=varIndex, arrayLen-2 do
		local nNextValue = GetFubenData_Param(varMap, arrayId+varI+1)
		SetFubenData_Param(varMap, arrayId+varI,nNextValue)
	end
	
end

function x700023_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;

	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir)
				
			end
			if varFlag ==0 then
				SetFubenData_Param(varMap, x700023_CSP_BOSS1_ID, varRet ) ;
				local nFullHp = GetHp( varMap, varRet )
				SetFubenData_Param(varMap, x700023_CSP_BOSS1_FULL_HP, nFullHp )
				SetFubenData_Param(varMap, x700023_CSP_BOSS1_LOADMONSTER, 0 )
			elseif varFlag ==1 then
				SetFubenData_Param(varMap, x700023_CSP_BOSS2_ID, varRet ) ;
			end
        end
	end

end




function x700023_CreateBoss2(varMap)

	local bCreatedSubMonster = GetFubenData_Param(varMap, x700023_CSP_BOSS1_LOADMONSTER )

	if bCreatedSubMonster>0 then
		return 0;
	end

	

	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700023_CSP_BOSS3_ID, varRet ) ;
			SetFubenData_Param(varMap, x700023_CSP_BOSS3_FLAG, 1 ) ;
			break;
        end
	end

	SetFubenData_Param(varMap, x700023_CSP_BOSS1_LOADMONSTER, 1 )

	local humancount = GetFuben_PlayerCount(varMap);
	
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "龙蛋出现";
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end





function x700023_CreateChildDragon(varMap, varCount)  

	local nCurrentChildCount = GetFubenData_Param(varMap, x700023_CSP_CHILD_COUNT ) ;
	if (nCurrentChildCount+varCount)>x700023_var_Max_Child_Count then
		return
	end

	

    local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;

	local iFlag =0
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir)
				
				end
				SetFubenData_Param(varMap, x700023_CSP_CHILD_ID_START+nCurrentChildCount+iFlag, varRet)
				iFlag = iFlag+1
				SetPatrolId(varMap, varRet, 2)
            end
			break;
        end
	end

	SetFubenData_Param(varMap, x700023_CSP_CHILD_COUNT, nCurrentChildCount+varCount)

	local humancount = GetFuben_PlayerCount(varMap);
	
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = format("%d怪物出现， 地图上总%d 只",varCount,nCurrentChildCount+varCount);
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end

end



function x700023_CreatePatrolMonster(varMap)
	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;

	local nCount =0;
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir)
				
				end
				SetPatrolId(varMap, varRet, 0)
				SetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_START + nCount, varRet ) 
				if varCount ==0 then
					local nFullHp = GetHp( varMap, varRet )
					SetFubenData_Param(varMap,x700023_CSP_PATROL_MONSTER_FULL_HP, nFullHp ) 
				end
				nCount = nCount +1;
            end
        end
	end
	
	SetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_COUNT, nCount ) 

end

function x700023_CreateChangeMonster(varMap, varX, z)
	 local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			if title~="" then
				CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
			else
				CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
			end
			break
            
        end
	end

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "一个小怪变身"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end

function x700023_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
									
				end
			end
        end
	end

end


function x700023_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700023_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700023_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;

	local objId1 = GetFubenData_Param(varMap, x700023_CSP_BOSS1_ID )
	local objId2 = GetFubenData_Param(varMap, x700023_CSP_BOSS2_ID ) ;
	if varPlayer ==objId1 then
		SetFubenData_Param(varMap, x700023_CSP_BOSS1_ID,-1 )
	elseif varPlayer ==objId2 then
		SetFubenData_Param(varMap, x700023_CSP_BOSS2_ID,-1 )
		x700023_CreateSubmitNpc( varMap)

		
			







				












			
			

			
			
			
	end

	local objId3 = GetFubenData_Param(varMap, x700023_CSP_BOSS3_ID ) ;
	
	local nBoss3Flag = GetFubenData_Param(varMap, x700023_CSP_BOSS3_FLAG) ;
	if nBoss3Flag>0 then

		if objId3== varPlayer then
			SetFubenData_Param(varMap, x700023_CSP_BOSS3_ID, -1 ) ;
			SetFubenData_Param(varMap, x700023_CSP_BOSS3_FLAG, 0) ;
			if objId1>=0 then
				SendSpecificImpactToUnit(varMap, objId1,objId1,objId1, x700023_var_BuffId,0 )
			end
		end
	end
	
	
	local nCurrentChildCount = GetFubenData_Param(varMap, x700023_CSP_CHILD_COUNT ) ;
	

	for varI=0, nCurrentChildCount-1 do
		local nChildObjId = GetFubenData_Param(varMap, x700023_CSP_CHILD_ID_START+varI )
		if nChildObjId==varPlayer then
			SetFubenData_Param(varMap, x700023_CSP_CHILD_COUNT, nCurrentChildCount-1 ) ;
			for j=varI,nCurrentChildCount-2 do
				local nNextObjId = GetFubenData_Param(varMap, x700023_CSP_CHILD_ID_START+j+1 )
				SetFubenData_Param(varMap, x700023_CSP_CHILD_ID_START+j,nNextObjId )
			end
			SetFubenData_Param(varMap, x700023_CSP_CHILD_ID_START+nCurrentChildCount-1,-1 )
			break;
		end
	end


	local varCount = GetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_COUNT)
	

	for varI=0, varCount-1 do
		local nObjId = GetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_START+varI)
		
		if nObjId ==varPlayer then
			SetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_START+varI,-1)
			x700023_ArrayDeleteByIndex(varMap,x700023_CSP_PATROL_MONSTER_START,varCount,varI)
			SetFubenData_Param(varMap, x700023_CSP_PATROL_MONSTER_COUNT,varCount-1 )
		end
	end

	
	
	
end

function x700023_ProcAllMonsterDead( varMap)
	
end

function x700023_CreateSubmitNpc( varMap)

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "副本完成，可以进入下一环了"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end

	if x700023_var_SubmitNPC.title~="" then

		CreateMonster(varMap, x700023_var_SubmitNPC.type, x700023_var_SubmitNPC.varX, x700023_var_SubmitNPC.z, 3, 0, -1, x700023_var_SubmitNPC.guid, -1,-1,x700023_var_SubmitNPC.facedir,  "",x700023_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700023_var_SubmitNPC.type, x700023_var_SubmitNPC.varX, x700023_var_SubmitNPC.z, 3, 0, -1, x700023_var_SubmitNPC.guid, -1,-1,x700023_var_SubmitNPC.facedir)
	
	end

	
	 x700023_CreateXianJinBoss(varMap)
	 

	 LuaCallNoclosure( 701101, "ProcSceneBossDie", varMap, 1)
	 LuaCallNoclosure( 701102, "ProcSceneBossDie", varMap, 1)
end





function x700023_CreateXianJinBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700023_CSP_FUBEN_MODE)

	if nFubenMode ==0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700023_ShowTipsToAll(varMap, "翻番宝箱出现！")
end






