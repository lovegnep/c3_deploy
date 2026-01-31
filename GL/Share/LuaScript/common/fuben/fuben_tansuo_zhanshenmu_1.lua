

x700084_CSP_FUBENTYPE				= 	0
x700084_CSP_SCRIPTID				=	1
x700084_CSP_TICKCOUNT				= 	2
x700084_CSP_BACKSCENEID				= 	3
x700084_CSP_ISCLOSING				= 	4
x700084_CSP_LEAVECOUNTDOWN			= 	5
x700084_CSP_TEAMID					=	6
x700084_CSP_TICKTIME				=	7
x700084_CSP_HOLDTIME				=	8
x700084_CSP_FUBENLEVEL				=	9

x700084_CSP_FUBEN_SCENE_ID			=	10
x700084_CSP_CLOSETICK				=	11
x700084_CSP_TICKCOUNT_ADD			=	12
x700084_CSP_TICKCOUNT_SUB			=	13
x700084_CSP_B_TOPLIST_ABLE			=	14

x700084_CSP_AREA_ID					=   200
x700084_CSP_AREA_FLAG				=   201
x700084_CSP_ZHANCHE					 = 238
x700084_CSP_XIANJINBOSS				=	239
x700084_CSP_HUMAN_COUNT				=	240
x700084_CSP_PLAYER_ENTER_START		=	241

x700084_CSP_LAST_TICKOUNT			=	247
x700084_CSP_GUID_START              =   248  
x700084_CSP_FUBEN_TYPE				=	254	
x700084_CSP_FUBEN_MODE				=   255



x700084_CSP_BOSS1_ID				=	50


x700084_var_QuestId					=  6608
x700084_var_FileId 					= 700084


x700084_var_NextFuben					= 46

x700084_var_Run_Count					= 15

x700084_var_SubmitNPC                 = {type =28507,guid= 150574,varX = 40, z=200, facedir =45, title = ""}
x700084_var_LeaveNPC                 = 150563
x700084_var_QuestId					= 6608
x700084_var_Talk_A					= "夏王墓是我西夏开国之主李元昊的陵墓，请你速去消灭盗墓贼完颜洪烈，让我家先人的陵墓完好无损！我在此先行谢过！"				
x700084_var_Talk_B					= "向我开炮，让火力来的更猛烈些吧！"								
x700084_var_Talk_C					= "让你尝尝我的厉害！"						
x700084_var_Talk_D					= "朋友们坚持住，由我来治愈你的伤痛！"	

x700084_var_Level_Limit = 70									  
x700084_var_Rate_Limit = 50

function x700084_ProcFubenSceneCreated( varMap )

	
	local humancount = GetFuben_PlayerCount(varMap)
	SetFubenData_Param(varMap, x700084_CSP_HUMAN_COUNT, humancount)
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		SetFubenData_Param(varMap, x700084_CSP_PLAYER_ENTER_START+varI, humanId)
	end
	
	SetFubenData_Param(varMap, x700084_CSP_BOSS1_ID, 0)
	SetFubenData_Param(varMap, x700084_CSP_AREA_FLAG, 0)
	

	x700084_CreateBoss1(varMap)
	x700084_CreateMonster(varMap)
end


function x700084_EnterTick(varMap, nowTickCount)




end


function x700084_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, varIndex)
end


function x700084_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

	SetFubenData_Param(varMap, x700084_CSP_AREA_ID, varArea)

	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700084_CSP_BOSS1_ID)
		if BossId ~= -1 then
			return 
		end
		SetFubenData_Param(varMap, x700084_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700084_var_QuestId, x700084_var_FileId)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700084_var_QuestId, x700084_var_FileId)
	end
end


function x700084_ProcAreaLeaved(varMap, varPlayer, varArea, varQuest)
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700084_CSP_AREA_ID, -1)
end




function x700084_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)	


	local varArea = GetFubenData_Param(varMap, x700084_CSP_AREA_ID)
	if varArea == 0 then
		
		local BossId = GetFubenData_Param(varMap, x700084_CSP_BOSS1_ID)
		if BossId ~= -1 then
			return 
		end
		
		local varFlag = GetFubenData_Param(varMap, x700084_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700084_CSP_AREA_FLAG,1)
		
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700084_var_QuestId, x700084_var_FileId)
	
		
	end
end


function x700084_ProcDie(varMap, varPlayer, varKiller)
	local xianjinboss = GetFubenData_Param(varMap, x700084_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700084_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local objId1 = GetFubenData_Param(varMap, x700084_CSP_BOSS1_ID)

	if objId1 == varPlayer then
		SetFubenData_Param(varMap, x700084_CSP_BOSS1_ID, -1)
		x700084_ShowTipsToAll(varMap, "顺利击杀胡沙虎，副本完成。")
		
		x700084_ProcFubenEnd(varMap)
		
		
		LuaCallNoclosure(701116,"ProcSceneBossDie", varMap, 1)
		LuaCallNoclosure(701117,"ProcSceneBossDie", varMap, 1)
	end
end



function x700084_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)

	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		Msg2Player(varMap, humanId, varStr, 8, 3)
	end
end


function x700084_CreateBoss1(varMap)
	local fubentype = GetFubenData_Param(varMap, x700084_CSP_FUBEN_TYPE )
	local varFlag = 1
	if fubentype == 1 then
		varFlag = varFlag + 100
	elseif fubentype == 2 then
		varFlag = varFlag + 200
	end
	
    local fubenlevel = GetFubenData_Param(varMap, x700084_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700084_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700084_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700084_var_FileId,nIndexFrom,varI)
		
		if idScript == x700084_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 1 and varFlag3 == fubentype then
		
			local varRet = 0
			if title ~="" then
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700084_var_FileId, -1, 21,-1,facedir, "",title)
			else
				varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700084_var_FileId, -1, 21,-1,facedir)
			end
			
			SetFubenData_Param(varMap, x700084_CSP_BOSS1_ID, varRet )
        end
	end
end


function x700084_CreateMonster(varMap)
	local fubentype = GetFubenData_Param(varMap, x700084_CSP_FUBEN_TYPE )
	
    local fubenlevel = GetFubenData_Param(varMap, x700084_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700084_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700084_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700084_var_FileId,nIndexFrom,varI)
		if idScript == x700084_var_FileId and levelmin <= fubenlevel and levelmax >= fubenlevel and monsterFlag == 4 and varFlag3 == fubentype then
		
			for j=0,varCount -1 do

				local varRet = 0;
				if title ~="" then
					varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700084_var_FileId, -1, 21,-1,facedir, "",title)
				else
					varRet = CreateMonster(varMap, type, x1, z1, ai, aiscript, x700084_var_FileId, -1, 21,-1,facedir)
				end
			end
        end
	end
end

function x700084_ProcFubenEnd(varMap)
	
		
	x700084_CreateXianJinBoss(varMap)
	x700084_CreateZhanCheBoss(varMap)

	 local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,53 )
	end	
end


function x700084_CreateSubmitNpc( varMap)

	local npc = x700084_var_SubmitNPC
	
	if npc.title~= "" then
		CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir, "", npc.title)
	else
		CreateMonster(varMap, npc.type, npc.varX, npc.z, 3, 0, -1, npc.guid, -1,-1,npc.facedir)
	end
end


function x700084_CreateXianJinBoss(varMap)
	local fubentype = GetFubenData_Param(varMap, x700084_CSP_FUBEN_TYPE )
	if fubentype ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700084_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700084_CSP_FUBENLEVEL )
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700084_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700084_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700084_var_FileId,nIndexFrom,varI)
		if idScript == x700084_var_FileId and monsterFlag == 9 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700084_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700084_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700084_CSP_XIANJINBOSS, varRet )
		end
	end

	x700084_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


function x700084_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700084_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700084_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700084_CSP_FUBENLEVEL)

	if fubenlevel < x700084_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700084_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700084_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700084_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700084_var_FileId,nIndexFrom,varI)
		if idScript == x700084_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end
			
			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700084_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
		x700084_ShowTipsToAll(varMap, "战车独冲之王出现！")
	end
end
