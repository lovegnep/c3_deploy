












x700012_CSP_FUBENTYPE				= 	0
x700012_CSP_SCRIPTID				=	1
x700012_CSP_TICKCOUNT				= 	2
x700012_CSP_FROMSCENEID				= 	3
x700012_CSP_ISCLOSING				= 	4
x700012_CSP_LEAVECOUNTDOWN			= 	5
x700012_CSP_TEAMID				=	6
x700012_CSP_BACKSCENEX       			=	7
x700012_CSP_BACKSCENEZ      			=	8
x700012_CSP_FUBENLEVEL				=	9

x700012_CSP_KILLCOUNT				=	20
x700012_CSP_FUBEN_SCENE_ID			=	21

x700012_CSP_BOSS1_ID				=	22
x700012_CSP_BOSS1_FULL_HP			=	23
x700012_CSP_BOSS1_APPOINT			=	24

x700012_CSP_BOSS2_ID				=	25
x700012_CSP_BOSS2_FULL_HP			=	26
x700012_CSP_BOSS2_LOADMONSTER			=	27
x700012_CSP_BOSS2_EATMONSTER			=	28

x700012_CSP_BOSS3_ID				=	29

x700012_CSP_NPC_ID				=	30
x700012_CSP_NPC_STATUS				=	31

x700012_CSP_BOSS_XJ_ID				=	32

x700012_CSP_B_GUOYUN_START			=	228
x700012_CSP_B_GATHERED_START			=	234
x700012_CSP_HUMAN_COUNT				=	240
x700012_CSP_OBJID_START				=	241
x700012_CSP_GUID_START				=	248

x700012_CSP_FUBEN_TYPE				=	254	
x700012_CSP_FUBEN_MODE				=	255 





x700012_var_FileId 				=	700012



x700012_var_RandomBossRate			=	0                       
x700012_var_nGrowpointType			=	535			

x700012_var_RandomBoss1SkillRate			=	200                     



x700012_var_Item_XJ				=	11990012
x700012_var_ItemCount_XJ				=	1



x700012_var_SubmitNPC				=	{ type =28511,guid= 150578,varX = 77, z=18, facedir =0, title="" }

x700012_var_RedeemNPC				=	{ type =28511,guid= 150585,varX = 78, z=18, facedir =0, title="" }


x700012_var_BossCreate				=	{

								{levelmin =20, levelmax=100, varName ="蓝龙",   type= 27733,  varX=68,  z=25,  r=0,  ai=18, aiscript=580,  varCount=1,  facedir = 0, title = "", varFlag =2},
											
							}






x700012_var_GrowPoints				=	{831,832,833,834}
x700012_var_ItemID				=	{11020030, 11020051, 11030003, 11020040, 11020062, 11020063}





x700012_var_PlayerDetonate_EffectID		=	7906

x700012_var_EatMonster_EffectID			=	5091











function x700012_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
end



function x700012_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700012_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700012_ProcFubenSceneCreated( varMap )
	
	
	
	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700012_CSP_HUMAN_COUNT, humancount);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		

		local bGuoyun = CountryIsFortuneTime(varMap,humanId,2)
		SetFubenData_Param(varMap, x700012_CSP_B_GUOYUN_START+varI, 0); 
	end
	
	x700012_CreateBoss( varMap )
	x700012_CreateRandomBoss( varMap )
	x700012_CreateMonster( varMap )

		
end

function x700012_EnterTick(varMap, nowTickCount)
	if nowTickCount >= 2 then
		local humancount = GetFuben_PlayerCount(varMap);
		if humancount>0 then
			local nBoss1 = GetFubenData_Param(varMap, x700012_CSP_BOSS1_ID )
			if nBoss1>0 then
				local nCurrentHp = GetHp( varMap, nBoss1 )
				local nFullHp = GetFubenData_Param(varMap, x700012_CSP_BOSS1_FULL_HP )
				local nAppoint = GetFubenData_Param(varMap, x700012_CSP_BOSS1_APPOINT )
				if nCurrentHp/nFullHp <0.8 then
					if nAppoint == 0 then
						local rate = random(0,100)/100;
						if rate < x700012_var_RandomBoss1SkillRate then
							x700012_AppointPlayerToDetonate(varMap)
						end
					end
				end

				if nCurrentHp/nFullHp <0.5 then
					if nAppoint == 0 or nAppoint == 1 then
						local rate = random(0,100)/100;
						if rate < x700012_var_RandomBoss1SkillRate then
							x700012_AppointPlayerToDetonate(varMap)
						end
					end
				end

			end

			local nBoss2 = GetFubenData_Param(varMap, x700012_CSP_BOSS2_ID )
		
			if nBoss2>0 then
				local nCurrentHp = GetHp( varMap, nBoss2 )
				local nFullHp = GetFubenData_Param(varMap, x700012_CSP_BOSS2_FULL_HP )
				
				
				
					
						
					
				
				local nEatMonster = GetFubenData_Param(varMap, x700012_CSP_BOSS2_EATMONSTER )
			
				if nCurrentHp/nFullHp <0.8 then
					if nEatMonster == 0 then
						x700012_EatMonster(varMap)
					end
				end
				
				if nCurrentHp/nFullHp <0.5 then
					if nEatMonster == 1 then
						x700012_EatMonster(varMap)
					end
				end


			end
		end
	end

	if nowTickCount>=6 then
		local npcStatus = GetFubenData_Param(varMap, x700012_CSP_NPC_STATUS )

		if npcStatus==1 then
			local varTalknpc = GetFubenData_Param(varMap, x700012_CSP_NPC_ID )
			NpcTalk(varMap, varTalknpc, "感谢你们除掉了这金矿洞的恶魔，不过，我们还是赶紧出去吧。",  -1)
			SetFubenData_Param(varMap, x700012_CSP_NPC_STATUS,  2 )
		end
	end



end

function x700012_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700012_CSP_FUBENLEVEL ) ;
	
	local nRandomNum = random(0,2)

	local nIndexFrom = GetFubenDataPosByScriptID(x700012_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700012_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700012_var_FileId,nIndexFrom,varI)
		if idScript == x700012_var_FileId and monsterFlag == 1 and varFlag1 == nRandomNum and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local nMonsterID = -1
			
			if title~="" then
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1, facedir)
			
			end
			
			if varFlag == 0 then
				SetFubenData_Param(varMap, x700012_CSP_BOSS1_ID, nMonsterID )
				SetPatrolId(varMap, nMonsterID, -1)
				local nFullHp = GetHp( varMap, nMonsterID )
				SetFubenData_Param(varMap, x700012_CSP_BOSS1_FULL_HP, nFullHp )
				SetFubenData_Param(varMap, x700012_CSP_BOSS1_APPOINT, 0 )

			elseif varFlag == 1 then				
				SetFubenData_Param(varMap, x700012_CSP_BOSS2_ID, nMonsterID )
				local nFullHp = GetHp( varMap, nMonsterID )
				SetFubenData_Param(varMap, x700012_CSP_BOSS2_FULL_HP, nFullHp )
				SetFubenData_Param(varMap, x700012_CSP_BOSS2_LOADMONSTER, 0 )

			elseif varFlag == 2 then
				SetFubenData_Param(varMap, x700012_CSP_BOSS3_ID, nMonsterID ) ;
			end
		end
	end

	

		
		    
			
				
			
				
			
			
			
			

			
			
			
		
	


end

function x700012_CreateRandomBoss(varMap)


	local rate = random(0,100)/100;
	if rate>= x700012_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,0)

	local fubenlevel = GetFubenData_Param(varMap, x700012_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700012_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700012_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700012_var_FileId,nIndexFrom,varI)
		if idScript == x700012_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				if title~="" then
					CreateMonster(varMap, type, varX,z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX,z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir)
				
				end
			end
		end
	end

end

function x700012_CreateSubMonster(varMap)
	local nBoss2 = GetFubenData_Param(varMap, x700012_CSP_BOSS2_ID )
	local bCreatedSubMonster = GetFubenData_Param(varMap, x700012_CSP_BOSS2_LOADMONSTER )

	if bCreatedSubMonster>0 then
		return 0;
	end

	local varX,z = GetWorldPos(varMap,nBoss2)
		
	local varStep =0.2 ; 
	local fubenlevel = GetFubenData_Param(varMap, x700012_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700012_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700012_var_FileId )

	local j =0;
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700012_var_FileId,nIndexFrom,varI)
		if idScript == x700012_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			j = j+1;
			local tx = varX + random(-1*(j+1)*varStep, (j+1)*varStep);
			local tz = z + random(-1*(j+1)*varStep, (j+1)*varStep);


			if title~="" then
				CreateMonster(varMap, type, tx, tz, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir, "", title)
			else
				CreateMonster(varMap, type, tx, tz, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir)
			
			end
		end
	end

	

	SetFubenData_Param(varMap, x700012_CSP_BOSS2_LOADMONSTER, 1 )

	
end






function x700012_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700012_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700012_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700012_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700012_var_FileId,nIndexFrom,varI)
		if idScript == x700012_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title ~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir, "", title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir)
				
				end
			end
        end
	end


	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700012_var_FileId,nIndexFrom,varI)
		if idScript == x700012_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local nMonsterID = -1
				if title~="" then
					nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir, "",title)
				else
					nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir)
				
				end
				SetPatrolId(varMap, nMonsterID, 1)
            end
        end
	end

end




function x700012_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700012_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700012_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	

	local buffId1 =9011
	local buffId1_1 = 9013
	local buffId2 =9012

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		local bHaveImpact1 = IsHaveSpecificImpact( varMap, humanId, buffId1 )
		local bHaveImpact1_1 = IsHaveSpecificImpact( varMap, humanId, buffId1_1 )
		local bHaveImpact2 = IsHaveSpecificImpact( varMap, humanId, buffId2 )
			
		local nLevel = GetLevel(varMap, humanId)

		
		local nXjBossId = GetFubenData_Param(varMap, x700012_CSP_BOSS_XJ_ID )
		
		if bHaveImpact1>0 or bHaveImpact1_1 > 0 then
			local nMoney = nLevel*4

			if nXjBossId==varPlayer then
				nMoney = nLevel*4*50*4
				SetFubenData_Param(varMap, x700012_CSP_BOSS_XJ_ID, -1 )
			end

			local strMoney = x700012_GetMoneyName(varMap,nMoney)
			local varStr = format("江湖请柬使您额外获得%s的现银",strMoney)
			AddMoney(varMap, humanId, 0, nMoney)
			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, humanId);
		end

		if bHaveImpact2>0 then
			local nMoney = nLevel*2

			if nXjBossId==varPlayer then
				nMoney = nLevel*4*50*4
				SetFubenData_Param(varMap, x700012_CSP_BOSS_XJ_ID, -1 )
			end

			local strMoney = x700012_GetMoneyName(varMap,nMoney)
			local varStr = format("你有朝廷请柬，获得%s的银卡",strMoney)
			AddMoney(varMap, humanId, 1, nMoney)
			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, humanId);
		end
		
	end

	
	

	
	local objId1 = GetFubenData_Param(varMap, x700012_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700012_CSP_BOSS2_ID)
	local objId3 = GetFubenData_Param(varMap, x700012_CSP_BOSS3_ID)
	if objId1 == varPlayer then
		
		
		SetFubenData_Param(varMap, x700012_CSP_BOSS1_ID, -1)
		
		NpcTalk(varMap, varPlayer, "#R这……这不可能……我……还没有使出全力……", -1)
		

		
		







			




		
		

		
		
		

	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700012_CSP_BOSS2_ID, -1)

		NpcTalk(varMap, varPlayer, "#R我会……再回来的……", -1)
	
		for	varI = 0, 6 - 1 do
			SetFubenData_Param(varMap, x700012_CSP_B_GATHERED_START+varI,0);
		end































	elseif objId3 == varPlayer then
		SetFubenData_Param(varMap, x700012_CSP_BOSS3_ID, -1)

		for j,item in x700012_var_GrowPoints do
			SetGrowPointIntervalContainer(varMap,item,1)
		end
		
		

		x700012_CreateSubmitNpc( varMap)
	end
end


function x700012_ProcAllMonsterDead( varMap)
	x700012_CreateSubmitNpc( varMap)
end

function x700012_CreateSubmitNpc( varMap)
	local humancount = GetFuben_PlayerCount(varMap)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
			LuaCallNoclosure( 203805, "FinishChanchufuben", varMap, humanId)
			LuaCallNoclosure( 203806, "FinishChanchufuben", varMap, humanId)
			LuaCallNoclosure( 203807, "FinishChanchufuben", varMap, humanId)
			LuaCallNoclosure( 203808, "FinishChanchufuben", varMap, humanId)
	end


	local nSubmitNpc = -1
	if x700012_var_SubmitNPC.title~="" then
		nSubmitNpc = CreateMonster(varMap, x700012_var_SubmitNPC.type, x700012_var_SubmitNPC.varX, x700012_var_SubmitNPC.z, 3, 0, -1, x700012_var_SubmitNPC.guid, -1,-1,x700012_var_SubmitNPC.facedir,  "",x700012_var_SubmitNPC.title)
	else
		nSubmitNpc = CreateMonster(varMap, x700012_var_SubmitNPC.type, x700012_var_SubmitNPC.varX, x700012_var_SubmitNPC.z, 3, 0, -1, x700012_var_SubmitNPC.guid, -1,-1,x700012_var_SubmitNPC.facedir)
	
	end

	SetFubenData_Param(varMap, x700012_CSP_NPC_ID, nSubmitNpc )
	SetFubenData_Param(varMap, x700012_CSP_NPC_STATUS, 1 )

	
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700012_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700012_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
	 
	x700012_CreateRedeemNpc(varMap)
end

function x700012_CreateRedeemNpc(varMap)
	local fubentype = GetFubenData_Param(varMap, x700012_CSP_FUBEN_TYPE )
	if fubentype == 0 then
		if x700012_var_RedeemNPC.title~="" then
			CreateMonster(varMap, x700012_var_RedeemNPC.type, x700012_var_RedeemNPC.varX, x700012_var_RedeemNPC.z, 3, 0, -1, x700012_var_RedeemNPC.guid,-1,-1,x700012_var_RedeemNPC.facedir,"",x700012_var_RedeemNPC.title)
		else
			CreateMonster(varMap, x700012_var_RedeemNPC.type, x700012_var_RedeemNPC.varX, x700012_var_RedeemNPC.z, 3, 0, -1, x700012_var_RedeemNPC.guid,-1,-1,x700012_var_RedeemNPC.facedir)
		end
	end
end





function x700012_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700012_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700012_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700012_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700012_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700012_var_FileId,nIndexFrom,varI)
		if idScript == x700012_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local nMonsterID = -1
			if title~="" then
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir,"",title)
			else
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700012_var_FileId, -1, 21,-1,facedir)
			end

			SetFubenData_Param(varMap, x700012_CSP_BOSS_XJ_ID, nMonsterID )
			
		end
	end

	x700012_ShowTipsToAll(varMap, "翻番宝箱出现！")
end






function x700012_ProcGpCreate(varMap,growPointType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1,60000)

	SetGrowPointIntervalContainer(varMap,growPointType,2147483648)

end

function x700012_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	return 0;
	
end

function x700012_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	
	return 1;
	
end



function x700012_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	

	

	
	local nItemIndex = random(1,6)

	StartItemTask(varMap)
	ItemAppend( varMap, x700012_var_ItemID[nItemIndex], 1 )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#cffcf00荻得道具！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#cffcf00物品栏已满，无法得到任务物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,humanObjId)
		return 1
	end


end


function x700012_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end




	
	

	

	
        
        
		
		
		

        

			
			
			

			
				
				
				
				
				
				
				
				
				
				
			
				
			

			
				
			
			
			
           
       
    





	

	

	

	
		
	






	
	



function x700012_GetMoneyName(varMap,nMoney)
	local ding = floor(nMoney/(1000*1000))
	local liang = floor((nMoney-ding*1000*1000)/1000)
	local wen = nMoney-(ding*1000*1000+liang*1000)

	local varStr=""
	if ding>0 then
		varStr = varStr..format("%d锭",ding)
	end

	if liang>0 then
		varStr = varStr..format("%d两",liang)
	end

	if wen>0 then
		varStr = varStr..format("%d文",wen)
	end

	return varStr;
	
end




function x700012_AppointPlayerToDetonate(varMap)
	local nBoss1 = GetFubenData_Param(varMap, x700012_CSP_BOSS1_ID )
	local nAppoint = GetFubenData_Param(varMap, x700012_CSP_BOSS1_APPOINT )

	if nAppoint>1 then
		return 0;
	end

	local varX,z = GetWorldPos(varMap,nBoss1)
	local Num =  GetNearPlayerCountForMonster(varMap, nBoss1,varX,z,50)

	if Num > 0 then
		local RandomIndex = random(0,Num-1);
		
		local humanObjId = GetNearPlayerMemberForMonster(varMap, nBoss1,RandomIndex);
		if humanObjId ~= -1 then
			local humanObjName = GetName(varMap, humanObjId)
			local varRet = SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, x700012_var_PlayerDetonate_EffectID, 0)
			if varRet == 1 then
				NpcTalk(varMap, nBoss1, format("#R"..humanObjName.."已经被我诅咒，你们会因为他受到伤害的"), -1)
			end
			
			
			
			
		end
	end


	

	nAppoint = nAppoint + 1
	SetFubenData_Param(varMap, x700012_CSP_BOSS1_APPOINT, nAppoint )

	
end

function x700012_EatMonster(varMap)
	local nBoss2 = GetFubenData_Param(varMap, x700012_CSP_BOSS2_ID )
	local nEatMonster = GetFubenData_Param(varMap, x700012_CSP_BOSS2_EATMONSTER )

	if nEatMonster>1 then
		return 0;
	end

	
	local nEatMonsterID = FindNearestTeammate(varMap,nBoss2,20)

	if nEatMonsterID >= 0 and nEatMonsterID ~= nBoss2 then
		
		
		local varRet = DeleteMonster(varMap,nEatMonsterID)
		if varRet == 1 then
			SendSpecificImpactToUnit(varMap,nBoss2,nBoss2,nBoss2,x700012_var_EatMonster_EffectID,2)

			local nBoss1 = GetFubenData_Param(varMap, x700012_CSP_BOSS1_ID)
			local nBoss3 = GetFubenData_Param(varMap, x700012_CSP_BOSS3_ID)

			if nEatMonsterID == nBoss1 then
				SetFubenData_Param(varMap, x700012_CSP_BOSS1_ID, -1)
			elseif nEatMonsterID == nBoss3	then
				SetFubenData_Param(varMap, x700012_CSP_BOSS3_ID, -1)
			end
		end
	end
		
	nEatMonster = nEatMonster + 1
	SetFubenData_Param(varMap, x700012_CSP_BOSS2_EATMONSTER, nEatMonster )

	
end





