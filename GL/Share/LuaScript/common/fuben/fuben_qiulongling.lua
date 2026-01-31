
x700023_CSP_FUBENTYPE				= 	0
x700023_CSP_SCRIPTID				=	1
x700023_CSP_TICKCOUNT				= 	2
x700023_CSP_FROMSCENEID				= 	3
x700023_CSP_ISCLOSING				= 	4
x700023_CSP_LEAVECOUNTDOWN			= 	5
x700023_CSP_TEAMID					=	6
x700023_CSP_BACKSCENEX       		=   7
x700023_CSP_BACKSCENEZ      		=   8
x700023_CSP_FUBENLEVEL			=	9

x700023_CSP_KILLCOUNT				=	20
x700023_CSP_FUBEN_SCENE_ID			=	21

x700023_CSP_BOSS_ID					=	22
x700023_CSP_BOSS_IS_DIE				=	23
x700023_CSP_BOSS_FULL_HP			=   24
x700023_CSP_SUBMONSTER_ALIVE_COUNT	= 	100	-- 存活小弟的个数
x700023_CSP_BOSS_LOADMONSTER_START  =   101 -- 记录小弟的ID  101 - 170

x700023_CSP_BOSS_START_COMBAT_TIME  =	171 -- boss进入战斗状态的时间

x700023_CSP_START_SUBMONSTER_TIME 	= 	172 -- 开始创建小弟的时间
x700023_CSP_SUBMONSTER_COUNT		= 	173 -- 创建小弟批次计数
x700023_CSP_BOSS_KUANGBO_FLAG		=	174	-- boss15分钟后狂暴标志
x700023_CSP_SUBMONSTER_DIE_COUNT	= 	175	-- 死亡小弟的个数
x700023_CSP_BOSS_HP_ADDBUFF_FLAG	= 	176	-- 根据血量添加buff的标志 176 - 186

x700023_CSP_AREA_ID					=   230
x700023_CSP_AREA_FLAG				=	231
x700023_CSP_ZHANCHE					= 	238
x700023_CSP_XIANJINBOSS				=	239

x700023_CSP_HUMAN_COUNT				=	240
x700023_CSP_OBJID_START				=	241

x700023_CSP_GUID_START              =   248  
x700023_CSP_FUBEN_TYPE				=	254	

x700023_CSP_FUBEN_MODE				=   255 



x700023_var_FileId 					= 700023
x700023_var_QuestId					= 6608

x700023_var_Level_Limit = 70
x700023_var_Rate_Limit = 40

x700023_var_Speed_low_buffID = -1				-- boss慢速移动buffID
x700023_var_Speed_Quick_buffID = 32076	 		-- boss快速移动buffID
x700023_var_wudi_buffid = 32072					-- 无敌buffid
x700023_var_Attack_buffID = 32085				-- boss强力攻击buffid
x700023_var_Boss_kuangbao_buffid = 32071			-- boss 战斗15分钟后狂暴buffID
x700023_var_CreateSubMonsterTimer = 10			-- 每多少秒刷一波小弟
x700023_var_CreateSubMonsterCount = 4			-- 共刷多少波小弟
x700023_var_KillSubMonster_effect_boss = 0.01	-- 每杀1个小弟boss掉1%的血、
x700023_var_KillPlayer_effect_boss = 0.1		-- 每杀一个玩家回复10%的血
x700023_var_Boss_Combat_kuangbao_time = 300		-- 战斗开始15分钟后狂暴
x700023_var_SubMonster_MaxNum = 70				-- 小弟最大个数

x700023_var_Boss_hp_Step_Hp = {0.1,0.2,0.3,0.4} -- 血量百分比 由小->大
--x700023_var_Boss_hp_Step_Speak = {
--									"血不足了10% 我要喊话！！！",
--									"血不足了20% 我要喊话！！！",
--									"血不足了30% 我要喊话！！！",
--									"血不足了40% 我要喊话！！！"
--								 }

x700023_var_Boss_Buff_when_subdie = {
										-- 小弟死亡次数，boss自加buffid
										{num=5,buffid=32085},
										{num=10,buffid=32086},
										{num=15,buffid=32087},
										{num=20,buffid=32088},
										{num=25,buffid=32089},
										{num=30,buffid=32090},
										{num=35,buffid=32091},
										{num=40,buffid=32092},
									}

x700023_var_Skill_Use = {
							--使用几率x%,技能id,技能类型0单体1群攻
							{pre=50,	skillID=13700,		skilltype=0}, 
							{pre=50,	skillID=0,		skilltype=0}, 
						 }

function x700023_TeleportWangCheng(varMap, varPlayer)
		local selfcountry =GetCurCountry( varMap, varPlayer)
        TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
        TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
		if selfcountry == 0 then
        	NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), x700023_var_FileId)
		elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), x700023_var_FileId)
		elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), x700023_var_FileId)
		elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), x700023_var_FileId)
		end
end

function x700023_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
	if nFlag == 2 then
		LuaCallNoclosure(700081,"ProcRequestEnterFuben", varMap, varPlayer, 0, 22)
	elseif nFlag == 1 then
		x700023_TeleportWangCheng(varMap, varPlayer)	
	end
end

function x700023_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700023_ProcFubenSceneCreated( varMap )
	SetFubenData_Param(varMap, x700023_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700023_CSP_XIANJINBOSS, -1 )
	
	for i=0, x700023_var_SubMonster_MaxNum do
		SetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i, 0 )
	end
	
	SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT, 0 )
	SetFubenData_Param(varMap, x700023_CSP_BOSS_START_COMBAT_TIME, 0 )
	SetFubenData_Param(varMap, x700023_CSP_START_SUBMONSTER_TIME, 0 )
	SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_COUNT, 0 )
	SetFubenData_Param(varMap, x700023_CSP_BOSS_KUANGBO_FLAG, 0 )
	SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_DIE_COUNT, 0 )
	
    x700023_CreateMonster( varMap )
	x700023_CreateBoss( varMap )
		
end

function x700023_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700023_CSP_AREA_ID, varArea)
	
	if varArea == 1 then
		varArea = 0
	else
		varArea = 1
	end
	
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID)
		
		if BossId ~= -1 then
			return 
		end
		SetFubenData_Param(varMap, x700023_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700023_var_QuestId, x700023_var_FileId)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700023_var_QuestId, x700023_var_FileId)
	end


	
	if varArea == 1 then  
		
	elseif varArea == 2 then   
		
	elseif varArea == 3 then   
		
	end
end	

function x700023_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700023_CSP_AREA_ID, -1)
	
end
function x700023_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end

function x700023_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700023_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID)
		
		if BossId ~= -1 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700023_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700023_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700023_var_QuestId, x700023_var_FileId)
		
	elseif varArea == 1 then
	 	
	end
end


function x700023_EnterTick(varMap, nowTickCount)

	if nowTickCount >= 2 then
		local nBoss2 = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID )
		if nBoss2>0 then
			local humancount = GetFuben_PlayerCount(varMap);
			if humancount>0 then
				-------------------------------------------------------------------------------
				if (GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE) ~= 2) then
					local nCurrentHp = GetHp( varMap, nBoss2 )
					local nFullHp = GetFubenData_Param(varMap, x700023_CSP_BOSS_FULL_HP )
					if nCurrentHp/nFullHp <0.2 then
						local bCreatedSubMonster = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START+0 )
						if bCreatedSubMonster<=0 then
							x700023_CreateSubMonster(varMap,0)
						end
					elseif nCurrentHp/nFullHp <0.5 then
						local bCreatedSubMonster = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START+2 )
						if bCreatedSubMonster<=0 then
							x700023_CreateSubMonster(varMap,2)		
						end
					elseif nCurrentHp/nFullHp <0.8 then
						local bCreatedSubMonster = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START+3 )
						if bCreatedSubMonster<=0 then
							x700023_CreateSubMonster(varMap,3)
						end
					end
					return
				end
				-------------------------------------------------------------------------------
				-- 慢速移动buff x700023_var_Speed_low_buffID
				if ( IsHaveSpecificImpact(varMap, nBoss2, x700023_var_Speed_low_buffID) == 0) then
					SendSpecificImpactToUnit( varMap, nBoss2, nBoss2, nBoss2, x700023_var_Speed_low_buffID, 0);
					--WriteLog(1, format("x700023_EnterTick --- 加入慢速buff buffid %d", x700023_var_Speed_low_buffID));
				end
				
				-- 判断如果小弟没有全部死亡的时候加入无敌buff
				if (x700023_IsAllSubMonsterDie(varMap) == 0) then
					if (IsHaveSpecificImpact(varMap, nBoss2, x700023_var_wudi_buffid) == 0) then
						SendSpecificImpactToUnit( varMap, nBoss2, nBoss2, nBoss2, x700023_var_wudi_buffid, 0);
						--WriteLog(1, format("x700023_EnterTick --- 加入无敌buff buffid %d", x700023_var_wudi_buffid));
					end
				end
				
				-- 判断是否进入了战斗状态
				local nIsInCombat = IsMosterInCombatState(varMap, nBoss2);
				if ( nIsInCombat == 1 ) then
					x700023_BossEnterCombatState(varMap);
					-- 判断是否加入15分钟后的狂暴buff
					local nCombatTime = GetFubenData_Param(varMap, x700023_CSP_BOSS_START_COMBAT_TIME);
					local nPassTime = GetCurrentTime() - nCombatTime;
					if (GetFubenData_Param(varMap, x700023_CSP_BOSS_KUANGBO_FLAG) == 0 and nPassTime >  x700023_var_Boss_Combat_kuangbao_time) then
						SendSpecificImpactToUnit( varMap, nBoss2, nBoss2, nBoss2, x700023_var_Boss_kuangbao_buffid, 0);
						SetFubenData_Param(varMap, x700023_CSP_BOSS_KUANGBO_FLAG, 1);
						--WriteLog(1, format("x700023_EnterTick --- 加入15分钟后的狂暴buff buffid %d", x700023_var_Boss_kuangbao_buffid));
					end
				else
					x700023_BossLeaveCombatState(varMap);
				end
				
				-- 判断是否可以创建小弟 每10秒创建一波小弟 共10波
				local nCreateSubMonsterTime = GetFubenData_Param(varMap, x700023_CSP_START_SUBMONSTER_TIME);
				local nCreateSubMonsterCount = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_COUNT);
				if ( nCreateSubMonsterTime ~= 0 and nCreateSubMonsterCount < x700023_var_CreateSubMonsterCount ) then
					if ((GetCurrentTime() - nCreateSubMonsterTime) / x700023_var_CreateSubMonsterTimer >= nCreateSubMonsterCount) then
						--WriteLog(1, format("x700023_EnterTick --- 创建第 %d 波小弟", nCreateSubMonsterCount));
						x700023_CreateSubMonster(varMap, nCreateSubMonsterCount);
						SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_COUNT, nCreateSubMonsterCount + 1);
					end
				end
				
				-- 根据boss血量触发boss行为
				local nCurBossHp = GetHp(varMap, nBoss2);
				local nMaxBossHp = GetFubenData_Param(varMap, x700023_CSP_BOSS_FULL_HP)
				if (nMaxBossHp > 0) then
					local fHp = nCurBossHp / nMaxBossHp;
					for i=1, getn(x700023_var_Boss_hp_Step_Hp) do
						if (x700023_var_Boss_hp_Step_Hp[i] > fHp and GetFubenData_Param(varMap, x700023_CSP_BOSS_HP_ADDBUFF_FLAG + i - 1 ) ~= 1) then
							--WriteLog(1, format("x700023_EnterTick --- 血量触发boss行为 %f ", fHp));
							SendSpecificImpactToUnit( varMap, nBoss2, nBoss2, nBoss2, x700023_var_Speed_Quick_buffID, 0);
							--NpcTalk(varMap, nBoss2, x700023_var_Boss_hp_Step_Speak[i],  -1)
							SetFubenData_Param(varMap, x700023_CSP_BOSS_HP_ADDBUFF_FLAG + i - 1, 1 )
						break
						end
					end
				end
				
			end
		end
	end
end

function x700023_CreateBoss(varMap)

	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1, facedir)
			end

			if(nFubenType == 2) then
				SetMonsterUseSkillByScript(varMap, varRet, 1);
			end
			
			SetFubenData_Param(varMap, x700023_CSP_BOSS_ID, varRet )
			local nFullHp = GetHp( varMap, varRet )
			SetFubenData_Param(varMap, x700023_CSP_BOSS_FULL_HP, nFullHp )
			
			break;
			
        end
	end

end

function x700023_CreateMonster(varMap)

	
    local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
				
				
			end
        end
	end


end

function x700023_CreateSubMonster(varMap, iIndex)

	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	if (nFubenType ~= 2) then
		local bCreatedSubMonster = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START+iIndex )
		if bCreatedSubMonster>0 then
			return 0;
		end
		SetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START+iIndex, 1 )
	end

	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			 for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = x1 + rx
                local rz = random(-r,r)
                local z = z1 + rz
		        local varRet = 0
				local nFileId = -1
				
				if (nFubenType == 2) then
					nFileId = x700023_var_FileId
				end
				
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir)
				
				end
				SetPatrolId(varMap, varRet, 0)
				
				if (nFubenType == 2) then
					local nAliveNum = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT);
					local nDieNum = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_DIE_COUNT);
					local nAllCount = nAliveNum + nDieNum;
					SetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + nAllCount, varRet );
					SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT, nAliveNum + 1);
				end
				
            end
        end
	end

	local strPercent= ""

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		local varStr = format("起来！我的勇士们！");
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);

		DeliverTalkTips(varMap, humanId);
	end

	
end

function x700023_ProcDie(varMap, varPlayer, varKiller)

	local xianjinboss = GetFubenData_Param(varMap, x700023_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end

	local zhanChe = GetFubenData_Param(varMap, x700023_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local nDieCount = GetFubenData_Param(varMap, x700023_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700023_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	local objId2 = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID)
	
	if objId2 == varPlayer then
		
		-- 清理下剩余的小弟
		if (GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE) == 2) then
			local nMonsterId = 0;
			for i=0, x700023_var_SubMonster_MaxNum do
				nMonsterId = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i )
				SetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i, 0 )
				if (nMonsterId > 0) then
					DeleteMonster(varMap,nMonsterId)
				end
			end
		end
	
		SetFubenData_Param(varMap, x700023_CSP_BOSS_ID, -1)
		x700023_ProcFubenEnd( varMap)
		x700023_ShowTipsToAll(varMap, "顺利击杀摩诃末，副本完成。") 
	
	end
	
	if (GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE) == 2) then
		-- 处理小弟的死亡
		x700023_ProcSubMonsterDie(varMap, varPlayer);
		-- 处理玩家的死亡
		x700023_ProcPlayerDie(varMap, varPlayer, varKiller);
	end
	
end

function x700023_ProcFubenEnd( varMap)
	x700023_CreateXianJinBoss(varMap)
	x700023_CreateZhanCheBoss(varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,51 )
	end	
end

function x700023_CreateXianJinBoss(varMap)
	
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700023_CSP_FUBEN_MODE)
	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700023_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700023_CSP_XIANJINBOSS, varRet )
		end
	end

	x700023_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700023_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700023_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700023_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700023_CSP_FUBENLEVEL)

	if fubenlevel < x700023_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700023_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700023_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700023_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700023_var_FileId,nIndexFrom,varI)
		if idScript == x700023_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end

			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700023_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700023_ShowTipsToAll(varMap, "战车雷爪之王出现！")
	end
end

-- boss离开战斗状态 重置一些状态
function x700023_BossLeaveCombatState(varMap)

	if (GetFubenData_Param(varMap, x700023_CSP_BOSS_START_COMBAT_TIME) ~= 0) then
		SetFubenData_Param(varMap, x700023_CSP_BOSS_START_COMBAT_TIME, 0);
		SetFubenData_Param(varMap, x700023_CSP_BOSS_KUANGBO_FLAG, 0);
		
		local nMonsterId = 0;
		for i=0, x700023_var_SubMonster_MaxNum do
			nMonsterId = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i )
			SetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i, 0 )
			if (nMonsterId > 0) then
				DeleteMonster(varMap,nMonsterId)
			end
		end
		
		SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT, 0 )
		SetFubenData_Param(varMap, x700023_CSP_START_SUBMONSTER_TIME, 0 )
		SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_COUNT, 0 )
		SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_DIE_COUNT, 0 )
		
		--WriteLog(1, format("x700023_EnterTick --- leave combat state"));
	end
end

-- boss进入战斗状态 记录一些状态
function x700023_BossEnterCombatState(varMap)
	if (GetFubenData_Param(varMap, x700023_CSP_BOSS_START_COMBAT_TIME) ~= 0) then
		return
	end

	SetFubenData_Param(varMap, x700023_CSP_BOSS_START_COMBAT_TIME, GetCurrentTime());
	
	if (GetFubenData_Param(varMap, x700023_CSP_START_SUBMONSTER_TIME) == 0) then
		SetFubenData_Param(varMap, x700023_CSP_START_SUBMONSTER_TIME, GetCurrentTime()-10);
	end
	
	for i=0, getn(x700023_var_Boss_hp_Step_Hp) - 1 do
		SetFubenData_Param(varMap, x700023_CSP_BOSS_HP_ADDBUFF_FLAG + i, 0 )
	end
	
	SetFubenData_Param(varMap, x700023_CSP_BOSS_KUANGBO_FLAG, 0);
	
	--WriteLog(1, format("x700023_EnterTick --- Enter combat state"));
end

-- 所有小弟死亡
function x700023_ProcAllSubMonsterDie(varMap)
	local nBoss2 = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID )
	
	if (IsHaveSpecificImpact(varMap, nBoss2, x700023_var_wudi_buffid) == 1) then
		CancelSpecificImpact(varMap, nBoss2, x700023_var_wudi_buffid);
		--WriteLog(1, format("x700023_EnterTick --- 所有小弟死亡去除无敌buff buffid %d", x700023_var_wudi_buffid));
	end
end

-- 判断小弟是否全部死亡
function x700023_IsAllSubMonsterDie(varMap)
	local nAliveNum = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT);
	local nCreateSubMonsterStep = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_COUNT);
	if (nAliveNum == 0 and nCreateSubMonsterStep >= x700023_var_CreateSubMonsterCount ) then
		return 1
	end
	
	return 0
end

-- 处理小弟的死亡
function x700023_ProcSubMonsterDie(varMap, varMonsterId)
	local nAliveNum = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT);
	local nDieNum = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_DIE_COUNT);
	local nAllCount = nAliveNum + nDieNum;
	local nMonsterID;
	local nIsSubMonsterDie = 0;
	
	--WriteLog(1, format("x700023_EnterTick --- 小弟死亡num %d 生存num %d 所有的num %d", nDieNum, nAliveNum, nAllCount));
	
	for i=0, nAllCount do
		nMonsterID = GetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i);
		if (nMonsterID == varMonsterId) then
			SetFubenData_Param(varMap, x700023_CSP_BOSS_LOADMONSTER_START + i, 0 );
			
			SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_ALIVE_COUNT , nAliveNum - 1 );
			SetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_DIE_COUNT, nDieNum + 1 );
			nIsSubMonsterDie = 1;
		break
		end
	end
	
	if (nIsSubMonsterDie == 1) then
		local nBoss2 = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID )
		
		if (nBoss2 <= 0 ) then
			return
		end
		
		local nBossFullHp = GetFubenData_Param(varMap, x700023_CSP_BOSS_FULL_HP)
		local nAddHp = nBossFullHp * x700023_var_KillSubMonster_effect_boss;
		SetHp(varMap, nBoss2, -nAddHp)
		
		nDieNum = GetFubenData_Param(varMap, x700023_CSP_SUBMONSTER_DIE_COUNT);
		-- 根据小弟死亡数 给boss添加buff
		for j,item in x700023_var_Boss_Buff_when_subdie do
			if (nDieNum == item.num) then
				SendSpecificImpactToUnit( varMap, nBoss2, nBoss2, nBoss2, item.buffid, 0);
				--WriteLog(1, format("x700023_EnterTick --- 小弟死亡 %d 添加buff buffid %d", nDieNum, item.buffid));
				break
			end
		end
		
		-- 小弟全死
		if x700023_IsAllSubMonsterDie(varMap) == 1 then
			x700023_ProcAllSubMonsterDie(varMap);
		end
	end
	
	return nIsSubMonsterDie
end

-- 玩家死亡
function x700023_ProcPlayerDie(varMap, varPlayerId, varKiller)
	local nBoss2 = GetFubenData_Param(varMap, x700023_CSP_BOSS_ID )

	-- 判断杀人者是boss
	if (varKiller == nBoss2) then
		-- 判断被杀者是玩家
		local varX,z = GetWorldPos(varMap,nBoss2)
		local Num = GetNearPlayerCountForMonster(varMap, nBoss2,varX,z,50)
		for playeridx = 0, Num - 1 do
			local humanObjId = GetNearPlayerMemberForMonster(varMap, nBoss2, playeridx);
			if (humanObjId == varPlayerId) then
				local nBossFullHp = GetFubenData_Param(varMap, x700023_CSP_BOSS_FULL_HP)
				local nAddHp = nBossFullHp * x700023_var_KillPlayer_effect_boss;
				SetHp(varMap, nBoss2, nAddHp)
				--WriteLog(1, format("x700023_EnterTick --- 玩家被杀boss + hp %d", nAddHp));
				return
			end
		end
	end
end

function x700023_ProcMonsterUseSkill(varMap, varPlayer)

	local nSkillID, nSkillType, nTargetID, nTargetX, nTargetZ;
	nTargetID = GetThreatTargetID(varMap, varPlayer);
	nTargetX, nTargetZ	= GetThreatTargetPos(varMap, varPlayer);
	
	local nRand = 0;
	local nMaxRand = 0;
	
	-- 计算要使用的技能及类型
	for varIRand,itemRand in x700023_var_Skill_Use do
		nMaxRand = nMaxRand + itemRand.pre;
	end
	
	nRand = random(0,nMaxRand);
	
	for varI,item in x700023_var_Skill_Use do
		if item.pre < nRand then
			nRand = nRand - item.pre
		else
			nSkillID = item.skillID;
			nSkillType = item.skilltype;
			break
		end
	end
	
	-- 使用技能
	if (nSkillType == 0) then
		-- 单体技能
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,1);
	else
		-- 群攻技能
		nTargetX, nTargetZ = GetMonsterPosition(varMap, varPlayer);
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,1);
	end
	--
	----WriteLog(1, format("x700023_EnterTick --- UseSpell spellid %d", nSkillID));
end
