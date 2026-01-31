











x700024_CSP_FUBENTYPE				= 	0
x700024_CSP_SCRIPTID				=	1
x700024_CSP_TICKCOUNT				= 	2
x700024_CSP_FROMSCENEID				= 	3
x700024_CSP_ISCLOSING				= 	4
x700024_CSP_LEAVECOUNTDOWN			= 	5
x700024_CSP_TEAMID					=	6
x700024_CSP_BACKSCENEX       		=   7
x700024_CSP_BACKSCENEZ      		=   8
x700024_CSP_FUBENLEVEL			=	9

x700024_CSP_KILLCOUNT				=	20
x700024_CSP_BOSS_ID					=   21
x700024_CSP_BOSS_FULL_HP			=   22
x700024_CSP_FUBEN_SCENE_ID			=	23
x700024_CSP_MONSTER_KILL_COUNT		=	24

x700024_CSP_B_KILL_SHARK			=	25


x700024_CSP_MONSTER_COUNT			=	39
x700024_CSP_MONSTER_ID_START		=	40
x700024_CSP_SHARK_COUNT				=	99
x700024_CSP_SHARK_ID_START			=	100
x700024_CSP_MODEL_COUNT				=	109
x700024_CSP_MODEL_ID_START			=	110

x700024_CSP_XIANJINBOSS				=	239

x700024_CSP_HUMAN_COUNT				=	240
x700024_CSP_OBJID_START				=	241

x700024_CSP_GUID_START              =   248  
x700024_CSP_FUBEN_TYPE				=	254	
x700024_CSP_FUBEN_MODE				=   255 





x700024_var_FileId 					= 700024

x700024_var_SubmitNPC                 =   { type =25007,guid= 150507,varX = 54, z=71, facedir =0, title="" }


										
x700024_var_Shark_FinalX					=	55
x700024_var_Shark_FinalZ					=	60














function x700024_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
end



function x700024_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700024_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700024_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700024_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700024_CSP_B_KILL_SHARK, 0 );
	x700024_CreateBoss( varMap )
    x700024_CreateMonster( varMap )

end

function x700024_EnterTick(varMap, nowTickCount)

	local nSharkCount = GetFubenData_Param(varMap, x700024_CSP_SHARK_COUNT ) ;
	
	for varI=0, nSharkCount-1 do
		local nObjMonsterId = GetFubenData_Param(varMap, x700024_CSP_SHARK_ID_START+varI );
		if nObjMonsterId>0 and IsObjValid(varMap,nObjMonsterId) == 1  then
			local varX,z = GetWorldPos(varMap,nObjMonsterId)
			
			if varX==x700024_var_Shark_FinalX and z==x700024_var_Shark_FinalZ then
				
				DeleteMonster( varMap,nObjMonsterId )
				SetFubenData_Param(varMap, x700024_CSP_SHARK_ID_START+varI, -1)
				x700024_CreateModel(varMap)
			end
		end
	end


	if mod(nowTickCount,1) ==0 then  
		local nBossId = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID ) ;

		if nBossId>=0 then
			local nCurrentBossHp = GetHp( varMap, nBossId )
			local nFullBossHp = GetFubenData_Param(varMap, x700024_CSP_BOSS_FULL_HP )
			if nCurrentBossHp/nFullBossHp<0.5 then
				

				local nModelCount = GetFubenData_Param(varMap, x700024_CSP_MODEL_COUNT );
				
				for varI=0, nModelCount-1 do
					local nModelId = GetFubenData_Param(varMap, x700024_CSP_MODEL_ID_START+varI ) ;
					
					if nModelId>0 then
						DeleteMonster( varMap,nModelId )
						SetFubenData_Param(varMap, x700024_CSP_MODEL_ID_START+varI, -1)

						SetHp(varMap,nBossId, nFullBossHp*0.2 )
						
						local humancount = GetFuben_PlayerCount(varMap);
						for	j = 0, humancount - 1 do
							local humanId = GetFuben_PlayerObjId(varMap, j);
							local varStr = "巨鲨吃了一条小鲨鱼，为自己补充生命！"
							StartTalkTask(varMap);
							TalkAppendString(varMap, varStr);
							StopTalkTask(varMap);
							DeliverTalkTips(varMap, humanId);
						end
						break;
					end
				end
			end
			
			
		end
	end
			
            
	
end

function x700024_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )

	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir)
			
			end
			SetFubenData_Param(varMap, x700024_CSP_BOSS_ID, varRet ) ;
			local nFullHp = GetHp( varMap, varRet )
			SetFubenData_Param(varMap, x700024_CSP_BOSS_FULL_HP, nFullHp )
			
        end
	end

end







function x700024_CreateMonster(varMap) 


    local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) ;

	local nCount = 0
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir)
				
				end
				SetFubenData_Param(varMap, x700024_CSP_MONSTER_ID_START+nCount, varRet ) ;
				nCount = nCount+1
            end
        end
	end

	SetFubenData_Param(varMap, x700024_CSP_MONSTER_COUNT, nCount ) ;
	SetFubenData_Param(varMap, x700024_CSP_MONSTER_KILL_COUNT, 0 )

end



function x700024_CreateModel(varMap)
	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) 
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nCount = GetFubenData_Param(varMap, x700024_CSP_MODEL_COUNT )

	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = varX + rx
				local rz = random(-r,r)
				local z = z + rz
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, -1,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, -1,-1, facedir)
				
				end
				SetFubenData_Param(varMap, x700024_CSP_MODEL_ID_START+nCount, varRet ) ;
				nCount = nCount+1
			end
			
        end
	end

	local nModelCount =  nCount;
	SetFubenData_Param(varMap, x700024_CSP_MODEL_COUNT,nModelCount )

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = format("%d只幼鲨受到巨鲨的庇护！",nModelCount);
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end

function x700024_CreateSharkMonster(varMap, nCurrentKillCount)
	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	local nCount = GetFubenData_Param(varMap, x700024_CSP_SHARK_COUNT )

	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			
			for j=0,varCount -1 do

				local rx = random(-r,r)
				local varX = varX + rx
				local rz = random(-r,r)
				local z = z + rz
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1, facedir)
				
				end
				SetPatrolId(varMap, varRet, 0)
				SetFubenData_Param(varMap, x700024_CSP_SHARK_ID_START+nCount, varRet ) ;
				nCount = nCount+1
			end
			
        end
	end

	local nSharkCount =  nCount;
	SetFubenData_Param(varMap, x700024_CSP_SHARK_COUNT,nSharkCount )

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = format("杀死小怪%d个, 第%d条幼鲨刷新",nCurrentKillCount,nSharkCount );
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end


function x700024_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700024_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		local humancount = GetFuben_PlayerCount(varMap);

	
		for varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			if GetLevel(varMap, humanId) >= 80 then
				local refixInhExp = AddInherenceExp(varMap, humanId, 600)
				local varStr = format("你获得了%d点天赋值", refixInhExp)
				StartTalkTask(varMap);
					TalkAppendString(varMap,varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId)
			end
		end
	end
	
	local nDieCount = GetFubenData_Param(varMap, x700024_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700024_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	

	local objId1 = GetFubenData_Param(varMap, x700024_CSP_BOSS_ID)

	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700024_CSP_BOSS_ID,-1)
		x700024_CreateSubmitNpc( varMap)

		local humancount = GetFuben_PlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			local varStr = "奇异的石头出现！";
			StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap, humanId);

			
			local nRandom = random(1,100)
			if nRandom<=20 then
				StartItemTask(varMap)
				ItemAppend( varMap, 11990101, 1 )
				local varRet = StopItemTask(varMap,humanId)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,humanId)
					varStr = "恭喜你获得了和氏璧"
				else
					varStr = "很遗憾，你的背包已满无法获得和氏璧"
				end

				StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
				StopTalkTask(varMap);
				DeliverTalkTips(varMap, humanId);
			end
			
		end

			
			







				












			
			

			
			
			
	end

	
	
		
	
	local nMonsterCount = GetFubenData_Param(varMap, x700024_CSP_MONSTER_COUNT ) ;
	for varI=0, nMonsterCount-1 do
		local nObjMonsterId = GetFubenData_Param(varMap, x700024_CSP_MONSTER_ID_START+varI );
		if nObjMonsterId>=0 then
			if nObjMonsterId== varPlayer then
				SetFubenData_Param(varMap, x700024_CSP_MONSTER_ID_START+varI, -1 );
				local nCurrentKillCount = GetFubenData_Param(varMap, x700024_CSP_MONSTER_KILL_COUNT )+1 ;

				
				SetFubenData_Param(varMap, x700024_CSP_MONSTER_KILL_COUNT,nCurrentKillCount ) ;
			
				if mod(nCurrentKillCount, 6) ==0 then
					x700024_CreateSharkMonster(varMap,nCurrentKillCount)
				end
			end
		end
	end

	local nSharkCount = GetFubenData_Param(varMap, x700024_CSP_SHARK_COUNT ) ;
	for varI=0, nSharkCount-1 do
		local nObjMonsterId = GetFubenData_Param(varMap, x700024_CSP_SHARK_ID_START+varI );
		if nObjMonsterId>=0 then
			if nObjMonsterId== varPlayer then
				SetFubenData_Param(varMap, x700024_CSP_SHARK_ID_START+varI, -1 );
				
				SetFubenData_Param(varMap, x700024_CSP_B_KILL_SHARK, 1 );
			end
		end
	end


	local nModelCount = GetFubenData_Param(varMap, x700024_CSP_MODEL_COUNT );
	for varI=0, nModelCount-1 do
		local nObjMonsterId = GetFubenData_Param(varMap, x700024_CSP_MODEL_ID_START+varI );
		if nObjMonsterId>=0 then
			if nObjMonsterId== varPlayer then
				SetFubenData_Param(varMap, x700024_CSP_MODEL_ID_START+varI, -1 );
				
			end
		end
	end

	

				





end

function x700024_ProcAllMonsterDead( varMap)
	
end

function x700024_CreateSubmitNpc( varMap)
	if x700024_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700024_var_SubmitNPC.type, x700024_var_SubmitNPC.varX, x700024_var_SubmitNPC.z, 3, 0, -1, x700024_var_SubmitNPC.guid, -1,-1,x700024_var_SubmitNPC.facedir,  "",x700024_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700024_var_SubmitNPC.type, x700024_var_SubmitNPC.varX, x700024_var_SubmitNPC.z, 3, 0, -1, x700024_var_SubmitNPC.guid, -1,-1,x700024_var_SubmitNPC.facedir)
	
	end

	
	 x700024_CreateXianJinBoss(varMap)
	 

	 LuaCallNoclosure( 701107, "ProcSceneBossDie", varMap, 0)

	 local bKillShark = GetFubenData_Param(varMap, x700024_CSP_B_KILL_SHARK);

	 if bKillShark<=0 then
		LuaCallNoclosure( 701108, "ProcSceneBossDie", varMap, 0)
	 end
end





function x700024_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700024_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700024_CSP_FUBEN_MODE)

	if nFubenMode ==0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700024_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700024_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700024_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700024_var_FileId,nIndexFrom,varI)
		if idScript == x700024_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700024_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700024_CSP_XIANJINBOSS, varRet )
		end
	end

	x700024_ShowTipsToAll(varMap, "翻番宝箱出现！")
end

