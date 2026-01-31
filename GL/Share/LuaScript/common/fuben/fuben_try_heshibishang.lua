











x700208_CSP_FUBENTYPE				= 	0
x700208_CSP_SCRIPTID				=	1
x700208_CSP_TICKCOUNT				= 	2
x700208_CSP_FROMSCENEID				= 	3
x700208_CSP_ISCLOSING				= 	4
x700208_CSP_LEAVECOUNTDOWN			= 	5
x700208_CSP_TEAMID					=	6
x700208_CSP_BACKSCENEX       		=   7
x700208_CSP_BACKSCENEZ      		=   8
x700208_CSP_FUBENLEVEL			=	9
x700208_CSP_KILLCOUNT				=	20
x700208_CSP_CURRENTNPC_ID			=   21
x700208_CSP_CURRENTNPC_INDEX		=   22
x700208_CSP_CURRENTNPC_TICK			=   23
x700208_CSP_FUBENSCENEID			=   24
x700208_CSP_NPC_ID					=	25
x700208_CSP_B_NEED_TALK				=	26

x700208_CSP_BOSS_ID_START			=	40
x700208_CSP_BOSS_FULL_HP_START		=	50
x700208_CSP_BOSS_LOADMONSTER_START	=   60

x700208_CSP_HUMAN_COUNT				=	240
x700208_CSP_OBJID_START				=	241
x700208_CSP_GUID_START              =   248





x700208_var_FileId 					= 700208


x700208_NeedKillMonster_Count		=	8		                

x700208_var_NpcTalkText			= {
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

x700208_var_NpcTalkTime			=	1	
x700208_var_NpcHoldTime			=	2



x700208_var_SubmitNPC                 =   { type =25009,guid= 150547,varX = 72, z=74, facedir =0, title="" }


x700208_var_BossCreate				=	{
											{levelmin =20, levelmax=100, varName ="角木熊星",   type= 27786,  varX=61, z=56, r=0,  ai=9, aiscript=535, varCount=1, facedir = 0, title = "",varFlag=0},
											
											{levelmin =20, levelmax=100, varName ="奎木狼星",   type= 27787,  varX=61, z=62, r=0,  ai=9, aiscript=536, varCount=1, facedir = 0, title = "",varFlag=1},
											
											{levelmin =20, levelmax=100, varName ="毕月乌星",   type= 27788,  varX=61, z=68, r=0,  ai=9, aiscript=537, varCount=1, facedir = 0, title = "",varFlag=2},
											
											{levelmin =20, levelmax=100, varName ="翼火蛇星",   type= 27789,  varX=61, z=74, r=0,  ai=9, aiscript=538, varCount=1, facedir = 0, title = "",varFlag=3},
											
											{levelmin =20, levelmax=100, varName ="胃土彘星",   type= 27790,  varX=72, z=56, r=0,  ai=9, aiscript=539, varCount=1, facedir = 0, title = "",varFlag=4},
											
											{levelmin =20, levelmax=100, varName ="女土蝠星",   type= 27791,  varX=72, z=62, r=0,  ai=9, aiscript=540, varCount=1, facedir = 0, title = "",varFlag=5},

											{levelmin =20, levelmax=100, varName ="鬼金羊星",   type= 27792,  varX=72, z=68, r=0,  ai=9, aiscript=541, varCount=1, facedir = 0, title = "",varFlag=6},
											
											{levelmin =20, levelmax=100, varName ="尾火虎星",   type= 27793,  varX=72, z=74, r=0,  ai=9, aiscript=542, varCount=1, facedir = 0, title = "",varFlag=7},
											
										}

x700208_var_NpcType1                  =   25042                    
x700208_var_NpcType2                  =   25043                    
x700208_var_NpcType3                  =   25044                    
x700208_var_NpcType4                  =   25045                    
x700208_var_NpcType5                  =   25046                    
x700208_var_NpcType6                  =   25047                    
x700208_var_NpcType7                  =   25048                    
x700208_var_NpcType8                  =   25049                    

x700208_var_NpcCreate					=	{
											{	type=x700208_var_NpcType1, 	varX=61,  z=56,	ai=3,   aiscript=-1,guid = 150005,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType2, 	varX=61,  z=62,	ai=3,   aiscript=-1,guid = 150006,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType3, 	varX=61,  z=68,	ai=3,   aiscript=-1,guid = 150007,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType4, 	varX=61,  z=74,	ai=3,   aiscript=-1,guid = 150008,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType5, 	varX=72,  z=56,	ai=3,   aiscript=-1,guid = 150009,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType6, 	varX=72,  z=62,	ai=3,   aiscript=-1,guid = 150010,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType7, 	varX=72,  z=68,	ai=3,   aiscript=-1,guid = 150011,facedir = 0, title = "" },
                                            {	type=x700208_var_NpcType8, 	varX=72,  z=74,	ai=3,   aiscript=-1,guid = 150012,facedir = 0, title = "" },
	
										}





function x700208_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

end






function x700208_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700208_CSP_B_NEED_TALK, 0);

	for varI=0, 9 do
		
		SetFubenData_Param(varMap, x700208_CSP_BOSS_ID_START+varI, -1);
	end

	x700208_CreateNpc( varMap,0)

	local humancount = GetFuben_PlayerCount(varMap);
	SetFubenData_Param(varMap, x700208_CSP_HUMAN_COUNT, humancount);
	
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		SetFubenData_Param(varMap, x700208_CSP_OBJID_START+varI, humanId);
	end
end





function x700208_GetNpcTextCount(varMap,nNpcIndex)

	local nTextList = x700208_var_NpcTalkText[nNpcIndex]
	local varCount =0
	for varI,item in nTextList do
		varCount = varCount+1
	end

	return varCount
end






function x700208_EnterTick(varMap,nowTickCount)
	local nNpcIndex = GetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_INDEX);

	local nNpcId = GetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_ID);

	if nNpcId>=0 then
		local nCurrentNpcTick = GetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_TICK)+1;
		SetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_TICK, nCurrentNpcTick)

		local nNpcTextCount = x700208_GetNpcTextCount(varMap,nNpcIndex)

		if nCurrentNpcTick<=nNpcTextCount then
			
			NpcTalk(varMap, nNpcId, x700208_var_NpcTalkText[nNpcIndex][nCurrentNpcTick],  -1)
		elseif nCurrentNpcTick==nNpcTextCount+1 then
			
			DeleteMonster( varMap,nNpcId ) 
			SetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_ID,-2);
			x700208_CreateBoss(varMap,nNpcIndex-1)
		end
	elseif nNpcId==-2 then
		local nBossId = GetFubenData_Param(varMap, x700208_CSP_BOSS_ID_START+nNpcIndex-1 )
			
		if nBossId>=0 then
			
			local nCurrentHp = GetHp( varMap, nBossId )
			local nFullHp = GetFubenData_Param(varMap, x700208_CSP_BOSS_FULL_HP_START+nNpcIndex-1  )
			local bCreatedSubMonster = GetFubenData_Param(varMap, x700208_CSP_BOSS_LOADMONSTER_START+nNpcIndex-1  )
			
			if nCurrentHp/nFullHp <0.25 then
				if bCreatedSubMonster<=0 then

					
					SetFubenData_Param(varMap, x700208_CSP_BOSS_LOADMONSTER_START+nNpcIndex-1,1 )
					if nNpcIndex<x700208_NeedKillMonster_Count then
					x700208_CreateNpc(varMap,nNpcIndex)
				end
			end
			end
			
		end
	end

	local nSubmitNpcId = GetFubenData_Param(varMap, x700208_CSP_NPC_ID);
	local bNeedTalk = GetFubenData_Param(varMap, x700208_CSP_B_NEED_TALK);

	if bNeedTalk>0 then
		SetFubenData_Param(varMap, x700208_CSP_B_NEED_TALK, 0);
		NpcTalk(varMap, nSubmitNpcId, "金銮殿之门已经开启！",  -1)
	end
end





function x700208_CreateBoss(varMap,varIndex)

	
    local copyscenelevel = GetFubenData_Param(varMap, x700208_CSP_FUBENLEVEL ) ;

	for varI, item in x700208_var_BossCreate do

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
            for j=0,item.varCount-1 do
                if item.varFlag == varIndex then
                    local varRet = 0
					if item.title~="" then
						varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700208_var_FileId, -1, 21,-1, item.facedir,  "",item.title)
					else
						varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700208_var_FileId, -1, 21,-1, item.facedir)
					
					end
					
					local nFullHp = GetHp( varMap, varRet )


					SetFubenData_Param(varMap, x700208_CSP_BOSS_ID_START+varIndex, varRet )
					SetFubenData_Param(varMap, x700208_CSP_BOSS_FULL_HP_START+varIndex, nFullHp )
					SetFubenData_Param(varMap, x700208_CSP_BOSS_LOADMONSTER_START+varIndex, 0 )

					x700208_ShowTipsToAll( varMap, format("第%d个字上帝王影像消失，第%d个字上出现异种怪物！", varIndex+1,varIndex+1))

					return

                end
            end
        end
	end
		
	

end

function x700208_CreateNpc( varMap,varIndex )

	local nLastStep = GetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_INDEX)

	if nLastStep ~= varIndex then
		return
	end

	if varIndex>=x700208_NeedKillMonster_Count then
		return
	end

    local item = x700208_var_NpcCreate[varIndex + 1]
	local varRet = 0
	if item.title~="" then
		varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.guid,-1,-1, item.facedir,  "",item.title);
	else
		varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.guid,-1,-1, item.facedir);
	
	end
	SetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_ID, varRet)
	SetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_INDEX, varIndex+1)
	SetFubenData_Param(varMap, x700208_CSP_CURRENTNPC_TICK, 0)

	x700208_ShowTipsToAll( varMap, format("第%d个字上出现帝王影像", varIndex+1))
end


function x700208_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700208_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700208_CSP_KILLCOUNT, nDieCount+1);

	

	nDieCount = nDieCount+1;
	
	
	for varI=0, 9 do
		local nBossId = GetFubenData_Param(varMap, x700208_CSP_BOSS_ID_START+varI )
		if nBossId== varPlayer then
			SetFubenData_Param(varMap, x700208_CSP_BOSS_ID_START+varI, -1 )
			x700208_ShowTipsToAll( varMap, format("杀死第%d个字上的异种怪物", varI+1))
			break;
		end
	end
		
	
	if nDieCount== x700208_NeedKillMonster_Count then
		
		
		







			












		
		

		

		
		
		
		x700208_ProcAllMonsterDead( varMap) 
	elseif nDieCount< x700208_NeedKillMonster_Count then
		x700208_CreateNpc(varMap,nDieCount)
	end
end

function x700208_ProcAllMonsterDead( varMap)
	
	x700208_CreateSubmitNpc( varMap)

	
end

function x700208_CreateSubmitNpc( varMap)
	 x700208_ShowTipsToAll( varMap, "副本完成， 神秘npc开启金銮殿之门！")
	 local varRet = 0
	 if x700208_var_SubmitNPC.title~="" then
	 	varRet = CreateMonster(varMap, x700208_var_SubmitNPC.type, x700208_var_SubmitNPC.varX, x700208_var_SubmitNPC.z, 3, 0, -1, x700208_var_SubmitNPC.guid, -1,-1,x700208_var_SubmitNPC.facedir, "", x700208_var_SubmitNPC.title)
	 else
	 	varRet = CreateMonster(varMap, x700208_var_SubmitNPC.type, x700208_var_SubmitNPC.varX, x700208_var_SubmitNPC.z, 3, 0, -1, x700208_var_SubmitNPC.guid, -1,-1,x700208_var_SubmitNPC.facedir)
	 
	 end

	 SetFubenData_Param(varMap, x700208_CSP_NPC_ID, varRet);
	 SetFubenData_Param(varMap, x700208_CSP_B_NEED_TALK, 1);
end


function x700208_ShowTipsToAll( varMap, varStr)
	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap, humanId);
	end
end






function x700208_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x700208_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end






