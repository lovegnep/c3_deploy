











x700002_CSP_FUBENTYPE				= 	0
x700002_CSP_SCRIPTID				=	1
x700002_CSP_TICKCOUNT				= 	2
x700002_CSP_FROMSCENEID				= 	3
x700002_CSP_ISCLOSING				= 	4
x700002_CSP_LEAVECOUNTDOWN			= 	5
x700002_CSP_TEAMID					=	6
x700002_CSP_BACKSCENEX       		=   7
x700002_CSP_BACKSCENEZ      		=   8
x700002_CSP_FUBENLEVEL			=	9

x700002_CSP_KILLCOUNT				=	20
x700002_CSP_FUBEN_SCENE_ID			=	21

x700002_CSP_GAME_STEP				=	22
x700002_CSP_TEMP_STEP				=	23
x700002_CSP_TEMP_TICKCOUNT			=	24
x700002_CSP_B_BAOMU_ING				=	25
x700002_CSP_B_FUBEN_STATUS			=	26
x700002_CSP_STARTNPC_ID				=	27
x700002_CSP_LAOBAN_ID				=	28
x700002_CSP_STEP_NPC_ID				=	29

x700002_CSP_GUANYU_ID				=	30
x700002_CSP_LUSU_ID					=	31
x700002_CSP_STEP_PARAM				=	32
x700002_CSP_MYS_FULL_HP				=	33
x700002_CSP_MYS_B_START_CALL		=	34
x700002_CSP_FINAL_KILLER_ID			=	35

x700002_CSP_GZ_COUNT				=	40
x700002_CSP_GZ_START				=	41   
x700002_CSP_RUN_MONSTER_COUNT		=	60
x700002_CSP_RUN_MONSTER_START		=	61	
x700002_CSP_STEP_BOSS_COUNT			=	70
x700002_CSP_STEP_BOSS_START			=	71
x700002_CSP_MONSTER_COUNT			=	80
x700002_CSP_MONSTER_START			=	81


x700002_CSP_HUMAN_COUNT				=	240
x700002_CSP_OBJID_START				=	241
x700002_CSP_GUID_START              =   248





x700002_var_FileId 					= 700002

x700002_var_StartGame					=	0
x700002_var_BaoMuX	=63
x700002_var_BaoMuZ	=52
x700002_var_BaoxinX	=37	
x700002_var_BaoxinZ	=56


x700002_var_BaomuNpcTalkText			= {
									{"第一幕",
									"西厢记"
									},

									{"第二幕",
                                    "单刀会"
									},

									{"第三幕",
									"窦娥冤"
									},

									{"第四幕",
                                    "汉宫秋"
									}

								  }

x700002_var_StepNpcTalkText			= {
										
									{"过雨樱桃血满枝，弄色的奇花红间紫，垂柳已成丝。",
                                    "恶人孙飞虎，欺男霸女实祸害，此贼不除，有情亦难成眷属。"
									 
									},

									{"原来汝等早有埋伏，快快保护君侯！",
									
									},

									{"没来由犯王法，不提防遭刑宪，叫声屈动地惊天！顷刻间游魂先赴森罗殿，怎不将天地也生埋怨。",
                                    "可怜我窦娥今日蒙冤九泉下，定不能饶了那可恨的张驴儿！！"

									},

									{"啊呀~~~！我只道是忠臣皆有用，高枕已无忧，却不想如今只凭佳人平定天下！！"
									}
								}

x700002_var_EndStepNpcTalkText	= {
										
									{"愿天下有情人终能成眷属！",
									 
									},

									{"我乃汉寿亭侯，匹夫安敢如此！",
									 
									},

									{"昏庸知县，十恶的张驴儿，死不足惜。",
									 
									},

									{"陛下~，都是那可恨的毛延寿害得你我天各一方！",
									 

									}
								}


x700002_var_SubmitNPC                 =   { type =25019,guid= 150519,varX = 63, z=50,facedir=0, title="" }
x700002_var_LeaveNPC					=   { type =25019,guid= 150519,varX = 63, z=50,facedir=0, title="" }	





x700002_var_NpcCreate				=	{                                          
                                            {varName ="报幕Npc",   type= 25052, guid= -1    , varX=45, z=29, r=0,  ai=7, aiscript=0,   facedir = 0, title = "", varFlag=0},
											{varName ="老板",		type= 25063, guid= 150518, varX=64, z=65, r=0,  ai=7, aiscript=0,   facedir = 180, title = "", varFlag=1},
									}




x700002_var_GzCreate				=	{

									 }
                                        






function x700002_StartBaoMu(varMap)

	local nFubenStatus = GetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS)  
	if nFubenStatus~= 0 then
		return
	end

	local nNpcId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)

	SetFubenData_Param(varMap, x700002_CSP_B_BAOMU_ING,1)

	SetPatrolId(varMap, nNpcId, 0)

	
	SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,0)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,0)

	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)
	x700002_ShowTipsToAll(varMap, format("第%d幕报幕开始",varCurrentStep+1))

end


function x700002_BaoMu(varMap)

	local bBaomu = GetFubenData_Param(varMap, x700002_CSP_B_BAOMU_ING)

	if bBaomu<=0 then
		return
	end

	local nNpcId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)

	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)
			
	NpcTalk(varMap, nNpcId, x700002_var_BaomuNpcTalkText[varCurrentStep+1][1],  -1)
	

	SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,1)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,1)

end

function x700002_LeaveBaoMu(varMap)
	local bBaomu = GetFubenData_Param(varMap, x700002_CSP_B_BAOMU_ING)

	if bBaomu<=0 then
		return
	end

	local nNpcId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)

	SetPatrolId(varMap, nNpcId, 1)

	SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,2)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,0)

end



function x700002_StartScene(varMap)

	local bBaomu = GetFubenData_Param(varMap, x700002_CSP_B_BAOMU_ING)

	if bBaomu<=0 then
		return
	end

	SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,3)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,0)

	SetFubenData_Param(varMap, x700002_CSP_B_BAOMU_ING,0)
	
	local nCurrentGameStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)+1
	SetFubenData_Param(varMap, x700002_CSP_GAME_STEP, nCurrentGameStep)
	SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, 0)
	

	
	

	
	x700002_CreateStepNpc(varMap,nCurrentGameStep-1)	
	
		

	
	
end

function x700002_ProcTalkOver(varMap)
	local nCurrentGameStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,4)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,0)

	if nCurrentGameStep==1 then
		x700002_CreateMonster(varMap,nCurrentGameStep-1)
	elseif  nCurrentGameStep==2 then
		local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
		SetPatrolId(varMap, nStepNpcId, 2)
		x700002_CreateBoss(varMap,nCurrentGameStep-1)
		x700002_CreateStep2Npc(varMap)
	elseif  nCurrentGameStep==3 then
		x700002_CreateMonster(varMap,nCurrentGameStep-1)
		x700002_CreateBoss(varMap,nCurrentGameStep-1)
	elseif  nCurrentGameStep==4 then
		local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
		x700002_DeleteMonster( varMap,nStepNpcId )
		SetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID,-1)

		x700002_CreateMonster(varMap,nCurrentGameStep-1)
		x700002_CreateBoss(varMap,nCurrentGameStep-1)
	end

	
end

function x700002_ProcStepEndOver(varMap)
	local nCurrentGameStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)
	local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)

	x700002_DeleteMonster( varMap,nStepNpcId )

	x700002_ShowTipsToAll(varMap, format("第%d幕结束",nCurrentGameStep))

	if nCurrentGameStep==4 then
		x700002_ProcCompleteAllGame(varMap)
	else
		x700002_StartBaoMu(varMap)
	end
	
end


function x700002_ProcAllBossOver(varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

	if varCurrentStep==1 then
		x700002_ProcCompleteOneStep(varMap)
	elseif varCurrentStep==2 then
		SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, 1)
	elseif varCurrentStep==3 then
		local nParam = GetFubenData_Param(varMap, x700002_CSP_STEP_PARAM)+1
		SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, nParam)
		
		if nParam==2 then  
			x700002_ShowTipsToAll(varMap, "张驴儿和打手都死了， 贪官出现")
			x700002_CreateMonster(varMap,21)
			x700002_CreateBoss(varMap,21)
		elseif nParam==4 then  
			x700002_ShowTipsToAll(varMap, "为窦娥报了仇")
			x700002_ProcCompleteOneStep(varMap)
		end
	elseif varCurrentStep==4 then
		local nParam = GetFubenData_Param(varMap, x700002_CSP_STEP_PARAM)+1
		SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, nParam)
		
		local nRunMonsterCount = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT)
		if nParam==3 then
			if nRunMonsterCount==0 then
				x700002_ShowTipsToAll(varMap, "保护好了昭君")
				x700002_ProcCompleteOneStep(varMap)
			end
		elseif nParam==1 then
			local nBossCount = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_COUNT)
			if nBossCount==0 then
				local bMysCall = GetFubenData_Param(varMap, x700002_CSP_MYS_B_START_CALL )
				if bMysCall==0 then
					
					local nMonsterCount = GetFubenData_Param(varMap, x700002_CSP_MONSTER_COUNT)

					for varI=0, nMonsterCount-1 do
						local nMonsterId = GetFubenData_Param(varMap, x700002_CSP_MONSTER_START+varI)

						if nMonsterId>=0 then
							x700002_DeleteMonster( varMap,nMonsterId )
							SetFubenData_Param(varMap, x700002_CSP_MONSTER_START+varI,-1)
						end
					end

					x700002_ProcCompleteOneStep(varMap)
				end
			end
		end
	end
end

function x700002_ProcAllMonsterOver(varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

	
	if varCurrentStep==1 then
		x700002_ShowTipsToAll(varMap, "杀死所有小怪，孙飞虎出现")
		x700002_CreateBoss(varMap,varCurrentStep-1)
	elseif varCurrentStep==2 then
		local nParam = GetFubenData_Param(varMap, x700002_CSP_STEP_PARAM)

		if nParam==1 then
			SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, 2)
			x700002_ProcCompleteOneStep(varMap)
		end
	elseif varCurrentStep==3 then
		local nParam = GetFubenData_Param(varMap, x700002_CSP_STEP_PARAM)+1
		SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, nParam) 

		if nParam==2 then  
			x700002_ShowTipsToAll(varMap, "张驴儿和打手都死了， 贪官出现")
			x700002_CreateMonster(varMap,21)
			x700002_CreateBoss(varMap,21)
		elseif nParam==4 then  
			x700002_ShowTipsToAll(varMap, "为窦娥报了仇")
			x700002_ProcCompleteOneStep(varMap)
		end
	elseif varCurrentStep==4 then
		local nParam = GetFubenData_Param(varMap, x700002_CSP_STEP_PARAM)+1
		SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, nParam)

		local nRunMonsterCount = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT)
		if nParam==3 then
			if nRunMonsterCount==0 then
				x700002_ShowTipsToAll(varMap, "保护好了昭君")
				x700002_ProcCompleteOneStep(varMap)
			end
		end
	end
end

function x700002_ProcAllRunMonsterOver(varMap)
	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

	if varCurrentStep~=4 then
		return
	end

	
	local nParam = GetFubenData_Param(varMap, x700002_CSP_STEP_PARAM)+1
	SetFubenData_Param(varMap, x700002_CSP_STEP_PARAM, nParam)
	
	local nRunMonsterCount = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT)
	if nParam==3 then
		if nRunMonsterCount==0 then
			x700002_ShowTipsToAll(varMap, "保护好了昭君")
			x700002_ProcCompleteOneStep(varMap)
		end
	end

end


function x700002_ProcCompleteAllGame(varMap)
	x700002_ProcFubenSuccess(varMap)
end

function x700002_ProcCompleteOneStep(varMap)

	
	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

	x700002_AllGzSay(varMap, "好精彩啊!")
	x700002_LaobanSay(varMap, "果然佳作")

	if varCurrentStep ==1 then
		

	elseif varCurrentStep ==2 then
		local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
		local nGuanyuId = GetFubenData_Param(varMap, x700002_CSP_GUANYU_ID)
		local nLusucId = GetFubenData_Param(varMap, x700002_CSP_LUSU_ID)

		if nGuanyuId<0 then
			return
		end

		
		
		if nStepNpcId>=0 then
			x700002_DeleteMonster( varMap,nStepNpcId )
		end
		x700002_DeleteMonster( varMap,nLusucId )
		
		SetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID,nGuanyuId)

		SetFubenData_Param(varMap, x700002_CSP_GUANYU_ID,-1)
		SetFubenData_Param(varMap, x700002_CSP_LUSU_ID,-1)

	elseif varCurrentStep ==3 then
	elseif varCurrentStep	==4 then
		x700002_CreateStepNpc(varMap,31)
		SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,5)
		SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,0)
		x700002_ShowTipsToAll(varMap, format("出色地完成了第%d幕",varCurrentStep))

		
		return
	end

	SetFubenData_Param(varMap, x700002_CSP_TEMP_STEP,5)
	SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,1)
	
	local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
			
	NpcTalk(varMap, nStepNpcId, x700002_var_EndStepNpcTalkText[varCurrentStep][1],  -1)

	x700002_ShowTipsToAll(varMap, format("出色地完成了第%d幕",varCurrentStep))
	
end





function x700002_EnterTick(varMap,nowTickCount)

	local nFubenStatus = GetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS)  
	if nFubenStatus~= 0 then
		return
	end
	
	local bBaomu = GetFubenData_Param(varMap, x700002_CSP_B_BAOMU_ING)

    local nNpcId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)

	
	
	
	

	if bBaomu<=0 then
		local nStatus = GetFubenData_Param(varMap, x700002_CSP_TEMP_STEP) 
		local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

		
		if nStatus==3 then  
			local nTickCount = GetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT)+1
			SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,nTickCount)

			
			local nTextCount = x700002_GetStepTextCount(varMap,varCurrentStep)
			
			if nTickCount>nTextCount then
				x700002_ProcTalkOver(varMap)
			else
				local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
				NpcTalk(varMap, nStepNpcId, x700002_var_StepNpcTalkText[varCurrentStep][nTickCount],  -1)
			end
		elseif nStatus==5 then
			
			local nTickCount = GetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT)+1
			SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,nTickCount)
			
				
			local nTextCount = x700002_GetEndStepTextCount(varMap,varCurrentStep)
			if nTickCount>nTextCount then
				
				x700002_ProcStepEndOver(varMap)
				
			else
				local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
				NpcTalk(varMap, nStepNpcId, x700002_var_EndStepNpcTalkText[varCurrentStep][nTickCount],  -1)
			end
			
		elseif	nStatus==4 then
			if varCurrentStep==4 then
				local nBossCount = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_COUNT)
				local nMysId = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START)
				local bCalled = GetFubenData_Param(varMap, x700002_CSP_MYS_B_START_CALL )	
				
				if nBossCount>0 then
					if bCalled<=0 then
						if nMysId>=0 then
							
							local nCurrentHp = GetHp( varMap, nMysId )
							local nFullHp = GetFubenData_Param(varMap, x700002_CSP_MYS_FULL_HP )
							
							if nCurrentHp< nFullHp then
								SetFubenData_Param(varMap, x700002_CSP_MYS_B_START_CALL,1 )
								NpcTalk(varMap, nMysId, "汉人反悔，赶快去报信！",  -1)
								x700002_CreateStep4RunMonster(varMap)
							end
						end
					end
				end
						
			end


			if varCurrentStep==4 then
		
				local nRunMonsterCount = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT)

				for varI=0, nRunMonsterCount-1 do
					local nMonsterId = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+varI)
					
					if( IsObjValid(varMap,nMonsterId) ~= 1 )then
						
						WriteLog(1,format("goulanqutai getworldpos 1:varCount=%d,varId=%d,varIndex=%d,step=%d,nFubenStatus=%d",nRunMonsterCount,nMonsterId,varI,varCurrentStep,nFubenStatus))
						return
					end
					

					local varX,z =GetWorldPos(varMap,nMonsterId)

					if varX==x700002_var_BaoxinX and z==x700002_var_BaoxinZ then
						x700002_ProcFubenFailed(varMap,4)
						break;
					end
				end
			end
		end

		
	else
		local nBaomuTickCount = GetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT)+1
		SetFubenData_Param(varMap, x700002_CSP_TEMP_TICKCOUNT,nBaomuTickCount)

		if( IsObjValid(varMap,nNpcId) ~= 1 )then
			
			WriteLog(1,format("goulanqutai getworldpos 2:varId=%d,nFubenStatus=%d",nNpcId,nFubenStatus))
			return
		end	
		

		local varX,z =GetWorldPos(varMap,nNpcId)
		local nBaomuStatus = GetFubenData_Param(varMap, x700002_CSP_TEMP_STEP)
		
		if nBaomuStatus==0 then
			if varX==x700002_var_BaoMuX and z==x700002_var_BaoMuZ then  
				x700002_BaoMu(varMap)
				return
			end			
		elseif nBaomuStatus==1 then		
			local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)
			local nTextCount = x700002_GetNpcTextCount(varMap,varCurrentStep+1)
			if nBaomuTickCount>nTextCount then
				x700002_LeaveBaoMu(varMap)
			else
				NpcTalk(varMap, nNpcId, x700002_var_BaomuNpcTalkText[varCurrentStep+1][nBaomuTickCount],  -1)
			end
		elseif nBaomuStatus==2 then		
			if nBaomuTickCount==1 then
				x700002_StartScene(varMap)
			end
		else
			return
		end
		
	end
end







function x700002_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

end






function x700002_ProcFubenSceneCreated( varMap )
	
	x700002_CreateNpc( varMap)
	x700002_CreateGz(varMap)
	
	local weekIndex = GetWeekIndex()
	local varHumanCount = GetScenePlayerCount( varMap)
	if varHumanCount > 0 then
	    for varI = 0, varHumanCount do
	        local varObj = GetScenePlayerObjId( varMap,varI)
	        if varObj >= 0 then
	        	SetPlayerGameData(varMap, varObj, MD_FUBEN_HUAPI_FLAG[1], MD_FUBEN_HUAPI_FLAG[2], MD_FUBEN_HUAPI_FLAG[3], 0)
	        end
		end
	end
end

function x700002_GetNpcTextCount(varMap,varIndex)

	local nTextList = x700002_var_BaomuNpcTalkText[varIndex]
	local varCount =0
	for varI,item in nTextList do
		varCount = varCount+1
	end

	return varCount;
end


function x700002_GetStepTextCount(varMap,varIndex)

	local nTextList = x700002_var_StepNpcTalkText[varIndex]
	local varCount =0
	for varI,item in nTextList do
		varCount = varCount+1
	end

	return varCount;
end

function x700002_GetEndStepTextCount(varMap,varIndex)
	local nTextList = x700002_var_EndStepNpcTalkText[varIndex]
	local varCount =0
	for varI,item in nTextList do
		varCount = varCount+1
	end

	return varCount;
end



function x700002_CreateStepNpc(varMap,varIndex)
	

	local fubenlevel = GetFubenData_Param(varMap, x700002_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700002_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700002_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700002_var_FileId,nIndexFrom,varI)
		if idScript == x700002_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			if varFlag == varIndex   then

				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,camp,-1, facedir, "", title);
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,camp,-1, facedir);
				
				end

				SetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID, varRet)
			end
		end
        
    end

	
end

function x700002_CreateStep2Npc(varMap)

	local nCurrentGameStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

	if nCurrentGameStep~= 2 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700002_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700002_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700002_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700002_var_FileId,nIndexFrom,varI)
		if idScript == x700002_var_FileId and monsterFlag == 4 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,camp,-1, facedir,  "",title);
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,camp,-1, facedir);
			
			end

            if varFlag == 0 then
				SetFubenData_Param(varMap, x700002_CSP_GUANYU_ID, varRet)
			elseif 	varFlag == 1 then
				SetFubenData_Param(varMap, x700002_CSP_LUSU_ID, varRet)
            end
        end
    end
end

function x700002_CreateStep4RunMonster(varMap)

	local nCurrentGameStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)

	if nCurrentGameStep~= 4 then
		return
	end

	local varRunCount = 0 
	local currentMonsterCount =varRunCount;

	local fubenlevel = GetFubenData_Param(varMap, x700002_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700002_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700002_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700002_var_FileId,nIndexFrom,varI)
		if idScript == x700002_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			for j=0,varCount -1 do
				local rx = random(-r,r)
				local varX = varX + rx
				local rz = random(-r,r)
				local z = z + rz

				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,21,-1, facedir,  "",title);
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,21,-1, facedir);
				
				end

				if patrolid>=0 then
						SetPatrolId(varMap, varRet, patrolid)
				end
				SetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+ currentMonsterCount, varRet)
				currentMonsterCount = currentMonsterCount +1
			end
			
        end
    end 

	SetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT, currentMonsterCount)

	x700002_ShowTipsToAll(varMap, "匈奴兵去报信了，赶快阻止他们")
end
	

function x700002_CreateBoss(varMap,varIndex)
	
	local nBossCount = 0 
	local currentBossCount =nBossCount;

	local fubenlevel = GetFubenData_Param(varMap, x700002_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700002_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700002_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700002_var_FileId,nIndexFrom,varI)
		if idScript == x700002_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            if varFlag == varIndex   then
				for j=0,varCount -1 do

					local rx = random(-r,r)
					local varX = varX + rx
					local rz = random(-r,r)
					local z = z + rz

					local varRet = 0
					if title~="" then
						varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,21,-1, facedir,  "",title);
					else
						varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,21,-1, facedir);
					
					end


					if patrolid>=0 then
						SetPatrolId(varMap, varRet, patrolid)
					end

					SetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START + currentBossCount, varRet)
					local humancount = GetFuben_PlayerCount(varMap);    
  				if humancount >= 1 then                             
  					local varPlayer = GetFuben_PlayerObjId(varMap, 0);
  					GamePlayScriptLog(varMap, varPlayer, 1194)        
  				end 
					
					currentBossCount = currentBossCount+1

					if varIndex ==3 then
						local nFullHp = GetHp( varMap, varRet )
						SetFubenData_Param(varMap, x700002_CSP_MYS_FULL_HP,nFullHp )
						SetFubenData_Param(varMap, x700002_CSP_MYS_B_START_CALL,0 )
						break;
					end
				end
            end

			
        end
    end

	SetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_COUNT, currentBossCount ) ;

end








function x700002_CreateMonster(varMap,varIndex)


    local fubenlevel = GetFubenData_Param(varMap, x700002_CSP_FUBENLEVEL ) ;

	local nMonsterCount = GetFubenData_Param(varMap, x700002_CSP_MONSTER_COUNT ) ;
	local currentMonsterCount =nMonsterCount;

	local nIndexFrom = GetFubenDataPosByScriptID(x700002_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700002_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700002_var_FileId,nIndexFrom,varI)
		if idScript == x700002_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then
			
            if varFlag == varIndex  then
				for j=0,varCount -1 do

					local rx = random(-r,r)
					local varX = varX + rx
					local rz = random(-r,r)
					local z = z + rz
					local monsterid = 0
					if title~="" then
						monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,21,-1,facedir,  "",title);
					else
						monsterid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700002_var_FileId,-1,21,-1,facedir);
					end

					if patrolid>=0 then
						SetPatrolId(varMap, monsterid, patrolid)
					end
					local humancount = GetFuben_PlayerCount(varMap);    
  				if humancount >= 1 then                             
  					local varPlayer = GetFuben_PlayerObjId(varMap, 0);
  					GamePlayScriptLog(varMap, varPlayer, 1193)        
  				end 

					SetFubenData_Param(varMap, x700002_CSP_MONSTER_START+currentMonsterCount, monsterid ) ;
					currentMonsterCount = currentMonsterCount +1
				end
            end
        end
    end


	SetFubenData_Param(varMap, x700002_CSP_MONSTER_COUNT, currentMonsterCount ) ;

end






function x700002_CreateNpc( varMap )
	

	local fubenlevel = GetFubenData_Param(varMap, x700002_CSP_FUBENLEVEL ) ;

	for varI, item in x700002_var_NpcCreate do

       
		local varRet = 0
		if item.title~="" then
			varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,item.guid,-1,-1,item.facedir,  "",item.title);
		else
			varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,item.guid,-1,-1,item.facedir);
		
		end

		if item.varFlag==0 then
			SetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID, varRet)
			SetFubenData_Param(varMap, x700002_CSP_GAME_STEP,x700002_var_StartGame)
			x700002_StartBaoMu(varMap)
		elseif item.varFlag==1 then
			SetFubenData_Param(varMap, x700002_CSP_LAOBAN_ID, varRet)
		end
		
	end

    
end

function x700002_CreateGz( varMap )
	

	local nGzCount = GetFubenData_Param(varMap, x700002_CSP_GZ_COUNT ) ;
	local varCount =nGzCount;

	for varI, item in x700002_var_GzCreate do

		local varRet = 0
		if item.title~="" then
			varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,-1,-1,item.facedir, "", item.title);
		else
			varRet = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1,-1,-1,-1,item.facedir);
		
		end
		
		SetFubenData_Param(varMap, x700002_CSP_GZ_START+varCount, varRet ) ;
		varCount = varCount+1
	end

	SetFubenData_Param(varMap, x700002_CSP_GZ_COUNT, varCount ) ;
    
end


function x700002_AllGzSay(varMap, varStr)
	local nGzCount = GetFubenData_Param(varMap, x700002_CSP_GZ_COUNT ) ;

	for varI=0, nGzCount-1 do
		local nGzId = GetFubenData_Param(varMap, x700002_CSP_GZ_START+varI)
		NpcTalk(varMap, nGzId, varStr,  -1)
	end
end


function x700002_LaobanSay(varMap, varStr)
	local laoban = GetFubenData_Param(varMap, x700002_CSP_LAOBAN_ID)
	NpcTalk(varMap, laoban, varStr,  -1)
end



function x700002_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end


function x700002_ProcDie(varMap, varPlayer, varKiller)
	
	
	local nFubenStatus = GetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS)  
	if nFubenStatus~= 0 then
		return
	end
	local nDieCount = GetFubenData_Param(varMap, x700002_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700002_CSP_KILLCOUNT, nDieCount+1);

	nDieCount = nDieCount+1;
	
	local nNpcObjId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)

	

	local bBoss  = 0;

	
	local varCurrentStep = GetFubenData_Param(varMap, x700002_CSP_GAME_STEP)


	local nBossCount = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_COUNT)
	

	

	for varI = 0, nBossCount - 1 do
		local nBossID = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START + varI)
		if nBossID>=0 then
			if nBossID== varPlayer then
				for j=varI, nBossCount-2 do
					local nNextId = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START+j+1)
					SetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START+j, nNextId)
					
				end
				SetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START+nBossCount-1,-1)
				SetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_COUNT,nBossCount-1)

				bBoss = varI+1;

				if varCurrentStep==2 then

					x700002_CreateMonster(varMap,varCurrentStep-1)
					x700002_ShowTipsToAll(varMap, "伏兵出现！")
				end

				if (nBossCount-1)==0 then
					x700002_ProcAllBossOver(varMap)
					
					
					if varCurrentStep==4 then
						SetFubenData_Param(varMap, x700002_CSP_FINAL_KILLER_ID,varKiller)
					end
					

				end
				break;
			end
		end
	end

	


	local nMonsterCount = GetFubenData_Param(varMap, x700002_CSP_MONSTER_COUNT)

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700002_CSP_MONSTER_START+varI)
		if nMonsterId== varPlayer then
			for j=varI, nMonsterCount-2 do
				local nNextId = GetFubenData_Param(varMap, x700002_CSP_MONSTER_START+j+1)
				SetFubenData_Param(varMap, x700002_CSP_MONSTER_START+j, nNextId)
				
			end
			SetFubenData_Param(varMap, x700002_CSP_MONSTER_START+nMonsterCount-1,-1)
			SetFubenData_Param(varMap, x700002_CSP_MONSTER_COUNT,nMonsterCount-1)
			if (nMonsterCount-1)==0 then
				x700002_ProcAllMonsterOver(varMap)
			end
			break
		end
	end


	if varCurrentStep ==2 then
		local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
		local nGuanyuId = GetFubenData_Param(varMap, x700002_CSP_GUANYU_ID)
		local nLusucId = GetFubenData_Param(varMap, x700002_CSP_LUSU_ID)

		if nStepNpcId== varPlayer then
			x700002_ShowTipsToAll(varMap, "周仓被杀")
			GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID,-1)
		elseif  nGuanyuId== varPlayer then
			GetFubenData_Param(varMap, x700002_CSP_GUANYU_ID,-1)
			x700002_ProcFubenFailed(varMap,varCurrentStep)
		end
	end

	if varCurrentStep==4 then
		
		local nRunMonsterCount = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT)

		for varI=0, nRunMonsterCount-1 do
			local nMonsterId = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+varI)
			if nMonsterId== varPlayer then
				for j=varI, nRunMonsterCount-2 do
					local nNextId = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+j+1)
					SetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+j, nNextId)
					
				end
				SetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+nRunMonsterCount-1,-1)
				SetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT,nRunMonsterCount-1)
				if (nRunMonsterCount-1)==0 then
					x700002_ProcAllRunMonsterOver(varMap)
				end
				break
			end
		end
	end
	


	
end

function x700002_ProcFubenFailed(varMap,nParam)
	local nFubenStatus = GetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS)  
	if nFubenStatus~= 0 then
		return
	end


	if nParam==2 then
		x700002_ShowTipsToAll(varMap, "关羽被杀，副本失败")

		local nStepNpcId = GetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID)
		local nGuanyuId = GetFubenData_Param(varMap, x700002_CSP_GUANYU_ID)
		local nLusucId = GetFubenData_Param(varMap, x700002_CSP_LUSU_ID)

		if nStepNpcId>=0  then
			x700002_DeleteMonster( varMap,nStepNpcId )
			SetFubenData_Param(varMap, x700002_CSP_STEP_NPC_ID,-1)
		end

		if nLusucId>=0 then
			x700002_DeleteMonster( varMap,nLusucId )
			SetFubenData_Param(varMap, x700002_CSP_LUSU_ID,-1)
		end

	elseif nParam==4 then
		
		x700002_ShowTipsToAll(varMap, "匈奴兵报信完成，副本失败")
		local nRunMonsterCount = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_COUNT)

		for varI=0, nRunMonsterCount-1 do
			local nMonsterId = GetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+varI)
			if nMonsterId>=0 then
				x700002_DeleteMonster( varMap,nMonsterId )
				SetFubenData_Param(varMap, x700002_CSP_RUN_MONSTER_START+varI,-1)
			end
		end
	else
		return
	end
	SetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS,2)  
	

	local nMonsterCount = GetFubenData_Param(varMap, x700002_CSP_MONSTER_COUNT)

	for varI=0, nMonsterCount-1 do
		local nMonsterId = GetFubenData_Param(varMap, x700002_CSP_MONSTER_START+varI)

		if nMonsterId>=0 then
			x700002_DeleteMonster( varMap,nMonsterId )
			SetFubenData_Param(varMap, x700002_CSP_MONSTER_START+varI,-1)
		end
	end

	local nBossCount = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_COUNT)

	for varI = 0, nBossCount - 1 do
		local nBossID = GetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START + varI)
		if nBossID>=0 then
			x700002_DeleteMonster( varMap,nBossID )
			SetFubenData_Param(varMap, x700002_CSP_STEP_BOSS_START+varI,-1)
		end
	end

	x700002_ShowTipsToAll(varMap, "副本失败，请离开副本")


	x700002_AllGzSay(varMap, "可惜了")
	x700002_LaobanSay(varMap, "真遗憾啊")

	local nNpcId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)
	NpcTalk(varMap, nNpcId, "...",  -1)
	
	x700002_CreateLeaveNpc( varMap)
end

function x700002_ProcFubenSuccess(varMap)

	local nFubenStatus = GetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS)  
	if nFubenStatus~= 0 then
		return
	end
	SetFubenData_Param(varMap, x700002_CSP_B_FUBEN_STATUS,1)  
	x700002_ShowTipsToAll(varMap, "副本完成，请退出副本。")

	x700002_AllGzSay(varMap, "英雄")
	x700002_LaobanSay(varMap, "好家伙")

	local nNpcId = GetFubenData_Param(varMap, x700002_CSP_STARTNPC_ID)
	NpcTalk(varMap, nNpcId, "英雄们，可以离开副本了",  -1)
	x700002_CreateSubmitNpc( varMap)






























	
end



function x700002_CreateSubmitNpc( varMap)
	if x700002_var_SubmitNPC.title~="" then
	  CreateMonster(varMap, x700002_var_SubmitNPC.type, x700002_var_SubmitNPC.varX, x700002_var_SubmitNPC.z, 3, 0, -1, x700002_var_SubmitNPC.guid, -1, -1,x700002_var_SubmitNPC.facedir, "", x700002_var_SubmitNPC.title )
	else
	  CreateMonster(varMap, x700002_var_SubmitNPC.type, x700002_var_SubmitNPC.varX, x700002_var_SubmitNPC.z, 3, 0, -1, x700002_var_SubmitNPC.guid, -1, -1,x700002_var_SubmitNPC.facedir )
	
	end
end

function x700002_CreateLeaveNpc( varMap)
	if x700002_var_LeaveNPC.title~="" then
		CreateMonster(varMap, x700002_var_LeaveNPC.type, x700002_var_LeaveNPC.varX, x700002_var_LeaveNPC.z, 3, 0, -1, x700002_var_LeaveNPC.guid, -1, -1,x700002_var_LeaveNPC.facedir, "", x700002_var_LeaveNPC.title )
	else
		CreateMonster(varMap, x700002_var_LeaveNPC.type, x700002_var_LeaveNPC.varX, x700002_var_LeaveNPC.z, 3, 0, -1, x700002_var_LeaveNPC.guid, -1, -1,x700002_var_LeaveNPC.facedir )
	
	end
end

function x700002_DeleteMonster(varMap,varPlayer)
	if IsObjValid(varMap,varPlayer) == 1 and GetHp(varMap,varPlayer ) > 0 then
		DeleteMonster(varMap,varPlayer)
	end
end

