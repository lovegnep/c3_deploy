











x700009_CSP_FUBENTYPE				= 	0
x700009_CSP_SCRIPTID				=	1
x700009_CSP_TICKCOUNT				= 	2
x700009_CSP_FROMSCENEID				= 	3
x700009_CSP_ISCLOSING				= 	4
x700009_CSP_LEAVECOUNTDOWN			= 	5
x700009_CSP_TEAMID					=	6
x700009_CSP_BACKSCENEX       		=   7
x700009_CSP_BACKSCENEZ      		=   8
x700009_CSP_FUBENLEVEL			=	9

x700009_CSP_KILLCOUNT				=	20
x700009_CSP_FUBEN_SCENE_ID			=	21
x700009_CSP_BOSSINDEX				=   22
x700009_CSP_BOSSCREATETIME			=	23
x700009_CSP_FORCE					=	24
x700009_CSP_GAME_STARTED            =   25
x700009_CSP_CURRENTBOSS_INDEX		=	26
x700009_CSP_CURRENTBOSS_TICK		=   27
x700009_CSP_STARTNPC_ID				=	28
x700009_CSP_B_FUBEN_STATUS			=	29
x700009_CSP_AREA_ID					=	30
x700009_CSP_AREA_FLAG				=	31
x700009_CSP_CURRENTBOSS_TIME_START	=   50
x700009_CSP_CURRENTBOSS_ID_START	=	60
x700009_CSP_MONSTER_COUNT			=	70
x700009_CSP_MONSTER_START			=	71

x700009_CSP_BOSS_COMBAT_START_TIME	= 	100	-- boss 进入战斗状态开始计时
x700009_CSP_BOSS_KUANGBAO_FLAG		= 	101 -- boss 15分钟狂暴标记
x700009_CSP_BOSS_XIANJING_TIME_FLAG =	102	-- boss 每隔30秒随机陷阱标记
x700009_CSP_BOSS_HP_STEP_FLAG		= 	103	-- boss 血量触发boss行为标记
x700009_CSP_BOSS_SUB_MONSTER1_COUNT	= 	104 -- boss 第一次召唤小弟的个数
x700009_CSP_BOSS_SUB_MONSTER1_ID_START	= 105 -- boss 105-114第一次召唤小弟的id记录 最大10个
x700009_CSP_BOSS_SUB_MONSTER2_COUNT	= 	115	-- boss 第二次召唤小弟的个数
x700009_CSP_BOSS_SUB_MONSTER2_ID_START	= 125 -- boss 125-134弟二次召唤小弟的id记录	最大10个
x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID	= 135 -- boss 第一次召唤小弟的关键小弟的id
x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID	= 136 -- boss 第二次召唤小弟的关键小弟的id 
x700009_CSP_BOSS_MAIN_ID				= 137 -- 记录下陈理的id 以便于判断 
x700009_CSP_BOSS_MAIN_SKILLID			= 138 -- 

x700009_CSP_GUTNPC_ID				=	229

x700009_B_CREATE_RANDOMBOSS			=	230
x700009_CSP_RANDOM_BOSS_ID			=	231
x700009_RANDOMBOSS_FLAG				=	232
x700009_CSP_ZHANCHE					 = 238
x700009_CSP_XIANJINBOSS				=	239

x700009_CSP_HUMAN_COUNT				=	240
x700009_CSP_OBJID_START				=	241

x700009_CSP_GUID_START              =   248  
x700009_CSP_FUBEN_TYPE				=	254	
x700009_CSP_FUBEN_MODE				=   255 


x700009_var_FileId 					= 700009
x700009_var_QuestId					= 6608

x700009_var_Boss_Interval = {2*12,2*12,2*12,2*12,2*12,2*12,2*12,2*12}  
x700009_var_SuccessBossInex			=	8	                         

x700009_var_MaxForce					=	50                           

x700009_var_NpcTalkText			=  { "受命于天，既寿永昌。","成吉思汗的黄金时代必将成为历史！"}
x700009_var_nTextCount			=	2


x700009_var_RandomBossRate		=	0.1


x700009_var_SubmitNPC                 =   { type =25011,guid= 150511,varX = 69, z=20,facedir=0, title="" }
x700009_var_LeaveNPC					=   { type =25011,guid= 150511,varX = 69, z=20,facedir=0, title="" }	


x700009_var_StartNPC 					=	{ type =42392,guid= 150593,varX = 63, z=100, facedir =0, title="" } 
x700009_var_StartNpcTalk				=  { "在下朱重八，代天下百姓在此谢过各位勇士前来相帮！","各位勇士请跟我前来大厅正殿，守护和氏璧！","和氏璧乃镇国之宝，决不可让这些贼匪所夺！如若敌方势力高于50，和氏璧危已……"}

x700009_var_EndNPC 					=	{ type =42392,guid= 150594,varX = 63.153572, z=16.656811, facedir =0, title="" }


x700009_var_MonsterCreate_Random_Count = {2,2,2,2,2,2,2,2}




x700009_var_NpcCreate				=	{                                          
                                            {levelmin =20, levelmax=100, varName ="朱元璋",   type= 25010,  varX=65, z=19, r=0,  ai=7, aiscript=0,   facedir = 0, title = "",camp = 24},
									}

x700009_var_Boss_kuangbao_time	= 300	-- boss战斗开始后xx秒后开始狂暴的时间
x700009_var_Boss_kuangbao_buffid = 32071	-- boss战斗开始后xx秒后开始狂暴的buffid
x700009_var_Boss_lowspeed_xiangjing_skillid = -1	-- boss战斗开始后每隔xx秒后释放的减速陷阱（废弃 被x700009_var_Boss_lowspeed_xiangjing_trapid替代 ）
x700009_var_Boss_lowspeed_xiangjing_trapid = 490	-- boss战斗开始后每隔xx秒后释放的减速陷阱
x700009_var_Boss_lowspeed_xiangjing_time = 30	-- boss战斗开始后每隔xx秒后释放减速陷阱的时间间隔
x700009_var_Boss_hp_step = {0.1,0.3,0.5,0.8}	-- 血量触发boss行为 血量百分比由小到大
x700009_var_Boss_hp_step_wudi_buffid = 32081	-- 由血量引起的boss无敌buffid
x700009_var_Boss_hp_step_fantan_buffid	= 14001 -- -- 由血量引起的boss反弹buffid
x700009_var_Boss_kill_monster_wudi_buff = 32081	-- 由小怪死亡引起的boss无敌行为
x700009_var_Boss_hp_step_aoe_skillid = 13707	-- 由血量引起的boss的aoe技能id
x700009_var_Boss_hurt_up_buffid = 32080			-- 由杀小怪引起的玩家伤害提高的buffid
x700009_var_Boss_dec_hp = 0.1				-- 由杀小怪引起的boss血量降低的百分比 
x700009_var_Boss_CreateSubMonster1_type = 13	-- 第一次召唤小弟的小弟的monstertype
x700009_var_Boss_CreateSubMonster2_type = 13 -- 第二次召唤小弟的小弟的monstertype
x700009_var_Boss_create_submonster_talk = 	{
												"%s怪护我周全，定有重赏", 
												"%s怪护我周全，定有重赏" 
											}

x700009_var_Skill_Use = {
							--使用几率x%,技能id,技能类型0单体1群攻
							{pre=5,	  skillID=13700,		skilltype=0}, 
							{pre=95,	skillID=0,		skilltype=0}, 
							
						}



x700009_var_Level_Limit 					= 70
x700009_var_Rate_Limit						= 40



function x700009_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

end

function x700009_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700009_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end


function x700009_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS,0 ) ;   
	SetFubenData_Param(varMap, x700009_CSP_GUTNPC_ID,-1)
	x700009_CreateStartNpc( varMap)
	
	SetFubenData_Param(varMap, x700009_CSP_BOSS_COMBAT_START_TIME,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_KUANGBAO_FLAG,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_XIANJING_TIME_FLAG,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_HP_STEP_FLAG,getn(x700009_var_Boss_hp_step) + 1) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_COUNT,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_COUNT,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID,0 ) ;
	SetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_ID,0 ) ;

end

function x700009_CheckMonsterRefresh(varMap,nowTickCount)

	local nFubenStatus = GetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS ) 

	if nFubenStatus~= 0 then
		return
	end

	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	if varCurrentStep>8 then
		return 0;
	end

	local nTargetTick = x700009_var_Boss_Interval[varCurrentStep];

	local nCurrentTick = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK) + 1;

	SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK,nCurrentTick)

	if nTargetTick ==nCurrentTick then
		if varCurrentStep<8 then
			x700009_CreateBoss(varMap,varCurrentStep)
		end
	end

	for varI = 0, varCurrentStep - 1 do
		local nBossId = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI);
		local nBossTime = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TIME_START + varI)+1;
		SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TIME_START + varI, nBossTime);

		if nBossId>=0 then
			if nBossTime>0 then
				if mod( nBossTime, 2 ) == 0 then
					x700009_var_CreateMonster(varMap,varI)
				end
			end
		end
	end
	
				
end

function x700009_EnterTick(varMap, nowTickCount)
	if nowTickCount >= 2 then
		local gutNpc = GetFubenData_Param(varMap, x700009_CSP_GUTNPC_ID)
		if gutNpc >= 0 and nowTickCount <= getn(x700009_var_StartNpcTalk)+1 then
			NpcTalk(varMap, gutNpc, x700009_var_StartNpcTalk[nowTickCount-1],  -1)
		end
		
		
	end
	
	local gutNpc = GetFubenData_Param(varMap, x700009_CSP_GUTNPC_ID)
	if gutNpc >= 0 then
			local varX,z = GetWorldPos(varMap, gutNpc)
			if varX >= 63 and varX <64 and z >= 16 and z < 17 then
				DeleteMonster(varMap,gutNpc) 
				SetFubenData_Param(varMap, x700009_CSP_GUTNPC_ID, -2)
				x700009_CreateEndNpc( varMap)
			end
		end
		
	
	if nowTickCount >= 2 and  nowTickCount<= x700009_var_nTextCount+1 then
		local nNpcId = GetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID)
		
		

	end

	if nowTickCount == (x700009_var_nTextCount+2) then
		SetFubenData_Param( varMap ,x700009_CSP_GAME_STARTED, 1)
		x700009_CreateBoss(varMap,0)
	end

	local nStarted = GetFubenData_Param( varMap ,x700009_CSP_GAME_STARTED)
	
	if nStarted>0 then
		

		x700009_CheckMonsterRefresh(varMap,nowTickCount)
		
	end
	
	if (GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE) == 2) then
		-- 主要boss陈理tick处理
		local nMainBossId = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + x700009_var_SuccessBossInex - 1)
		--WriteLog(1, format("x700008_ProcHpSubBossTick --- 主bossID = %d", GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + x700009_var_SuccessBossInex - 1)));
		if (nMainBossId > 0) then
			x700009_ProcMainBossTick(varMap, nMainBossId);
		end
	end
end

function x700009_CreateBoss(varMap,varIndex)

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

            if varFlag == varIndex   then

				local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE )
				if nForce>x700009_var_MaxForce then
					
					return
				end


                local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1, facedir,  "",title);
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1, facedir);
				
				end
				if patrolid>=0 then
					SetPatrolId(varMap, varRet, patrolid)
				end

				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varIndex, varRet)
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX, varIndex+1)
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK, 0)
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TIME_START + varIndex, 0)

				if (varIndex == x700009_var_SuccessBossInex - 1) and nFubenType == 2 then
					SetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_ID, varRet)
					SetMonsterUseSkillByScript(varMap, varRet, 1);
					SetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_SKILLID, 0 )
				end
             
                nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) + 10
                SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )
                SetFubenData_Param(varMap, x700009_CSP_BOSSINDEX,varIndex +1 )

                local nTickCount = GetFubenData_Param( varMap ,x700009_CSP_TICKCOUNT );
                SetFubenData_Param(varMap, x700009_CSP_BOSSCREATETIME,nTickCount )

                local humancount = GetFuben_PlayerCount(varMap);

                for varI = 0, humancount - 1 do
                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    StartTalkTask(varMap);
                        TalkAppendString(varMap,"敌对势力增加10, 总势力上升至"..nForce);
                    StopTalkTask();
                    DeliverTalkTips(varMap, humanId);
                end

				if nForce>x700009_var_MaxForce then
					x700009_ProcFubenFailed(varMap,0)
					return
				end

                break
            end
        end
    end

end








function x700009_var_CreateMonster(varMap,varIndex)

	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
    local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT ) ;
	local varCount =nMonsterCount;

	local nTypeCount = x700009_var_MonsterCreate_Random_Count[varIndex+1];
	local nTypeFlag = random(0,nTypeCount-1)
	nTypeFlag = varIndex+nTypeFlag*10

	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then

            if varFlag == nTypeFlag  then

				local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE )
				if nForce>x700009_var_MaxForce then
					
					return
				end

                local monsterid = 0
				if title~="" then
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1,facedir,  "",title);
                else
					monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId,-1,21,-1,facedir);
                
				end
				if patrolid>=0 then
					SetPatrolId(varMap, monsterid, patrolid)
				end

				SetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varCount, monsterid ) ;
				varCount = varCount +1


                
                nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) + 1
                SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )

                local humancount = GetFuben_PlayerCount(varMap);

                
                for varI = 0, humancount - 1 do
                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    StartTalkTask(varMap);
                        TalkAppendString(varMap,"敌对势力增加1, 总势力上升至"..nForce);
                    StopTalkTask();
                    DeliverTalkTips(varMap, humanId);
                end

				if nForce>x700009_var_MaxForce then
					SetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT, varCount ) ;
					x700009_ProcFubenFailed(varMap,0)
					return
				end

                break

            end
        end
    end


	SetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT, varCount ) ;

end




function x700009_CreateNpc( varMap )

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;

	for varI, item in x700009_var_NpcCreate do

        if item.levelmin <= fubenlevel and item.levelmax >= fubenlevel then
			local varRet = 0
			if item.title~="" then
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,item.camp,-1,item.facedir, "", item.title);
			else
				varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,item.camp,-1,item.facedir);
			
			end
			SetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID, varRet)
			break;
		end
	end

    
end


function x700009_ProcFubenFailed(varMap, nParam)
	SetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700009_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS,2 ) ;   
	
	x700009_CreateXianJinBoss(varMap)
	
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,57 )
	end	
	if nParam==0 then
		x700009_ShowTipsToAll(varMap, format("敌对势力超过%d, 副本失败",x700009_var_MaxForce))
	elseif nParam==1 then
		x700009_ShowTipsToAll(varMap, "朱五四见势不妙,落荒而逃, 副本失败")
	end


	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	

	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>= 0 then
			DeleteMonster( varMap,nBossID )
		end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varI)
		if nMonsterId>=0 then
		DeleteMonster( varMap,nMonsterId )
	end
	end

	local nNpcObjId = GetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID)

	if nNpcObjId>=0 then
		DeleteMonster( varMap,nNpcObjId )
	end

	x700009_ShowTipsToAll(varMap, "所有怪物消失")

	
end


function x700009_ProcFubenSuccess(varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,57 )
	end	
	
	SetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS,1 ) ;   
	x700009_ShowTipsToAll(varMap, "顺利击杀陈理，副本完成。")

	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)
	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>= 0 then
		DeleteMonster( varMap,nBossID )
	end
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT)	
	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varI)
		if nMonsterId>=0 then
		DeleteMonster( varMap,nMonsterId )
		end
	end

	x700009_ShowTipsToAll(varMap, "所有怪物消失")

	x700009_CreateXianJinBoss(varMap)
	x700009_CreateZhanCheBoss(varMap)


	
	
	LuaCallNoclosure( 701107, "ProcSceneBossDie", varMap, 2)
	LuaCallNoclosure( 701108, "ProcSceneBossDie", varMap, 2)
	
	
end


function x700009_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	
	
	
	SetFubenData_Param(varMap, x700009_CSP_AREA_ID, varArea)
	if varArea == 0 then  
		local varStatus = GetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS) 
		
		
		if varStatus == 1 then
			SetFubenData_Param(varMap, x700009_CSP_AREA_FLAG,1)
			LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700009_var_QuestId, x700009_var_FileId)
		elseif varStatus == 2 then
			SetFubenData_Param(varMap, x700009_CSP_AREA_FLAG,1)
			LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700009_var_QuestId, x700009_var_FileId)
		end
		
		

	elseif varArea == 1 then
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700009_var_QuestId, x700009_var_FileId)
	
	end

end	




function x700009_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700009_CSP_AREA_ID, -1)
end


function x700009_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	local varArea = GetFubenData_Param(varMap, x700009_CSP_AREA_ID )	
	if varArea == 0 then  
		local varStatus = GetFubenData_Param(varMap, x700009_CSP_B_FUBEN_STATUS) 
		
		
		local varFlag = GetFubenData_Param(varMap, x700009_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700009_CSP_AREA_FLAG,1)
		
		
		if varStatus == 1 then
			LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700009_var_QuestId, x700009_var_FileId)
		elseif varStatus == 2 then
			LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700009_var_QuestId, x700009_var_FileId,1)
		end
		
		

	elseif varArea == 1 then
		
	
	end
end

function x700009_CreateRandomMonster(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local rate = random(0,100)/100;
	local nStdRate = x700009_var_RandomBossRate
	local nFubenMode = GetFubenData_Param(varMap, x700009_CSP_FUBEN_MODE)
	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	
	if rate>= nStdRate then
		return 0;
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;


	
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir)
				
				end

				SetFubenData_Param(varMap, x700009_B_CREATE_RANDOMBOSS, 1)
				SetFubenData_Param(varMap, x700009_RANDOMBOSS_FLAG, nFlag)

				SetFubenData_Param(varMap, x700009_CSP_RANDOM_BOSS_ID, nBossID)
			end

				
		end
	end

	x700009_ShowTipsToAll(varMap, "战神再现！")

end





function x700009_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700009_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	-- 处理由boss创建出来的小弟的死亡
	if ( x700009_ProcSubMonsterDie(varMap, varPlayer, varKiller) == 1) then
		return 
	end
	
	local nDieCount = GetFubenData_Param(varMap, x700009_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700009_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	
	
	local bCreateRandomboss = GetFubenData_Param(varMap, x700009_B_CREATE_RANDOMBOSS)

	if bCreateRandomboss>0 then
		local nRandomBossId = GetFubenData_Param(varMap, x700009_CSP_RANDOM_BOSS_ID)
		if nRandomBossId==varPlayer then
			
			
			
			
			
			local nKillerType = GetObjType(varMap, varKiller)
			local nOwnerId = varKiller
			if nKillerType== 3 then
				nOwnerId = GetOwnerID(varMap, varKiller)
				
			end
			
			local strPlayerName = GetName(varMap, nOwnerId)
			
			local varCountry = GetCurCountry( varMap, nOwnerId )
			local strCountryName = "";
			if varCountry==0 then
				strCountryName = "楼兰"
			elseif varCountry==1 then
				strCountryName = "天山"
			elseif varCountry==2 then
				strCountryName = "昆仑"
			elseif varCountry==3 then
				strCountryName = "敦煌"
			end

			local strHorseName = ""

			local nHorseFlag = GetFubenData_Param(varMap, x700009_RANDOMBOSS_FLAG);
			local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL )
			
			if fubenlevel < 50 then
				if nHorseFlag==0 then
					strHorseName = "凶豹"
				elseif nHorseFlag==1 then
					strHorseName = "奔羚"
				elseif nHorseFlag==2 then
					strHorseName = "天鹅"
				elseif nHorseFlag==3 then
					strHorseName = "河马"
				end
			elseif fubenlevel < 70 then
				if nHorseFlag==0 then
					strHorseName = "烈狮"
				elseif nHorseFlag==1 then
					strHorseName = "驯鹿"
				elseif nHorseFlag==2 then
					strHorseName = "瑞鹤"
				elseif nHorseFlag==3 then
					strHorseName = "铁犀"
				end
			elseif fubenlevel < 80 then
				if nHorseFlag==0 then
					strHorseName = "剑齿虎"
				elseif nHorseFlag==1 then
					strHorseName = "蛮牛"
				elseif nHorseFlag==2 then
					strHorseName = "凤凰"
				elseif nHorseFlag==3 then
					strHorseName = "巨象"
				end
			elseif fubenlevel < 110 then
				if nHorseFlag==0 then
					strHorseName = "螭龙"
				elseif nHorseFlag==1 then
					strHorseName = "应龙"
				elseif nHorseFlag==2 then
					strHorseName = "暴龙"
				elseif nHorseFlag==3 then
				strHorseName = "奎龙"
				end
			elseif fubenlevel < 130 then
				if nHorseFlag==0 then
					strHorseName = "螭龙"
				elseif nHorseFlag==1 then
					strHorseName = "应龙"
				elseif nHorseFlag==2 then
					strHorseName = "暴龙"
				elseif nHorseFlag==3 then
					strHorseName = "奎龙"
				end
			else
				if nHorseFlag==0 then
					strHorseName = "螭龙"
				elseif nHorseFlag==1 then
					strHorseName = "应龙"
				elseif nHorseFlag==2 then
					strHorseName = "暴龙"
				elseif nHorseFlag==3 then
					strHorseName = "奎龙"
				end
			end



			local strMapName = "金銮殿"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)
			
			
			
		end
	end
	
	
	local nNpcObjId = GetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID)

	if nNpcObjId==varPlayer then
		SetFubenData_Param(varMap, x700009_CSP_STARTNPC_ID,-1)
		x700009_ProcFubenFailed(varMap, 1)
		return
	end

	local bBoss  = 0;


	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	

	for varI = 0, varCurrentStep - 1 do
		local nBossID = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI)
		if nBossID>=0 then
			if nBossID== varPlayer then
				SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + varI, -1)
				local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) - 10;
				SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )

				local humancount = GetFuben_PlayerCount(varMap);

				
				for varI = 0, humancount - 1 do
					local humanId = GetFuben_PlayerObjId(varMap, varI);

					StartTalkTask(varMap);
						TalkAppendString(varMap,"敌对势力减少10, 总势力下降至"..nForce);
					StopTalkTask();
					DeliverTalkTips(varMap, humanId);
				end

				
				if nForce==0 then
					x700009_ProcAllForceDie(varMap)
				end
				

				bBoss = varI+1;
				break;
			end
		end
	end

	if bBoss==x700009_var_SuccessBossInex then
		x700009_ProcFubenSuccess(varMap)
		SetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_ID, -1)
		x700009_DelHpSubMonster(varMap);
		return
	end

	local nMonsterCount = GetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT)	

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+varI)
		if nMonsterId== varPlayer then
			for j=varI, nMonsterCount-2 do
				local nNextId = GetFubenData_Param(varMap, x700009_CSP_MONSTER_START+j+1)
				SetFubenData_Param(varMap, x700009_CSP_MONSTER_START+j, nNextId)
				
			end
			SetFubenData_Param(varMap, x700009_CSP_MONSTER_START+nMonsterCount-1,0)

			SetFubenData_Param(varMap, x700009_CSP_MONSTER_COUNT,nMonsterCount-1)

			local nForce = GetFubenData_Param(varMap, x700009_CSP_FORCE ) - 1;
			SetFubenData_Param(varMap,x700009_CSP_FORCE,nForce )

			local humancount = GetFuben_PlayerCount(varMap);

			
			for varI = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, varI);

				StartTalkTask(varMap);
					TalkAppendString(varMap,"敌对势力减少1, 总势力下降至"..nForce);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end

			
			if nForce==0 then
				x700009_ProcAllForceDie(varMap)
			end
			
			break
		end
	end
end

-- 主要boss陈理
function x700009_ProcMainBossTick(varMap, BossId)
	if (BossId <= 0) then
		return
	end
	
	-- 处理boss的战斗状态
	local nIsInCombat = IsMosterInCombatState(varMap, BossId);
	local nCombatTime = GetFubenData_Param(varMap, x700009_CSP_BOSS_COMBAT_START_TIME)
	if (nIsInCombat == 1) then
		if (nCombatTime == 0) then
			SetFubenData_Param(varMap, x700009_CSP_BOSS_COMBAT_START_TIME, GetCurrentTime())
			SetFubenData_Param(varMap, x700009_CSP_BOSS_KUANGBAO_FLAG, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_XIANJING_TIME_FLAG, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_HP_STEP_FLAG, getn(x700009_var_Boss_hp_step) + 1)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID, 0)
		end
	else
		if (nCombatTime ~= 0) then
			SetFubenData_Param(varMap, x700009_CSP_BOSS_COMBAT_START_TIME, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_KUANGBAO_FLAG, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_XIANJING_TIME_FLAG, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_HP_STEP_FLAG, getn(x700009_var_Boss_hp_step) + 1)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID, 0)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID, 0)
			x700009_DelHpSubMonster(varMap);
		end
		return
	end
	
	nCombatTime = GetFubenData_Param(varMap, x700009_CSP_BOSS_COMBAT_START_TIME)
	local nPassTime = GetCurrentTime() - nCombatTime
	-- 每隔30秒释放陷阱
	local nStep1 = floor(nPassTime / x700009_var_Boss_lowspeed_xiangjing_time)
	local nStep1Record = GetFubenData_Param(varMap, x700009_CSP_BOSS_XIANJING_TIME_FLAG)
	if (nStep1 > nStep1Record) then
		-- 找到一个playerid，释放减速陷阱
		local varX,z = GetWorldPos(varMap,BossId)
		local Num =  GetNearPlayerCountForMonster(varMap, BossId,varX,z,50)
		local idx = random(0,Num - 1)
		local playerid = GetNearPlayerMemberForMonster(varMap, BossId, idx);
		if (playerid > 0) then
			local posx, posz = GetWorldPos(varMap,playerid);
			--UnitUseSkill(varMap, BossId, x700009_var_Boss_lowspeed_xiangjing_skillid,playerid,posx,posz,-1.0,0);
			CreateTrap(varMap, BossId, posx, posz, x700009_var_Boss_lowspeed_xiangjing_trapid)
		end
		
		--WriteLog(1, format("x700009_ProcMainBossTick --- 时间触发陷阱第 %f 次触发 被下了陷阱的人物的id = %d", nStep1,playerid));
		SetFubenData_Param(varMap, x700009_CSP_BOSS_XIANJING_TIME_FLAG, nStep1);
	end
	
	-- 15分钟后狂暴
	if (nPassTime >= x700009_var_Boss_kuangbao_time) then
		local nFlag = GetFubenData_Param(varMap, x700009_CSP_BOSS_KUANGBAO_FLAG);
		if (nFlag ~= 1) then
			SetFubenData_Param(varMap, x700009_CSP_BOSS_KUANGBAO_FLAG, 1)
			SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700009_var_Boss_kuangbao_buffid, 0);
			--WriteLog(1, format("x700023_EnterTick --- 加入15分钟后的狂暴buff buffid %d", x700009_var_Boss_kuangbao_buffid));
		end
	end
	-- 主boss每tick血量处理
	x700009_ProcMainBossHpStep(varMap,BossId)
end

-- 清除多余的小怪 在boss脱离战斗状态的时候 删除由血量触发创建出来的小怪
function x700009_DelHpSubMonster(varMap)
	local nMonsterCount1 = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_COUNT);
	local nMonsterCount2 = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_COUNT);
	local nMonsterId = -1;
	for nCount1 =  0, nMonsterCount1 - 1 do
		nMonsterId = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_ID_START + nCount1)
		if (nMonsterId > 0) then
			DeleteMonster(varMap, nMonsterId)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_ID_START + nCount1, -1)
		end
	end
	
	for nCount2 = 0, nMonsterCount2 - 1 do
		nMonsterId = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_ID_START + nCount2)
		if (nMonsterId > 0) then
			DeleteMonster(varMap, nMonsterId);
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_ID_START + nCount2, -1)
		end
	end
	
	SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_COUNT, 0)
	SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_COUNT, 0)
end

-- 处理由血量触发创建出来的小怪的死亡事件
function x700009_ProcSubMonsterDie(varMap, varPlayer, varKiller)
	
	local nMonsterCount1 = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_COUNT);
	local nMonsterCount2 = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_COUNT);
	local nMonsterKey1  = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID);
	local nMonsterKey2 	= GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID);
	local nMainBossId = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_ID_START + x700009_var_SuccessBossInex - 1)
	local nMonsterId = 0;
	if nMonsterCount1 > 0 then
		local nIsKillKeyBoss = 0;
		if (nMonsterKey1 == varPlayer) then
			-- 判断是否是key monster
			nIsKillKeyBoss = 1;
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID, -1)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_COUNT, 0)
		end
		
		for i = 1, nMonsterCount1 do
			nMonsterId = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_ID_START + i - 1);
			if (nIsKillKeyBoss == 1) then
				-- 杀了key monster 处理
				if (nMonsterId ~= varPlayer and nMonsterId > 0) then
					DeleteMonster( varMap,nMonsterId )
				end
				SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_ID_START + i - 1, -1);
			elseif (nMonsterId == varPlayer and nMonsterId > 0) then
				SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_ID_START + i - 1, -1);
				SendSpecificImpactToUnit( varMap, nMainBossId, nMainBossId, nMainBossId, x700009_var_Boss_kill_monster_wudi_buff, 0);
				WriteLog(1, format("x700009_ProcSubMonsterDie --- 1炳岿┣buff buffid %d", x700009_var_Boss_kill_monster_wudi_buff));
				return 1
			end
		end
		
		if (nIsKillKeyBoss == 1 and nMainBossId > 0) then
			local nBossFullHp = GetMaxHp(varMap, nMainBossId)
			local nAddHp = nBossFullHp * x700009_var_Boss_dec_hp;
			SetHp(varMap, nMainBossId, -nAddHp)
			SendSpecificImpactToUnit( varMap, varKiller, varKiller, varKiller, x700009_var_Boss_hurt_up_buffid, 0);
			WriteLog(1, format("x700009_ProcSubMonsterDie --- 1炳癸┣矗蔼端甡buff buffid %d", x700009_var_Boss_hurt_up_buffid));
			return 1
		end
	end
	
	if (nMonsterCount2 > 0) then
		local nIsKillKeyBoss = 0;
		if (nMonsterKey2 == varPlayer) then
			-- 判断是否是key monster
			nIsKillKeyBoss = 1;
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID, -1)
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_COUNT, 0)
		end
		
		for i = 1, nMonsterCount2 do
			nMonsterId = GetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_ID_START + i - 1);
			if (nIsKillKeyBoss == 1) then
				-- 杀了key monster 处理
				if (nMonsterId ~= varPlayer and nMonsterId > 0) then
					DeleteMonster( varMap,nMonsterId )
				end
				SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_ID_START + i - 1, -1);
			elseif (nMonsterId == varPlayer and nMonsterId > 0) then
				SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_ID_START + i - 1, -1);
				SendSpecificImpactToUnit( varMap, nMainBossId, nMainBossId, nMainBossId, x700009_var_Boss_kill_monster_wudi_buff, 0);
				WriteLog(1, format("x700009_ProcSubMonsterDie --- 1炳岿┣buff buffid %d", x700009_var_Boss_kill_monster_wudi_buff));
				return 1
			end
		end
		
		if (nIsKillKeyBoss == 1 and nMainBossId  > 0) then
			local nBossFullHp = GetMaxHp(varMap, nMainBossId)
			local nAddHp = nBossFullHp * x700009_var_Boss_dec_hp;
			SetHp(varMap, nMainBossId, -nAddHp)
			SendSpecificImpactToUnit( varMap, varKiller, varKiller, varKiller, x700009_var_Boss_hurt_up_buffid, 0);
			WriteLog(1, format("x700009_ProcSubMonsterDie --- 1炳癸┣矗蔼端甡buff buffid %d", x700009_var_Boss_hurt_up_buffid));
			return 1
		end
	end
	
	return 0
end

-- 主要Boss陈理血量处理
function x700009_ProcMainBossHpStep(varMap, BossId)
	if (BossId <= 0) then
		return
	end
	
	local nCurHp = GetHp(varMap, BossId);
	local nMaxHp = GetMaxHp(varMap, BossId);
	local nHp = nCurHp / nMaxHp;
	local nHpStep = -1;
	local nHpStepCount = getn(x700009_var_Boss_hp_step);
	
	local nTargetX, nTargetZ;

	for nstep = 1,nHpStepCount do
		if (nHp <= x700009_var_Boss_hp_step[nstep]) then
			--WriteLog(1, format("x700009_ProcMainBossHpStep ---nHpStep = %f,%f", nHp,x700009_var_Boss_hp_step[nstep]));	
	
			if (nstep < GetFubenData_Param(varMap, x700009_CSP_BOSS_HP_STEP_FLAG)) then
				nHpStep = nstep
				SetFubenData_Param(varMap, x700009_CSP_BOSS_HP_STEP_FLAG, nstep);
			end
			break
		end
	end
	
	--WriteLog(1, format("x700009_ProcMainBossHpStep --- hp触发百分比 = %d,hp = %f, steprecord=%d", nHpStep,nHp,GetFubenData_Param(varMap, x700009_CSP_BOSS_HP_STEP_FLAG)));	
	if (nHpStep == -1) then
		return
	end
	
	if (nHpStep == 1 or nHpStep == 3) then
		-- 10%血 or -- 50%血
		-- 无敌10秒buff，释放一个大范围的aoe
		SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700009_var_Boss_hp_step_wudi_buffid, 0);
		nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId);
		--UnitUseSkill(varMap, BossId, x700009_var_Boss_hp_step_aoe_skillid,GetThreatTargetID(varMap, BossId),nTargetX,nTargetZ,-1.0,0);
		SetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_SKILLID, x700009_var_Boss_hp_step_aoe_skillid )
		--WriteLog(1, format("x700009_ProcMainBossHpStep --- 释放群攻啦。。。", x700009_var_Boss_hp_step_wudi_buffid, x700009_var_Boss_hp_step_aoe_skillid));	
	elseif (nHpStep == 2) then
		-- 30%血
		SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700009_var_Boss_hp_step_fantan_buffid, 0);
		--WriteLog(1, format("x700009_ProcMainBossHpStep --- 加入15分钟后的反弹buff buffid %d", x700009_var_Boss_hp_step_fantan_buffid));	
		local x,z = GetMonsterPosition(varMap, BossId)
		x700009_ProcMonsterCreateSubMonster(varMap, 2, x700009_var_Boss_CreateSubMonster2_type, BossId,x,z)
	elseif (nHpStep == 4) then
		-- 80%血
		SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700009_var_Boss_hp_step_fantan_buffid, 0);
		--WriteLog(1, format("x700009_ProcMainBossHpStep --- 加入15分钟后的反弹buff buffid %d", x700009_var_Boss_hp_step_fantan_buffid));	
		local x,z = GetMonsterPosition(varMap, BossId)
		x700009_ProcMonsterCreateSubMonster(varMap, 1, x700009_var_Boss_CreateSubMonster1_type, BossId,x,z)
	end
	
end

function x700009_ProcMonsterCreateSubMonster(varMap,nCreateMonsterStep, MonsterType, BossId,x,z)
	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL )
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	local MonsterID = {}
	local MonsterName = {}
	local nCount = 0;
	for varI = 0,nDataCount-1 do	
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,varZ,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == MonsterType and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            local varRet = 0
			
			local Posx,Posz;
			Posx = random(0,10)
			Posz = random(0,10)
			Posx = Posx - 5 + x;
			Posz = Posz - 5 + z;
			
			if title~="" then
				varRet = CreateMonster(varMap, type, Posx, Posz, ai, aiscript, x700009_var_FileId,-1,21,-1, facedir,  "",title);
			else
				varRet = CreateMonster(varMap, type, Posx, Posz, ai, aiscript, x700009_var_FileId,-1,21,-1, facedir);
			end
			
			if patrolid>=0 then
				SetPatrolId(varMap, varRet, patrolid)
			end
			
			nCount = nCount + 1;
			MonsterName[nCount] = varName;
			MonsterID[nCount] = varRet;
        end
    end
	--WriteLog(1, format("x700009_ProcMainBossHpStep --- 创建submonster %d", nCount));	
	if (nCount <= 0) then
		return
	end
	
	local nRand = random(1,nCount)
	local nKeyBossId = MonsterID[nRand];
	local nKeyBossName = MonsterName[nRand];
	local strSpeak = "";
	
	-- Boss创建完成后记录必要的变量
	if (nCreateMonsterStep == 1) then
		strSpeak = format(x700009_var_Boss_create_submonster_talk[1],nKeyBossName);
		SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_COUNT, nCount);
		SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_KEY_ID, nKeyBossId);
		for n = 1, nCount do
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER1_ID_START + n - 1, MonsterID[n])
		end
	elseif (nCreateMonsterStep == 2) then
		strSpeak = format(x700009_var_Boss_create_submonster_talk[2],nKeyBossName);
		SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_COUNT, nCount);
		SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_KEY_ID, nKeyBossId);
		for n = 1, nCount do
			SetFubenData_Param(varMap, x700009_CSP_BOSS_SUB_MONSTER2_ID_START + n - 1, MonsterID[n])
		end
	end
	
	--WriteLog(1, format("x700009_ProcMainBossHpStep --- 创建submonsterstep = %d talk=_%s_", nCreateMonsterStep, strSpeak));	
	
	NpcTalk(varMap, BossId, strSpeak,  -1)
end

function x700009_ProcMonsterUseSkill(varMap, varPlayer)

	local nSkillID, nSkillType, nTargetID, nTargetX, nTargetZ;
	nTargetID = GetThreatTargetID(varMap, varPlayer);
	nTargetX,nTargetZ	= GetThreatTargetPos(varMap, varPlayer);
	
	local nRand = 0;
	local nMaxRand = 0;
	
	-- 计算要使用的技能及类型
	for varIRand,itemRand in x700009_var_Skill_Use do
		nMaxRand = nMaxRand + itemRand.pre;
	end
	
	nRand = random(0,nMaxRand);
	
	for varI,item in x700009_var_Skill_Use do
		if item.pre < nRand then
			nRand = nRand - item.pre
		else
			nSkillID = item.skillID;
			nSkillType = item.skilltype;
			break
		end
	end
	
	
	local nSkillIDTmp = GetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_SKILLID)
	if (nSkillIDTmp > 0) then
		nTargetX, nTargetZ = GetMonsterPosition(varMap, varPlayer);
		UnitUseSkill(varMap, varPlayer, nSkillIDTmp,nTargetID,nTargetX,nTargetZ,-1.0,0);
		SetFubenData_Param(varMap, x700009_CSP_BOSS_MAIN_SKILLID, 0 )
		return
	end
	
	-- 使用技能
	if (nSkillType == 0) then
		-- 单体技能
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,0);
	else
		-- 群攻技能
		nTargetX, nTargetZ = GetMonsterPosition(varMap, varPlayer);
		UnitUseSkill(varMap, varPlayer, nSkillID,nTargetID,nTargetX,nTargetZ,-1.0,0);
	end
	--
	--WriteLog(1, format("x700009_ProcMonsterUseSkill --- UseSpell spellid %d", nSkillID));
end

function x700009_ProcAllForceDie(varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_INDEX)

	if varCurrentStep>8 then
		return 0;
	end

	local nTargetTick = x700009_var_Boss_Interval[varCurrentStep];


	SetFubenData_Param(varMap, x700009_CSP_CURRENTBOSS_TICK,nTargetTick-1)

	local humancount = GetFuben_PlayerCount(varMap);

end


function x700009_ProcAllMonsterDead( varMap)
	
end

function x700009_CreateSubmitNpc( varMap)

	if x700009_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700009_var_SubmitNPC.type, x700009_var_SubmitNPC.varX, x700009_var_SubmitNPC.z, 3, 0, -1, x700009_var_SubmitNPC.guid, -1, -1,x700009_var_SubmitNPC.facedir, "", x700009_var_SubmitNPC.title )
	else
		CreateMonster(varMap, x700009_var_SubmitNPC.type, x700009_var_SubmitNPC.varX, x700009_var_SubmitNPC.z, 3, 0, -1, x700009_var_SubmitNPC.guid, -1, -1,x700009_var_SubmitNPC.facedir )
	
	end

	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)

	x700009_CreateXianJinBoss(varMap)
	
end

function x700009_CreateStartNpc( varMap)
	local varRet = 0
	if x700009_var_StartNPC.title~="" then
		varRet = CreateMonster(varMap, x700009_var_StartNPC.type, x700009_var_StartNPC.varX, x700009_var_StartNPC.z, 3, 0, -1, x700009_var_StartNPC.guid, -1, -1,x700009_var_StartNPC.facedir, "", x700009_var_StartNPC.title )
	else
		varRet = CreateMonster(varMap, x700009_var_StartNPC.type, x700009_var_StartNPC.varX, x700009_var_StartNPC.z, 3, 0, -1, x700009_var_StartNPC.guid, -1, -1,x700009_var_StartNPC.facedir )
	
	end
	SetFubenData_Param(varMap, x700009_CSP_GUTNPC_ID,varRet)
	SetPatrolId(varMap, varRet, 8)
end

function x700009_CreateEndNpc( varMap)

	if x700009_var_EndNPC.title~="" then
		CreateMonster(varMap, x700009_var_EndNPC.type, x700009_var_EndNPC.varX, x700009_var_EndNPC.z, 3, 0, -1, x700009_var_EndNPC.guid, -1, -1,x700009_var_EndNPC.facedir, "", x700009_var_EndNPC.title )
	else
		CreateMonster(varMap, x700009_var_EndNPC.type, x700009_var_EndNPC.varX, x700009_var_EndNPC.z, 3, 0, -1, x700009_var_EndNPC.guid, -1, -1,x700009_var_EndNPC.facedir )
	
	end

end
function x700009_CreateLeaveNpc( varMap)
	if x700009_var_LeaveNPC.title ~="" then
		CreateMonster(varMap, x700009_var_LeaveNPC.type, x700009_var_LeaveNPC.varX, x700009_var_LeaveNPC.z, 3, 0, -1, x700009_var_LeaveNPC.guid, -1, -1,x700009_var_LeaveNPC.facedir,  "",x700009_var_LeaveNPC.title )
	else
		CreateMonster(varMap, x700009_var_LeaveNPC.type, x700009_var_LeaveNPC.varX, x700009_var_LeaveNPC.z, 3, 0, -1, x700009_var_LeaveNPC.guid, -1, -1,x700009_var_LeaveNPC.facedir )
	end
	
	x700009_CreateXianJinBoss(varMap)

end


function x700009_CreateXianJinBoss(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700009_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS, varRet )
		end
	end

	x700009_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700009_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700009_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCountx,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700009_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700009_CSP_XIANJINBOSS, varRet )
		end
	end

	x700009_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700009_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700009_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700009_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700009_CSP_FUBENLEVEL)

	if fubenlevel < x700009_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700009_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700009_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700009_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700009_var_FileId,nIndexFrom,varI)
		if idScript == x700009_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end

			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700009_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700009_ShowTipsToAll(varMap, "战车雷爪之王出现！")
	end
end
