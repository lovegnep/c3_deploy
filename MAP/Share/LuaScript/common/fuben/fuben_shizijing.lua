











x700010_CSP_FUBENTYPE				= 	0
x700010_CSP_SCRIPTID				=	1
x700010_CSP_TICKCOUNT				= 	2
x700010_CSP_FROMSCENEID				= 	3
x700010_CSP_ISCLOSING				= 	4
x700010_CSP_LEAVECOUNTDOWN			= 	5
x700010_CSP_TEAMID					=	6
x700010_CSP_BACKSCENEX       		=   7
x700010_CSP_BACKSCENEZ      		=   8
x700010_CSP_FUBENLEVEL			=	9

x700010_CSP_KILLCOUNT				=	20
x700010_CSP_FUBEN_SCENE_ID			=	21
x700010_CSP_BOSS1_ID				=	22
x700010_CSP_BOSS2_ID				=	23
x700010_CSP_BOSS3_ID				=   24
x700010_CSP_B_BOSS1_STATUS			=	25
x700010_CSP_BOSS1_TIME_COUNT		=	26
x700010_CSP_BOSS1_FULL_HP			=	27
x700010_CSP_B_BOSS2_STATUS			=	28
x700010_CSP_BOSS2_TIME_COUNT		=	29
x700010_CSP_XJ_BOSS_ID				=	30

x700010_CSP_HUMAN_COUNT				=	240
x700010_CSP_OBJID_START				=	241
x700010_CSP_GUID_START              =   248

x700010_CSP_FUBEN_MODE				=   255 


x700010_var_FileId 					= 700010

x700010_var_Buff1						=	13505                   
x700010_var_Buff2						=	13504                   
x700010_var_Boss1_Del_Time			=	6                       
x700010_var_Boss_Relive_Time			=	1*36                    

x700010_var_nShengWang_Boss1			=	10                      
x700010_var_nShengWang_Boss2			=	10                      
x700010_var_nShengWang_Boss3			=	200                     
x700010_var_nShengWang_Monster		=   5                       

x700010_var_SubmitNPC                 =   { type =25023,guid= 150523,varX = 49, z=52, facedir =0, title =""}











function x700010_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

end

function x700010_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700010_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700010_ProcFubenSceneCreated( varMap )
	

	x700010_CreateMonster( varMap )
	x700010_CreateBoss( varMap, 3 )
   
		
end



function x700010_EnterTick(varMap,nowTickCount)
	local nBoss1TimeCount = GetFubenData_Param(varMap, x700010_CSP_BOSS1_TIME_COUNT) + 1;
	SetFubenData_Param(varMap, x700010_CSP_BOSS1_TIME_COUNT, nBoss1TimeCount);

	local nBoss2TimeCount = GetFubenData_Param(varMap, x700010_CSP_BOSS2_TIME_COUNT) + 1;
	SetFubenData_Param(varMap, x700010_CSP_BOSS2_TIME_COUNT, nBoss2TimeCount);

	local nBoss1Status = GetFubenData_Param(varMap, x700010_CSP_B_BOSS1_STATUS)
	local nBoss2Status = GetFubenData_Param(varMap, x700010_CSP_B_BOSS2_STATUS)


	
	
	if nBoss1Status==1 then
		local nBoss1Id = GetFubenData_Param(varMap, x700010_CSP_BOSS1_ID)

		local currentHp = GetHp( varMap, nBoss1Id )
		local nFullHp = GetFubenData_Param(varMap, x700010_CSP_BOSS1_FULL_HP)
		
		if currentHp>=nFullHp then
			
			nBoss1TimeCount = nBoss1TimeCount-1
			SetFubenData_Param(varMap, x700010_CSP_BOSS1_TIME_COUNT, nBoss1TimeCount);
		else
			
			if nBoss1TimeCount==x700010_var_Boss1_Del_Time then
			
				if nBoss1Id>=0 then
					DeleteMonster( varMap,nBoss1Id )
					SetFubenData_Param(varMap, x700010_CSP_B_BOSS1_STATUS,2)
					SetFubenData_Param(varMap, x700010_CSP_BOSS1_ID,-1)
					SetFubenData_Param(varMap, x700010_CSP_BOSS1_TIME_COUNT,0)
					
				end
			end
		end

		
	elseif nBoss1Status==2 then
		if nBoss1TimeCount==x700010_var_Boss_Relive_Time then
			x700010_CreateBoss(varMap, 0)
			
		end
	end

	if nBoss2Status==2 then
		if nBoss2TimeCount==x700010_var_Boss_Relive_Time then
			x700010_CreateBoss(varMap, 1)
		end
	end
	
end



function x700010_CreateBoss(varMap, nFlag)


	local fubenlevel = GetFubenData_Param(varMap, x700010_CSP_FUBENLEVEL ) ;

	
	local nIndexFrom = GetFubenDataPosByScriptID(x700010_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700010_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700010_var_FileId,nIndexFrom,varI)
		if idScript == x700010_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if nFlag== varFlag or nFlag>=3 then
				local varRet = 0
				if title ~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700010_var_FileId, -1, 21,-1, facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700010_var_FileId, -1, 21,-1, facedir)
				
				end
				if varFlag == 0 then
					SetFubenData_Param(varMap, x700010_CSP_BOSS1_ID, varRet )
					SetFubenData_Param(varMap, x700010_CSP_B_BOSS1_STATUS, 1 )
					SetFubenData_Param(varMap, x700010_CSP_BOSS1_TIME_COUNT, 0 )

					local nFullHp = GetHp( varMap, varRet )
					SetFubenData_Param(varMap, x700010_CSP_BOSS1_FULL_HP,nFullHp )
					
					
				elseif varFlag == 1 then
					
					SetFubenData_Param(varMap, x700010_CSP_BOSS2_ID, varRet )
					SetFubenData_Param(varMap, x700010_CSP_B_BOSS2_STATUS, 1 )
					SetFubenData_Param(varMap, x700010_CSP_BOSS2_TIME_COUNT, 0 )
				elseif varFlag == 2 then
					
					SetFubenData_Param(varMap, x700010_CSP_BOSS3_ID, varRet )
					
				end
			end
		
        end
	end



















end







function x700010_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700010_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700010_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700010_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700010_var_FileId,nIndexFrom,varI)
		if idScript == x700010_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz

				if title ~= "" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, x700010_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, x700010_var_FileId, -1, 21,-1,facedir)
				
				end
			end
        end
	end


	
end




function x700010_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700010_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700010_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	
	local objId1 = GetFubenData_Param(varMap, x700010_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700010_CSP_BOSS2_ID)
	local objId3 = GetFubenData_Param(varMap, x700010_CSP_BOSS3_ID)
	local nXjBossId = GetFubenData_Param(varMap, x700010_CSP_XJ_BOSS_ID )

	local nShengWangBonus = 0;
	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700010_CSP_BOSS1_ID, -1)
		SetFubenData_Param(varMap, x700010_CSP_B_BOSS1_STATUS, 2)
		SetFubenData_Param(varMap, x700010_CSP_BOSS1_TIME_COUNT, 0)
		nShengWangBonus	= x700010_var_nShengWang_Boss1;
		local humancount = GetFuben_PlayerCount(varMap);

		for varI = 0, humancount - 1 do


			local humanId = GetFuben_PlayerObjId(varMap, varI);	
			SendSpecificImpactToUnit(varMap, humanId,humanId,humanId, x700010_var_Buff1,0 )






		end
	
		
	elseif objId2 == varPlayer then

		SetFubenData_Param(varMap, x700010_CSP_BOSS2_ID, -1)
		SetFubenData_Param(varMap, x700010_CSP_B_BOSS2_STATUS, 2)
		SetFubenData_Param(varMap, x700010_CSP_BOSS2_TIME_COUNT, 0)
		nShengWangBonus	= x700010_var_nShengWang_Boss2;

		local humancount = GetFuben_PlayerCount(varMap);

		for varI = 0, humancount - 1 do


			local humanId = GetFuben_PlayerObjId(varMap, varI);	
			SendSpecificImpactToUnit(varMap, humanId,humanId,humanId, x700010_var_Buff2,0 )






		end
		
		
	elseif objId3 == varPlayer then

		nShengWangBonus	= x700010_var_nShengWang_Boss3;
		SetFubenData_Param(varMap, x700010_CSP_BOSS3_ID, -1)
		x700010_CreateSubmitNpc( varMap)
		






























	elseif nXjBossId == varPlayer then
		SetFubenData_Param(varMap, x700010_CSP_XJ_BOSS_ID, -1 )
		nShengWangBonus = 620*4
	else
		nShengWangBonus	= x700010_var_nShengWang_Monster;
		
	end


	local nShengWangBonus_dup = nShengWangBonus
	
	
	if nShengWangBonus > 0 then
		local humancount = GetFuben_PlayerCount(varMap);

		for varI = 0, humancount - 1 do


			local humanId = GetFuben_PlayerObjId(varMap, varI);	

			
			nShengWangBonus = nShengWangBonus_dup
			local nLevel1 = GetLevel(varMap, varPlayer)	
			local nLevel2 = GetLevel(varMap, humanId)	
			local fubenlevel = GetFubenData_Param(varMap, x700010_CSP_FUBENLEVEL ) ; 
			
			if nLevel2-fubenlevel>10 then
				nShengWangBonus = floor(nShengWangBonus*nLevel1/nLevel2)
			end
			


			local varShengWang = GetShengWang( varMap, humanId )
			varShengWang = varShengWang + nShengWangBonus
			SetShengWang( varMap, humanId, varShengWang )
            
            local varStr = format("您获得了%d点声望值的奖励。", nShengWangBonus)
			Msg2Player(varMap,humanId,varStr,4,2)
			Msg2Player(varMap,humanId,varStr,4,3)

		end
		

		

		local buffId1 =9011
		local buffId1_1 = 9013
		local buffId2 =9012

		local humancount = GetFuben_PlayerCount(varMap);

		
		for varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			
			local bHaveImpact1 = IsHaveSpecificImpact( varMap, humanId, buffId1 )
			local bHaveImpact1_1 = IsHaveSpecificImpact( varMap, humanId, buffId1_1 )
			local bHaveImpact2 = IsHaveSpecificImpact( varMap, humanId, buffId2 )

			
			nShengWangBonus = nShengWangBonus_dup
			local nLevel1 = GetLevel(varMap, varPlayer)	
			local nLevel2 = GetLevel(varMap, humanId)	
			local fubenlevel = GetFubenData_Param(varMap, x700010_CSP_FUBENLEVEL ) ; 
			
			if nLevel2-fubenlevel>10 then
				nShengWangBonus = floor(nShengWangBonus*nLevel1/nLevel2)
			end
			
				
			local nLevel = GetLevel(varMap, humanId)
			if bHaveImpact1>0 or bHaveImpact1_1 > 0 then
				
				local varShengWang = GetShengWang( varMap, humanId )
				varShengWang = varShengWang + nShengWangBonus*1
				SetShengWang( varMap, humanId, varShengWang )

				local varStr = format("江湖请柬帮你获得%d点声望值的奖励",nShengWangBonus*1)
				Msg2Player(varMap,humanId,varStr,4,2)
                Msg2Player(varMap,humanId,varStr,4,3)
				
				
				StartTalkTask(varMap);
					TalkAppendString(varMap,varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);

			
				
			end

			if bHaveImpact2>0 then
				
				local varShengWang = GetShengWang( varMap, humanId )
				varShengWang = varShengWang + nShengWangBonus*2
				SetShengWang( varMap, humanId, varShengWang )

				local varStr = format("朝廷请柬帮你获得%d点声望值的奖励",nShengWangBonus*2)
				Msg2Player(varMap,humanId,varStr,4,2)
                Msg2Player(varMap,humanId,varStr,4,3)
				
				
				StartTalkTask(varMap);
					TalkAppendString(varMap,varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end
			
		end

	
	end
end

function x700010_ProcAllMonsterDead( varMap)
	x700010_CreateSubmitNpc( varMap)
end

function x700010_CreateSubmitNpc( varMap)
	if x700010_var_SubmitNPC.title ~="" then
		CreateMonster(varMap, x700010_var_SubmitNPC.type, x700010_var_SubmitNPC.varX, x700010_var_SubmitNPC.z, 3, 0, -1, x700010_var_SubmitNPC.guid, -1,-1,x700010_var_SubmitNPC.facedir,  "",x700010_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700010_var_SubmitNPC.type, x700010_var_SubmitNPC.varX, x700010_var_SubmitNPC.z, 3, 0, -1, x700010_var_SubmitNPC.guid, -1,-1,x700010_var_SubmitNPC.facedir)
	
	end

	
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700010_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700010_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
end





function x700010_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700010_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700010_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700010_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700010_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700010_var_FileId,nIndexFrom,varI)
		if idScript == x700010_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700010_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700010_var_FileId, -1, 21,-1,facedir)
			end

			SetFubenData_Param(varMap, x700010_CSP_XJ_BOSS_ID, varRet )
			
		end
	end

	x700010_ShowTipsToAll(varMap, "翻番宝箱出现！")
end
