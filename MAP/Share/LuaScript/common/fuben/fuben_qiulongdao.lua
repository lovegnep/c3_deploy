x700028_CSP_FUBENTYPE				= 	0
x700028_CSP_SCRIPTID				=	1
x700028_CSP_TICKCOUNT				= 	2
x700028_CSP_FROMSCENEID				= 	3
x700028_CSP_ISCLOSING				= 	4
x700028_CSP_LEAVECOUNTDOWN			= 	5
x700028_CSP_TEAMID					=	6
x700028_CSP_BACKSCENEX       		=   7
x700028_CSP_BACKSCENEZ      		=   8
x700028_CSP_FUBENLEVEL			=	9

x700028_CSP_KILLCOUNT				=	20
x700028_CSP_FUBEN_SCENE_ID			=	21
x700028_CSP_BOSS_ID					=	22
x700028_CSP_BOSS_FULL_HP			=   23
x700028_CSP_BOSS_LOADMONSTER_START	=   24

x700028_CSP_HUMAN_COUNT				=	240
x700028_CSP_OBJID_START				=	241
x700028_CSP_GUID_START              =   248  
x700028_CSP_FUBEN_TYPE				=	254	

x700028_CSP_FUBEN_MODE				=   255 


x700028_var_FileId 					= 700028

x700028_var_SubmitNPC                 =   { type =25001,guid= 150501,varX = 72, z=48, facedir =0, title = "" }










function x700028_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
end




function x700028_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700028_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700028_ProcFubenSceneCreated( varMap )
	
	
	
	
	
	
    x700028_CreateMonster( varMap )
	x700028_CreateBoss( varMap )

	
		
end

function x700028_EnterTick(varMap, nowTickCount)
	if nowTickCount >= 2 then
		local nBoss2 = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID )

		
		
		if nBoss2>0 then
			local humancount = GetFuben_PlayerCount(varMap);
			if humancount>0 then
				local nCurrentHp = GetHp( varMap, nBoss2 )
				local nFullHp = GetFubenData_Param(varMap, x700028_CSP_BOSS_FULL_HP )


				if nCurrentHp/nFullHp <0.2 then
					local bCreatedSubMonster = GetFubenData_Param(varMap, x700028_CSP_BOSS_LOADMONSTER_START+0 )
					if bCreatedSubMonster<=0 then
						x700028_CreateSubMonster(varMap,0)
						
					end
				elseif nCurrentHp/nFullHp <0.5 then
					
					local bCreatedSubMonster = GetFubenData_Param(varMap, x700028_CSP_BOSS_LOADMONSTER_START+1)
					if bCreatedSubMonster<=0 then
						x700028_CreateSubMonster(varMap,1)
						
					end
				elseif nCurrentHp/nFullHp <0.8 then
					local bCreatedSubMonster = GetFubenData_Param(varMap, x700028_CSP_BOSS_LOADMONSTER_START+2 )
					if bCreatedSubMonster<=0 then
						x700028_CreateSubMonster(varMap,2)
						
					end
				end
				
			end
		end
	end
end

function x700028_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL ) ;

	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1, facedir)
			
			end

			
				
			SetFubenData_Param(varMap, x700028_CSP_BOSS_ID, varRet )
			local nFullHp = GetHp( varMap, varRet )
			SetFubenData_Param(varMap, x700028_CSP_BOSS_FULL_HP, nFullHp )

			for j=0, 5-1 do
				SetFubenData_Param(varMap, x700028_CSP_BOSS_LOADMONSTER_START+j, 0 )
			end
			
			break;
			
        end
	end

end



function x700028_CreateSubMonster(varMap, iIndex)

	
	local bCreatedSubMonster = GetFubenData_Param(varMap, x700028_CSP_BOSS_LOADMONSTER_START+iIndex )

	if bCreatedSubMonster>0 then
		return 0;
	end

	SetFubenData_Param(varMap, x700028_CSP_BOSS_LOADMONSTER_START+iIndex, 1 )

	
	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			 for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
				SetPatrolId(varMap, varRet, 0)
            end
        end
	end

	local strPercent= ""

	if iIndex==0 then
		strPercent= "20%"
	elseif iIndex==1 then
		strPercent= "50%"
	elseif iIndex==2 then
		strPercent= "80%"
	end

	

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = format("起来！我的勇士们！",strPercent);
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);

		DeliverTalkTips(varMap, humanId);
	end

	
end






function x700028_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end


end




function x700028_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700028_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700028_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	local objId2 = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID)
	
	if objId2 == varPlayer then
		SetFubenData_Param(varMap, x700028_CSP_BOSS_ID, -1)
		x700028_ProcAllMonsterDead( varMap)
	
		
			







				












			
			

			

			
			
			
	end
end

function x700028_ProcAllMonsterDead( varMap)
	x700028_CreateSubmitNpc( varMap)
end

function x700028_CreateSubmitNpc( varMap)
	if x700028_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700028_var_SubmitNPC.type, x700028_var_SubmitNPC.varX, x700028_var_SubmitNPC.z, 3, 0, -1, x700028_var_SubmitNPC.guid, -1,-1,x700028_var_SubmitNPC.facedir,  "",x700028_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700028_var_SubmitNPC.type, x700028_var_SubmitNPC.varX, x700028_var_SubmitNPC.z, 3, 0, -1, x700028_var_SubmitNPC.guid, -1,-1,x700028_var_SubmitNPC.facedir)
	
	end
	
	
	 x700028_CreateXianJinBoss(varMap)
	 
	 
	 LuaCallNoclosure( 701101, "ProcSceneBossDie", varMap, 0)
	 LuaCallNoclosure( 701102, "ProcSceneBossDie", varMap, 0)

end





function x700028_CreateXianJinBoss(varMap)
	
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700028_CSP_FUBEN_MODE)
	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700028_ShowTipsToAll(varMap, "翻番宝箱出现！")
end




