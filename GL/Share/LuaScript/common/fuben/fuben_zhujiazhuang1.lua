











x700030_CSP_FUBENTYPE				= 	0
x700030_CSP_SCRIPTID				=	1
x700030_CSP_TICKCOUNT				= 	2
x700030_CSP_FROMSCENEID				= 	3
x700030_CSP_ISCLOSING				= 	4
x700030_CSP_LEAVECOUNTDOWN			= 	5
x700030_CSP_TEAMID					=	6
x700030_CSP_BACKSCENEX       		=   7
x700030_CSP_BACKSCENEZ      		=   8
x700030_CSP_FUBENLEVEL			=	9

x700030_CSP_KILLCOUNT				=	20
x700030_CSP_FUBEN_SCENE_ID			=	21

x700030_CSP_NPC1_ID					=	22
x700030_CSP_NPC2_ID					=	23
x700030_CSP_BOSS1_ID				=	24
x700030_CSP_BOSS2_ID				=	25
x700030_CSP_RUN_FLAG				=	26
x700030_CSP_GAME_STEP				=	27
x700030_CSP_TALK_STEP				=	28



x700030_CSP_SHUAGUAI_AREA_START		=	90
x700030_CSP_OBJID_AREA				=	110
x700030_CSP_FAIL_FLAG				=	111
x700030_CSP_ZHANCHE					 = 238
x700030_CSP_XIANJINBOSS				=	239
x700030_CSP_HUMAN_COUNT				=	240
x700030_CSP_OBJID_START				=	241

x700030_CSP_GUID_START              =   248  
x700030_CSP_FUBEN_TYPE				=	254	

x700030_CSP_FUBEN_MODE				=   255 


x700030_var_FileId 					= 700030

x700030_var_FubenType				= 	FUBEN_ZHUJIAZHUANG1		    

x700030_var_Level_Limit = 70
x700030_var_Rate_Limit = 50

x700030_var_SubmitNPC                 =   { type =25077,guid= 150551,varX = 142, z=214, facedir =0, title ="拼命三郎" }
x700030_var_LeaveNPC					=   { type =25077,guid= 150029,varX = 142, z=214, facedir =0, title ="拼命三郎" }

x700030_var_Run_Count						= 12

x700030_var_NpcTalkCount =5

x700030_var_NpcTalk1 = {"哎呦，祝家没人了不成？怎么还出来一个女的？",	"",	"啊，我怎么动弹不得？有妖法？",	"",	"兄弟们救我……"}
x700030_var_NpcTalk2 = {"",	"贼人休要胡言，今天就让你看看姑奶奶的手段！","","哼哼，你这等草寇怎么识得我的天网阵法。",""	}










function x700030_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	
end

function x700030_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700030_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700030_ProcFubenSceneCreated( varMap )

	for varI=20,239 do
		SetFubenData_Param(varMap, varI, -1 )
	end
	SetFubenData_Param(varMap, x700030_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700030_CSP_GAME_STEP, 0 )
	SetFubenData_Param(varMap, x700030_CSP_TALK_STEP, 0 )
	SetFubenData_Param(varMap, x700030_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700030_CSP_FAIL_FLAG, 0 )


	
	
	x700030_CreateBoss( varMap )

    x700030_CreateMonster( varMap )
		
end

function x700030_EnterTick(varMap,nowTickCount)

	if nowTickCount == 2 then
			
		x700030_CreateNpc( varMap, 0 )
		return 
	end

	if nowTickCount>24 then
		local nCurrentFlag = GetFubenData_Param(varMap,x700030_CSP_RUN_FLAG)

		if nCurrentFlag<x700030_var_Run_Count then
	
			if random(1,100)<=15 then				
				x700030_CreateRunMonster(varMap, nCurrentFlag)
			end
		end
	end

	local nNpcId1 = GetFubenData_Param(varMap, x700030_CSP_NPC1_ID )
	local nNpcId2 = GetFubenData_Param(varMap, x700030_CSP_NPC2_ID )

	local varStep = GetFubenData_Param(varMap, x700030_CSP_GAME_STEP )

	if varStep==0 then   

		if nNpcId1>=0 then
			local varX,z =GetWorldPos(varMap,nNpcId1)
			
			local area = {121,180,157,218}  
			if varX>=area[1] and varX<=area[3] then
				if z>=area[2] and z<=area[4] then
					x700030_ProcNpcInArea(varMap)
				end
			end
		end
	elseif varStep==1 then 
		local nTalkStep = GetFubenData_Param(varMap, x700030_CSP_TALK_STEP )
		
		if nTalkStep<=x700030_var_NpcTalkCount then
			if x700030_var_NpcTalk1[nTalkStep]~="" then
				NpcTalk(varMap, nNpcId1, x700030_var_NpcTalk1[nTalkStep],  -1)
			end
			if x700030_var_NpcTalk2[nTalkStep]~="" then
				NpcTalk(varMap, nNpcId2, x700030_var_NpcTalk2[nTalkStep],  -1)
			end
		else
			SetFubenData_Param(varMap, x700030_CSP_GAME_STEP, 2 )
		end

		SetFubenData_Param(varMap, x700030_CSP_TALK_STEP, nTalkStep+1 )
		
		
	elseif varStep ==2 then 
		DeleteMonster( varMap,nNpcId1 )
		DeleteMonster( varMap,nNpcId2 )
		SetFubenData_Param(varMap, x700030_CSP_NPC1_ID, -2 )
		SetFubenData_Param(varMap, x700030_CSP_NPC2_ID, -2 )
		SetFubenData_Param(varMap, x700030_CSP_GAME_STEP, 3 ) 
		
		x700030_ShowTipsToAll( varMap, "时迁又被抓走了！")
		x700030_CreateSubmitNpc( varMap)
		x700030_CreateZhanCheBoss(varMap)
		x700030_ShowTipsToAll( varMap, "副本完成")
	end

end



function x700030_ProcNpcInArea(varMap)


	local nNpcId1 = GetFubenData_Param(varMap, x700030_CSP_NPC1_ID )
	local boss1 = GetFubenData_Param(varMap, x700030_CSP_BOSS1_ID )
	local boss2 = GetFubenData_Param(varMap, x700030_CSP_BOSS2_ID )

	if nNpcId1<0 then
		return
	end
	
	if boss1<0 and boss2<0 then
		x700030_EnterNextScene(varMap)
	end
end

function x700030_EnterNextScene(varMap)
	local varStep = GetFubenData_Param(varMap, x700030_CSP_GAME_STEP )

	if varStep~=0 then
		return
	end


	SetFubenData_Param(varMap, x700030_CSP_GAME_STEP, 1 )
	SetFubenData_Param(varMap, x700030_CSP_TALK_STEP, 1 )

	x700030_CreateNpc( varMap, 1 )
	
end




function x700030_CreateNpc( varMap, nFlag )
	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	
	for varI = 0,nDataCount-1 do		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 and varFlag == nFlag then

			if 	varFlag == 0 then
				camp = 24
			elseif varFlag == 1 then
				camp = 20
			end

			local nObjId  = -1  
			if title~="" then
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700030_var_FileId, -1, camp,-1,facedir, "",title)
			else
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700030_var_FileId, -1, camp,-1,facedir)
				
			end
			if nObjId >= 0 then

				if varFlag==0 then
					SetFubenData_Param(varMap, x700030_CSP_NPC1_ID, nObjId )
					SetPatrolId(varMap, nObjId, 0)
					x700030_ShowTipsToAll( varMap, "保护时迁逃到河边，有船接应！")	
				elseif varFlag==1 then
					SetFubenData_Param(varMap, x700030_CSP_NPC2_ID, nObjId )
	
				end

			end
			break
		end
	end

end



function x700030_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	
	for varI = 0,nDataCount-1 do		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

			local nObjId  = -1  
			if title~="" then
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700030_var_FileId, -1, 21,-1,facedir, "",title)
			else
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700030_var_FileId, -1, 21,-1,facedir)
				
			end

			if nObjId >= 0 then					
				if varFlag == 0 then
					SetFubenData_Param(varMap, x700030_CSP_BOSS1_ID, nObjId )
					SetPatrolId(varMap, nObjId, 1)
				elseif varFlag == 1 then
					SetFubenData_Param(varMap, x700030_CSP_BOSS2_ID, nObjId )
				end
			end
        end
	end

end










function x700030_CreateMonster(varMap)

	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
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

function x700030_CreateRunMonster(varMap, nFlag)
	
	local nCurrentFlag = GetFubenData_Param(varMap,x700030_CSP_RUN_FLAG)

	if nCurrentFlag>=x700030_var_Run_Count then
		return
	end

	SetFubenData_Param(varMap,x700030_CSP_RUN_FLAG, nCurrentFlag+1)

	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and varFlag == nFlag and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz

				local nObjId = -1

				if title~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
				if nObjId >= 0 and patrolid >=0 then
					SetPatrolId(varMap, nObjId, 0)
				end
			end
        end
	end



end




function x700030_CreateAreaMonster(varMap, areaId)



	local bCreated = GetFubenData_Param(varMap,x700030_CSP_SHUAGUAI_AREA_START+areaId)

	if bCreated>0 then
		return
	end

	SetFubenData_Param(varMap,x700030_CSP_SHUAGUAI_AREA_START+areaId, 1)

	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and varFlag == areaId and nFubenType == varFlag3 then
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


function x700030_ProcEnterShuaguaiArea(varMap,  areaId)
	


	
	local bCreated = GetFubenData_Param(varMap,x700030_CSP_SHUAGUAI_AREA_START+areaId)


	if bCreated>0 then
		return
	end

	x700030_CreateAreaMonster(varMap, areaId)
end



function x700030_ProcDie(varMap, varPlayer, varKiller)
	
	local nDieCount = GetFubenData_Param(varMap, x700030_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700030_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	local objId1 = GetFubenData_Param(varMap, x700030_CSP_NPC1_ID)
	local objId2 = GetFubenData_Param(varMap, x700030_CSP_BOSS1_ID)
	local objId3 = GetFubenData_Param(varMap, x700030_CSP_BOSS2_ID)
	
	local xianjinboss = GetFubenData_Param(varMap, x700030_CSP_XIANJINBOSS)
	
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700030_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700030_CSP_NPC1_ID, -1)
		
		x700030_ProcFubenFailed(varMap, varPlayer)
		
	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700030_CSP_BOSS1_ID, -1)
		
	elseif objId3 == varPlayer then
		SetFubenData_Param(varMap, x700030_CSP_BOSS2_ID, -1)
		
	end
end

function x700030_ProcAllMonsterDead( varMap)
	
end

function x700030_DelAllMonster( varMap)
	local nMonsterCount = GetMonsterCount(varMap)
	for varI=1,nMonsterCount do
    	local varObj = GetMonsterObjID(varMap,varI-1)
    	if varObj >= 0 and IsObjValid(varMap,varObj) then
    		DeleteMonster(varMap,varObj)
    	end
	end
end		
		
function x700030_ProcFubenFailed(varMap,varPlayer)
	x700030_ShowTipsToAll( varMap, "时迁被抓走,速去河边与石秀会合,再谋对策！")
	
	x700030_CreateSubmitNpc( varMap)
	SetFubenData_Param(varMap, x700030_CSP_FAIL_FLAG, 1)
end

function x700030_CreateLeaveNpc( varMap)
	
	if x700030_var_LeaveNPC.title~= "" then
		CreateMonster(varMap, x700030_var_LeaveNPC.type, x700030_var_LeaveNPC.varX, x700030_var_LeaveNPC.z, 3, 0, -1, x700030_var_LeaveNPC.guid, -1,-1,x700030_var_LeaveNPC.facedir, "", x700030_var_LeaveNPC.title)
	else
		CreateMonster(varMap, x700030_var_LeaveNPC.type, x700030_var_LeaveNPC.varX, x700030_var_LeaveNPC.z, 3, 0, -1, x700030_var_LeaveNPC.guid, -1,-1,x700030_var_LeaveNPC.facedir)
		
	end

	
	 x700030_CreateXianJinBoss(varMap)
	 
end

function x700030_CreateSubmitNpc( varMap)
	if x700030_var_SubmitNPC.title~= "" then
		CreateMonster(varMap, x700030_var_SubmitNPC.type, x700030_var_SubmitNPC.varX, x700030_var_SubmitNPC.z, 3, 0, -1, x700030_var_SubmitNPC.guid, -1,-1,x700030_var_SubmitNPC.facedir, "", x700030_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700030_var_SubmitNPC.type, x700030_var_SubmitNPC.varX, x700030_var_SubmitNPC.z, 3, 0, -1, x700030_var_SubmitNPC.guid, -1,-1,x700030_var_SubmitNPC.facedir)
		
	end

	
	 x700030_CreateXianJinBoss(varMap)
	 

	 LuaCallNoclosure( 701119, "ProcSceneBossDie", varMap, 0)
end





function x700030_CreateXianJinBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)

	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700030_CSP_FUBEN_MODE)
	
	if nFubenMode == 0  then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700030_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700030_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700030_CSP_XIANJINBOSS, varRet )
		end
	end

	x700030_ShowTipsToAll(varMap, "翻番宝箱出现！")
end








function x700030_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	if GetFubenData_Param(varMap, x700030_CSP_FAIL_FLAG) == 1 then
		return
	end
	
	
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBENTYPE);

	if nFubenType~=x700030_var_FubenType then
		return
	end

	
	
	local humancount = GetFuben_PlayerCount(varMap);
	
		
		
		
		
		
		
	

	 
    local nFind = 1
    local guid = GetPlayerGUID( varMap,varPlayer )


	
    
    if nFind == 0 then
		return
    end

	local varIndex = x700030_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    if varObj == varPlayer then

	    	SetFubenData_Param(varMap, idx, varPlayer )
			SetFubenData_Param(varMap, idx+1, varArea )

	    	break
	    elseif varObj == -1 then

	        SetFubenData_Param(varMap, idx, varPlayer )
	        SetFubenData_Param(varMap, idx+1, varArea )
	        break
		end
	end

	


	x700030_ProcEnterShuaguaiArea(varMap, varArea)
	

end




function x700030_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )

	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBENTYPE);

	if nFubenType~=x700030_var_FubenType then
		return
	end

    local humancount = GetFuben_PlayerCount(varMap);
	
		
		
		
		
		
		
	

	local varIndex = x700030_CSP_OBJID_AREA
	for varI=0, 5 do
		local idx = varIndex+varI*2
	    local varObj = GetFubenData_Param(varMap, idx )
	    local varArea = GetFubenData_Param(varMap, idx + 1 )
	    if varObj == varPlayer then
	        SetFubenData_Param(varMap, idx, -1 )
	        SetFubenData_Param(varMap, idx+1, -1 )
	    end
	end
end




function x700030_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	
end



function x700030_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700030_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700030_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700030_CSP_FUBENLEVEL)

	if fubenlevel < x700030_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700030_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700030_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700030_var_FileId,nIndexFrom,varI)
		if idScript == x700030_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700030_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
		x700030_ShowTipsToAll(varMap, "战车独冲之王出现！")
	end
end
