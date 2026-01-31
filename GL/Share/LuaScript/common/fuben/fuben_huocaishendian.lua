











x700003_CSP_FUBENTYPE				= 	0
x700003_CSP_SCRIPTID				=	1
x700003_CSP_TICKCOUNT				= 	2
x700003_CSP_FROMSCENEID				= 	3
x700003_CSP_ISCLOSING				= 	4
x700003_CSP_LEAVECOUNTDOWN			= 	5
x700003_CSP_TEAMID					=	6
x700003_CSP_BACKSCENEX       		=   7
x700003_CSP_HOLDTIME      		=   8
x700003_CSP_FUBENLEVEL			=	9

x700003_CSP_KILLCOUNT				=	20
x700003_CSP_BOSS1_ID				=	21
x700003_CSP_BOSS2_ID				=	22
x700003_CSP_NPC_ID					=	23
x700003_CSP_B_PAO_OVER				=	24
x700003_CSP_PAO_STATUS				=	25
x700003_CSP_FUBEN_SCENE_ID			=	26
x700003_CSP_PAO_TICKCOUNT			=	27


x700003_CSP_B_GETBONUS_START		=	230

x700003_CSP_XIANJINBOSS				=	239


x700003_CSP_HUMAN_COUNT				=	240
x700003_CSP_OBJID_START				=	241
x700003_CSP_GUID_START              =   248  
x700003_CSP_FUBEN_TYPE				=	254	

x700003_CSP_FUBEN_MODE				=   255 



x700003_var_FileId 					= 700003


x700003_var_LimitTotalHoldTime		= 	720						
x700003_var_PaoTaiHoldTime			=	15*12					

x700003_var_SubmitNPC                 =   { type =25072,guid= 150535,varX = 35, z=31, facedir =0, title="" }     
x700003_var_SubmitNPC1                =   { type =25072,guid= 150535,varX = 35, z=31, facedir =0, title="" }	 
x700003_var_NpcGroup                  =   {
                                            {   type = 25034,varX=22,z=107,ai=3,aiscript = 0,guid=150534,facedir =0, title=""},
                                        }


										













function x700003_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
end



function x700003_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700003_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700003_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700003_CSP_XIANJINBOSS, -1 )
	x700003_CreateBoss( varMap,0 )
    x700003_CreateMonster1( varMap )
	x700003_CreateNpc(varMap )

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		 x700003_AddPlayerBuff(varMap, humanId,1)
	end
		
end

function x700003_ProcHuoPaoOver(varMap, nStatus)
	if nStatus ~= 1 and nStatus~=2  then
		return -1;
	
	end

	local objId1 = GetFubenData_Param(varMap, x700003_CSP_BOSS1_ID);
	if objId1>=0 then
		DeleteMonster( varMap, objId1);
	
		
	end

	SetFubenData_Param(varMap, x700003_CSP_PAO_STATUS, nStatus )  
	SetFubenData_Param(varMap, x700003_CSP_B_PAO_OVER, 1 ) ;
	
	local nowTick = GetFubenData_Param(varMap, x700003_CSP_TICKCOUNT);
	SetFubenData_Param(varMap,x700003_CSP_PAO_TICKCOUNT,nowTick);

	local varStr="";

	if nStatus==1 then
		varStr	= "你未能顺利阻止火炮攻击！"
		x700003_CreateBoss(varMap, 1)
	else
		varStr = "火炮顺利的被摧毁了！"
		x700003_CreateMonster2(varMap)
		x700003_CreateBoss(varMap, 1)

	end

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
		if nStatus==1 then
			LuaCallNoclosure(UTILITY_SCRIPT, "PlayEffect", varMap, humanId, 7 )
		end
	end
end



function x700003_AddPlayerBuff(varMap, varPlayer, nFlag)
	
end

function x700003_ProcStartHuoPaoTime(varMap)
	
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		
	end
	
end

function x700003_EnterTick(varMap, nowTickCount)
	if nowTickCount == 2 then
		local nTalkNpcId = GetFubenData_Param(varMap, x700003_CSP_NPC_ID ) ;
		if nTalkNpcId>0 then
			NpcTalk(varMap, nTalkNpcId, "那群叛军在山顶架设了火炮，你们快去摧毁它！",  -1)
			x700003_ProcStartHuoPaoTime(varMap);

		end
	end



	
	local bPaoTimeOver = GetFubenData_Param(varMap, x700003_CSP_B_PAO_OVER ) ;
	if bPaoTimeOver==0 then
		
		if nowTickCount >= x700003_var_PaoTaiHoldTime then
			
			bPaoTimeOver = 1;
			
			x700003_ProcHuoPaoOver(varMap, 1)
		end
	end


	if bPaoTimeOver==0 then	
		SetFubenData_Param(varMap, x700003_CSP_HOLDTIME, x700003_var_PaoTaiHoldTime);
	else
		SetFubenData_Param(varMap, x700003_CSP_HOLDTIME, x700003_var_LimitTotalHoldTime);
	end
end




function x700003_CreateBoss(varMap, nFlag)

    local fubenlevel = GetFubenData_Param(varMap, x700003_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700003_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700003_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700003_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700003_var_FileId,nIndexFrom,varI)
		if idScript == x700003_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    if varFlag == nFlag then
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700003_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700003_var_FileId, -1, 21,-1,facedir)
				
				end

				if varFlag ==0 then
					SetFubenData_Param(varMap, x700003_CSP_BOSS1_ID,varRet  )
				elseif varFlag ==1 then
					SetFubenData_Param(varMap, x700003_CSP_BOSS2_ID,varRet  )
				end
			end
        end
	end

end




function x700003_CreateMonster1(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700003_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700003_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700003_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700003_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700003_var_FileId,nIndexFrom,varI)
		if idScript == x700003_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local x1 = varX + rx
                local rz = random(-r,r)
                local z1 = z + rz

				if title~="" then
					CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end

end




function x700003_CreateMonster2(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700003_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700003_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700003_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700003_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700003_var_FileId,nIndexFrom,varI)
		if idScript == x700003_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local x1 = varX + rx
                local rz = random(-r,r)
                local z1 = z + rz

				if title~="" then
					CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir, "",title)
				else
					CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir)
					
				end
			end
        end
	end

end






function x700003_CreateNpc(varMap )

    for varI, item in x700003_var_NpcGroup do
        local varRet = 0
		if item.title~="" then
			varRet = CreateMonster( varMap,item.type,item.varX,item.z,item.ai,item.aiscript,-1,item.guid,-1,-1,item.facedir, "",item.title)
		else
			varRet = CreateMonster( varMap,item.type,item.varX,item.z,item.ai,item.aiscript,-1,item.guid,-1,-1,item.facedir)
		
		end
		SetFubenData_Param(varMap, x700003_CSP_NPC_ID,varRet ) ;
    end
end


function x700003_ProcDie(varMap, varPlayer, varKiller)

	local xianjinboss = GetFubenData_Param(varMap, x700003_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	
	
	local nDieCount = GetFubenData_Param(varMap, x700003_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700003_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	


	local objId1 = GetFubenData_Param(varMap, x700003_CSP_BOSS1_ID);
	local objId2 = GetFubenData_Param(varMap, x700003_CSP_BOSS2_ID);

	
	local name_t = GetName(varMap, varPlayer)
	
	if name_t == "将军哈达鲁" then
		local msg_t = "x700003_ProcDie 将军哈达鲁: varObj="..objId2..",varPlayer="..varPlayer
		WriteLog(1,msg_t)
	end

	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700003_CSP_BOSS1_ID, -1);

		x700003_ProcHuoPaoOver(varMap,2)
		return
	end

	if objId2>0 then
		if objId2 == varPlayer then
			SetFubenData_Param(varMap, x700003_CSP_BOSS2_ID, -1);
			
			x700003_CreateSubmitNpc( varMap)
			x700003_ShowTipsToAll(varMap, "副本完成")

			
			
























			
			
			
			

		end
	end
end


function x700003_ProcAllMonsterDead( varMap)
	
end

function x700003_CreateSubmitNpc( varMap)

	 local nStatus = GetFubenData_Param(varMap, x700003_CSP_PAO_STATUS )
	 if nStatus== 1 then
		if x700003_var_SubmitNPC1.title~="" then
			CreateMonster(varMap, x700003_var_SubmitNPC1.type, x700003_var_SubmitNPC1.varX, x700003_var_SubmitNPC1.z, 3, 0, -1, x700003_var_SubmitNPC1.guid, -1,-1,x700003_var_SubmitNPC1.facedir,  "",x700003_var_SubmitNPC1.title)
		else
			CreateMonster(varMap, x700003_var_SubmitNPC1.type, x700003_var_SubmitNPC1.varX, x700003_var_SubmitNPC1.z, 3, 0, -1, x700003_var_SubmitNPC1.guid, -1,-1,x700003_var_SubmitNPC1.facedir)
		
		end
	 elseif nStatus==2 then
		if x700003_var_SubmitNPC.title~="" then
			CreateMonster(varMap, x700003_var_SubmitNPC.type, x700003_var_SubmitNPC.varX, x700003_var_SubmitNPC.z, 3, 0, -1, x700003_var_SubmitNPC.guid, -1,-1,x700003_var_SubmitNPC.facedir,  "",x700003_var_SubmitNPC.title)
		else
			CreateMonster(varMap, x700003_var_SubmitNPC.type, x700003_var_SubmitNPC.varX, x700003_var_SubmitNPC.z, 3, 0, -1, x700003_var_SubmitNPC.guid, -1,-1,x700003_var_SubmitNPC.facedir)
		
		end
	 end

	 
	 x700003_CreateXianJinBoss(varMap)
	 

	 LuaCallNoclosure( 701113, "ProcSceneBossDie", varMap, 0)
	 LuaCallNoclosure( 701114, "ProcSceneBossDie", varMap, 0)
end





function x700003_CreateXianJinBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700003_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	
	local nFubenMode = GetFubenData_Param(varMap, x700003_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700003_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700003_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700003_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700003_var_FileId,nIndexFrom,varI)
		if idScript == x700003_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700003_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700003_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700003_CSP_XIANJINBOSS, varRet )
		end
	end

	x700003_ShowTipsToAll(varMap, "翻番宝箱出现！")
end





