

x700028_CSP_FUBENTYPE				= 	0
x700028_CSP_SCRIPTID				=	1
x700028_CSP_TICKCOUNT				= 	2
x700028_CSP_FROMSCENEID				= 	3
x700028_CSP_ISCLOSING				= 	4
x700028_CSP_LEAVECOUNTDOWN			= 	5
x700028_CSP_TEAMID					=	6
x700028_CSP_BACKSCENEX       		=   7
x700028_CSP_BACKSCENEZ      		=   8
x700028_CSP_FUBENLEVEL				=	9

x700028_CSP_KILLCOUNT				=	20
x700028_CSP_FUBEN_SCENE_ID			=	21


x700028_CSP_CURRENTSTEP				=	23
x700028_CSP_CURRENTSTEP_TICKCOUNT	=	24
x700028_CSP_MONSTER_COUNT			=	25
x700028_CSP_BOSS_ID					=	26

x700028_CSP_AREA_ID					=	28
x700028_CSP_AREA_FLAG				=	29

x700028_CSP_BOSS_COMBAT_BEGIN_TIME 	= 30	-- 记录boss进入战斗开始时的秒数
x700028_CSP_BOSS_HP_ACTION_FLAG 	= 31	-- boss血量百分比行为标记 (31 - 40) 预留10个标记


x700028_CSP_ZHANCHE					 = 238
x700028_CSP_XIANJINBOSS				=	239


x700028_CSP_HUMAN_COUNT				=	240
x700028_CSP_OBJID_START				=	241
x700028_CSP_NEXT_SCENE				=   247
x700028_CSP_GUID_START              =   248
x700028_CSP_FUBEN_TYPE				=	254	
x700028_CSP_FUBEN_MODE				=   255 


x700028_var_FileId 					= 700028 
x700028_var_QuestId					= 6608


x700028_var_TimeIntervalTab 			= {1,30,30,30,36,36,36}   
	
x700028_var_Level_Limit = 70
x700028_var_Rate_Limit = 50

x700028_var_Boos_Time_kuangbao = 300; -- boss 战斗15分钟后狂暴 时间
x700028_var_Boos_Time_KB_buffid = 32071;  -- boss 战斗15分钟后狂暴buffid
x700028_var_Skill_Use = {
							--使用几率x%,技能id,技能类型0单体1群攻
							{pre=5,		skillID=13700,		skilltype=0}, 
							{pre=2,	  skillID=13701,		skilltype=1}, 
							{pre=93,	skillID=0,		    skilltype=0}, 
							
						 }

x700028_var_HP_Step = {0.2,0.5,0.8} 	-- 血量百分之x时触发  由小-》大
x700028_var_HP_Step_Buff1 = 32070;	 	-- buff1 (狂暴)
x700028_var_HP_Step_Buff2 = 13114;	 	-- buff2 (定身)
x700028_var_HP_Step_Buff3 = 13164;	 	-- buff3 (沉默)
x700028_var_HP_Step_Skill = 13702;	 	-- 技能  (群攻)

function x700028_TeleportWangCheng(varMap, varPlayer)
		local selfcountry =GetCurCountry( varMap, varPlayer)
        TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
        TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
		if selfcountry == 0 then
        	NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), x700028_var_FileId)
		elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), x700028_var_FileId)
		elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), x700028_var_FileId)
		elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), x700028_var_FileId)
		end
end







function x700028_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

	
end






function x700028_ProcFubenSceneCreated( varMap )
	
	

	SetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP, 1)
	SetFubenData_Param( varMap, x700028_CSP_BOSS_ID, -2)
	SetFubenData_Param( varMap, x700028_CSP_MONSTER_COUNT, 0)
	SetFubenData_Param(varMap, x700028_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700028_CSP_ZHANCHE, -1)

	x700028_CreateRawMonster(varMap)
end


function x700028_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	SetFubenData_Param(varMap, x700028_CSP_AREA_ID, varArea)
	
	
	
	
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID)
		if BossId ~= -1 then
			return 
		end
		SetFubenData_Param(varMap, x700028_CSP_AREA_FLAG,1)
		
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700028_var_QuestId, x700028_var_FileId)
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700028_var_QuestId, x700028_var_FileId)
	end

end	



function x700028_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700028_CSP_AREA_ID, -1)
end

function x700028_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700028_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID)
		if BossId ~= -1 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700028_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700028_CSP_AREA_FLAG,1)
		
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700028_var_QuestId, x700028_var_FileId)
	else
	 	
	end
end

function x700028_EnterTick(varMap, nowTickCount)
	
	local varCurrentStep = GetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP)
	if varCurrentStep<=0 then
		return
	end

	local nLen = getn(x700028_var_TimeIntervalTab)

	if varCurrentStep <= nLen then
		local nCurrentStepTickCount = GetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP_TICKCOUNT)+1;
		SetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP_TICKCOUNT, nCurrentStepTickCount)
		
		local nNextStepTime = x700028_var_TimeIntervalTab[varCurrentStep];
		
		if nCurrentStepTickCount>=nNextStepTime then
			SetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP_TICKCOUNT, 0)
			SetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP,varCurrentStep+1 )
			
			if varCurrentStep< nLen then
				x700028_CreateMonster( varMap, varCurrentStep )
			else
				x700028_CreateBoss(varMap)
			end
	    
		end
	elseif (GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE) == 2) then
		-- 处理Boss的ai 15分钟后狂暴
		local BossId = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID)
		local nBossBeginCombatTime = GetFubenData_Param(varMap,x700028_CSP_BOSS_COMBAT_BEGIN_TIME)
		
		-- boss 战斗计时 Begin
		if (BossId ~= -1 and BossId ~= -2) then
			local nIsInCombat = IsMosterInCombatState(varMap, BossId);
			if(nIsInCombat == 1) then
				-- 战斗中
				if (nBossBeginCombatTime == 0) then
					SetFubenData_Param(varMap, x700028_CSP_BOSS_COMBAT_BEGIN_TIME, GetCurrentTime());
				elseif (nBossBeginCombatTime ~= -1) then
					local nTimePass = GetCurrentTime() - nBossBeginCombatTime;
			
					if (nTimePass > x700028_var_Boos_Time_kuangbao) then
						-- 使用狂暴技能 
						----WriteLog(1, format("x700028_ProcMonsterUseSkill --- 狂暴释放"))
						SetFubenData_Param(varMap, x700028_CSP_BOSS_COMBAT_BEGIN_TIME, -1);
						SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700028_var_Boos_Time_KB_buffid, 0)
						return
					end
				end
			else
			  -- 不在战斗中
			  x700028_BossLevalCombatState(varMap);
			  return
			end
		end
		-- boss 战斗计时 End
		
		-- boss血量begin
		nBossBeginCombatTime = GetFubenData_Param(varMap,x700028_CSP_BOSS_COMBAT_BEGIN_TIME)
		if (nBossBeginCombatTime ~= 0 and BossId ~= -1 and BossId ~= -2 ) then
			local nHp = GetHp(varMap, BossId);
			local nMaxHp = GetMaxHp(varMap, BossId);
			local npreHp = nHp/nMaxHp;
			
			local varX,z = GetWorldPos(varMap,BossId)
			local Num =  GetNearPlayerCountForMonster(varMap, BossId,varX,z,50)
			for i = 1, getn(x700028_var_HP_Step) do
				if (x700028_var_HP_Step[i] > npreHp) then
					if (GetFubenData_Param(varMap,x700028_CSP_BOSS_HP_ACTION_FLAG + i) == 0) then
						-- 向所有人添加buff
						for playeridx = 0, Num - 1 do
							local humanObjId = GetNearPlayerMemberForMonster(varMap, BossId, playeridx);
							SendSpecificImpactToUnit( varMap, humanObjId, humanObjId, humanObjId, x700028_var_HP_Step_Buff2, 0);
							SendSpecificImpactToUnit( varMap, humanObjId, humanObjId, humanObjId, x700028_var_HP_Step_Buff3, 0);
						end
						-- 群攻技能
						local nSkillID, nSkillType, nTargetID, nTargetX, nTargetZ, nTargetDir;
						nTargetID = GetThreatTargetID(varMap, BossId);
						nTargetX, nTargetZ = GetThreatTargetPos(varMap, BossId);
						SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700028_var_HP_Step_Buff1, 0);
						UnitUseSkill(varMap, BossId, x700028_var_HP_Step_Skill,nTargetID,nTargetX,nTargetZ,-1.0,0);
						SetFubenData_Param(varMap,x700028_CSP_BOSS_HP_ACTION_FLAG + i, 1)
						--WriteLog(1, format("x700028_ProcMonsterUseSkill --- Hp = %f %f %f", npreHp,nTargetX,nTargetZ))
					end
					break
				end
			end
		end
		-- boss血量end
		
	end
	
end


function x700028_CreateBoss(varMap)

	
	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	x700028_BossLevalCombatState(varMap)
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel  and nFubenType == varFlag3 then                                            
		    local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1,facedir)
			end

			if (nFubenType == 2) then
				SetMonsterUseSkillByScript(varMap, varRet, 1);
			end
			
			SetFubenData_Param( varMap, x700028_CSP_BOSS_ID, varRet)
			SetPatrolId(varMap, varRet, varFlag2)
			break;
        end
	end

	
end

function x700028_CreateRawMonster(varMap)

	local varCount = GetFubenData_Param(varMap, x700028_CSP_MONSTER_COUNT ) 
	
	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel  and nFubenType == varFlag3 then
		    local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
			end
			
			
    	end
	end
        
	
	
end




function x700028_CreateMonster(varMap, varStep)

	local currentMonsterCount = GetFubenData_Param(varMap, x700028_CSP_MONSTER_COUNT ) 
	
	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	local varNum = 0
	for varI = 0,nDataCount-1 do
		if varNum >= 6 then
			return
		end
			
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do
			    local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
                
                local monId= 0
				if title~="" then
					monId= CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					monId= CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1,facedir)
									
				end
				varNum = varNum + 1
				SetPatrolId(varMap, monId, varFlag2)
				
				currentMonsterCount = currentMonsterCount+1
				
				
				SetFubenData_Param(varMap, x700028_CSP_MONSTER_COUNT, currentMonsterCount ) 
			end
        end
	end
	
end

function x700028_ProcFubenEnd( varMap)
	x700028_CreateXianJinBoss(varMap)
	x700028_CreateZhanCheBoss(varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,50 )
	end	
end

function x700028_CreateXianJinBoss(varMap)
	
	--WriteLog(1, format("创建了宝箱 哈哈 ,"));
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700028_CSP_FUBEN_MODE)
	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and monsterFlag == 10 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700028_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700028_CSP_XIANJINBOSS, varRet )
			--WriteLog(1, format("创建了宝箱 哈哈 嘻嘻,"));
		end
	end

	x700028_ShowTipsToAll(varMap, "翻番宝箱出现！")
end



function x700028_ProcDie(varMap, varPlayer, varKiller)

	local xianjinboss = GetFubenData_Param(varMap, x700028_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700028_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local bossid = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID)
	local varCountry = GetCurCountry(varMap, varPlayer)	
	if bossid== varPlayer then
		
		SetFubenData_Param(varMap, x700028_CSP_BOSS_ID, -1)
		x700028_ProcFubenEnd( varMap)
		x700028_ShowTipsToAll(varMap, "顺利击杀亦难出，副本完成。") 
	else
		local nCurMonsterCount = GetFubenData_Param(varMap, x700028_CSP_MONSTER_COUNT)-1 
		
		SetFubenData_Param(varMap, x700028_CSP_MONSTER_COUNT, nCurMonsterCount)
		if nCurMonsterCount==0 then
			x700028_ProcAllMonsterDead( varMap)
		end
	end	
	
end

function x700028_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end



function x700028_ProcAllMonsterDead( varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP)

	if varCurrentStep<=0 then
		return
	end

	local nLen = getn(x700028_var_TimeIntervalTab)

	if varCurrentStep> nLen then
		return
	end
	
	local nNextStepTime = x700028_var_TimeIntervalTab[varCurrentStep];
	
	SetFubenData_Param(varMap, x700028_CSP_CURRENTSTEP_TICKCOUNT, nNextStepTime-1)
	
	

end

function x700028_ProcAccept( varMap, varPlayer )
	
	
	LuaCallNoclosure(700081,"NextLoopFuben", varMap, varPlayer, x700028_var_FileId)
	
	
	
	

end


function x700028_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
end

function x700028_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
end

function x700028_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700028_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700028_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700028_CSP_FUBENLEVEL)

	if fubenlevel < x700028_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700028_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700028_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700028_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700028_var_FileId,nIndexFrom,varI)
		if idScript == x700028_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700028_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
		x700028_ShowTipsToAll(varMap, "战车独冲之王出现！")
	end
end

function x700028_BossLevalCombatState(varMap)
	SetFubenData_Param(varMap, x700028_CSP_BOSS_COMBAT_BEGIN_TIME, 0);
	
	for i = 1, getn(x700028_var_HP_Step) do
		SetFubenData_Param(varMap, x700028_CSP_BOSS_HP_ACTION_FLAG + i, 0);
	end
	
	-- 取消战斗15分钟后的狂暴buff
	--local BossId = GetFubenData_Param(varMap, x700028_CSP_BOSS_ID)
	--if (IsHaveSpecificEffect(varMap, BossId, x700028_var_Boos_Time_KB_buffid) ~= 0) then
	--	CancelSpecificImpact(varMap, BossId, x700028_var_Boos_Time_KB_buffid)
	--end
	
end

function x700028_ProcMonsterUseSkill(varMap, varPlayer)

	local nSkillID, nSkillType, nTargetID, nTargetX, nTargetZ, nTargetDir;
	nTargetID = GetThreatTargetID(varMap, varPlayer);
	nTargetX, nTargetZ	= GetThreatTargetPos(varMap, varPlayer);
	
	local nRand = 0;
	local nMaxRand = 0;
	
	-- 计算要使用的技能及类型
	for varIRand,itemRand in x700028_var_Skill_Use do
		nMaxRand = nMaxRand + itemRand.pre;
	end
	
	nRand = random(0,nMaxRand);
	
	for varI,item in x700028_var_Skill_Use do
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
	--WriteLog(1, format("x700023_EnterTick --- UseSpell spellid %d", nSkillID));
	
end
