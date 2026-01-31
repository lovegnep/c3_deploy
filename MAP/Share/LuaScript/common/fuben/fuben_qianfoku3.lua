











x700099_CSP_FUBENTYPE				= 	0
x700099_CSP_SCRIPTID				=	1
x700099_CSP_TICKCOUNT				= 	2
x700099_CSP_FROMSCENEID				= 	3
x700099_CSP_ISCLOSING				= 	4
x700099_CSP_LEAVECOUNTDOWN			= 	5
x700099_CSP_TEAMID					=	6
x700099_CSP_BACKSCENEX       		=   7
x700099_CSP_BACKSCENEZ      		=   8
x700099_CSP_FUBENLEVEL			=	9

x700099_CSP_KILLCOUNT				=	20

x700099_CSP_FUBEN_SCENE_ID			=	21

x700099_CSP_BOSS1_ID				=	22
x700099_CSP_BOSS2_ID				=	23
x700099_CSP_BOSS2_FINAL_ID			=	24
x700099_CSP_BOSS2_STATUS			=	25

x700099_CSP_OBJID_AREA				=	40
x700099_CSP_MONSTER_START			=	50	
x700099_CSP_CAPTIVE_MONSTER_START	=	70	
x700099_CSP_FREE_MONSTER_START		=	130	

x700099_CSP_HUMAN_COUNT				=	240
x700099_CSP_OBJID_START				=	241
x700099_CSP_NEXT_SCENE				=   248
x700099_CSP_GUID_START              =   248

x700099_CSP_FUBEN_MODE				=   255 





x700099_var_FileId 					= 700099  

x700099_var_SubmitNPC                 =   { type =25075,guid= 150543,varX = 57, z=101, facedir =0, title="" }







function x700099_ProcFubenSceneCreated( varMap )
	
	
	for	varI = 30, 180 do
		
		SetFubenData_Param(varMap, varI, -1);
	end
	
	SetFubenData_Param(varMap, x700099_CSP_BOSS2_FINAL_ID, -1);
	

    x700099_CreateMonster( varMap )
	x700099_CreateBoss( varMap )
		
end

function x700099_EnterTick(varMap, nowTickCount)
	
	
	for varI=0, 60-1 do
		local nFlag = GetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+varI);

		if nFlag<0 then
			local nMonsterId = GetFubenData_Param(varMap, x700099_CSP_FREE_MONSTER_START+varI);
			if nMonsterId>=0 then	
				if nFlag==-1 then
					
					
					NpcTalk(varMap, nMonsterId, "谢谢你的帮助，我们终于自由了！",  -1)
					SetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+varI, -2);
					
				elseif nFlag==-2 then
					DeleteMonster( varMap,nMonsterId )
					SetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+varI, -3);
					SetFubenData_Param(varMap, x700099_CSP_FREE_MONSTER_START+varI,-1);
				end
			end
		end
		
	end
	

	
	local nBoss2Status = GetFubenData_Param(varMap, x700099_CSP_BOSS2_STATUS)
	if nBoss2Status ==1 then
		local nBoss2Id = GetFubenData_Param(varMap, x700099_CSP_BOSS2_ID )
		DeleteMonster( varMap,nBoss2Id )
		SetFubenData_Param(varMap, x700099_CSP_BOSS2_STATUS, 2)

		x700099_CreateBoss2(varMap,1)
	end
	
	
end

function x700099_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700099_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700099_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700099_var_FileId )

	for varI = 0,nDataCount-1 do
		   
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,varI)
		if idScript == x700099_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then


			if varFlag==0 then 
				local varRet = 0;
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
				SetFubenData_Param(varMap, x700099_CSP_BOSS1_ID, varRet )
			elseif varFlag==1 then  
				local varRet = 0;
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 20,-1,facedir,"",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 20,-1,facedir)
				end

				SetFubenData_Param(varMap, x700099_CSP_BOSS2_STATUS, 0)
				SetFubenData_Param(varMap, x700099_CSP_BOSS2_ID, varRet )
			end

			
        end
	end

end

function x700099_CreateBoss2(varMap,nFlag)


	local fubenlevel = GetFubenData_Param(varMap, x700099_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700099_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700099_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,varI)
		if idScript == x700099_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
		   

			if varFlag==nFlag then 
				local varRet = 0;
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700099_var_FileId, -1, 21,-1,facedir,"",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700099_var_FileId, -1, 21,-1,facedir)
				end
				SetFubenData_Param(varMap, x700099_CSP_BOSS2_FINAL_ID, varRet )
				break;
			
			end

			
        end
	end

end








function x700099_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700099_CSP_FUBENLEVEL ) ;

	local nCount = 0;

	local nIndexFrom = GetFubenDataPosByScriptID(x700099_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700099_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,varI)
		if idScript == x700099_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz

				local varRet;
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700099_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700099_var_FileId, -1, 21,-1,facedir)
				end

				SetFubenData_Param(varMap, x700099_CSP_MONSTER_START+nCount, varRet )
				

				
				
				
				for k = 0,nDataCount-1 do
					local x1,z1;
					idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,k)
					if idScript == x700099_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
						local varCount2 = 0
						for l=1, 3 do
							local tx = varX+ random(-1,1)
							local tz = z+ random(-1,1)
							
							if title~="" then
								varRet = CreateMonster(varMap, type, tx, tz, ai, aiscript, x700099_var_FileId, -1, 21,-1,facedir, "",title)
							else
								varRet = CreateMonster(varMap, type, tx, tz, ai, aiscript, x700099_var_FileId, -1, 21,-1,facedir)
							end

							SetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+nCount*3+varCount2, varRet )

							varCount2 = varCount2 + 1
						end
					end
				end
				
				

				nCount = nCount+1
            end
        end
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700099_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700099_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,varI)
		if idScript == x700099_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz

				local varRet;
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
			end

        end
	end

	

end



function x700099_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700099_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700099_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	for varI= 0, 20-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700099_CSP_MONSTER_START+varI)

		if nMonsterId== varPlayer then
			SetFubenData_Param(varMap, x700099_CSP_MONSTER_START+varI,-1)
			x700099_ProcCaptainMonsterDie(varMap,varI)
			
		end
	end

	for varI= 0, 60-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+varI)

		if nMonsterId== varPlayer then
			SetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+varI,-1)
			
		end
	end

	local nFinalBossId = GetFubenData_Param(varMap, x700099_CSP_BOSS2_FINAL_ID )

	if nFinalBossId == varPlayer then
		SetFubenData_Param(varMap, x700099_CSP_BOSS2_FINAL_ID, -1 )
		x700099_CreateSubmitNpc( varMap)

		
		





























	end


	
end

function x700099_ProcCaptainMonsterDie(varMap,iIndex)

	for varI=0, 3-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+iIndex*3+varI)
		if nMonsterId>=0 and IsObjValid(varMap,nMonsterId) == 1 then
			local varX,z =GetWorldPos(varMap,nMonsterId)
			DeleteMonster( varMap,nMonsterId )
			SetFubenData_Param(varMap, x700099_CSP_CAPTIVE_MONSTER_START+iIndex*3+varI, -1)

			local fubenlevel = GetFubenData_Param(varMap, x700099_CSP_FUBENLEVEL ) ;
			
			local nIndexFrom = GetFubenDataPosByScriptID(x700099_var_FileId)
			local nDataCount = GetFubenDataCountByScriptID( x700099_var_FileId )
			for k = 0,nDataCount-1 do
				local x1,z1;
				local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,k)
				if idScript == x700099_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
					
					local varRet =0
					if title~="" then
						varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 20,-1,facedir, "",title)
					else
						varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 20,-1,facedir)
					end

					SetFubenData_Param(varMap, x700099_CSP_FREE_MONSTER_START+iIndex*3+varI, varRet)
					break;
						
				end
			end
				
			
		end
	end
end

function x700099_ProcAllMonsterDead( varMap)
	x700099_CreateSubmitNpc( varMap)
end

function x700099_CreateSubmitNpc( varMap)
	 if x700099_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700099_var_SubmitNPC.type, x700099_var_SubmitNPC.varX, x700099_var_SubmitNPC.z, 3, 0, -1, x700099_var_SubmitNPC.guid, -1,-1,x700099_var_SubmitNPC.facedir,  "", x700099_var_SubmitNPC.title)
	 else
		CreateMonster(varMap, x700099_var_SubmitNPC.type, x700099_var_SubmitNPC.varX, x700099_var_SubmitNPC.z, 3, 0, -1, x700099_var_SubmitNPC.guid, -1,-1,x700099_var_SubmitNPC.facedir)
	 end

     
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700099_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700099_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
	 
end






function x700099_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700099_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700099_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700099_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700099_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700099_var_FileId,nIndexFrom,varI)

        if idScript == x700099_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
		end
	end

	x700099_ShowTipsToAll(varMap, "翻番宝箱出现！")
end





function x700099_ProcEnterArea( varMap, varPlayer, varArea, varQuest )

	
	
	
	local varScriptFileId = GetFubenData_Param(varMap, x700099_CSP_SCRIPTID);

	if varScriptFileId~=x700099_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcEnterArea", varMap, varPlayer, varArea, varQuest)
		return
	end
	

	
	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
	local bFind = 0;
	for varI=0, 5 do
        local paramidx = x700099_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
				nGUID = format("%u", nGUID)
        if nGUID == myGuid then

            bFind = 1
            break
        end
    end



	if bFind<=0 then
		return
	end
	

	local varIndex = x700099_CSP_OBJID_AREA
	for varI=0,5 do
		local idx = varIndex+varI
	    local varObj = GetFubenData_Param(varMap, idx )
	    if varObj == varPlayer then

	    	SetFubenData_Param(varMap, idx, varPlayer )
			break;
	    	
	    elseif varObj == -1 then

	        SetFubenData_Param(varMap, idx, varPlayer )
	        break;
	        
	    end
	end


	local varCount=0

	for varI=0,5 do
		local nObjId = GetFubenData_Param(varMap, varIndex+varI)
		if nObjId>=0 then
			varCount = varCount +1
		end
	end

	

	if varCount>=1 then
		x700099_ProcTooMuchPlayerEnterArea(varMap);
	end
end




function x700099_ProcTooMuchPlayerEnterArea(varMap)
	local nBoss2Status = GetFubenData_Param(varMap, x700099_CSP_BOSS2_STATUS)

	if nBoss2Status==0 then
		SetFubenData_Param(varMap, x700099_CSP_BOSS2_STATUS, 1)
		local nBoss2Id = GetFubenData_Param(varMap, x700099_CSP_BOSS2_ID )

		NpcTalk(varMap, nBoss2Id, "你们这些愚蠢的凡人，接受我的惩罚吧！",  -1)
	end


end




function x700099_ProcLeaveArea( varMap, varPlayer, varScript, varQuest )

	
	local varScriptFileId = GetFubenData_Param(varMap, x700099_CSP_SCRIPTID);

	if varScriptFileId~=x700099_var_FileId then
		LuaCallNoclosure( varScriptFileId, "ProcLeaveArea", varMap, varPlayer, varScript, varQuest)
		return
	end
	

	local varIndex = x700099_CSP_OBJID_AREA
	for varI=0,5 do
		local idx = varIndex+varI
	    local varObj = GetFubenData_Param(varMap, idx )
	    if varObj == varPlayer then
	        SetFubenData_Param(varMap, idx, -1 ) 
	    end
	end
end




function x700099_ProcTimer( varMap, varPlayer, varScript, varQuest )
	
end


function x700099_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700099_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700099_ProcDefaultEvent(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
end

