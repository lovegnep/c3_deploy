











x700001_CSP_FUBENTYPE				= 	0
x700001_CSP_SCRIPTID				=	1
x700001_CSP_TICKCOUNT				= 	2
x700001_CSP_FROMSCENEID				= 	3
x700001_CSP_ISCLOSING				= 	4
x700001_CSP_LEAVECOUNTDOWN			= 	5
x700001_CSP_TEAMID					=	6
x700001_CSP_BACKSCENEX       		=   7
x700001_CSP_BACKSCENEZ      		=   8
x700001_CSP_FUBENLEVEL				=	9

x700001_CSP_KILLCOUNT				=	20
x700001_CSP_BOSS_ID					=   21
x700001_CSP_CURRENT_STEP			=   22
x700001_CSP_CURRENT_SUB_STEP		=	23
x700001_CSP_B_FIGTHING				=	24
x700001_CSP_FUBEN_SCENE_ID			=	25
x700001_CSP_NPC_ID					=	26
x700001_CSP_B_MISSION_FAILED		=	27

x700001_CSP_BOSS_FLAG1_ID			=	30
x700001_CSP_BOSS_FLAG2_ID			=	31
x700001_CSP_BOSS_FLAG3_ID			=	32
x700001_CSP_BOSS_FLAG4_ID			=	33
x700001_CSP_BOSS_FLAG5_ID			=	34
x700001_CSP_BOSS_FLAG6_ID			=	35
x700001_CSP_BOSS_FLAG7_ID			=	36
x700001_CSP_BOSS_FLAG8_ID			=	37
x700001_CSP_BOSS_FLAG9_ID			=	38
x700001_CSP_BOSS_FLAG10_ID			=	39

x700001_CSP_KILLCOUNT_SUB1			=	40
x700001_CSP_KILLCOUNT_SUB2			=	41
x700001_CSP_KILLCOUNT_SUB3			=	42
x700001_CSP_KILLCOUNT_SUB4			=	43
x700001_CSP_KILLCOUNT_SUB5			=	44
x700001_CSP_KILLCOUNT_SUB6			=	45
x700001_CSP_KILLCOUNT_SUB7			=	46
x700001_CSP_KILLCOUNT_SUB8			=	47
x700001_CSP_KILLCOUNT_SUB9			=	48
x700001_CSP_KILLCOUNT_SUB10			=	49


x700001_CSP_BOSS1_FULL_HP			=   50
x700001_CSP_BOSS1_TRANS_HUMAN		=   60

x700001_CSP_B_GETBONUS_START		=	220 
x700001_CSP_HUMAN_TALKPARAM_START	=	230
x700001_CSP_HUMAN_COUNT				=	240
x700001_CSP_OBJID_START				=	241
x700001_CSP_LAST_TICKOUNT			=	247
x700001_CSP_GUID_START              =   248  



x700001_var_FileId 					= 700001
x700001_NeedKillMonster_CountList	=	{9,9,9,9,9,9,9,9,9,9}; 

x700001_var_Buff_Id					=	13502                   
x700001_MAX_TOTAL_STEP				=	10                      
x700001_var_Npc_Yaogong                 =   { type =25039,guid= 150539,varX = 119, z=122, facedir =0, title = "" }







function x700001_ProcFubenSceneCreated( varMap )
	
	x700001_CreateBoss(varMap)
	x700001_CreateYaogongNpc( varMap)
	
	local weekIndex = GetWeekIndex()
	local varHumanCount = GetScenePlayerCount( varMap)
	if varHumanCount > 0 then
	    for varI = 0, varHumanCount do
	        local varObj = GetScenePlayerObjId( varMap,varI)
	        if varObj >= 0 then
	        	local week = GetPlayerGameData(varMap, varObj, MD_FUBEN_XIAOQIAN_DATE[1], MD_FUBEN_XIAOQIAN_DATE[2], MD_FUBEN_XIAOQIAN_DATE[3])
	        	SetPlayerGameData(varMap, varObj, MD_FUBEN_XIAOQIAN_DATE[1], MD_FUBEN_XIAOQIAN_DATE[2], MD_FUBEN_XIAOQIAN_DATE[3], weekIndex)
	        	if week ~= weekIndex then
	        		SetPlayerGameData(varMap, varObj, MD_FUBEN_XIAOQIAN_FLAG[1], MD_FUBEN_XIAOQIAN_FLAG[2], MD_FUBEN_XIAOQIAN_FLAG[3], 0)
	        	end
	        end
		end
	end
end

function x700001_EnterTick(varMap, nowTickCount)
	local bFighting = GetFubenData_Param(varMap, x700001_CSP_B_FIGTHING )

	if bFighting>0 then
		 local nCurrentSubStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_SUB_STEP )
		 if nCurrentSubStep==8 then
			x700001_CreateBoss2(varMap)
		 elseif nCurrentSubStep<8 then
			x700001_CreateMonster( varMap )
		 end


		local nCurrentGameStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP )

		

		 local nBossId = GetFubenData_Param(varMap, x700001_CSP_BOSS_FLAG1_ID+ nCurrentGameStep)
	
		if nBossId>0 then
			local humancount = GetFuben_PlayerCount(varMap)
			if humancount>0 then   
				local nCurrentHp = GetHp( varMap, nBossId )
				local nFullHp = GetFubenData_Param(varMap, x700001_CSP_BOSS1_FULL_HP+nCurrentGameStep )
				local bTransHuman = GetFubenData_Param(varMap, x700001_CSP_BOSS1_TRANS_HUMAN+nCurrentGameStep )
				
				if nCurrentHp/nFullHp <0.5 then
					if bTransHuman<=0 then
						SetFubenData_Param(varMap, x700001_CSP_BOSS1_TRANS_HUMAN+nCurrentGameStep, 1)
						x700001_TransferHuman(varMap)
					end
				end
			end
		end
	end
end


function x700001_TransferHuman(varMap)

	local humancount = GetFuben_PlayerCount(varMap);
	local nObj = random(0, humancount-1)
	local n = random(1,8)

	local posList = {
		{varX=127,  z=54},
		{varX=179,  z=75}, 
		{varX=202, z=127}, 
		{varX=179, z=177}, 
		{varX=128, z=200}, 
		{varX=76,  z=178}, 
		{varX=54,  z=126}, 
		{varX=75,  z=75}
	 }  
	
	local humanId = GetFuben_PlayerObjId(varMap, nObj);

	SetPos(varMap,humanId,posList[n].varX,posList[n].z)
	SendSpecificImpactToUnit(varMap, humanId,humanId,humanId, x700001_var_Buff_Id,0 )


	local strHumanName = GetName( varMap, humanId )
	local varStr = strHumanName.."突然被一群烈焰卷入了钧窑深处"
	
	for varI=0, humancount-1 do
		
		humanId = GetFuben_PlayerObjId(varMap, varI);
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
	
end

function x700001_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700001_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
		if idScript == x700001_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, guid, camp,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, guid, camp,-1,facedir)
			end
					local humancount = GetFuben_PlayerCount(varMap);
					if humancount >= 1 then
						local varPlayer = GetFuben_PlayerObjId(varMap, 0);
						GamePlayScriptLog(varMap, varPlayer, 1143)
					end			

			SetFubenData_Param(varMap, x700001_CSP_BOSS_ID, varRet  )

			local humancount = GetFuben_PlayerCount(varMap);
			for	varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI);
 				local varStr = "陶录好像有些事要跟你说！";
  				StartTalkTask(varMap);
  				TalkAppendString(varMap, varStr);
  				StopTalkTask(varMap);
  				DeliverTalkTips(varMap, humanId);
			end
        end
		
	end
end

function x700001_CreateBoss2(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700001_CSP_FUBENLEVEL ) ;
	local nCurrentGameStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP )
	local nCurrentSubStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_SUB_STEP)

	if nCurrentSubStep~= 8 then
		return
	end
	
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
		if idScript == x700001_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nCurrentGameStep then
				local nCurrentBossFlag = 0;
				if varFlag== 0 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG1_ID
				elseif varFlag== 1 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG2_ID
				elseif varFlag== 2 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG3_ID
				elseif varFlag== 3 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG4_ID
				elseif varFlag== 4 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG5_ID
				elseif varFlag== 5 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG6_ID
				elseif varFlag== 6 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG7_ID
				elseif varFlag== 7 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG8_ID
				elseif varFlag== 8 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG9_ID
				elseif varFlag== 9 then
					nCurrentBossFlag = x700001_CSP_BOSS_FLAG10_ID
				end

				if nCurrentBossFlag<=0 then
					return
				end

				local nBossId = GetFubenData_Param(varMap, nCurrentBossFlag ) ;

				if nBossId>0 then
					return
				end

				local varRet = 0
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
				end

				SetPatrolId(varMap, varRet, 0)
				
				SetFubenData_Param(varMap, nCurrentBossFlag, varRet  )
				local humancount = GetFuben_PlayerCount(varMap);    
    		if humancount >= 1 then                             
    			local varPlayer = GetFuben_PlayerObjId(varMap, 0);
    			GamePlayScriptLog(varMap, varPlayer, 1145)        
    		end  

				local nFullHp = GetHp( varMap, varRet )
				SetFubenData_Param(varMap, x700001_CSP_BOSS1_FULL_HP+nCurrentGameStep, nFullHp )
				SetFubenData_Param(varMap, x700001_CSP_BOSS1_TRANS_HUMAN+nCurrentGameStep, 0 )

				local humancount = GetFuben_PlayerCount(varMap);
				for	varI = 0, humancount - 1 do
					local humanId = GetFuben_PlayerObjId(varMap, varI);
					local varStr = format("一个强大的妖魔出现了!", nCurrentGameStep+1);
					StartTalkTask(varMap);
					TalkAppendString(varMap, varStr);
					StopTalkTask(varMap);
					DeliverTalkTips(varMap, humanId);
				end
			end
        end
	end
	
	nCurrentSubStep = nCurrentSubStep+1;
	SetFubenData_Param(varMap, x700001_CSP_CURRENT_SUB_STEP, nCurrentSubStep )

end




function x700001_CreateMonster(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700001_CSP_FUBENLEVEL ) ;

	local nCurrentGameStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP )
	local nCurrentSubStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_SUB_STEP )

	if nCurrentGameStep>=x700001_MAX_TOTAL_STEP then
		return
	end

	if nCurrentSubStep>=8 then
		return
	end

	local r1 = random(1,4)
    local r2 = random(5,8)

    if nCurrentGameStep==0 then
    	
	    local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						end
						
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	
	elseif nCurrentGameStep==1 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==2 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==3 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==4 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==5 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==6 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 8 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==7 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 9 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==8 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 10 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end
	elseif nCurrentGameStep==9 then
		local nIndexFrom = GetFubenDataPosByScriptID(x700001_var_FileId)
		local nDataCount = GetFubenDataCountByScriptID( x700001_var_FileId )
		
		for varI = 0,nDataCount-1 do
			local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700001_var_FileId,nIndexFrom,varI)
			if idScript == x700001_var_FileId and monsterFlag == 11 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				if nCurrentSubStep== varFlag then
					for j=0,varCount -1 do

						local rx = random(-r,r)
						local varX = varX + rx
						local rz = random(-r,r)
						local z = z + rz
						local monsterid= 0
						if title~="" then
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir,  "",title)
						else
							monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700001_var_FileId, -1, camp,-1,facedir)
						
						end
						SetPatrolId(varMap, monsterid, 0)
					end
				end
			end
		end

		end
	  	local humancount = GetFuben_PlayerCount(varMap);    
    	if humancount >= 1 then                             
    		local varPlayer = GetFuben_PlayerObjId(varMap, 0);
    		GamePlayScriptLog(varMap, varPlayer, 1144)        
    	end                                                 







	nCurrentSubStep = nCurrentSubStep+1;
	SetFubenData_Param(varMap, x700001_CSP_CURRENT_SUB_STEP, nCurrentSubStep )
end

function x700001_ProcProtectedFailed(varMap)
	SetFubenData_Param(varMap, x700001_CSP_B_MISSION_FAILED,1)
	SetFubenData_Param(varMap, x700001_CSP_BOSS_ID, -1);
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = "炼妖壶碎裂了，妖魔化作一团黑气直冲九霄， 副本失败！"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end

function x700001_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700001_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700001_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;

	local objId1 = GetFubenData_Param(varMap, x700001_CSP_BOSS_ID);

	if objId1 == varPlayer then
		x700001_ProcProtectedFailed(varMap)
		local humancount = GetFuben_PlayerCount(varMap);    
  	if humancount >= 1 then                             
  		local varPlayer = GetFuben_PlayerObjId(varMap, 0);
  		GamePlayScriptLog(varMap, varPlayer, 1146)        
  	end  
		return
	end

	for varI=0, 9 do
		local nBossId_sub = GetFubenData_Param(varMap, x700001_CSP_BOSS_FLAG1_ID+varI)
		if nBossId_sub == varPlayer then
			SetFubenData_Param(varMap, x700001_CSP_BOSS_FLAG1_ID+varI,-1)
			break;
		end
	end
	

	local nCurrentGameStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP )
	local nCurrentSub_Macro = x700001_CSP_KILLCOUNT_SUB1 + nCurrentGameStep;
	
	local nDieCount_Sub = GetFubenData_Param(varMap, nCurrentSub_Macro)
	nDieCount_Sub = nDieCount_Sub+1
	SetFubenData_Param(varMap, nCurrentSub_Macro, nDieCount_Sub)










	
	if nDieCount_Sub == x700001_NeedKillMonster_CountList[nCurrentGameStep+1] then
		local humancount = GetFuben_PlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			local varStr = format("你们顺利抵挡住了第%d波妖魔！", nCurrentGameStep+1);
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap, humanId);
		end

		SetFubenData_Param(varMap, x700001_CSP_B_FIGTHING, 0)
		SetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP,nCurrentGameStep+1 )
		SetFubenData_Param(varMap, x700001_CSP_CURRENT_SUB_STEP,0 )

		nCurrentGameStep = nCurrentGameStep+1

		if nCurrentGameStep>=x700001_MAX_TOTAL_STEP then
			local nYaogongNpcId = GetFubenData_Param(varMap, x700001_CSP_NPC_ID)
		
			NpcTalk(varMap, nYaogongNpcId, "感谢你们的帮助！我带你们离开这里吧！",  -1)
			
			x700001_ShowTipsToAll(varMap, "副本完成，请退出副本。")




























		end
	end		
end


function x700001_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)

	for varI = 0, humancount - 1 do
	
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		Msg2Player(varMap, humanId, varStr, 8, 3)
	end
end

function x700001_ProcAllMonsterDead( varMap)
	
end

function x700001_CreateYaogongNpc( varMap)
	local varRet = 0
	if x700001_var_Npc_Yaogong.title~="" then
		varRet = CreateMonster(varMap, x700001_var_Npc_Yaogong.type, x700001_var_Npc_Yaogong.varX, x700001_var_Npc_Yaogong.z, 3, 0, -1, x700001_var_Npc_Yaogong.guid, -1,-1,x700001_var_Npc_Yaogong.facedir, "", x700001_var_Npc_Yaogong.title)
	else
		varRet = CreateMonster(varMap, x700001_var_Npc_Yaogong.type, x700001_var_Npc_Yaogong.varX, x700001_var_Npc_Yaogong.z, 3, 0, -1, x700001_var_Npc_Yaogong.guid, -1,-1,x700001_var_Npc_Yaogong.facedir)
		
	end
	SetFubenData_Param(varMap, x700001_CSP_NPC_ID,varRet )
end




function x700001_ProcNpcTalk(varMap, varPlayer, nParam)

	local nCurrentGameStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP )

	if nParam == nCurrentGameStep then

		x700001_ProcStartPlay(varMap, varPlayer, nCurrentGameStep)
	else
		
		local varStr = " "
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, varPlayer);
	end
	
	
end

function x700001_ProcStartPlay(varMap, varPlayer, nCurrentGameStep)

	local nCurrentGameStep = GetFubenData_Param(varMap, x700001_CSP_CURRENT_STEP )
	local bFighting = GetFubenData_Param(varMap, x700001_CSP_B_FIGTHING )
	local bFailed = GetFubenData_Param(varMap, x700001_CSP_B_MISSION_FAILED )

	if bFailed>0 then
		local varStr = "副本已经失败，不能继续"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, varPlayer);
		return
		
	end

	if bFighting>0 then
		local varStr = "已经开始保护炼妖壶了"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, varPlayer);
		return
	end

	if nCurrentGameStep>=x700001_MAX_TOTAL_STEP then
		return
	end

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = format("开始第%d波任务!", nCurrentGameStep+1);
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end

	SetFubenData_Param(varMap, x700001_CSP_B_FIGTHING, 1 )
	x700001_CreateMonster(varMap);
end

function x700001_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
end
