











x700108_CSP_FUBENTYPE				= 	0
x700108_CSP_SCRIPTID				=	1
x700108_CSP_TICKCOUNT				= 	2
x700108_CSP_FROMSCENEID				= 	3
x700108_CSP_ISCLOSING				= 	4
x700108_CSP_LEAVECOUNTDOWN			= 	5
x700108_CSP_TEAMID					=	6
x700108_CSP_TICKTIME				=	7
x700108_CSP_HOLDTIME				=	8
x700108_CSP_FUBENLEVEL				=	9

x700108_CSP_AREA_ID					=	220
x700108_CSP_AREA_FLAG				=	221
x700108_B_CREATE_RANDOMBOSS			=	230
x700108_CSP_RANDOM_BOSS_ID			=	231
x700108_RANDOMBOSS_FLAG				=	232

x700108_CSP_BOSS_ID					=   233
x700108_CSP_ZHANCHE					 = 238
x700108_CSP_XIANJINBOSS				=	239
x700108_CSP_HUMAN_COUNT				=	240
x700108_CSP_PLAYER_ENTER_START		=	241

x700108_CSP_LAST_TICKOUNT			=	247
x700108_CSP_GUID_START				=   248
x700108_CSP_FUBEN_TYPE				=	254	
x700108_CSP_FUBEN_MODE				=   255


x700108_var_FileId 					= 700108
x700108_var_QuestId					= 6608


x700108_var_RandomBossRate			=   1

x700108_var_RandomMonsterRate			=	0.05

                  
x700108_var_Level_Limit  = 70
x700108_var_Rate_Limit  = 50



function x700108_ProcEventEntry(varMap,varPlayer,varTalknpc)

end




function x700108_ProcFubenSceneCreated( varMap )
	 
	for varI = 20,239 do
		SetFubenData_Param(varMap, varI,-1)
	end
	
	x700108_CreateMonster(varMap)
	x700108_CreateBoss(varMap)
	
end
function x700108_EnterTick(varMap, nowTickCount)
end



function x700108_CreateMonster(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700108_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700108_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700108_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700108_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700108_var_FileId,nIndexFrom,varI)
		if idScript == x700108_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
            for j=0,varCount -1 do
            	local varRet = 0
				
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end
				
				
				
				SetPatrolId(varMap, varRet, patrolid)
			end
        end
	end


end

function x700108_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700108_CSP_FUBENLEVEL ) ;

	local nFubenType = GetFubenData_Param(varMap, x700108_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700108_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700108_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700108_var_FileId,nIndexFrom,varI)
		if idScript == x700108_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700108_var_FileId, -1, 21,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700108_var_FileId, -1, 21,-1, facedir)
			
			end

			SetFubenData_Param(varMap, x700108_CSP_BOSS_ID, varRet )
			
			
			SetPatrolId(varMap, varRet, patrolid)
			
        end
	end

end


function x700108_ProcDie(varMap, varPlayer, varKiller)

	local xianjinboss = GetFubenData_Param(varMap, x700108_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700108_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local bossid = GetFubenData_Param(varMap, x700108_CSP_BOSS_ID)
	
	if bossid == varPlayer then
		SetFubenData_Param(varMap, x700108_CSP_BOSS_ID, -1)
		x700108_ProcFubenEnd( varMap)
		x700108_ShowTipsToAll(varMap, "杀死了大友赖泰，副本完成。")
	end
	
end

function x700108_ProcFubenEnd( varMap)
	x700108_CreateXianJinBoss(varMap)
	x700108_CreateZhanCheBoss(varMap)
	local humancount = GetFuben_PlayerCount(varMap);
	for ii = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, ii);
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,62 )
	end	
end






function x700108_EnterTick(varMap, nowTickCount)
end

function x700108_CreateXianJinBoss(varMap)
	
	local nFubenType = GetFubenData_Param(varMap, x700108_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700108_CSP_FUBEN_MODE)
	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700108_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700108_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700108_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700108_var_FileId,nIndexFrom,varI)
		if idScript == x700108_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700108_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700108_var_FileId, -1, 21,-1,facedir)
			end
			
			
			SetPatrolId(varMap, varRet, patrolid)
			SetFubenData_Param(varMap, x700108_CSP_XIANJINBOSS, varRet )
		end
	end

	x700108_ShowTipsToAll(varMap, "翻番宝箱出现！")
end

function x700108_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end


function x700108_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	SetFubenData_Param(varMap, x700108_CSP_AREA_ID, varArea)
	if varArea == 0 then  
		
		local BossId = GetFubenData_Param(varMap, x700108_CSP_BOSS_ID)
		
		if BossId ~= -1 then
			return 
		end
		SetFubenData_Param(varMap, x700108_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700108_var_QuestId, x700108_var_FileId)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700108_var_QuestId, x700108_var_FileId)
	end
end	



function x700108_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700108_CSP_AREA_ID, -1)
end

function x700108_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
	local varArea = GetFubenData_Param(varMap, x700108_CSP_AREA_ID)

	if varArea == 0 then
		local BossId = GetFubenData_Param(varMap, x700108_CSP_BOSS_ID)
		
		if BossId ~= -1 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700108_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700108_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700108_var_QuestId, x700108_var_FileId)
	elseif varArea == 1 then
		
	end
end


function x700108_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700108_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700108_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700108_CSP_FUBENLEVEL)

	if fubenlevel < x700108_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)

	if nRate > x700108_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700108_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700108_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700108_var_FileId,nIndexFrom,varI)
		if idScript == x700108_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2 then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end

			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700108_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700108_ShowTipsToAll(varMap, "战车独冲之王出现！")
	end
end
