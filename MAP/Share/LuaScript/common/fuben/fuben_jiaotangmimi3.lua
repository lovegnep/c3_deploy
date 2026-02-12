











x700092_CSP_FUBENTYPE				= 	0
x700092_CSP_SCRIPTID				=	1
x700092_CSP_TICKCOUNT				= 	2
x700092_CSP_FROMSCENEID				= 	3
x700092_CSP_ISCLOSING				= 	4
x700092_CSP_LEAVECOUNTDOWN			= 	5
x700092_CSP_TEAMID					=	6
x700092_CSP_BACKSCENEX       		=   7
x700092_CSP_BACKSCENEZ      		=   8
x700092_CSP_FUBENLEVEL			=	9
x700092_CSP_NPCID					=   10

x700092_CSP_KILLCOUNT				=	20
x700092_CSP_SPECIALMONSTER1			=   21
x700092_CSP_BOSS1					=   22
x700092_CSP_BOSS2					=   23
x700092_CSP_BOSS3					=   24
x700092_CSP_BOSS4					=   25
x700092_CSP_BOSS_COUNT				=   26

x700092_CSP_FUBEN_SCENE_ID			=	27
x700092_CSP_AREA_ID					=	28
x700092_CSP_AREA_FLAG				=	29
x700092_CSP_RANDOM_BOSS_ID			=	233
x700092_RANDOMBOSS_FLAG				=	234
x700092_CSP_ZHANCHE					 = 238
x700092_CSP_XIANJINBOSS				=	239

x700092_CSP_HUMAN_COUNT				=	240
x700092_CSP_OBJID_START				=	241
x700092_CSP_NEXT_SCENE				=   247
x700092_CSP_GUID_START              =   248

x700092_CSP_FUBEN_TYPE				=	254	
x700092_CSP_FUBEN_MODE				=   255 




x700092_var_QuestId					=   6608
x700092_var_FileId 					= 700092                    

x700092_var_Level_Limit = 70
x700092_var_Rate_Limit  = 30

x700092_var_SubmitNPC                 =   { type =28517,guid= 150561,varX = 96, z=11, facedir =180, title="" }
			
x700092_var_TalkNpcID					=   	150556		
x700092_var_NpcTalk = 	{
								"景教堂竟然有个惊天的秘密，他们在用人类做残忍的研究！"		,	
						}
						
x700092_var_BossBuffID 				= 4250  

                       
x700092_var_RandomMonsterRate			= 0.08*6
x700092_var_RandomMonsterRateZHOUSANFAN			= 67                      







function x700092_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

end

function x700092_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700092_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700092_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700092_CSP_BOSS4, 0);
	SetFubenData_Param(varMap, x700092_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param(varMap, x700092_CSP_ZHANCHE, -1)
    x700092_CreateMonster( varMap )
	x700092_CreateBoss( varMap )
	
	
	
end




function x700092_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700092_CSP_AREA_ID )
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700092_CSP_BOSS4 )
		if BossId ~= -1 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700092_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700092_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700092_var_QuestId, x700092_var_FileId,1)
		
	else
	 	
	end
end


function x700092_EnterTick(varMap, nowTickCount)

end

function x700092_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL ) 
	SetFubenData_Param(varMap, x700092_CSP_BOSS_COUNT, 0 )
	

	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700092_var_FileId )
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700092_var_FileId,nIndexFrom,varI)
		if idScript == x700092_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir)
			end

			if varFlag == 2 then
				SetFubenData_Param(varMap, x700092_CSP_SPECIALMONSTER1, varRet )
			elseif varFlag==0 then
				SetFubenData_Param(varMap, x700092_CSP_BOSS4, varRet )
			end
        end
	end

end

function x700092_CreateBoss1(varMap)
	
	local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700092_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700092_var_FileId,nIndexFrom,varI)
		if idScript == x700092_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and varFlag == 0 and nFubenType == varFlag3 then
		    local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir)
			end
			
        end
	end

end



function x700092_CreateBoss2(varMap)
	
	local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700092_var_FileId )
	















end





function x700092_CreateMonster(varMap)


    local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700092_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700092_var_FileId,nIndexFrom,varI)
		if idScript == x700092_var_FileId and monsterFlag == 3 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local varX = varX + rx
                local rz = random(-r,r)
                local z = z + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir, "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
            end
        end
	end

end
function x700092_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700092_CSP_AREA_ID, -1)
end
function x700092_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700092_CSP_AREA_ID, varArea)
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700092_CSP_BOSS4 )
		if BossId ~= -1 then
			return 
		end
		SetFubenData_Param(varMap, x700092_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700092_var_QuestId, x700092_var_FileId,1)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700092_var_QuestId, x700092_var_FileId)
	end
end



function x700092_CreateRandomMonster(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end

	local rate = random(0,100)/100;
	local nFubenMode = GetFubenData_Param(varMap, x700092_CSP_FUBEN_MODE)
	local nStdRate = LuaCallNoclosure(930206,"Showzhanshen", varMap,FUBEN_JIAOTANGMIMI3,nFubenMode )/100

	if nFubenMode ==1 then
		nStdRate = nStdRate*3
	end
	
	if(nFubenMode ~= 2) then
		if rate>= nStdRate then
			return 0;
		end
	else			
		rate = random(1,100)
		if(rate > x700092_var_RandomMonsterRateZHOUSANFAN) then
			return 0;
		end
	end

	local nFlag = random(0,3)

	

	local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL ) ;
	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700092_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700092_var_FileId,nIndexFrom,varI)
		
		
		
			if idScript == x700092_var_FileId and monsterFlag == 7+nFlag and levelmin <= fubenlevel and levelmax >= fubenlevel  and varFlag3 == nFubenType then
				local nBossID =0;
				if title~="" then
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					nBossID = CreateMonster(varMap, type, varX,z, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir)
				
				end
				
				SetFubenData_Param(varMap, x700092_RANDOMBOSS_FLAG, nFlag)
				SetFubenData_Param(varMap, x700092_CSP_RANDOM_BOSS_ID, nBossID)
			end
		
	end

	x700092_ShowTipsToAll(varMap, "战神再现！")

end

























































function x700092_ProcDie(varMap, varPlayer, varKiller)
	
	

	
	
	
		
	

	local objId1 = GetFubenData_Param(varMap, x700092_CSP_SPECIALMONSTER1)
	local objId2 = GetFubenData_Param(varMap, x700092_CSP_BOSS1)
	local objId3 = GetFubenData_Param(varMap, x700092_CSP_BOSS2)
	local objId4 = GetFubenData_Param(varMap, x700092_CSP_BOSS3)
	local objId5 = GetFubenData_Param(varMap, x700092_CSP_BOSS4)

	local xianjinboss = GetFubenData_Param(varMap, x700092_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700092_CSP_ZHANCHE)
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
		local strMapName = "大教堂"
		LuaAllScenceM2Wrold (varMap, strPlayerName.."打败了"..strMapName.."的战车风翼之王！", 5, 1)
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	if objId1 == varPlayer then		
		local varX,z = GetWorldPos(varMap,objId1)
		x700092_CreateBoss1(varMap)
		
	end
	
	if objId2 == varPlayer then		
		
	elseif objId3 == varPlayer then		
		
	elseif objId4 == varPlayer then
		
	end

	if varPlayer ==objId5 then
		
		
		x700092_ProcFubenEnd( varMap)
		SetFubenData_Param(varMap, x700092_CSP_BOSS4, -1)
		
		
	end

	
	local nRandomBossId = GetFubenData_Param(varMap, x700092_CSP_RANDOM_BOSS_ID)

	if nRandomBossId ~= 0 then
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

			local nHorseFlag = GetFubenData_Param(varMap, x700092_RANDOMBOSS_FLAG)
			local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL )
			
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



			local strMapName = "大教堂"
			
			LuaAllScenceM2Wrold (varMap,strCountryName.."的"..strPlayerName.."打败了"..strMapName.."的九旄战神，九旄丢下"..strHorseName.."落荒而逃！", 5, 1)
			
			
			
		end
	end
	
end

function x700092_ProcAllMonsterDead( varMap)
	
	
end

function x700092_ProcFubenEnd( varMap)
	
	
	x700092_CreateZhanCheBoss(varMap)
	x700092_CreateXianJinBoss(varMap)
	x700092_CreateRandomMonster(varMap)
	LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcFubuenCompleted", varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,61 )
	end	

	x700092_ShowTipsToAll(varMap, "顺利击杀贝拉四世,副本完成，请退出副本。")
end

function x700092_CreateSubmitNpc( varMap)
	if x700092_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700092_var_SubmitNPC.type, x700092_var_SubmitNPC.varX, x700092_var_SubmitNPC.z, 3, 0, -1, x700092_var_SubmitNPC.guid, -1,-1,x700092_var_SubmitNPC.facedir,  "", x700092_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700092_var_SubmitNPC.type, x700092_var_SubmitNPC.varX, x700092_var_SubmitNPC.z, 3, 0, -1, x700092_var_SubmitNPC.guid, -1,-1,x700092_var_SubmitNPC.facedir)
	end

	
	
	
	LuaCallNoclosure( 701110, "ProcSceneBossDie", varMap, 0)
	local humancount = GetFuben_PlayerCount(varMap);
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		local haveImpact = IsHaveSpecificImpact( varMap, humanId, x700092_var_BossBuffID )
		if haveImpact == 1 then
			LuaCallNoclosure( 701111, "ProcSceneBossDie", varMap, 0)
			return
		end
	end
	 





	 
	 
end





function x700092_CreateXianJinBoss(varMap)

	
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700092_CSP_FUBEN_MODE)
	
	if nFubenMode == 0 then
	  return
	end
	
	local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700092_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700092_var_FileId,nIndexFrom,varI)
		if idScript == x700092_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700092_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700092_CSP_XIANJINBOSS, varRet )
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
	x700092_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700092_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700092_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700092_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700092_CSP_FUBENLEVEL)

	if fubenlevel < x700092_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700092_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700092_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID(x700092_var_FileId )

	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700092_var_FileId,nIndexFrom,varI)
		if idScript == x700092_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1  and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700092_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700092_ShowTipsToAll(varMap, "战车风翼之王出现！")
	end
end
