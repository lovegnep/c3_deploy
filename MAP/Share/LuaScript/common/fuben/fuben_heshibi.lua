
x700008_CSP_FUBENTYPE				= 	0
x700008_CSP_SCRIPTID				=	1
x700008_CSP_TICKCOUNT				= 	2
x700008_CSP_FROMSCENEID				= 	3
x700008_CSP_ISCLOSING				= 	4
x700008_CSP_LEAVECOUNTDOWN			= 	5
x700008_CSP_TEAMID					=	6
x700008_CSP_BACKSCENEX       		=   7
x700008_CSP_BACKSCENEZ      		=   8
x700008_CSP_FUBENLEVEL			=	9

x700008_CSP_KILLCOUNT				=	20
x700008_CSP_CURRENTNPC_ID			=   21
x700008_CSP_CURRENTNPC_INDEX		=   22
x700008_CSP_CURRENTNPC_TICK			=   23
x700008_CSP_FUBENSCENEID			=   24
x700008_CSP_NPC_ID					=	25
x700008_CSP_B_NEED_TALK				=	26

x700008_CSP_B_KILL_FUWANG			=   27
x700008_CSP_AREA_ID					=   30
x700008_CSP_AREA_FLAG				=	31
x700008_CSP_BOSS_ID_START			=	40
x700008_CSP_BOSS_FULL_HP_START		=	50
x700008_CSP_BOSS_LOADMONSTER_START	=   60

x700008_CSP_BOSS_ID					=  80
x700008_CSP_FUBEN_FINISH			=	81

x700008_CSP_BOSS_COMBAT_START_TIME = 100 -- boss 进入战斗时间
x700008_CSP_BOSS_HP_STEP_RECORD	   = 101 -- boss hp阶段触发记录
x700008_CSP_SUBBOSS_COUNT		   = 102 -- 创建小boss的个数 
x700008_CSP_SUBBOSS_ID_START	   = 103 -- 记录创建的小boss的id的起始位置 留20个位置 103 - 122
x700008_CSP_SUBBOSS_COMBAT_START_TIME = 123 -- 记录创建的小boss的战斗时间的起始位置留20个位置 123 - 142
x700008_CSP_BOSS_COMBAT_TIME_RECORD1 = 143
x700008_CSP_BOSS_COMBAT_TIME_RECORD2 = 144
x700008_CSP_BOSS_KUANGBAO_TIME_RECORDE = 145 -- 记录BOSS进入战斗的时间用于狂暴记录


x700008_B_CREATE_RANDOMBOSS			=	230
x700008_CSP_RANDOM_BOSS_ID			=	231
x700008_RANDOMBOSS_FLAG				=	232
x700008_RANDOM_BOSS_ID				=   235
x700008_CSP_ZHANCHE					 = 238
x700008_CSP_XIANJINBOSS				=	239


x700008_CSP_HUMAN_COUNT				=	240
x700008_CSP_OBJID_START				=	241

x700008_CSP_GUID_START              =   248  
x700008_CSP_FUBEN_TYPE				=	254	

x700008_CSP_FUBEN_MODE				=   255 

x700008_var_RandomBossRate		=	0.08*6


x700008_var_FileId 					= 700008
x700008_var_QuestId					=  6608

x700008_var_Level_Limit 					= 70
x700008_var_Rate_Limit						= 30

x700008_var_NpcTalkText			= {
									{"朕乃楚王，你是何人？敢来与我争夺天下！"
									},

									{"八荒一统，六合归一。天下社稷，舍我取谁？"
									},

									{"力拔山兮气盖世，时不利兮骓不逝。"
									},

									{"万里江山，有能者得之，汝能奈我何？"
									},

									{"哈哈哈，三千铁甲开天庭，八方六合尽掌中。"
									},

									{"何言世无英雄，使庶子成名！司马一族，当世称雄。"
									},

									{"人生故当死，岂不一日为帝乎？"
									},

									{"待到秋来九月八，我花开后百花杀。冲天香阵透长安，满城尽带黄金甲。"
									}
								  }	

x700008_var_NpcTalkTime			=	1	
x700008_var_NpcHoldTime			=	2

x700008_NeedKillMonster_Count		=	8		                

x700008_var_Item_XJ					= 11990011
x700008_var_ItemCount_XJ				=	0

x700008_var_SubmitNPC                 =   { type =25009,guid= 150509,varX = 72, z=74, facedir =0, title="" }

x700008_var_NpcType1                  =   25042                    
x700008_var_NpcType2                  =   25043                    
x700008_var_NpcType3                  =   25044                    
x700008_var_NpcType4                  =   25045                    
x700008_var_NpcType5                  =   25046                    
x700008_var_NpcType6                  =   25047                    
x700008_var_NpcType7                  =   25048                    
x700008_var_NpcType8                  =   25049                    

x700008_var_NpcCreate					=	{
											{	type=x700008_var_NpcType1, 	varX=61,  z=56,	ai=3,   aiscript=-1,guid = 150005,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType2, 	varX=61,  z=62,	ai=3,   aiscript=-1,guid = 150006,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType3, 	varX=61,  z=68,	ai=3,   aiscript=-1,guid = 150007,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType4, 	varX=61,  z=74,	ai=3,   aiscript=-1,guid = 150008,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType5, 	varX=72,  z=56,	ai=3,   aiscript=-1,guid = 150009,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType6, 	varX=72,  z=62,	ai=3,   aiscript=-1,guid = 150010,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType7, 	varX=72,  z=68,	ai=3,   aiscript=-1,guid = 150011,facedir = 0, title = "" },
                                            {	type=x700008_var_NpcType8, 	varX=72,  z=74,	ai=3,   aiscript=-1,guid = 150012,facedir = 0, title = "" },
										}

x700008_var_hp_Step = {0.25,0.5,0.75}	-- boss 由血量百分比触发
x700008_var_SubMonsterType = 12			-- boss 由血量创建小boss的类型
x700008_var_Boss_aoe_skillid = 13704		-- boss 群体恐惧技能
x700008_var_Boss_Random_buffIdset = {32077,32078,32079} -- 随机buff进攻免疫，远攻免疫，魔攻免疫
x700008_var_no_heart_buffid	= 32083			-- boss 免疫仇恨buffid
x700008_var_Boss_time_aoe_skillid = 13701	-- boss 每30秒释放群体攻击技能的技能id
x700008_var_Boss_time_aoe_Buffid = 13121	-- boss 每60秒流血buffid
x700008_var_Boss_time_aoe_time1 = 30	-- boss xx 秒触发（30秒触发的）
x700008_var_Boss_time_aoe_time2 = 60	-- boss xx 秒触发（60秒触发的）
x700008_var_subBoss_time = 30			-- subboss xx 秒清空一次仇恨（30秒触发的）
x700008_var_Boss_kuangbao_time = 300	-- Boss xx 秒后狂暴
x700008_var_Boss_kuangbao_buffid = 32071 -- Boss xx 秒后狂暴的BuffId

-- 小怪技能释放几率
x700008_var_Skill_Use = {
							--使用几率x%,技能id,技能类型0单体1群攻
							{pre=20,	skillID=15130,		skilltype=1}, 
							{pre=20,	skillID=15131,		skilltype=0}, 
							{pre=60,	skillID=0,		    skilltype=0}, 
						 }

function x700008_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	
end

function x700008_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700008_CSP_AREA_ID, varArea)

	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700008_CSP_FUBEN_FINISH)
		if BossId == 0 then
			return 
		end
		SetFubenData_Param(varMap, x700008_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700008_var_QuestId, x700008_var_FileId,1)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700008_var_QuestId, x700008_var_FileId)
	end
end	



function x700008_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700008_CSP_AREA_ID, -1)
end
function x700008_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700008_CSP_AREA_ID)
	
	if varArea == 0 then
		local BossId = GetFubenData_Param(varMap, x700008_CSP_FUBEN_FINISH)
		
		if BossId == 0 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700008_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700008_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700008_var_QuestId, x700008_var_FileId)
	elseif varArea == 1 then
		
	end
end

function x700008_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700008_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700008_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700008_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700008_CSP_ZHANCHE, -1)
	SetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK, 0);
	SetFubenData_Param(varMap, x700008_CSP_FUBEN_FINISH, 0)
	
	SetFubenData_Param(varMap, x700008_CSP_B_KILL_FUWANG, 0);

	SetFubenData_Param(varMap, x700008_CSP_BOSS_ID, -1)
	
	SetFubenData_Param(varMap, x700008_CSP_AREA_FLAG, 0)

	SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_START_TIME, 0)
	SetFubenData_Param(varMap, x700008_CSP_BOSS_HP_STEP_RECORD, 0)
	SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD1, 0)
	SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD2, 0)
	SetFubenData_Param(varMap, x700008_CSP_BOSS_HP_STEP_RECORD, getn(x700008_var_hp_Step) + 1);
	SetFubenData_Param(varMap, x700008_CSP_BOSS_KUANGBAO_TIME_RECORDE,0)
	for varI=0, 9 do
		
		SetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+varI, -1);
	end

	

	x700008_CreateNpc( varMap,0)

	
end

function x700008_GetNpcTextCount(varMap,nNpcIndex)

	local nTextList = x700008_var_NpcTalkText[nNpcIndex]
	local varCount =0
	for varI,item in nTextList do
		varCount = varCount+1
	end

	return varCount
end


function x700008_EnterTick(varMap,nowTickCount)

	local nNpcIndex = GetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_INDEX);

	local nNpcId = GetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_ID);
	
	local nMainBossId = x700008_GetMainBossId(varMap);
	if (nMainBossId > 0) and (GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE) == 2) then
		x700008_ProcMainBossTick(varMap, nMainBossId)
	end

	if nNpcId>=0 then
		local nCurrentNpcTick = GetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_TICK)+1;
		SetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_TICK, nCurrentNpcTick)

		local nNpcTextCount = x700008_GetNpcTextCount(varMap,nNpcIndex)

		if nCurrentNpcTick<=nNpcTextCount then
			
			NpcTalk(varMap, nNpcId, x700008_var_NpcTalkText[nNpcIndex][nCurrentNpcTick],  -1)
		elseif nCurrentNpcTick==nNpcTextCount+1 then
			
			DeleteMonster( varMap,nNpcId ) 
			SetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_ID,-2);
			x700008_CreateBoss(varMap,nNpcIndex-1)
		end
	elseif nNpcId==-2 then
		local nBossId = GetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+nNpcIndex-1 )
			
		if nBossId>=0 then
			
			local nCurrentHp = GetHp( varMap, nBossId )
			local nFullHp = GetFubenData_Param(varMap, x700008_CSP_BOSS_FULL_HP_START+nNpcIndex-1  )
			local bCreatedSubMonster = GetFubenData_Param(varMap, x700008_CSP_BOSS_LOADMONSTER_START+nNpcIndex-1  )
			
			if nCurrentHp/nFullHp <0.25 then
				if bCreatedSubMonster<=0 then

					
					SetFubenData_Param(varMap, x700008_CSP_BOSS_LOADMONSTER_START+nNpcIndex-1,1 )
					if nNpcIndex<x700008_NeedKillMonster_Count then
					x700008_CreateNpc(varMap,nNpcIndex)
				end
			end
			end
		elseif nBossId == -2 then
			SetFubenData_Param(varMap, x700008_CSP_BOSS_LOADMONSTER_START+nNpcIndex-1,1 )
			if nNpcIndex<x700008_NeedKillMonster_Count then
					x700008_CreateNpc(varMap,nNpcIndex)
			
			end
			
		end
	end

	local nSubmitNpcId = GetFubenData_Param(varMap, x700008_CSP_NPC_ID);
	local bNeedTalk = GetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK);

	if bNeedTalk>0 then
		SetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK, 0);
		NpcTalk(varMap, nSubmitNpcId, "返回王城的大门已经开启！",  -1)
	end
end





function x700008_CreateBoss(varMap,varIndex)
	
    local fubenlevel = GetFubenData_Param(varMap, x700008_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700008_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700008_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700008_var_FileId,nIndexFrom,varI)
		if idScript == x700008_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount-1 do
                if varFlag == varIndex then
                    local varRet = 0
					if title~="" then
						varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700008_var_FileId, -1, 21,-1, facedir,  "",title)
					else
						varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700008_var_FileId, -1, 21,-1, facedir)
					
					end
					
					local nFullHp = GetHp( varMap, varRet )


					SetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+varIndex, varRet )
					SetFubenData_Param(varMap, x700008_CSP_BOSS_FULL_HP_START+varIndex, nFullHp )
					SetFubenData_Param(varMap, x700008_CSP_BOSS_LOADMONSTER_START+varIndex, 0 )

					x700008_ShowTipsToAll( varMap, format("第%d个字上帝王影像消失，第%d个字上出现异种怪物！", varIndex+1,varIndex+1))
				--Debug Log
					local varHumanCount = GetScenePlayerCount( varMap)
			    if varHumanCount > 0 then
			    		local strGUIDList = ""
			        for varObjIndex = 0, varHumanCount do
			            local varObjId = GetScenePlayerObjId( varMap,varObjIndex)
			            if varObjId >= 0 then
			              local nGUID = GetGUID(varMap, varObjId)
										if strGUIDList == "" then
											strGUIDList = strGUIDList .. nGUID
										else
											strGUIDList = strGUIDList .. "," .. nGUID
										end	
			            end
			        end
			        WriteLog(1, format("Fuben Debug: HeShiBi Create Boss: varIndex=%d, GUIDList=%s", varIndex, strGUIDList))
			    end
			    --end Debug Log	

					return

                end
            end
        end
	end
		
	

end

function x700008_CreateNpc( varMap,varIndex )

	local nLastStep = GetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_INDEX)

	if nLastStep ~= varIndex then
		return
	end

	if varIndex>=x700008_NeedKillMonster_Count then
		return
	end

    local item = x700008_var_NpcCreate[varIndex + 1]
	local varRet = 0
	if item.title~="" then
		varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.guid,-1,-1, item.facedir,  "",item.title);
	else
		varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.guid,-1,-1, item.facedir);
	
	end
	SetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_ID, varRet)
	SetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_INDEX, varIndex+1)
	SetFubenData_Param(varMap, x700008_CSP_CURRENTNPC_TICK, 0)

	x700008_ShowTipsToAll( varMap, format("第%d个字上出现帝王影像", varIndex+1))
end


function x700008_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700008_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	if (x700008_IsHpSubMonsterDie(varMap, varPlayer) == 1) then
		return
	end

	local zhanChe = GetFubenData_Param(varMap, x700008_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		
		local strPlayerName = GetName( varMap, varKiller)
		local varCountry = GetCurCountry( varMap, varKiller )
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
		local strMapName = "和氏璧"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end

	local nDieCount = GetFubenData_Param(varMap, x700008_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700008_CSP_KILLCOUNT, nDieCount+1);
	

	nDieCount = nDieCount+1;
	
	
	for varI=0, 9 do
		local nBossId = GetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+varI )
		if nBossId== varPlayer then
			SetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+varI, -2 )
			x700008_ShowTipsToAll( varMap, format("杀死第%d个字上的异种怪物", varI+1))
			if varI==7 then
				SetFubenData_Param(varMap, x700008_CSP_B_KILL_FUWANG, 1 )
			elseif varI==8 then
				local bKillFuwang = GetFubenData_Param(varMap, x700008_CSP_B_KILL_FUWANG);

				if bKillFuwang<=0 then
					LuaCallNoclosure( 701108, "ProcSceneBossDie", varMap, 1)
				end
			end

			break;
		end
	end
		
	if nDieCount== x700008_NeedKillMonster_Count then	
		x700008_ProcFubenEnd( varMap) 
		
		local nSubMonsterNum = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT);
		local nMonsterId = -1
		for i = 0, nSubMonsterNum - 1 do
			nMonsterId = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + i);
			if (nMonsterId > 0) then
				DeleteMonster(varMap, nMonsterId)
				SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + i, 0);
			end
		end
		SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT, 0)
	elseif nDieCount< x700008_NeedKillMonster_Count then
		
	end

	local nRandomBossId = GetFubenData_Param(varMap, x700008_CSP_RANDOM_BOSS_ID)

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

		local nHorseFlag = GetFubenData_Param(varMap, x700008_RANDOMBOSS_FLAG);
		local fubenlevel = GetFubenData_Param(varMap, x700008_CSP_FUBENLEVEL )
		
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
		elseif fubenlevel < 95 then
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
				strHorseName = "狻猊"
			elseif nHorseFlag==1 then
				strHorseName = "毕方"
			elseif nHorseFlag==2 then
				strHorseName = "??杌"
			elseif nHorseFlag==3 then
				strHorseName = "饕餮"
			end
		else
			if nHorseFlag==0 then
				strHorseName = "狻猊"
			elseif nHorseFlag==1 then
				strHorseName = "毕方"
			elseif nHorseFlag==2 then
				strHorseName = "??杌"
			elseif nHorseFlag==3 then
				strHorseName = "饕餮"
			end
		end



		local strMapName = "和氏璧"
		
		LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)
		
		
		
	end
	
	
	
end

function x700008_ProcAllMonsterDead( varMap)
	
	x700008_CreateSubmitNpc( varMap)
	x700008_CreateRandomMonster(varMap)
	
end

function x700008_CreateSubmitNpc( varMap)
	 
	 local varRet = 0
	 if x700008_var_SubmitNPC.title~="" then
	 	varRet = CreateMonster(varMap, x700008_var_SubmitNPC.type, x700008_var_SubmitNPC.varX, x700008_var_SubmitNPC.z, 3, 0, -1, x700008_var_SubmitNPC.guid, -1,-1,x700008_var_SubmitNPC.facedir, "", x700008_var_SubmitNPC.title)
	 else
	 	varRet = CreateMonster(varMap, x700008_var_SubmitNPC.type, x700008_var_SubmitNPC.varX, x700008_var_SubmitNPC.z, 3, 0, -1, x700008_var_SubmitNPC.guid, -1,-1,x700008_var_SubmitNPC.facedir)
	 
	 end

	 SetFubenData_Param(varMap, x700008_CSP_NPC_ID, varRet);
	 SetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK, 1);

	 
	 
	 

	 LuaCallNoclosure( 701107, "ProcSceneBossDie", varMap, 1)

	 

end

function x700008_CreateRandomMonster(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700008_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,FUBEN_HESHIBI,nFubenMode )/100

	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	
	if rate>= nStdRate then
		return 0;
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700008_CSP_FUBENLEVEL ) ;


	
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700008_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700008_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700008_var_FileId,nIndexFrom,varI)
		if idScript == x700008_var_FileId and monsterFlag == 8+nFlag and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == nFlag then
			
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700008_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700008_var_FileId, -1, 21,-1,facedir)
				
				end

				SetFubenData_Param(varMap, x700008_B_CREATE_RANDOMBOSS, 1)
				SetFubenData_Param(varMap, x700008_RANDOMBOSS_FLAG, nFlag)

				SetFubenData_Param(varMap, x700008_CSP_RANDOM_BOSS_ID, nBossID)
			end

				
		end
	end

	x700008_ShowTipsToAll(varMap, "战神再现！")

end

function x700008_ProcFubenEnd( varMap)
	x700008_CreateXianJinBoss(varMap)
	x700008_CreateRandomMonster(varMap)
	x700008_CreateSubmitNpc( varMap)
	x700008_CreateZhanCheBoss(varMap)
	SetFubenData_Param(varMap, x700008_CSP_FUBEN_FINISH, 1)
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,58 )
		--本周最大次数
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT,"SetMaxEnterCount", varMap, humanId) 
	end	
	x700008_ShowTipsToAll(varMap, "顺利击杀尾火虎星，副本完成，请退出副本。")
end


function x700008_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700008_CSP_FUBEN_MODE)

	if nFubenMode==0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700008_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700008_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700008_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700008_var_FileId,nIndexFrom,varI)
		if idScript == x700008_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700008_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700008_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700008_CSP_XIANJINBOSS, varRet )
		end
	end
	local humancount = GetFuben_PlayerCount(varMap);
	if humancount >= 1 then
		for i = 0,humancount - 1 do
			local varPlayer = GetFuben_PlayerObjId(varMap, i);
			if IsHaveQuest(varMap,varPlayer, 1718) > 0 then
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1718)
				if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 2 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
					Msg2Player(varMap, varPlayer, format("你挑战了一次三番副本 %d/3", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)			
				else
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,3)
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				end
			end	 
		end
	end
	x700008_ShowTipsToAll(varMap, "翻番宝箱出现！")
end



function x700008_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700008_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700008_CSP_FUBENLEVEL)

	if fubenlevel < x700008_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700008_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700008_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID(x700008_var_FileId )

	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700008_var_FileId,nIndexFrom,varI)
		if idScript == x700008_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700008_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700008_ShowTipsToAll(varMap, "战车风翼之王出现！")
	end
end

function x700008_ProcMainBossTick(varMap, BossId)
	if (BossId <= 0) then
		return
	end
	
	-- buff检测
	if (IsHaveSpecificImpact(varMap, BossId, x700008_var_no_heart_buffid) == 0) then
		SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700008_var_no_heart_buffid, 0);
		--WriteLog(1, format("x700023_EnterTick --- boss 添加免除仇恨buff buffid %d", x700008_var_no_heart_buffid));
	end
	
	-- 战斗状态判定
	local nTimeRecord = GetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_START_TIME)
	local nIsInCombat = IsMosterInCombatState(varMap, BossId);
	if ( nIsInCombat == 1 ) then
		if (nTimeRecord == 0) then
			SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_START_TIME, GetCurrentTime())
			SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD1, GetCurrentTime())
			SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD2, GetCurrentTime())
			SetFubenData_Param(varMap, x700008_CSP_BOSS_HP_STEP_RECORD, getn(x700008_var_hp_Step) + 1);
			SetFubenData_Param(varMap, x700008_CSP_BOSS_KUANGBAO_TIME_RECORDE, GetCurrentTime())
		end
	else
		if (nTimeRecord ~= 0) then
			SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_START_TIME, 0)
			SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD1, 0)
			SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD2, 0)
			SetFubenData_Param(varMap, x700008_CSP_BOSS_HP_STEP_RECORD, getn(x700008_var_hp_Step) + 1);
			SetFubenData_Param(varMap, x700008_CSP_BOSS_KUANGBAO_TIME_RECORDE, 0)
			local nSubMonsterNum = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT);
			local nMonsterId = -1
			for i = 0, nSubMonsterNum - 1 do
				nMonsterId = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + i);
				if (nMonsterId > 0) then
					DeleteMonster(varMap, nMonsterId)
					SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + i, 0);
				end
			end
			SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT, 0)
		end
		return
	end
	
	-- 狂暴
	local nTimeRecord0 = GetFubenData_Param(varMap, x700008_CSP_BOSS_KUANGBAO_TIME_RECORDE)
	local nPassTime0 = GetCurrentTime() - nTimeRecord0;

	if(nTimeRecord0 > 0 and nPassTime0 >= x700008_var_Boss_kuangbao_time) then
		SetFubenData_Param(varMap, x700008_CSP_BOSS_KUANGBAO_TIME_RECORDE, -1);
		SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, x700008_var_Boss_kuangbao_buffid, 0);
		--WriteLog(1, format("x700008_ProcMainBossTick --- 狂暴buffid %d", x700008_var_Boss_kuangbao_buffid));
	end
	
	local nTimeRecord1 = GetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD1)
	local nPassTime1 = GetCurrentTime() - nTimeRecord1;
		
	if (nPassTime1 >= x700008_var_Boss_time_aoe_time1) then
		-- time1 触发
		-- 释放大群攻技能
		nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId);
		UnitUseSkill(varMap, BossId, x700008_var_Boss_time_aoe_skillid,BossId,nTargetX,nTargetZ,-1.0,0);
		SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD1, GetCurrentTime())
		--WriteLog(1, format("x700008_ProcMainBossTick --- %d群Skill id = %d", x700008_var_Boss_time_aoe_time1,x700008_var_Boss_time_aoe_skillid));
		
	end
	
	local nTimeRecord2 = GetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD2)
	local nPassTime2 = GetCurrentTime() - nTimeRecord2;
	if (nPassTime2 >= x700008_var_Boss_time_aoe_time2) then
		-- time2 触发
		-- 群buff
		local varX,z = GetWorldPos(varMap,BossId)
		local Num = GetNearPlayerCountForMonster(varMap, BossId,varX,z,50)
		for playeridx = 0, Num - 1 do
			local humanObjId = GetNearPlayerMemberForMonster(varMap, BossId, playeridx);
			SendSpecificImpactToUnit( varMap, BossId, BossId, humanObjId, x700008_var_Boss_time_aoe_Buffid, 0);
		end
		--WriteLog(1, format("x700008_ProcMainBossTick --- 群buffid %d", x700008_var_Boss_time_aoe_time2));
		SetFubenData_Param(varMap, x700008_CSP_BOSS_COMBAT_TIME_RECORD2, GetCurrentTime())
	end
	
	x700008_ProcHpSubBossTick(varMap)
	x700008_ProcMainBossHp(varMap, BossId)
end

-- 处理有mainboss血量变化创建出来的小boss
function x700008_ProcHpSubBossTick(varMap)

	local nMonsterId = 0;
	local nTimeRecord = 0;
	local nSubMonsterNum = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT);
	for i = 0, nSubMonsterNum - 1 do
		nMonsterId = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + i);
		nTimeRecord = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COMBAT_START_TIME + i)
		
		if (IsHaveSpecificImpact(varMap, nMonsterId, x700008_var_no_heart_buffid) == 1) then
			SendSpecificImpactToUnit( varMap, nMonsterId, nMonsterId, nMonsterId, x700008_var_no_heart_buffid, 0);
			--WriteLog(1, format("x700023_EnterTick ---小 boss 添加免除仇恨buff buffid %d", x700008_var_no_heart_buffid));
		end
		
		
		-- 判断是否进入了战斗状态
		local nIsInCombat = IsMosterInCombatState(varMap, nMonsterId);
		if ( nIsInCombat == 1 ) then
			if (nTimeRecord == 0) then
				SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COMBAT_START_TIME + i, GetCurrentTime())
			end
			
			-- tick检测
			nTimeRecord = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COMBAT_START_TIME + i)
			local nPassTime = GetCurrentTime() - nTimeRecord;
			if (nTimeRecord > x700008_var_subBoss_time) then
				SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COMBAT_START_TIME + i, GetCurrentTime())
				SetMonsterThreat(varMap,nMonsterId,GetThreatTargetID(varMap, nMonsterId),0);
				--WriteLog(1, format("x700008_ProcHpSubBossTick --- 清空仇恨"));
			end
		else
			if (nTimeRecord ~= 0) then
				SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COMBAT_START_TIME + i, 0)
			end
		end
		
	end
end

function x700008_ProcMainBossHp(varMap, BossId)
	if (BossId <= 0) then
		return
	end
	
	local nMaxHp = GetMaxHp(varMap, BossId)
	local nCurHp = GetHp(varMap, BossId)
	local nHp = nCurHp / nMaxHp
	local nMaxHpStep = getn(x700008_var_hp_Step)
	local nHpStepRecord = GetFubenData_Param(varMap, x700008_CSP_BOSS_HP_STEP_RECORD);
	for nstep = 1, nMaxHpStep do
		if (nHp < x700008_var_hp_Step[nstep]) then
			--WriteLog(1, format("x700008_ProcMainBossHp 血量nhp=%f,nstep=%d,fThp=%f,nHpStepRecord=%d",nHp,nstep,x700008_var_hp_Step[nstep],nHpStepRecord));
		
			if (nHpStepRecord > nstep) then
				-- 血量触发事件
				-- 创建小boss
				local x,z = GetMonsterPosition(varMap, BossId)
				x700008_CreateHpStepSubMonster(varMap, nstep,x,z);
				
				-- 清仇恨
				local playerid = GetThreatTargetID(varMap, BossId);
				if (playerid > 0) then
					--WriteLog(1, format("x700004_ResetSubBossState --- idx = %d,Playerid = %d",BossId,playerid));
					SetMonsterThreat(varMap,BossId,GetThreatTargetID(varMap, playerid),0);
				end
				
				-- 群体恐惧技能
				local nTargetX, nTargetZ = GetMonsterPosition(varMap, BossId);
				UnitUseSkill(varMap, BossId, x700008_var_Boss_aoe_skillid,BossId,nTargetX,nTargetZ,-1.0,0);
				
				-- 随机附加buff
				local nRandomBuffCount = getn(x700008_var_Boss_Random_buffIdset)
				if (nRandomBuffCount > 0) then
					local nRand = random(1, getn(x700008_var_Boss_Random_buffIdset))
					local BuffId = x700008_var_Boss_Random_buffIdset[nRand]
					SendSpecificImpactToUnit( varMap, BossId, BossId, BossId, BuffId, 0);
					--WriteLog(1, format("x700023_EnterTick --- boss 添加免除仇恨buff buffid %d", BuffId));
				end
				--WriteLog(1, format("x700008_ProcMainBossHp 触发血量效果"));
		
				SetFubenData_Param(varMap, x700008_CSP_BOSS_HP_STEP_RECORD, nstep);
			end
			break
		end
	end
end

function x700008_CreateHpStepSubMonster(varMap, varIdx,x,z)
	local fubenlevel = GetFubenData_Param(varMap, x700008_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700008_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700008_var_FileId )

	local nCount = GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT)
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,varZ,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700008_var_FileId,nIndexFrom,varI)
		if idScript == x700008_var_FileId and monsterFlag == x700008_var_SubMonsterType and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
         
            local varRet = 0
			
			local Posx,Posz;
			Posx = random(0,10)
			Posz = random(0,10)
			Posx = Posx - 5 + x;
			Posz = Posz - 5 + z;
	
			if title~="" then
				varRet = CreateMonster(varMap, type, Posx, Posz, ai, aiscript, x700008_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, Posx, Posz, ai, aiscript, x700008_var_FileId, -1, 21,-1, facedir)
			end
			
			SetMonsterUseSkillByScript(varMap, varRet, 1);
			SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + nCount, varRet)
			nCount = nCount + 1;
        end
	end
	SetFubenData_Param(varMap, x700008_CSP_SUBBOSS_COUNT, nCount)	
end

-- 获取尾火虎星的id
function x700008_GetMainBossId(varMap)
	return GetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START + x700008_NeedKillMonster_Count - 1 )
end

function x700008_GetMainBossMaxHp(varMap)
	return GetFubenData_Param(varMap, x700008_CSP_BOSS_FULL_HP_START + x700008_NeedKillMonster_Count - 1 )
end

function x700008_IsHpSubMonsterDie(varMap, MonsterId)
	local nIsFind = 0
	
	for i = 0, x700008_CSP_SUBBOSS_COUNT - 1 do
		if (MonsterId > 0 and MonsterId == GetFubenData_Param(varMap, x700008_CSP_SUBBOSS_ID_START + i)) then
			return 1
		end
	end
	
	return nIsFind
end

function x700008_ProcMonsterUseSkill(varMap, varPlayer)

	local nSkillID, nSkillType, nTargetID, nTargetX, nTargetZ;
	nTargetID = GetThreatTargetID(varMap, varPlayer);
	nTargetX,nTargetZ	= GetThreatTargetPos(varMap, varPlayer);
	
	local nRand = 0;
	local nMaxRand = 0;
	
	-- 计算要使用的技能及类型
	for varIRand,itemRand in x700008_var_Skill_Use do
		nMaxRand = nMaxRand + itemRand.pre;
	end
	
	nRand = random(0,nMaxRand);
	
	for varI,item in x700008_var_Skill_Use do
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


