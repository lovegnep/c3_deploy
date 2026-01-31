











x700031_CSP_FUBENTYPE				= 	0
x700031_CSP_SCRIPTID				=	1
x700031_CSP_TICKCOUNT				= 	2
x700031_CSP_FROMSCENEID				= 	3
x700031_CSP_ISCLOSING				= 	4
x700031_CSP_LEAVECOUNTDOWN			= 	5
x700031_CSP_TEAMID					=	6
x700031_CSP_BACKSCENEX       		=   7
x700031_CSP_BACKSCENEZ      		=   8
x700031_CSP_FUBENLEVEL			=	9

x700031_CSP_TICKCOUNT_ADD			=	12
x700031_CSP_TICKCOUNT_SUB			=	13

x700031_CSP_KILLCOUNT				=	20
x700031_CSP_FUBEN_SCENE_ID			=	21

x700031_CSP_NPC1_ID					=	22
x700031_CSP_NPC2_ID					=	23
x700031_CSP_NPC3_ID					=	24
x700031_CSP_NPC4_ID					=	25
x700031_CSP_NPC5_ID					=	26
x700031_CSP_NPC6_ID					=	27
x700031_CSP_BOSS1_ID				=	28
x700031_CSP_BOSS2_ID				=	29
x700031_CSP_BOSS3_ID				=	30
x700031_CSP_BOSS4_ID				=	31
x700031_CSP_BOSS5_ID				=	32


x700031_CSP_GAME_STEP				=	34

x700031_CSP_B_BOSS1					=	35
x700031_CSP_B_BOSS2					=	36
x700031_CSP_B_BOSS3					=	37
x700031_CSP_B_BOSS4					=	38
x700031_CSP_B_BOSS5					=	39
x700031_CSP_B_MONSTER2				=	40
x700031_CSP_FINAL_BOSS_ID			=	41
x700031_CSP_B_FINALBOSS				=	42


x700031_CSP_TALK_NPC1_ID			=	43
x700031_CSP_TALK_NPC1_STEP			=	44
x700031_CSP_TALK_NPC2_ID			=	45
x700031_CSP_TALK_NPC2_STEP			=	46

x700031_CSP_B_KILL_WUXING			=	47



x700031_CSP_SHUAGUAI_AREA_START		=	90
x700031_CSP_OBJID_AREA				=	110

x700031_CSP_ZHANCHE					 = 238
x700031_CSP_XIANJINBOSS				=	239
x700031_CSP_HUMAN_COUNT				=	240
x700031_CSP_OBJID_START				=	241

x700031_CSP_GUID_START              =   248  
x700031_CSP_FUBEN_TYPE				=	254	
x700031_CSP_FUBEN_MODE				=   255 



x700031_var_FileId 					= 700031
x700031_var_FubenType				= 	FUBEN_ZHUJIAZHUANG2		    
x700031_var_LimitTotalHoldTime		= 	540						
x700031_var_TaopaoTime				=   30*12
x700031_var_Level_Limit = 70
x700031_var_Rate_Limit = 40

x700031_var_SubmitNPC                 =   { type =25079,guid= 150553,varX = 138, z=203, facedir =0, title ="神行太保" }
x700031_var_LeaveNPC					=   { type =25079,guid= 150553,varX = 138, z=203, facedir =0, title ="神行太保" }

x700031_var_ShiqianNPC					=   { type =25088,varX = 130, z=110.5, facedir =178, title ="" }

x700031_var_TalkNPCList					= {
											{ type =25089,varX = 135, z=202,	facedir =178, varFlag =0, title ="花和尚" },
											{ type =25090,varX = 0,	z=0,	facedir =178, varFlag =1, title ="矮脚虎" },
										  }







function x700031_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	
end


function x700031_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700031_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700031_ProcFubenSceneCreated( varMap )
	
	
	SetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING,0)
	local varIndex = x700031_CSP_OBJID_AREA
	for varI=varIndex,varIndex+11 do

		SetFubenData_Param(varMap, varI, -1 )
	end

	SetFubenData_Param(varMap, x700031_CSP_GAME_STEP, 0 )

	SetFubenData_Param(varMap, x700031_CSP_BOSS1_ID,-2)
	SetFubenData_Param(varMap, x700031_CSP_BOSS2_ID,-2)
	SetFubenData_Param(varMap, x700031_CSP_BOSS3_ID,-2)
	SetFubenData_Param(varMap, x700031_CSP_BOSS4_ID,-2)
	SetFubenData_Param(varMap, x700031_CSP_BOSS5_ID,-2)
	SetFubenData_Param(varMap, x700031_CSP_FINAL_BOSS_ID,-2)
	SetFubenData_Param(varMap, x700031_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700031_CSP_XIANJINBOSS, -1 )

	x700031_CreateTalkNpc( varMap, 0 )

	x700031_CreateNpc( varMap )
	
	

    x700031_CreateMonster( varMap )
		
end

function x700031_EnterTick(varMap,nowTickCount)
	local varStep = GetFubenData_Param(varMap, x700031_CSP_GAME_STEP )
	if varStep==1 then
		local nNpcId1 = GetFubenData_Param(varMap, x700031_CSP_NPC1_ID )
		
		DeleteMonster( varMap,nNpcId1 )
		SetFubenData_Param(varMap, x700031_CSP_GAME_STEP, 2 )
	end
	
	local nTalkStep1 = GetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_STEP )
	local nTalkStep2 = GetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_STEP )

	if nTalkStep1>0 then
		local nTalkNpc1 = GetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_ID )
			
		local talklen =2
		local talklist = {"洒家一路杀过来，未见时迁，只见几个怪异的东西立在院内。倒是刚刚看见一个小女子手提一布袋向庄院最里边走去，莫非那袋中的便是时迁不成？","众家兄弟，杀进庄去，救出时迁！"};

		if nTalkStep1<= talklen then
			NpcTalk(varMap, nTalkNpc1, talklist[nTalkStep1],  -1)
			SetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_STEP, nTalkStep1+1 )
		else
			if nTalkNpc1>=0 then
				DeleteMonster( varMap,nTalkNpc1 )
				SetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_ID, -1 )
			end
			SetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_STEP, -1 )
		end
	end

	if nTalkStep2>0 then
		local nTalkNpc2 = GetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_ID )
		local talklen =1
		local talklist = {"兄弟慢动手，似这等小娘子死了岂不可惜，待我禀明宋公明哥哥，讨她做老婆，嘿嘿……"};

		if nTalkStep2<= talklen then
			NpcTalk(varMap, nTalkNpc2, talklist[nTalkStep2],  -1)
			SetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_STEP, nTalkStep2+1 )
		else
			if nTalkNpc2>=0 then
				DeleteMonster( varMap,nTalkNpc2 )
				SetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_ID, -1 )
			end
			SetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_STEP, -1 )
		end
	end
	
	
	
end


function x700031_CreateTalkNpc( varMap, nFlag, x1,z1 )
	for varI, item in x700031_var_TalkNPCList do

		if item.varFlag == nFlag then

			local varRet = 0
			
				


			if item.varFlag==0 then
				if item.title ~="" then
					varRet = CreateMonster(varMap, item.type, item.varX, item.z, 7, -1, -1, -1, -1,-1, item.facedir,  "",item.title)
					
				else
					varRet = CreateMonster(varMap, item.type, item.varX, item.z, 7, -1, -1, item.guid, -1,-1, item.facedir)
				
				end
				SetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_ID, varRet )
				SetFubenData_Param(varMap, x700031_CSP_TALK_NPC1_STEP, 1 )
					
			elseif item.varFlag==1 then
				local nRandom1 = random(-2,2)
				local nRandom2 = random(-2,2)
				if item.title ~="" then
					varRet = CreateMonster(varMap, item.type, x1+nRandom1, z1+nRandom2, 7, -1, -1, -1, -1,-1, item.facedir,  "",item.title)
					
				else
					varRet = CreateMonster(varMap, item.type, x1+nRandom1, z1+nRandom2, 7, -1, -1, item.guid, -1,-1, item.facedir)
				
				end
				SetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_ID, varRet )
				SetFubenData_Param(varMap, x700031_CSP_TALK_NPC2_STEP, 1 )
			
			end
		end
	end
end



function x700031_CreateNpc( varMap )

	local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

			local nObjId = 0
			if title ~="" then
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, guid, -1,-1, facedir,  "",title)
			else
				nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, guid, -1,-1, facedir)
			
			end

			if nObjId >= 0 then
				if varFlag==0 then
					SetFubenData_Param(varMap, x700031_CSP_NPC1_ID, nObjId )					
				elseif varFlag==1 then
					SetFubenData_Param(varMap, x700031_CSP_NPC2_ID, nObjId )
				elseif varFlag==2 then
					SetFubenData_Param(varMap, x700031_CSP_NPC3_ID, nObjId )
				elseif varFlag==3 then
					SetFubenData_Param(varMap, x700031_CSP_NPC4_ID, nObjId )
				elseif varFlag==4 then
					SetFubenData_Param(varMap, x700031_CSP_NPC5_ID, nObjId )
				elseif varFlag==5 then
					SetFubenData_Param(varMap, x700031_CSP_NPC6_ID, nObjId )
				end
			end
		end

	end			
		
end



function x700031_CreateBoss(varMap, nFlag)


	if nFlag==0 then
		local bCreated = GetFubenData_Param(varMap, x700031_CSP_B_BOSS1 )
		if bCreated>0 then
			return
		end
	elseif nFlag==1 then
		local bCreated = GetFubenData_Param(varMap, x700031_CSP_B_BOSS2 )
		if bCreated>0 then
			return
		end
	elseif nFlag==2 then
		local bCreated = GetFubenData_Param(varMap, x700031_CSP_B_BOSS3 )
		if bCreated>0 then
			return
		end
	elseif nFlag==3 then
		local bCreated = GetFubenData_Param(varMap, x700031_CSP_B_BOSS4 )
		if bCreated>0 then
			return
		end
	elseif nFlag==4 then
		local bCreated = GetFubenData_Param(varMap, x700031_CSP_B_BOSS5 )
		if bCreated>0 then
			return
		end
	else
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)

	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

			if nFlag==varFlag then
				local nObjId = -1
				if title ~="" then
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700031_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					nObjId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700031_var_FileId, -1, 21,-1, facedir)
				
				end

				if nObjId >= 0 then 
					if nFlag==0 then
						SetFubenData_Param(varMap, x700031_CSP_BOSS1_ID, nObjId )
						SetFubenData_Param(varMap, x700031_CSP_B_BOSS1, 1 )
					elseif nFlag==1 then
						SetFubenData_Param(varMap, x700031_CSP_BOSS2_ID, nObjId )
						SetFubenData_Param(varMap, x700031_CSP_B_BOSS2, 1 )
					elseif nFlag==2 then
						SetFubenData_Param(varMap, x700031_CSP_BOSS3_ID, nObjId )
						SetFubenData_Param(varMap, x700031_CSP_B_BOSS3, 1 )
					elseif nFlag==3 then
						SetFubenData_Param(varMap, x700031_CSP_BOSS4_ID, nObjId )
						SetFubenData_Param(varMap, x700031_CSP_B_BOSS4, 1 )
					elseif nFlag==4 then
						SetFubenData_Param(varMap, x700031_CSP_BOSS5_ID, nObjId )
						SetFubenData_Param(varMap, x700031_CSP_B_BOSS5, 1 )
					end
					break
				end
			end													
        end

	end

end


function x700031_CreateBoss2(varMap)  

	local bCreated = GetFubenData_Param(varMap, x700031_CSP_B_FINALBOSS )

	if bCreated>0 then
		return
	end


	local bosslist ={x700031_CSP_BOSS1_ID,x700031_CSP_BOSS2_ID,x700031_CSP_BOSS3_ID,x700031_CSP_BOSS4_ID,x700031_CSP_BOSS5_ID}
	
	local nDieCount = 0
	for varI,item in bosslist do
		local nValue = GetFubenData_Param(varMap, item ) ;
		if nValue==-1 then
			nDieCount = nDieCount+1;
		end
	end

	local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 and nDieCount == varFlag then

				local varRet = 0
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700031_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700031_var_FileId, -1, 21,-1, facedir)
				
				end


				
				SetFubenData_Param(varMap, x700031_CSP_FINAL_BOSS_ID, varRet )
				SetFubenData_Param(varMap, x700031_CSP_B_FINALBOSS, 1 )


				
				break
			
	    end
	end

	SetFubenData_Param(varMap, x700031_CSP_GAME_STEP,3 )

end







function x700031_CreateMonster2(varMap)  


    local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL ) ;
	local bCreatMonster2 = GetFubenData_Param(varMap, x700031_CSP_B_MONSTER2 ) ;

	if bCreatMonster2>0 then
		return
	end

	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title ~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end

	SetFubenData_Param(varMap, x700031_CSP_B_MONSTER2, 1 ) 


	

end





function x700031_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL ) 
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title ~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
			end
        end
	end

	

end







function x700031_ProcDie(varMap, varPlayer, varKiller)
	
	local nDieCount = GetFubenData_Param(varMap, x700031_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700031_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	local objId1 = GetFubenData_Param(varMap, x700031_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700031_CSP_BOSS2_ID)
	local objId3 = GetFubenData_Param(varMap, x700031_CSP_BOSS3_ID)
	local objId4 = GetFubenData_Param(varMap, x700031_CSP_BOSS4_ID)
	local objId5 = GetFubenData_Param(varMap, x700031_CSP_BOSS5_ID)
	local finalbossid = GetFubenData_Param(varMap, x700031_CSP_FINAL_BOSS_ID)

	
	local xianjinboss = GetFubenData_Param(varMap, x700031_CSP_XIANJINBOSS)
	
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700031_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700031_CSP_BOSS1_ID, -1)
		
		SetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING, 1)
	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700031_CSP_BOSS2_ID, -1)
		SetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING, 1)
	elseif objId3 == varPlayer then
		SetFubenData_Param(varMap, x700031_CSP_BOSS3_ID, -1)
		SetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING, 1)
	elseif objId4 == varPlayer then
		SetFubenData_Param(varMap, x700031_CSP_BOSS4_ID, -1)
		SetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING, 1)
	elseif objId5 == varPlayer then
		SetFubenData_Param(varMap, x700031_CSP_BOSS5_ID, -1)
		SetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING, 1)
	elseif finalbossid == varPlayer then

		local varX,z = GetWorldPos(varMap,finalbossid)
		
		x700031_CreateTalkNpc( varMap, 1,varX,z )

		SetFubenData_Param(varMap, x700031_CSP_FINAL_BOSS_ID, -1)

		x700031_CreateSubmitNpc( varMap)
		x700031_CreateZhanCheBoss(varMap)
		x700031_ShowTipsToAll( varMap, "顺利击杀扈三娘，副本完成。")
	end
end

function x700031_ProcAllMonsterDead( varMap)
	
end

function x700031_ProcFubenFailed(varMap,varPlayer)

	x700031_CreateLeaveNpc( varMap)
end

function x700031_CreateLeaveNpc( varMap)
	
	if x700031_var_LeaveNPC.title~= "" then
		CreateMonster(varMap, x700031_var_LeaveNPC.type, x700031_var_LeaveNPC.varX, x700031_var_LeaveNPC.z, 3, 0, -1, x700031_var_LeaveNPC.guid, -1,-1,x700031_var_LeaveNPC.facedir, "", x700031_var_LeaveNPC.title)
	else
		CreateMonster(varMap, x700031_var_LeaveNPC.type, x700031_var_LeaveNPC.varX, x700031_var_LeaveNPC.z, 3, 0, -1, x700031_var_LeaveNPC.guid, -1,-1,x700031_var_LeaveNPC.facedir)
		
	end

	
	 x700031_CreateXianJinBoss(varMap)
	 

end



function x700031_CreateSubmitNpc( varMap)
	
	if x700031_var_SubmitNPC.title~= "" then
		CreateMonster(varMap, x700031_var_SubmitNPC.type, x700031_var_SubmitNPC.varX, x700031_var_SubmitNPC.z, 3, 0, -1, x700031_var_SubmitNPC.guid, -1,-1,x700031_var_SubmitNPC.facedir, "", x700031_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700031_var_SubmitNPC.type, x700031_var_SubmitNPC.varX, x700031_var_SubmitNPC.z, 3, 0, -1, x700031_var_SubmitNPC.guid, -1,-1,x700031_var_SubmitNPC.facedir)
		
	end

	
	 x700031_CreateXianJinBoss(varMap)
	 

	local bKillWuxing = GetFubenData_Param(varMap, x700031_CSP_B_KILL_WUXING)

	if bKillWuxing<=0 then
		LuaCallNoclosure( 701120, "ProcSceneBossDie", varMap, 0)
	end
end





function x700031_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700031_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700031_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700031_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700031_CSP_XIANJINBOSS, varRet )
		end
	end

	x700031_ShowTipsToAll(varMap, "翻番宝箱出现！")
end










function x700031_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBENTYPE);

	if nFubenType~=x700031_var_FubenType then
		return
	end

	local humancount = GetFuben_PlayerCount(varMap);









	 
    local nFind = 1
    local guid = GetPlayerGUID( varMap,varPlayer )


	
    
    if nFind == 0 then
		return
    end

	local varIndex = x700031_CSP_OBJID_AREA
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


	local varStep = GetFubenData_Param(varMap, x700031_CSP_GAME_STEP )


	if varStep==2 then 
		x700031_CreateBoss2(varMap)
	end

	
	

end




function x700031_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )

	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBENTYPE);

	if nFubenType~=x700031_var_FubenType then
		return
	end

    local humancount = GetFuben_PlayerCount(varMap);









	local varIndex = x700031_CSP_OBJID_AREA
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




function x700031_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	
end





function x700031_ProcNpcTalk1( varMap, varPlayer)
	local varStep = GetFubenData_Param(varMap, x700031_CSP_GAME_STEP )
	if varStep~=0 then
		return
	end

	local bCloseing = GetFubenData_Param(varMap, x700031_CSP_ISCLOSING);

	if bCloseing==1 then
		return
	end

	SetFubenData_Param(varMap, x700031_CSP_GAME_STEP, 1 )
	local nNpcId1 = GetFubenData_Param(varMap, x700031_CSP_NPC1_ID )

	
	NpcTalk(varMap, nNpcId1, "这是个圈套！时间无多，大家快撤！",  -1)
		
	

	local varRet = 0
	if x700031_var_ShiqianNPC.title~= "" then
		varRet = CreateMonster(varMap, x700031_var_ShiqianNPC.type, x700031_var_ShiqianNPC.varX, x700031_var_ShiqianNPC.z, 3, 0, -1, -1, -1,-1,x700031_var_ShiqianNPC.facedir, "", x700031_var_LeaveNPC.title)
	else
		varRet = CreateMonster(varMap, x700031_var_ShiqianNPC.type, x700031_var_ShiqianNPC.varX, x700031_var_ShiqianNPC.z, 3, 0, -1, -1, -1,-1,x700031_var_ShiqianNPC.facedir)
		
	end
	
	

	
	x700031_CreateMonster2(varMap)

	local nowTickCount = GetFubenData_Param(varMap, x700031_CSP_TICKCOUNT)

	
	local nAdd = x700031_var_LimitTotalHoldTime-x700031_var_TaopaoTime-nowTickCount
	if nAdd>0 then
		SetFubenData_Param(varMap, x700031_CSP_TICKCOUNT_ADD, nAdd)
	elseif nAdd<0 then
		nAdd = -1*nAdd
		SetFubenData_Param(varMap, x700031_CSP_TICKCOUNT_SUB, nAdd)
	end

	SetFubenData_Param(varMap, x700031_CSP_TICKCOUNT, x700031_var_LimitTotalHoldTime-x700031_var_TaopaoTime);  
	x700031_SetTempImpassable(varMap)
end


function x700031_ProcNpcTalk2( varMap, varPlayer)
	x700031_CreateBoss(varMap, 0)
end


function x700031_ProcNpcTalk3( varMap, varPlayer)
	x700031_CreateBoss(varMap, 1)
end


function x700031_ProcNpcTalk4( varMap, varPlayer)
	x700031_CreateBoss(varMap, 2)
end


function x700031_ProcNpcTalk5( varMap, varPlayer)
	x700031_CreateBoss(varMap, 3)
end


function x700031_ProcNpcTalk6( varMap, varPlayer)
	x700031_CreateBoss(varMap, 4)
end





function x700031_SetTempImpassable(varMap)
	
	
	local arrArea = {Left = 125,Top = 107,Right =  135,Bottom = 114}


	AddSceneTempImpassable(varMap,arrArea.Left,arrArea.Top,arrArea.Right,arrArea.Bottom)
		
	
end




function x700031_ClearTempImpassable(varMap)
	
	LuaThisScenceM2Wrold( varMap,"战斗开始",5,1)
	
	local varIndex = x700031_GetBattleSceneType(varMap)
	
	for varI,itm in x700031_var_TempImpassable do
		if itm.Flag == varIndex then
			DelSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
		end
	end
end



function x700031_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700031_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700031_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700031_CSP_FUBENLEVEL)

	if fubenlevel < x700031_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700031_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700031_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700031_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700031_var_FileId,nIndexFrom,varI)
		if idScript == x700031_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end

			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700031_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700031_ShowTipsToAll(varMap, "战车雷爪之王出现！")
	end
end
