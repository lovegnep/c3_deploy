











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

x700008_CSP_BOSS_ID_START			=	40
x700008_CSP_BOSS_FULL_HP_START		=	50
x700008_CSP_BOSS_LOADMONSTER_START	=   60


x700008_B_CREATE_RANDOMBOSS			=	230
x700008_CSP_RANDOM_BOSS_ID			=	231
x700008_RANDOMBOSS_FLAG				=	232

x700008_CSP_XIANJINBOSS				=	239

x700008_CSP_HUMAN_COUNT				=	240
x700008_CSP_OBJID_START				=	241

x700008_CSP_GUID_START              =   248  
x700008_CSP_FUBEN_TYPE				=	254	

x700008_CSP_FUBEN_MODE				=   255 

x700008_var_RandomBossRate		=	0.1*6


x700008_var_FileId 					= 700008



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







function x700008_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	
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
	
	SetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK, 0);
	
	
	SetFubenData_Param(varMap, x700008_CSP_B_KILL_FUWANG, 0);

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
			
		end
	end

	local nSubmitNpcId = GetFubenData_Param(varMap, x700008_CSP_NPC_ID);
	local bNeedTalk = GetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK);

	if bNeedTalk>0 then
		SetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK, 0);
		NpcTalk(varMap, nSubmitNpcId, "金銮殿之门已经开启！",  -1)
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
	
	local nDieCount = GetFubenData_Param(varMap, x700008_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700008_CSP_KILLCOUNT, nDieCount+1);

	

	nDieCount = nDieCount+1;
	
	
	for varI=0, 9 do
		local nBossId = GetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+varI )
		if nBossId== varPlayer then
			SetFubenData_Param(varMap, x700008_CSP_BOSS_ID_START+varI, -1 )
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
		
		
		







			












		
		

		

		
		
		
		x700008_ProcAllMonsterDead( varMap) 
	elseif nDieCount< x700008_NeedKillMonster_Count then
		x700008_CreateNpc(varMap,nDieCount)
	end
end

function x700008_ProcAllMonsterDead( varMap)
	
	x700008_CreateSubmitNpc( varMap)
	x700008_CreateRandomMonster(varMap)
	
end

function x700008_CreateSubmitNpc( varMap)
	 x700008_ShowTipsToAll( varMap, "副本完成， 神秘npc开启金銮殿之门！")
	 local varRet = 0
	 if x700008_var_SubmitNPC.title~="" then
	 	varRet = CreateMonster(varMap, x700008_var_SubmitNPC.type, x700008_var_SubmitNPC.varX, x700008_var_SubmitNPC.z, 3, 0, -1, x700008_var_SubmitNPC.guid, -1,-1,x700008_var_SubmitNPC.facedir, "", x700008_var_SubmitNPC.title)
	 else
	 	varRet = CreateMonster(varMap, x700008_var_SubmitNPC.type, x700008_var_SubmitNPC.varX, x700008_var_SubmitNPC.z, 3, 0, -1, x700008_var_SubmitNPC.guid, -1,-1,x700008_var_SubmitNPC.facedir)
	 
	 end

	 SetFubenData_Param(varMap, x700008_CSP_NPC_ID, varRet);
	 SetFubenData_Param(varMap, x700008_CSP_B_NEED_TALK, 1);

	 
	 x700008_CreateXianJinBoss(varMap)
	 

	 LuaCallNoclosure( 701107, "ProcSceneBossDie", varMap, 1)

	 

end

function x700008_CreateRandomMonster(varMap)

	local nFubenType = GetFubenData_Param(varMap, x700008_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700008_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,nFubenType,nFubenMode )

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
		if idScript == x700008_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
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

	x700008_ShowTipsToAll(varMap, "翻番宝箱出现！")
end





