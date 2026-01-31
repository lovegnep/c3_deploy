
x700102_CSP_FUBENTYPE				= 	0
x700102_CSP_SCRIPTID				=	1
x700102_CSP_TICKCOUNT				= 	2
x700102_CSP_FROMSCENEID				= 	3
x700102_CSP_ISCLOSING				= 	4
x700102_CSP_LEAVECOUNTDOWN			= 	5
x700102_CSP_TEAMID				=	6
x700102_CSP_BACKSCENEX       			=	7
x700102_CSP_BACKSCENEZ      			=	8
x700102_CSP_FUBENLEVEL				=	9

x700102_CSP_KILLCOUNT				=	20
x700102_CSP_FUBEN_SCENE_ID			=	21

x700102_CSP_BOSS1_ID				=	22
x700102_CSP_BOSS1_FULL_HP			=	23
x700102_CSP_BOSS1_APPOINT			=	24

x700102_CSP_BOSS2_ID				=	25
x700102_CSP_BOSS2_FULL_HP			=	26
x700102_CSP_BOSS2_LOADMONSTER			=	27
x700102_CSP_BOSS2_EATMONSTER			=	28

x700102_CSP_BOSS3_ID				=	29

x700102_CSP_NPC_ID				=	30
x700102_CSP_NPC_STATUS				=	31

x700102_CSP_BOSS_XJ_ID				=	32

x700102_CSP_B_GUOYUN_START			=	228
x700102_CSP_B_GATHERED_START			=	234
x700102_CSP_HUMAN_COUNT				=	240
x700102_CSP_OBJID_START				=	241
x700102_CSP_GUID_START				=	248

x700102_CSP_FUBEN_TYPE				=	254	
x700102_CSP_FUBEN_MODE				=	255 

x700102_var_FileId 				=	700102



x700102_var_RandomBossRate			=	0                       
x700102_var_nGrowpointType			=	535			

x700102_var_RandomBoss1SkillRate			=	200                     



x700102_var_Item_XJ				=	11990012
x700102_var_ItemCount_XJ				=	1



x700102_var_SubmitNPC				=	{ type =28511,guid= 150578,varX = 61, z=102, facedir =270, title="副本传送人" }

x700102_var_RedeemNPC				=	{ type =28526,guid= 150585,varX = 51, z=101, facedir =270, title="藏宝令兑换" }


x700102_var_BossCreate				=	{

								{levelmin =20, levelmax=100, varName ="蓝龙",   type= 27733,  varX=68,  z=25,  r=0,  ai=18, aiscript=580,  varCount=1,  facedir = 0, title = "", varFlag =2},
											
							}

x700102_var_GrowPoints				=	{831,832,833,834}
x700102_var_ItemID				=	{11020030, 11020051, 11030003, 11020040, 11020062, 11020063}

x700102_var_PlayerDetonate_EffectID		=	7906

x700102_var_EatMonster_EffectID			=	5091


function x700102_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
end



function x700102_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700102_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700102_ProcFubenSceneCreated( varMap )
	
	
	
	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700102_CSP_HUMAN_COUNT, humancount);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		

		local bGuoyun = CountryIsFortuneTime(varMap,humanId,2)
		SetFubenData_Param(varMap, x700102_CSP_B_GUOYUN_START+varI, 0); 
	end
	
	x700102_CreateBoss( varMap )
	x700102_CreateRandomBoss( varMap )
	x700102_CreateMonster( varMap )

		
end

function x700102_EnterTick(varMap, nowTickCount)
	if nowTickCount >= 2 then
		local humancount = GetFuben_PlayerCount(varMap);
		if humancount>0 then
			local nBoss1 = GetFubenData_Param(varMap, x700102_CSP_BOSS1_ID )
			if nBoss1>0 then
				local nCurrentHp = GetHp( varMap, nBoss1 )
				local nFullHp = GetFubenData_Param(varMap, x700102_CSP_BOSS1_FULL_HP )
				local nAppoint = GetFubenData_Param(varMap, x700102_CSP_BOSS1_APPOINT )
				if nCurrentHp/nFullHp <0.8 then
					if nAppoint == 0 then
						local rate = random(0,100)/100;
						if rate < x700102_var_RandomBoss1SkillRate then
							x700102_AppointPlayerToDetonate(varMap)
						end
					end
				end

				if nCurrentHp/nFullHp <0.5 then
					if nAppoint == 0 or nAppoint == 1 then
						local rate = random(0,100)/100;
						if rate < x700102_var_RandomBoss1SkillRate then
							x700102_AppointPlayerToDetonate(varMap)
						end
					end
				end

			end

			local nBoss2 = GetFubenData_Param(varMap, x700102_CSP_BOSS2_ID )
		
			if nBoss2>0 then
				local nCurrentHp = GetHp( varMap, nBoss2 )
				local nFullHp = GetFubenData_Param(varMap, x700102_CSP_BOSS2_FULL_HP )
				
				local nEatMonster = GetFubenData_Param(varMap, x700102_CSP_BOSS2_EATMONSTER )
			
				if nCurrentHp/nFullHp <0.8 then
					if nEatMonster == 0 then
						x700102_EatMonster(varMap)
					end
				end
				
				if nCurrentHp/nFullHp <0.5 then
					if nEatMonster == 1 then
						x700102_EatMonster(varMap)
					end
				end


			end
		end
	end

	if nowTickCount>=6 then
		local npcStatus = GetFubenData_Param(varMap, x700102_CSP_NPC_STATUS )

		if npcStatus==1 then
			local varTalknpc = GetFubenData_Param(varMap, x700102_CSP_NPC_ID )
			NpcTalk(varMap, varTalknpc, "感谢你们除掉了这藏宝洞的恶魔，不过，我们还是赶紧出去吧。",  -1)
			SetFubenData_Param(varMap, x700102_CSP_NPC_STATUS,  2 )
		end

	end
end

function x700102_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700102_CSP_FUBENLEVEL ) ;
	
	local nRandomNum = random(0,2)

	local nIndexFrom = GetFubenDataPosByScriptID(x700102_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700102_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700102_var_FileId,nIndexFrom,varI)
		if idScript == x700102_var_FileId and monsterFlag == 1 and varFlag1 == nRandomNum and levelmin <= fubenlevel and levelmax >= fubenlevel then
		    local nMonsterID = -1
			
			if title~="" then
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1, facedir)
			
			end
			
			if varFlag == 0 then
				SetFubenData_Param(varMap, x700102_CSP_BOSS1_ID, nMonsterID )
				SetPatrolId(varMap, nMonsterID, -1)
				local nFullHp = GetHp( varMap, nMonsterID )
				SetFubenData_Param(varMap, x700102_CSP_BOSS1_FULL_HP, nFullHp )
				SetFubenData_Param(varMap, x700102_CSP_BOSS1_APPOINT, 0 )

			elseif varFlag == 1 then				
				SetFubenData_Param(varMap, x700102_CSP_BOSS2_ID, nMonsterID )
				local nFullHp = GetHp( varMap, nMonsterID )
				SetFubenData_Param(varMap, x700102_CSP_BOSS2_FULL_HP, nFullHp )
				SetFubenData_Param(varMap, x700102_CSP_BOSS2_LOADMONSTER, 0 )

			elseif varFlag == 2 then
				SetFubenData_Param(varMap, x700102_CSP_BOSS3_ID, nMonsterID ) ;
			end
		end
	end
	local humancount = GetFuben_PlayerCount(varMap);    
  if humancount >= 1 then                             
  	local varPlayer = GetFuben_PlayerObjId(varMap, 0);
  	GamePlayScriptLog(varMap, varPlayer, 1214)        
  end 
	
end

function x700102_CreateRandomBoss(varMap)


	local rate = random(0,100)/100;
	if rate>= x700102_var_RandomBossRate then
		return 0;
	end

	local nFlag = random(0,0)

	local fubenlevel = GetFubenData_Param(varMap, x700102_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700102_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700102_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700102_var_FileId,nIndexFrom,varI)
		if idScript == x700102_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				if title~="" then
					CreateMonster(varMap, type, varX,z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX,z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir)
				
				end
			end
		end
	end

end

function x700102_CreateSubMonster(varMap)
	local nBoss2 = GetFubenData_Param(varMap, x700102_CSP_BOSS2_ID )
	local bCreatedSubMonster = GetFubenData_Param(varMap, x700102_CSP_BOSS2_LOADMONSTER )

	if bCreatedSubMonster>0 then
		return 0;
	end

	local varX,z = GetWorldPos(varMap,nBoss2)
		
	local varStep =0.2 ; 
	local fubenlevel = GetFubenData_Param(varMap, x700102_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700102_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700102_var_FileId )

	local j =0;
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700102_var_FileId,nIndexFrom,varI)
		if idScript == x700102_var_FileId and monsterFlag == 5 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			j = j+1;
			local tx = varX + random(-1*(j+1)*varStep, (j+1)*varStep);
			local tz = z + random(-1*(j+1)*varStep, (j+1)*varStep);

			local MonId = 0
			if title~="" then
				MonId = CreateMonster(varMap, type, tx, tz, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir, "", title)
			else
				MonId = CreateMonster(varMap, type, tx, tz, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir)
			
			end
			
			SetPatrolId(varMap, MonId, patrolid)
		end
	end
	
	SetFubenData_Param(varMap, x700102_CSP_BOSS2_LOADMONSTER, 1 )

	
end

function x700102_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700102_CSP_FUBENLEVEL ) ;

	local nIndexFrom = GetFubenDataPosByScriptID(x700102_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700102_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700102_var_FileId,nIndexFrom,varI)
		if idScript == x700102_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
                
                local MonId = 0
				if title ~="" then
					MonId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir, "", title)
				else
					MonId = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir)
				
				end
				
				SetPatrolId(varMap, MonId, patrolid)
				print("SetPatrolId",MonId,patrolid)
			end
        end
	end


	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700102_var_FileId,nIndexFrom,varI)
		if idScript == x700102_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
		        local nMonsterID = -1
				if title~="" then
					nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir, "",title)
				else
					nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir)
				
				end
				SetPatrolId(varMap, nMonsterID, patrolid)
            end
        end
	end
	local humancount = GetFuben_PlayerCount(varMap);    
  if humancount >= 1 then                             
  	local varPlayer = GetFuben_PlayerObjId(varMap, 0);
  	GamePlayScriptLog(varMap, varPlayer, 1213)        
  end 

end

function x700102_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700102_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700102_CSP_KILLCOUNT, nDieCount+1);

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

		
		local nXjBossId = GetFubenData_Param(varMap, x700102_CSP_BOSS_XJ_ID )
	----------------------------------- 周卡 ----------------------------------		
		if bHaveImpact1>0 or bHaveImpact1_1 > 0 or bHaveImpact2 > 0 then
			local nMoney = nLevel*5*2

			if nXjBossId==varPlayer then
				nMoney = nLevel*5*50*4
				SetFubenData_Param(varMap, x700102_CSP_BOSS_XJ_ID, -1 )
			end

			local strMoney = x700102_GetMoneyName(varMap,nMoney)
			local varStr = format("请柬使您额外获得%s的现银",strMoney)
			AddMoney(varMap, humanId, 0, nMoney)
			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, humanId);
			
			if bHaveImpact2 > 0 then
				local nMoney = nLevel*5*20
				if nXjBossId==varPlayer then
					nMoney = nLevel*5*50*4
					SetFubenData_Param(varMap, x700102_CSP_BOSS_XJ_ID, -1 )
				end
				local strMoney = x700102_GetMoneyName(varMap,nMoney)
				local varStr = format("朝廷请柬使您额外获得%s的金卡",strMoney)
				AddMoney(varMap, humanId, 3, nMoney)
				StartTalkTask(varMap);
					TalkAppendString(varMap,varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end
			
	----------------------------------- 周卡 END---------------------------------			
		else
			local nMoney = nLevel*5
			if nXjBossId==varPlayer then
				nMoney = nLevel*5*50*4
				SetFubenData_Param(varMap, x700102_CSP_BOSS_XJ_ID, -1 )
			end
			local strMoney = x700102_GetMoneyName(varMap,nMoney)
			local varStr = format("杀死怪物使您额外获得%s的银卡",strMoney)
			AddMoney(varMap, humanId, 1, nMoney)
			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, humanId);
		end
		
	end
	
	local objId1 = GetFubenData_Param(varMap, x700102_CSP_BOSS1_ID)
	local objId2 = GetFubenData_Param(varMap, x700102_CSP_BOSS2_ID)
	local objId3 = GetFubenData_Param(varMap, x700102_CSP_BOSS3_ID)
	if objId1 == varPlayer then				
		SetFubenData_Param(varMap, x700102_CSP_BOSS1_ID, -1)		
		NpcTalk(varMap, varPlayer, "#R这……这不可能……我……还没有使出全力……", -1)
	elseif objId2 == varPlayer then
		SetFubenData_Param(varMap, x700102_CSP_BOSS2_ID, -1)
		NpcTalk(varMap, varPlayer, "#R我会……再回来的……", -1)	
	elseif objId3 == varPlayer then
		SetFubenData_Param(varMap, x700102_CSP_BOSS3_ID, -1)
		for j,item in x700102_var_GrowPoints do
			
		end
        
  SetGrowPointIntervalContainer(varMap, 535 , 1000);
  local humancount = GetFuben_PlayerCount(varMap);    
  if humancount >= 1 then                             
  	local varPlayer = GetFuben_PlayerObjId(varMap, 0);
  	GamePlayScriptLog(varMap, varPlayer, 1215)        
  end 
		
		

		x700102_CreateSubmitNpc( varMap)
	end
end


function x700102_ProcAllMonsterDead( varMap)
	x700102_CreateSubmitNpc( varMap)
end

function x700102_CreateSubmitNpc( varMap)

	local nSubmitNpc = -1
	if x700102_var_SubmitNPC.title~="" then
		nSubmitNpc = CreateMonster(varMap, x700102_var_SubmitNPC.type, x700102_var_SubmitNPC.varX, x700102_var_SubmitNPC.z, 3, 0, -1, x700102_var_SubmitNPC.guid, -1,-1,x700102_var_SubmitNPC.facedir,  "",x700102_var_SubmitNPC.title)
	else
		nSubmitNpc = CreateMonster(varMap, x700102_var_SubmitNPC.type, x700102_var_SubmitNPC.varX, x700102_var_SubmitNPC.z, 3, 0, -1, x700102_var_SubmitNPC.guid, -1,-1,x700102_var_SubmitNPC.facedir)
	
	end

	SetFubenData_Param(varMap, x700102_CSP_NPC_ID, nSubmitNpc )
	SetFubenData_Param(varMap, x700102_CSP_NPC_STATUS, 1 )

	
	 
	 local nFubenMode = GetFubenData_Param(varMap, x700102_CSP_FUBEN_MODE)
	 if nFubenMode==1 then
	 	SetGrowPointIntervalContainer(varMap,541,1)
	 	x700102_ShowTipsToAll(varMap, "现金宝箱出现！")
	 end
	 
	 
	x700102_CreateRedeemNpc(varMap)
end

function x700102_CreateRedeemNpc(varMap)
	local fubentype = GetFubenData_Param(varMap, x700102_CSP_FUBEN_TYPE )
	if fubentype == 0 then
		if x700102_var_RedeemNPC.title~="" then
			CreateMonster(varMap, x700102_var_RedeemNPC.type, x700102_var_RedeemNPC.varX, x700102_var_RedeemNPC.z, 3, 0, -1, x700102_var_RedeemNPC.guid,-1,-1,x700102_var_RedeemNPC.facedir,"",x700102_var_RedeemNPC.title)
		else
			CreateMonster(varMap, x700102_var_RedeemNPC.type, x700102_var_RedeemNPC.varX, x700102_var_RedeemNPC.z, 3, 0, -1, x700102_var_RedeemNPC.guid,-1,-1,x700102_var_RedeemNPC.facedir)
		end
	end
end





function x700102_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700102_CSP_FUBEN_MODE)

	if nFubenMode~=1 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700102_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700102_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700102_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700102_var_FileId,nIndexFrom,varI)
		if idScript == x700102_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local nMonsterID = -1
			if title~="" then
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir,"",title)
			else
				nMonsterID = CreateMonster(varMap, type, varX, z, ai, aiscript, x700102_var_FileId, -1, 21,-1,facedir)
			end

			SetFubenData_Param(varMap, x700102_CSP_BOSS_XJ_ID, nMonsterID )
			
		end
	end

	x700102_ShowTipsToAll(varMap, "翻番宝箱出现！")
end








function x700102_ProcGpCreate(varMap,growPointType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)

end



function x700102_ProcGpOpen(varMap,varPlayer,varTalknpc)
    
	local myGuid = GetPlayerGUID( varMap,varPlayer )
    myGuid = format("%u", myGuid)


    local humancount = GetFuben_PlayerCount(varMap)
    for varI=0, 6 do
        local paramidx = x700102_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
    	nGUID = format("%u", nGUID)
    
    
        if nGUID == myGuid then
    
    		local bGathered = GetFubenData_Param(varMap, x700102_CSP_B_GATHERED_START+varI);
    		
    		local varStr = ""
    
    		if bGathered>0 then
            	varStr = "您只能采集一次！"
                StartTalkTask(varMap);
    			TalkAppendString(varMap,varStr);
    			StopTalkTask();
    			DeliverTalkTips(varMap, varPlayer);
                return 1
       		end
        end
    end
	
	return 0;
	
end

function x700102_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	
	return 0;
end



function x700102_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	

	x700102_ProcAnwer(varMap,varPlayer)

	
end


function x700102_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

	
end


function x700102_ProcAnwer(varMap,varPlayer)

	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
	
        local humancount = GetFuben_PlayerCount(varMap)
	for varI = 0 , 6 do
        local paramidx = x700102_CSP_GUID_START + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
		nGUID = format("%u", nGUID)
		
		
        if nGUID == myGuid then

			local bGathered = GetFubenData_Param(varMap, x700102_CSP_B_GATHERED_START+varI);
			
			local varStr = ""

			if bGathered<=0 then
				SetFubenData_Param(varMap, x700102_CSP_B_GATHERED_START+varI,1);
				
				local bGuoyun =GetFubenData_Param(varMap, x700102_CSP_B_GUOYUN_START+varI);
				local nMoney = x700102_GetMyMoneyBonus(varMap,varPlayer,bGuoyun);
				
				
				local strMoney = x700102_GetMoneyName(varMap,nMoney)
				varStr = format("获得%s的银卡",strMoney)
				
				AddMoney(varMap, varPlayer, 1, nMoney)
			else
				varStr = "您只能采集一次！"
			end

			StartTalkTask(varMap);
				TalkAppendString(varMap,varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			break;
           
        end
    end
end


function x700102_GetMyMoneyBonus(varMap,varPlayer,bGuoyun)

	local nLevel = GetLevel(varMap,varPlayer)

	local varCount = nLevel*400

	local nFubenMode = GetFubenData_Param(varMap, x700102_CSP_FUBEN_MODE)

	if nFubenMode==1 then
		varCount = nLevel*400*5
	end






	
	return varCount;
end


function x700102_GetMoneyName(varMap,nMoney)
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





function x700102_AppointPlayerToDetonate(varMap)
	local nBoss1 = GetFubenData_Param(varMap, x700102_CSP_BOSS1_ID )
	local nAppoint = GetFubenData_Param(varMap, x700102_CSP_BOSS1_APPOINT )

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
			local varRet = SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, x700102_var_PlayerDetonate_EffectID, 0)
			if varRet == 1 then
				NpcTalk(varMap, nBoss1, format("#R"..humanObjName.."已经被我诅咒，你们会因为他受到伤害的"), -1)
			end
			
			
			
			
		end
	end


	

	nAppoint = nAppoint + 1
	SetFubenData_Param(varMap, x700102_CSP_BOSS1_APPOINT, nAppoint )

	
end

function x700102_EatMonster(varMap)
	local nBoss2 = GetFubenData_Param(varMap, x700102_CSP_BOSS2_ID )
	local nEatMonster = GetFubenData_Param(varMap, x700102_CSP_BOSS2_EATMONSTER )

	if nEatMonster>1 then
		return 0;
	end

	
	local nEatMonsterID = FindNearestTeammate(varMap,nBoss2,20)

	if nEatMonsterID >= 0 and nEatMonsterID ~= nBoss2 then
		
		
		local varRet = DeleteMonster(varMap,nEatMonsterID)
		if varRet == 1 then
			SendSpecificImpactToUnit(varMap,nBoss2,nBoss2,nBoss2,x700102_var_EatMonster_EffectID,2)

			local nBoss1 = GetFubenData_Param(varMap, x700102_CSP_BOSS1_ID)
			local nBoss3 = GetFubenData_Param(varMap, x700102_CSP_BOSS3_ID)

			if nEatMonsterID == nBoss1 then
				SetFubenData_Param(varMap, x700102_CSP_BOSS1_ID, -1)
			elseif nEatMonsterID == nBoss3	then
				SetFubenData_Param(varMap, x700102_CSP_BOSS3_ID, -1)
			end
		end
	end
		
	nEatMonster = nEatMonster + 1
	SetFubenData_Param(varMap, x700102_CSP_BOSS2_EATMONSTER, nEatMonster )

	
end





