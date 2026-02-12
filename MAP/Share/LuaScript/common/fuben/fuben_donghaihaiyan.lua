











x700004_CSP_FUBENTYPE				= 	0
x700004_CSP_SCRIPTID				=	1
x700004_CSP_TICKCOUNT				= 	2
x700004_CSP_FROMSCENEID				= 	3
x700004_CSP_ISCLOSING				= 	4
x700004_CSP_LEAVECOUNTDOWN			= 	5
x700004_CSP_TEAMID					=	6
x700004_CSP_BACKSCENEX       		=   7
x700004_CSP_BACKSCENEZ      		=   8
x700004_CSP_FUBENLEVEL			=	9

x700004_CSP_KILLCOUNT				=	20
x700004_CSP_FINALBOSS_OBJID			=   21
x700004_CSP_RELIVE_COUNT1			=   22
x700004_CSP_RELIVE_COUNT2			=   23
x700004_CSP_RELIVE_COUNT3			=   24
x700004_CSP_RELIVE_COUNT4			=   25
x700004_CSP_RELIVE_COUNT5			=   26
x700004_CSP_RELIVE_COUNT6			=   27

x700004_CSP_RELIVE_START1			=   40
x700004_CSP_RELIVE_START2			=   50
x700004_CSP_RELIVE_START3			=   60
x700004_CSP_RELIVE_START4			=   70
x700004_CSP_RELIVE_START5			=   80
x700004_CSP_RELIVE_START6			=   90

x700004_B_CREATE_RANDOMBOSS			=	230
x700004_CSP_RANDOM_BOSS_ID			=	231
x700004_RANDOMBOSS_FLAG				=	232
x700004_CSP_GUID_START              =   248  
x700004_CSP_FUBEN_TYPE				=	254	
x700004_CSP_FUBEN_MODE				=   255 


x700004_var_FileId 					= 700004

x700004_RefreshTime					= 360		                
x700004_var_RandomBossRate			= 0                         
x700004_var_RandomMonsterRate			= 0.08*6
x700004_var_EnterBuffId				= 14309                     



x700004_var_SubmitNPC                 =   { type =25005,guid= 150505,varX = 27, z=100, facedir = 0, title = "" }


x700004_var_NpcType1                  =   25005                    
x700004_var_NpcGroup                  =   {
											{   hash = 1,type = x700004_var_NpcType1,varX=23,z=22,ai=3,aiscript = 0, guid= 150002, facedir=0, title=""  },
										}




x700004_var_Random_Boss_Type_Count = 4








function x700004_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

end


function x700004_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700004_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700004_ProcFubenSceneCreated( varMap )
	

	SetFubenData_Param(varMap, x700004_CSP_RELIVE_START1,0);
	SetFubenData_Param(varMap, x700004_CSP_RELIVE_START2,0);
	SetFubenData_Param(varMap, x700004_CSP_RELIVE_START3,0);
	SetFubenData_Param(varMap, x700004_CSP_RELIVE_START4,0);
	SetFubenData_Param(varMap, x700004_CSP_RELIVE_START5,0);
	SetFubenData_Param(varMap, x700004_CSP_RELIVE_START6,0);
	

	x700004_CreateBoss( varMap )
	x700004_CreateRandomBoss( varMap )
    x700004_CreateMonster( varMap )

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		 x700004_AddPlayerBuff(varMap, humanId,1)
	end
		
end

function x700004_AddPlayerBuff(varMap, varPlayer, nFlag)
	local haveImpact = IsHaveSpecificImpact( varMap, varPlayer, x700004_var_EnterBuffId )
	if haveImpact == 1 then
		
		if nFlag == 1 then
			return
		end
		CancelSpecificImpact(varMap, varPlayer, x700004_var_EnterBuffId);
		
	end

	

	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x700004_var_EnterBuffId,0 )
end

function x700004_RemovePlayerBuff(varMap, varPlayer)
	local haveImpact = IsHaveSpecificImpact( varMap, varPlayer, x700004_var_EnterBuffId )
	if haveImpact == 1 then

		CancelSpecificImpact(varMap, varPlayer, x700004_var_EnterBuffId);
	end
end

function x700004_EnterTick(varMap, nowTickCount)
	if nowTickCount > 6 then
	   if mod(nowTickCount, x700004_RefreshTime) == 0 then
			x700004_CheckReliveMonster(varMap)
	   end 
	end
end


function x700004_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
			end

			if varFlag ==1 then
				SetFubenData_Param(varMap, x700004_CSP_FINALBOSS_OBJID, varRet ) ;
			end
        end
	end

end

function x700004_CreateRandomBoss(varMap)


	local rate = random(0,100)/100;
	if rate>= x700004_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,3)

	local nType = random(0,x700004_var_Random_Boss_Type_Count-1)

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;


	
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		
		if nType == varFlag then
			if idScript == x700004_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
				local varX,z;
				if nFlag==0 then
					varX = 32
					z = 68
				else
					varX = 91
					z = 80
				end
				if title~="" then
					CreateMonster(varMap, type, varX,z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX,z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
			end
		end
		
	end

end







function x700004_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local monsterid = 0
				if title~="" then
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end

				SetPatrolId(varMap, monsterid, 0)
            end
        end
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel  and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local monsterid = 0;
				if title ~="" then
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end

				SetPatrolId(varMap, monsterid, 1)
            end
        end
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 6 and levelmin <= fubenlevel and levelmax >= fubenlevel  and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local monsterid = 0
				if title~="" then
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
				SetPatrolId(varMap, monsterid, 2)
            end
        end
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 8 and levelmin <= fubenlevel and levelmax >= fubenlevel  and nFubenType == varFlag3 then
           
			if title~="" then
				CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
			else
				CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
        end
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel  and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz

		        local varRet = 0;
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir, "", title);
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir);
				end

				if varFlag == 0 then
					local varCount = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START1);
		
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START1,varCount+1);
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START1+varCount+1, varRet);
				elseif varFlag ==1 then
					local varCount = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START2);
		
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START2,varCount+1);
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START2+varCount+1, varRet);
				elseif varFlag==2 then
					local varCount = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START3);
		
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START3,varCount+1);
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START3+varCount+1, varRet);
				elseif varFlag==3 then
					local varCount = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START4);
		
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START4,varCount+1);
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START4+varCount+1, varRet);
				elseif varFlag==4 then
					local varCount = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START5);
		
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START5,varCount+1);
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START5+varCount+1, varRet);
				elseif varFlag==5 then
					local varCount = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START6);
		
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START6,varCount+1);
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START6+varCount+1, varRet);
				end
				
				
            end
        end
	end

end

function x700004_ReliveMonster( varMap, varIndex, index2)  

	
	 local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 7 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varIndex == varFlag then
				 local rx = random(-r,r)
				 local varX = varX + rx
				 local rz = random(-r,r)
				 local z = z + rz	

				 local varRet = 0
				 if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21,  "",title)
				 else
				 	varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700004_var_FileId, -1, 21)
				 end

				 if varIndex ==0 then
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START1+index2, varRet);
				 elseif varIndex==1 then
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START2+index2, varRet);
				 elseif varIndex==2 then
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START3+index2, varRet);
				 elseif varIndex==3 then
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START4+index2, varRet);
				 elseif varIndex==4 then
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START5+index2, varRet);
				 elseif varIndex==5 then
					SetFubenData_Param(varMap, x700004_CSP_RELIVE_START6+index2, varRet);
				 end
				 
				 return 1;
			end
		end
	end
end

function x700004_CheckReliveMonster(varMap)
	local n1 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START1);
	local n2 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START2);
	local n3 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START3);
	local n4 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START4);
	local n5 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START5);
	local n6 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START6);

	

	for varI=1, n1 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START1+varI);
		
		if nObjId == -1 then
			
			x700004_ReliveMonster( varMap, 0, varI);
			
		end
	end

	for varI=1, n2 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START2+varI);
		
		if nObjId == -1 then
			
			x700004_ReliveMonster( varMap, 1,varI);
			
		end
	end

	for varI=1, n3 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START3+varI);
		if nObjId == -1 then
			x700004_ReliveMonster( varMap, 2,varI);
			
		end
	end

	for varI=1, n4 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START4+varI);
		if nObjId == -1 then
			x700004_ReliveMonster( varMap, 3,varI);
			
		end
	end

	for varI=1, n5 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START5+varI);
		if nObjId == -1 then
			x700004_ReliveMonster( varMap, 4,varI);
			
		end
	end

	for varI=1, n6 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START6+varI);
		
		if nObjId == -1 then
			x700004_ReliveMonster( varMap, 5,varI);
			
		end
	end
end




function x700004_CreateNpc(varMap )

  	for varI, item in x700004_var_NpcGroup do
  		if title~="" then
			CreateMonster( varMap,type,varX,z,ai,aiscript,-1,guid,-1,-1, facedir, "", title)
		else
			CreateMonster( varMap,type,varX,z,ai,aiscript,-1,guid,-1,-1, itme.facedir)
		end
	end
end



function x700004_CreateRandomMonster(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700004_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,FUBEN_DONGHAIHAIYAN,nFubenMode )/100

	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	if rate>= nStdRate then
		return 0;
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;


	
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if varFlag == nFlag then
		
		
			if idScript == x700004_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700004_var_FileId, -1, 21,-1,facedir)
				
				end

				SetFubenData_Param(varMap, x700004_B_CREATE_RANDOMBOSS, 1)
				SetFubenData_Param(varMap, x700004_RANDOMBOSS_FLAG, nFlag)

				SetFubenData_Param(varMap, x700004_CSP_RANDOM_BOSS_ID, nBossID)
			end
		end
	end

	x700004_ShowTipsToAll(varMap, "Õ½ÉñÔÙÏÖ£¡")

end

function x700004_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700004_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700004_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700004_B_CREATE_RANDOMBOSS)

	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700004_CSP_RANDOM_BOSS_ID)
		if nRandomBossId==varPlayer then
			
			
			
			
			
			local nKillerType = GetObjType(varMap, varKiller)
			local nOwnerId = varKiller
			if nKillerType== 3 then
				nOwnerId = GetOwnerID(varMap, varKiller)
				
			end
			
			local strPlayerName = GetName(varMap, nOwnerId)
			
			local varCountry = GetCurCountry( varMap, nOwnerId )
			local strCountryName = "";
			if varCountry==0 then
				strCountryName = "Â¥À¼"
			elseif varCountry==1 then
				strCountryName = "ÌìÉ½"
			elseif varCountry==2 then
				strCountryName = "À¥ÂØ"
			elseif varCountry==3 then
				strCountryName = "¶Ø»Í"
			end

			local strHorseName = ""

			local nHorseFlag = GetFubenData_Param(varMap, x700004_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL )
			
			if fubenlevel < 50 then
				if nHorseFlag==0 then
					strHorseName = "Ð×±ª"
				elseif nHorseFlag==1 then
					strHorseName = "±¼Áç"
				elseif nHorseFlag==2 then
					strHorseName = "Ìì¶ì"
				elseif nHorseFlag==3 then
					strHorseName = "ºÓÂí"
				end
			elseif fubenlevel < 70 then
				if nHorseFlag==0 then
					strHorseName = "ÁÒÊ¨"
				elseif nHorseFlag==1 then
					strHorseName = "Ñ±Â¹"
				elseif nHorseFlag==2 then
					strHorseName = "Èðº×"
				elseif nHorseFlag==3 then
					strHorseName = "ÌúÏ¬"
				end
			elseif fubenlevel < 80 then
				if nHorseFlag==0 then
					strHorseName = "½£³Ý»¢"
				elseif nHorseFlag==1 then
					strHorseName = "ÂùÅ£"
				elseif nHorseFlag==2 then
					strHorseName = "·ï»Ë"
				elseif nHorseFlag==3 then
					strHorseName = "¾ÞÏó"
				end
			elseif fubenlevel < 110 then
				if nHorseFlag==0 then
					strHorseName = "ó¤Áú"
				elseif nHorseFlag==1 then
					strHorseName = "Ó¦Áú"
				elseif nHorseFlag==2 then
					strHorseName = "±©Áú"
				elseif nHorseFlag==3 then
				strHorseName = "¿üÁú"
				end
			elseif fubenlevel < 130 then
				if nHorseFlag==0 then
					strHorseName = "ó¤Áú"
				elseif nHorseFlag==1 then
					strHorseName = "Ó¦Áú"
				elseif nHorseFlag==2 then
					strHorseName = "±©Áú"
				elseif nHorseFlag==3 then
					strHorseName = "¿üÁú"
				end
			else
				if nHorseFlag==0 then
					strHorseName = "ó¤Áú"
				elseif nHorseFlag==1 then
					strHorseName = "Ó¦Áú"
				elseif nHorseFlag==2 then
					strHorseName = "±©Áú"
				elseif nHorseFlag==3 then
					strHorseName = "¿üÁú"
				end
			end

		


			local strMapName = "ÁúÑ¨"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."µÄ"..strPlayerName.."´ò°ÜÁË"..strMapName.."µÄ¾Åì¸Õ½Éñ£¬¾Åì¸¶ªÏÂ"..strHorseName.."Âä»Ä¶øÌÓ£¡", 5, 1)
			
			
			
		end
	end
	

	local objId1 = GetFubenData_Param(varMap, x700004_CSP_FINALBOSS_OBJID ) ;






























	
	

	if objId1>=0 then
		if objId1== varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_FINALBOSS_OBJID,-1 )
			x700004_CreateSubmitNpc( varMap)

			x700004_CreateRandomMonster(varMap)
		end
	end

	local n1 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START1);
	local n2 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START2);
	local n3 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START3);
	local n4 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START4);
	local n5 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START5);
	local n6 = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START6);

	

	for varI=1, n1 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START1+varI);
		if nObjId == varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_RELIVE_START1+varI, -1);
			return 1;
		end
	end

	for varI=1, n2 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START2+varI);
		if nObjId == varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_RELIVE_START2+varI, -1);
			return 1;
		end
	end

	for varI=1, n3 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START3+varI);
		if nObjId == varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_RELIVE_START3+varI, -1);
			return 1;
		end
	end

	for varI=1, n4 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START4+varI);
		if nObjId == varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_RELIVE_START4+varI, -1);
			return 1;
		end
	end

	

	for varI=1, n5 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START5+varI);
		
		if nObjId == varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_RELIVE_START5+varI, -1);
			return 1;
		end
	end

	for varI=1, n6 do
		local nObjId = GetFubenData_Param(varMap, x700004_CSP_RELIVE_START6+varI);
		if nObjId == varPlayer then
			SetFubenData_Param(varMap, x700004_CSP_RELIVE_START6+varI, -1);
			return 1;
		end
	end
	
				
end

function x700004_ProcAllMonsterDead( varMap)
	
	
	
	x700004_CreateSubmitNpc( varMap)
end

function x700004_CreateSubmitNpc( varMap)
	if x700004_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700004_var_SubmitNPC.type, x700004_var_SubmitNPC.varX, x700004_var_SubmitNPC.z, 3, 0, -1, x700004_var_SubmitNPC.guid, -1,-1,x700004_var_SubmitNPC.facedir, "", x700004_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700004_var_SubmitNPC.type, x700004_var_SubmitNPC.varX, x700004_var_SubmitNPC.z, 3, 0, -1, x700004_var_SubmitNPC.guid, -1,-1,x700004_var_SubmitNPC.facedir)
		
	end

	
	 x700004_CreateXianJinBoss(varMap)
	 
	
	LuaCallNoclosure( 701101, "ProcSceneBossDie", varMap, 2)
	LuaCallNoclosure( 701102, "ProcSceneBossDie", varMap, 2)
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
end





function x700004_CreateXianJinBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700004_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700004_CSP_FUBEN_MODE)

	if nFubenMode ==0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700004_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700004_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700004_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700004_var_FileId,nIndexFrom,varI)
		if idScript == x700004_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700004_ShowTipsToAll(varMap, "·­·¬±¦Ïä³öÏÖ£¡")
end






