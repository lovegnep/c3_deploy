



x303101_var_FileId 					=   303101
x303101_var_GrowPointScriptId       = 	303104


if x303101_TeamInfoA == nil then
x303101_TeamInfoA					= 	{}	
end

if x303101_TeamInfoB == nil then						  
x303101_TeamInfoB					= 	{}
end


if x303101_LevelFlag == nil then
x303101_LevelFlag					= 	{}
end


if x303101_SceneInfo == nil then
x303101_SceneInfo					= 	{}
end



x303101_PlayerLevel					=	
{
{level = 0,  exp = {1500, 500}},
{level = 70, exp = {2700, 900}}, 
{level = 80, exp = {5400, 1800}},
{level = 90, exp = {7000, 2400}}}




x303101_var_SceneMapNavPath			= 	{	{"zhanchang_mshuangrenzhanchang/zhanchang_mshuangrenzhanchang.scn", 1, 1},	
											{"zhanchang_mshuangrenzhanchang/zhanchang_mshuangrenzhanchang.scn", 2, 0},	
											{"zhanchang_mshuangrenzhanchang/zhanchang_mshuangrenzhanchang.scn", 3, 0},	
										}
										
x303101_var_TempImpassable			=	{
											{Left = 89, Top = 71,Right = 168, Bottom = 183, Flag = 1},
										}




x303101_var_EnterScenePos				=	{
											{ {79, 124}, {79, 131}, {176, 124}, {176, 132} },	
											{ {27, 106}, {23, 107}, {101,107}, {104,107} },
											{ {31, 102}, {27, 99}, {93, 28}, {98, 29} },
										}

x303101_var_CloseTick					= 	10														
x303101_var_LimitTotalHoldTime		=	4 * 60													
x303101_var_Kick_Down					=	4														
x303101_var_GameId					=	1221													




x303101_var_CampFlag					= 	{5, 6}												




x303101_var_Winner_Bonus_Level		= 	1				
x303101_var_Winner_Bonus_Mark			= 	30
x303101_var_Loser_Bonus_Level			= 	1				
x303101_var_Loser_Bonus_Mark			= 	7
x303101_var_Other_Bonus_Mark			= 	7




x303101_var_State_Invalid				= 	-1
x303101_var_State_Signup				=  	100 		-- 2011-2-27 by rj 值发生变化，与程序保持统一
x303101_var_State_SignupFinished		=  	101
x303101_var_State_Begin					=  	102
x303101_var_State_End					=  	103
x303101_var_CurrentState				= 	{}




x303101_var_RandBuf_40				= 	{30000, 30010, 30020, 30030, 30040, 30050, 30060}
x303101_var_RandBuf_50				= 	{30001, 30011, 30021, 30031, 30041, 30051, 30061}
x303101_var_RandBuf_60				= 	{30002, 30012, 30022, 30032, 30042, 30052, 30062}
x303101_var_RandBuf_70				= 	{30003, 30013, 30023, 30033, 30043, 30053, 30063}
x303101_var_RandBuf_80				= 	{30004, 30014, 30024, 30034, 30044, 30054, 30064}
x303101_var_RandBuf_90				= 	{30005, 30015, 30025, 30035, 30045, 30055, 30065}
x303101_var_RandBuf_100				= 	{30006, 30016, 30026, 30036, 30046, 30056, 30066}




x303101_var_Award_ItemID				= 	12266663		
x888888_var_AwardGetBufList			= 	{9011,9012,9013}	
x303101_var_Award_LevelInfo			=  					
{ 
{minlevel = 40, maxlevel = 49, win = 1, lose = 0, normal = 0}, 
{minlevel = 50, maxlevel = 59, win = 1, lose = 0, normal = 0}, 
{minlevel = 60, maxlevel = 69, win = 2, lose = 0, normal = 0}, 
{minlevel = 70, maxlevel = 79, win = 2, lose = 0, normal = 0}, 
{minlevel = 80, maxlevel = 89, win = 3, lose = 0, normal = 0}, 
{minlevel = 90, maxlevel = 99, win = 3, lose = 0, normal = 0}, 
{minlevel = 100, maxlevel = 160, win = 3, lose = 0, normal = 0}, 
}




x303101_var_GrowPoint_RefreshInterval	= 	20				
x303101_var_GrowPoint_TimerTbl		= 	{}				




x303101_var_BattleHonour_WinVal		= 	40				
x303101_var_BattleHonour_NormalVal	= 	10				
x303101_var_BattleHonour_LoseVal		= 	10				

function x303101_GiveTrainAwardTeamA(varMap, varPlayer, nBonusType)

	local nlevel = GetLevel( varMap,varPlayer )
	local exp = 0
	local name = GetName(varMap, varPlayer)
	if name == nil then
		name = "Error "
	end

	if nBonusType == -1 or nBonusType == 1 then
    	for i, item in x303101_PlayerLevel do
    		if nlevel > item.level then
    			exp = nlevel * item.exp[2]
    		end			
    	end	
    	AddExp(varMap, varPlayer, exp)
    	LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点经验", exp), name, 2, 1)
    	
	elseif nBonusType == 0 then
    	for i, item in x303101_PlayerLevel do
    		if nlevel > item.level then
    			exp = nlevel * item.exp[1]
    		end			
    	end	
    	AddExp(varMap, varPlayer, exp)
    	LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点经验", exp), name, 2, 1)	
	end	
end

function x303101_GiveTrainAwardTeamB(varMap, varPlayer, nBonusType)

	local nlevel = GetLevel( varMap,varPlayer )
	local exp = 0
	local name = GetName(varMap, varPlayer)
	if name == nil then
		name = "Error "
	end

	if nBonusType == -1 or nBonusType == 0 then
    	for i, item in x303101_PlayerLevel do
    		if nlevel > item.level then
    			exp = nlevel * item.exp[2]
    		end			
    	end	
    	AddExp(varMap, varPlayer, exp)
    	LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点经验", exp), name, 2, 1)
    	
	elseif nBonusType == 1 then
    	for i, item in x303101_PlayerLevel do
    		if nlevel > item.level then
    			exp = nlevel * item.exp[1]
    		end			
    	end	
    	AddExp(varMap, varPlayer, exp)
    	LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点经验", exp), name, 2, 1)	
	end		
end

function x303101_GiveRawAwardTeamA(varMap, varPlayer, nBonusType)

	local name = GetName(varMap, varPlayer)
	if name == nil then
		name = "Error "
	end
	
	if nBonusType == -1 then
		
		LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点战场积分", x303101_var_Other_Bonus_Mark), name, 2, 1)
		x303101_AddPVP2V2Level(varMap, varPlayer, 0)
		AddPVP2V2Mark(varMap, varPlayer, x303101_var_Other_Bonus_Mark)
		x303101_AddItem(varMap, varPlayer, x303101_var_Award_ItemID, 0)
		LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303101_var_BattleHonour_NormalVal)
		
	elseif nBonusType == 0 then			
		
		if x303101_LevelFlag[varMap] == 1 then
			LuaScenceM2Player(varMap, varPlayer, "#G战场等级相差悬殊（20级以上），无法获得战场等级！", name, 2, 1)
		else
			LuaScenceM2Player(varMap, varPlayer, format("#G战场等级+%d", x303101_var_Winner_Bonus_Level), name, 2, 1)
			x303101_AddPVP2V2Level(varMap, varPlayer, x303101_var_Winner_Bonus_Level)
		end

		LuaScenceM2Player( varMap,varPlayer,format("#G获得#R%d#G点战场积分",x303101_var_Winner_Bonus_Mark),name,2,1)
		AddPVP2V2Mark(varMap,varPlayer,x303101_var_Winner_Bonus_Mark)	
		x303101_AddItem(varMap, varPlayer, x303101_var_Award_ItemID, 1)
		LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303101_var_BattleHonour_WinVal)
												
	elseif nBonusType == 1 then
		
		LuaScenceM2Player(varMap, varPlayer, format("#G战场等级-%d", x303101_var_Loser_Bonus_Level), name, 2, 1)
		LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点战场积分", x303101_var_Loser_Bonus_Mark) ,name, 2, 1)	
		x303101_SubPVP2V2Level(varMap, varPlayer, x303101_var_Loser_Bonus_Level)
		AddPVP2V2Mark(varMap, varPlayer, x303101_var_Loser_Bonus_Mark)
		x303101_AddItem(varMap, varPlayer, x303101_var_Award_ItemID, 2)
		LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303101_var_BattleHonour_LoseVal)
	end
end

function x303101_GiveRawAwardTeamB(varMap, varPlayer, nBonusType)

	local name = GetName(varMap, varPlayer)
	if name == nil then
		name = "Error "
	end
	
	if nBonusType == -1 then
		
		LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点战场积分", x303101_var_Other_Bonus_Mark), name, 2, 1)
		x303101_AddPVP2V2Level(varMap, varPlayer, 0)
		AddPVP2V2Mark(varMap, varPlayer, x303101_var_Other_Bonus_Mark)
		x303101_AddItem(varMap, varPlayer, x303101_var_Award_ItemID, 0)
		LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303101_var_BattleHonour_NormalVal)
		
	elseif nBonusType == 0 then
		
		LuaScenceM2Player(varMap, varPlayer, format("#G战场等级-%d", x303101_var_Loser_Bonus_Level), name, 2, 1)
		LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点战场积分", x303101_var_Loser_Bonus_Mark), name, 2, 1)
		x303101_SubPVP2V2Level(varMap, varPlayer, x303101_var_Loser_Bonus_Level)
		AddPVP2V2Mark(varMap, varPlayer, x303101_var_Loser_Bonus_Mark)
		x303101_AddItem(varMap, varPlayer, x303101_var_Award_ItemID, 2)
		LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303101_var_BattleHonour_LoseVal)
		
	elseif nBonusType == 1 then					

		if x303101_LevelFlag[varMap] == 2 then
			LuaScenceM2Player(varMap, varPlayer,"#G战场等级相差悬殊（20级以上），无法获得战场等级！", name, 2, 1)
		else
			LuaScenceM2Player(varMap, varPlayer,format("#G战场等级+%d", x303101_var_Winner_Bonus_Level), name, 2, 1)
			x303101_AddPVP2V2Level(varMap, varPlayer, x303101_var_Winner_Bonus_Level)
		end
		
		LuaScenceM2Player(varMap, varPlayer, format("#G获得#R%d#G点战场积分", x303101_var_Winner_Bonus_Mark), name, 2, 1)
		AddPVP2V2Mark(varMap, varPlayer, x303101_var_Winner_Bonus_Mark)	
		x303101_AddItem(varMap, varPlayer, x303101_var_Award_ItemID, 1)
		LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303101_var_BattleHonour_WinVal)
	end
end

function x303101_ProcMapCreate(varMap)
	
	
	x303101_TeamInfoA[varMap]			= {	
											{GUID = -1, DIE = 0, ENTER = 0,LEAVE = 0 },
											{GUID = -1, DIE = 0, ENTER = 0,LEAVE = 0 }
										  }
	
	
	x303101_TeamInfoB[varMap]			= {	
											{GUID = -1, DIE = 0, ENTER = 0, LEAVE = 0 },
											{GUID = -1, DIE = 0, ENTER = 0, LEAVE = 0 }
										  }

	
	x303101_LevelFlag[varMap]			= 0
	

	x303101_SceneInfo[varMap]			= {
											TICKCOUNT = 0,
											ISCLOSING = 0,
											LEAVECOUNTDOWN = 0,
											RESULT = 0,
											LIMITHOLDTIME = 5 * 60,
										  }
										  
	x303101_var_CurrentState[varMap]		= x303101_var_State_Invalid
	x303101_var_GrowPoint_TimerTbl[varMap] = 0
	


end




function x303101_AddItem(varMap, varPlayer, nItemID, nType)

	local nItemNum = 0
	local nPlayerLevel = GetLevel(varMap, varPlayer)
	
	
    for varI, item in x303101_var_Award_LevelInfo do
        if nPlayerLevel >= item.minlevel and nPlayerLevel <= item.maxlevel then
            if nType == 0 then
            	nItemNum = item.normal
            elseif nType == 1 then
            	nItemNum = item.win
            elseif nType == 2 then
            	nItemNum = item.lose
            end
        end
    end
    
	if nItemNum > 0 then
	
		
		local bHaveBuf = 0
		for varI, item in x888888_var_AwardGetBufList do
			if IsHaveSpecificImpact(varMap, varPlayer, item) > 0 then
				bHaveBuf = 1
				break
			end
		end
		
		StartItemTask(varMap)

		if bHaveBuf == 1 then
			ItemAppend(varMap, nItemID, nItemNum)
		else
            ItemAppendBind(varMap, nItemID, nItemNum)
		end
		
		if StopItemTask(varMap, varPlayer) > 0 then
			DeliverItemListSendToPlayer(varMap, varPlayer)
	 		WriteLog(1, format("MPVPBATTLE:x303101_AddItem 1 varMap=%d PlayerSNID=%X varParam1=%u varParam2=%d varParam3=%d", 
	 			varMap, GetGUID(varMap, varPlayer), nItemID, nItemNum, nType))
		else
			Msg2Player(varMap, varPlayer, "背包已满，无法获得奖励物品", 8, 3)
			Msg2Player(varMap, varPlayer, "背包已满，无法获得奖励物品", 8, 2)
	 		WriteLog(1, format("MPVPBATTLE:x303101_AddItem 2 varMap=%d PlayerSNID=%X varParam1=%u varParam2=%d varParam3=%d", 
	 			varMap, GetGUID(varMap, varPlayer), nItemID, nItemNum, nType))
		end
	end
end




function x303101_GetBattleSceneType(varMap)

    local varName = GetBattleSceneName(varMap)
    for varI, item in x303101_var_SceneMapNavPath do
        if varName == item[1] then
            return item[2]
        end
    end
    return -1
end




function x303101_IsBattleSceneValid(varMap)

    local varName = GetBattleSceneName(varMap)
    for varI, item in x303101_var_SceneMapNavPath do
        if varName == item[1] then
            return item[3]
        end
    end
    return 0
end





function x303101_ProcMBattleState(varMap, varState)

	-- 2011-2-17 by rj 删除报名场景状态变更处理

	local varMapType = GetSceneType(varMap)
	if varMapType == 7 then
		x303101_ProcBattleState_BattleScene(varMap, varState)
	end
end




function x303101_ProcBattleState_BattleScene(varMap, varState)

	
    if  x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end

    if varState == x303101_var_State_Signup then
    	
    	
    	if x303101_var_CurrentState[varMap] == x303101_var_State_Begin then
    		return
    	end
    	
        if x303101_var_CurrentState[varMap] ~= x303101_var_State_Signup then
            WriteLog(1, format("MPVPBATTLE:x303101_var_State_Signup, varMap=%d", varMap))
        end
        
        
        x303101_var_CurrentState[varMap] = x303101_var_State_Signup
        MPVP2v2RegisterScene(varMap)
        
    elseif varState == x303101_var_State_Begin then

        if x303101_var_CurrentState[varMap] ~= x303101_var_State_Begin then
            WriteLog(1, format("MPVPBATTLE:x303101_var_State_Begin, varMap=%d", varMap))
        end

        
        x303101_var_CurrentState[varMap] = x303101_var_State_Begin
        x303101_ProcBattleSceneReady(varMap, x303101_var_LimitTotalHoldTime)

    elseif varState == x303101_var_State_End then

		
        if x303101_var_CurrentState[varMap] > x303101_var_State_Begin or x303101_var_CurrentState[varMap] < x303101_var_State_Signup then
            
            WriteLog(1, format("MPVPBATTLE:x303101_var_State_End,Result:nState > x303101_var_State_Begin or nState < x303101_var_State_Signup varMap=%d, varState=%d", 
            	varMap, x303101_var_CurrentState[varMap]))

            x303101_ProcBattleSceneClose(varMap, 0)
            WriteLog(1, format("MPVPBATTLE:x303101_var_State_End, varMap=%d", varMap))
            return
        end

        
		x303101_var_CurrentState[varMap] = x303101_var_State_End
        x303101_ProcBattleSceneClose(varMap, 1)

        WriteLog(1, format("MPVPBATTLE:x303101_var_State_End, varMap=%d", varMap))
    end
end








function x303101_ProcMBattleMatchInfo(varMap, leaderguid1, otherguid1, leaderguid2, otherguid2, nLevelFlag)
	
	
	x303101_TeamInfoA[varMap]			= {	
											{GUID = leaderguid1, DIE = 0, ENTER = 0, LEAVE = 0},
											{GUID = otherguid1, DIE = 0, ENTER = 0, LEAVE = 0},
										  }

	
	x303101_TeamInfoB[varMap]			= {	
											{GUID = leaderguid2, DIE = 0, ENTER = 0, LEAVE = 0},
											{GUID = otherguid2, DIE = 0, ENTER = 0, LEAVE = 0},
										  }
										  
	
	x303101_LevelFlag[varMap]			= nLevelFlag
	
	
	LuaCallNoclosure(x303101_var_GrowPointScriptId, "ProcInit", varMap)
	
	x303101_var_GrowPoint_TimerTbl[varMap] = 0
end




function x303101_GetPlayerTeamIndex(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	
	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return 0
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return 0
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return 1
	end
	
	return -1
end




function x303101_GetPlayerPos(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)
	local varIndex = x303101_GetBattleSceneType(varMap)
	
	
	if varIndex < 1 or varIndex > getn(x303101_var_EnterScenePos) then
		return 100, 100
	end
	
	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		local varX = x303101_var_EnterScenePos[varIndex][1][1]
		local z = x303101_var_EnterScenePos[varIndex][1][2]
		return varX, z
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		local varX = x303101_var_EnterScenePos[varIndex][2][1]
		local z = x303101_var_EnterScenePos[varIndex][2][2]
		return varX, z
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		local varX = x303101_var_EnterScenePos[varIndex][3][1]
		local z = x303101_var_EnterScenePos[varIndex][3][2]
		return varX, z
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		local varX = x303101_var_EnterScenePos[varIndex][4][1]
		local z = x303101_var_EnterScenePos[varIndex][4][2]
		return varX, z
	end
	
	return 100,100
end





function x303101_ProcPlayerEnter(varMap, varPlayer)

	
    if x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end
	
	
    local scenePre = GetPlayerRuntimeData(varMap,varPlayer, RD_HUMAN_SCENE_PRE) - 1
    if scenePre >= 0 then
    
        
        local CurX = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE)
        SetPlayerBakSceneInfo(varMap, varPlayer, scenePre, CurX, CurZ)
        
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE, 0)
    end
    
	
	if x303101_SceneInfo[varMap].ISCLOSING > 0 then
		
		
		x303101_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerEnterFinished kick 0 varMap=%d ", varMap))
		return
	end
	
	
	if x303101_CheckPlayerValid(varMap, varPlayer) == 0 then
		x303101_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerEnterFinished kick 1 varMap=%d ", varMap))
		return
	end
	
	
	if x303101_GetPlayerDieFlag(varMap, varPlayer) == 1 then
		x303101_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerEnterFinished kick 2 varMap=%d ", varMap))		
		return
	end
	
	
	if x303101_GetPlayerEnterSceneFlag(varMap, varPlayer) == 1 then
		x303101_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerEnterFinished kick 3 varMap=%d ", varMap))
		return
	end
	
	
	local nTeamIndex = x303101_GetPlayerTeamIndex(varMap, varPlayer)
	if nTeamIndex < 0 or nTeamIndex > 1 then
		x303101_SetPlayerNeedKick(varMap, varPlayer)
		WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerEnterFinished kick 4 varMap=%d ", varMap))
		return
	end
	
	
	SetCurCamp(varMap, varPlayer, x303101_var_CampFlag[nTeamIndex + 1])

	
	local varX, z = x303101_GetPlayerPos(varMap, varPlayer)
	SetPos(varMap, varPlayer, varX, z)
	
	WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerEnterFinished playerEnter varMap=%d varX = %d, z = %d varFlag = %d varName=%s", 
		varMap, varX, z, nTeamIndex, GetName(varMap, varPlayer)))
	
	
	x303101_SetPlayerEnterSceneFlag(varMap, varPlayer)
	
	
	SetMPVP2v2BattleDisable(varMap, varPlayer, 0, nTeamIndex)
	
	
	if x303101_SceneInfo[varMap].TICKCOUNT < 31 then
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientMapColor", varMap, varPlayer, 0, 0)
	end
	
	
	
	
	
	
	
		
	
		
	
		
	
		
	
		
	
		
	
		
	
	
	
	
		
		
		
		
		
		
			
			
			
			
			
		
	
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,0)
end




function x303101_ProcPlayerLeave(varMap, varPlayer)

	local nDebug = 1
	
	if nDebug == 1 then
        WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerLeave 0 varMap=%d Name=%s 2v2 LevelPre = %d", varMap, GetName(varMap,varPlayer), GetPVP2V2Level(varMap,varPlayer)))
	end

	
    if  x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end
	
	
	if x303101_SceneInfo[varMap].ISCLOSING > 0 then
		return
	end

	if x303101_GetPlayerLeaveSceneFlag(varMap, varPlayer) == 0 then
		
		x303101_SetPlayerLeaveSceneFlag(varMap, varPlayer)
		
		local n2v2LevelPre = GetPVP2V2Level(varMap, varPlayer)
		
		
		x303101_SubPVP2V2Level(varMap, varPlayer, x303101_var_Loser_Bonus_Level)
		
		local n2v2LevelAfter = GetPVP2V2Level(varMap,varPlayer)

        WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerLeave 1 varMap=%d Name=%s 2v2LevelPre = %d 2v2LevelAfter=%d", 
        	varMap, GetName(varMap, varPlayer), n2v2LevelPre, n2v2LevelAfter))
	end	
end




function x303101_ProcMapTimerTick(varMap, nowTime)

	
    if  x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end

	x303101_UpdatePlayerKickState(varMap)

	
	if x303101_SceneInfo[varMap].ISCLOSING > 0 then

		local leaveCountDown = x303101_SceneInfo[varMap].LEAVECOUNTDOWN + 1
		x303101_SceneInfo[varMap].LEAVECOUNTDOWN = leaveCountDown
		
		if leaveCountDown >= x303101_var_CloseTick then
		
			
			local humanCount = GetScenePlayerCount(varMap)
			for	varI = 0, humanCount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI)
                TimerCommand(varMap, humanId, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303101_var_FileId, -1, -1)	

                
                x303101_SetPlayerNeedKick(varMap, humanId)
                WriteLog(1, format("MPVPBATTLE:x303101_ProcMapTimerTick kick 1 varMap=%d ", varMap))
			end
		elseif leaveCountDown < x303101_var_CloseTick then  
		
			
			local humanCount = GetScenePlayerCount(varMap)
			for	varI = 0, humanCount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI)
  				Msg2Player(varMap, humanId, format("本场战斗将在%d秒后关闭", x303101_var_CloseTick - leaveCountDown), 8, 3)
			end			
		end
	else
		if x303101_var_CurrentState[varMap] ~= x303101_var_State_Begin then
			return
		end
		
		local nowTickCount = x303101_SceneInfo[varMap].TICKCOUNT + 1;
		x303101_SceneInfo[varMap].TICKCOUNT = nowTickCount
		
		
		if nowTickCount == 31 then
			x303101_ClearTempImpassable(varMap)
		end
			
		
		x303101_var_GrowPoint_TimerTbl[varMap] = x303101_var_GrowPoint_TimerTbl[varMap] + 1
		if mod(x303101_var_GrowPoint_TimerTbl[varMap], x303101_var_GrowPoint_RefreshInterval) == 0 then
			if GetScenePlayerCount(varMap) ~= 0 then
				LuaCallNoclosure(x303101_var_GrowPointScriptId, "ProcTimeMakeGrowPoint", varMap)
			end
		end
		
		
		if nowTickCount >= 60 then
			if x303101_CheckBattleFinished(varMap) == 1 then
				x303101_ProcBattleSceneClose(varMap, 2)			
                WriteLog(1, format("MPVPBATTLE:x303101_ProcMapTimerTick varMap=%d,nowTickCount=%d 000", varMap, nowTickCount))
			end
		end

		
		if nowTickCount >= x303101_var_LimitTotalHoldTime then
			local humanCount = GetScenePlayerCount(varMap)
			for varI = 0, humanCount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI)
  				Msg2Player(varMap, humanId, format("本场战斗时间已到，将于%d秒后关闭！", x303101_var_CloseTick), 8, 3)
			end
			
            x303101_ProcBattleSceneClose(varMap, 3)
            WriteLog(1, format("MPVPBATTLE:x303101_ProcMapTimerTick varMap=%d, nowTickCount=%d 001", varMap, nowTickCount))
		end
	end
end




function x303101_ProcPlayerDie(varMap, varPlayer, varKiller)	
	
	
    if  x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end
    
	x303101_SetPlayerDieFlag(varMap, varPlayer)
	
	
	if x303101_CheckBattleFinished(varMap) == 1 then
		x303101_ProcBattleSceneClose(varMap, 4)	
        WriteLog(1, format("MPVPBATTLE:x303101_ProcPlayerDie varMap=%d  002", varMap))
	end
end




function x303101_ProcPlayerRelive(varMap, varPlayer, varReliveOp)
	
	
    if  x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end

	
	if x303101_SceneInfo[varMap].ISCLOSING > 0 then
		return
	end
	
  	Msg2Player(varMap, varPlayer, "跨服双人战场比赛结束之前不能复活，请耐心等待！", 8, 3)
end




function x303101_DoPlayerRelive(varMap, varPlayer, value)

	
	local nHp = GetHp(varMap, varPlayer)
	if nHp <= 0 then
	
		ClearRageRecoverTick(varMap, varPlayer)
		RestoreHp(varMap, varPlayer, value)
		RestoreRage(varMap, varPlayer, value)
		ClearMutexState(varMap, varPlayer, 6)
		SendReliveResult(varMap, varPlayer,1)
	end
	
	
	LastMount(varMap, varPlayer)
	RestoreHp(varMap, varPlayer, 0)
end




function x303101_KickPlayer(varMap, varPlayer)
	
	

	
    x303101_DoPlayerRelive(varMap, varPlayer, 100)
    x303101_RestorePlayerCamp(varMap, varPlayer)
    SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, 0)
    
    
    SetMPVP2v2BattleDisable(varMap, varPlayer, 1, 0)

	
	LuaCallNoclosure(x303101_var_GrowPointScriptId, "RecyclePlayerAllBuf", varMap, varPlayer)	
	


















	



    
    
    LuaCallNoclosure(800123, "RecycleAllBuff", varMap, varPlayer)
	
	
    
    local nBakSceneId, varX, z = GetPlayerBakSceneInfo(varMap, varPlayer)
    
    -- 如果后退场景为当前战场场景表示以前版本情况下在报名场景下线的用户, 定位回大都
    if varMap == nBakSceneId then
        NewWorld(varMap, varPlayer, 0, 100, 100, x303101_var_FileId)
        return
    end
    
    if nBakSceneId >= 0 then
        NewWorld(varMap, varPlayer, nBakSceneId, varX, z, x303101_var_FileId)
        return
    end

    
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        NewWorld(varMap, varPlayer, 50, 123, 57, x303101_var_FileId)
    elseif varCountry == 1 then
        NewWorld(varMap, varPlayer, 150, 123, 57, x303101_var_FileId)
    elseif varCountry == 2 then
        NewWorld(varMap, varPlayer, 250, 123, 57, x303101_var_FileId)
    elseif varCountry == 3 then
        NewWorld(varMap, varPlayer, 350, 123, 57, x303101_var_FileId)
    end
end




function x303101_RestorePlayerCamp(varMap,varPlayer)
    SetCurCamp(varMap, varPlayer, GetCurCountry(varMap, varPlayer))
end




function x303101_SyncBattleTimeToAllPlayer(varMap, nTime)
	
	
	local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            TimerCommand(varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303101_var_FileId, -1, -1)
            if nTime > 0 then
                TimerCommand(varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303101_var_FileId, nTime, nTime)
            end
        end
    end
end




function x303101_ProcMSyncBattleTime(varMap, nTime)
    
    
    if  x303101_GetBattleSceneType(varMap) <= 0 then
        return
    end
    
    
    if x303101_IsBattleSceneValid(varMap) ~= 1 then
    	return	
    end
    
	
    x303101_SceneInfo[varMap].TICKCOUNT = NumberCastIntToUInt(nTime)
    local DownTickCount = x303101_var_LimitTotalHoldTime - NumberCastIntToUInt(nTime)
    x303101_SyncBattleTimeToAllPlayer(varMap, DownTickCount)
end




function x303101_CheckBattleFinished(varMap)

	
	if  x303101_CheckTeamA_AllLeave(varMap) == 1 or x303101_CheckTeamB_AllLeave(varMap) == 1 then
		return 1
	end
	
	
	if x303101_CheckTeamA_AllDie(varMap) == 1 or x303101_CheckTeamB_AllDie(varMap) == 1 then
		return 1
	end
	
	
	if x303101_CheckTeamA_Live(varMap) == 0 or x303101_CheckTeamB_Live(varMap) == 0 then
		return 1
	end
		
	return 0
end




function x303101_GiveBattleBonus(varMap, nResult)

	if nResult == -1 then
		LuaThisScenceM2Wrold(varMap, "平局", 5, 1)
		x303101_ProcGiveTeamA(varMap, -1)
		x303101_ProcGiveTeamB(varMap, -1)
	elseif nResult == 0 then
		 LuaThisScenceM2Wrold(varMap, "蓝方获胜", 5, 1)		
		x303101_ProcGiveTeamA(varMap, 0)
		x303101_ProcGiveTeamB(varMap, 0)
	elseif nResult == 1 then
		 LuaThisScenceM2Wrold(varMap, "红方获胜", 5, 1)
		x303101_ProcGiveTeamA(varMap, 1)
		x303101_ProcGiveTeamB(varMap, 1)
	end

	
end




function x303101_ProcGiveTeamA(varMap, nBonusType)
		
	local minOfDay = GetMinOfDay()
	local humanCount = GetScenePlayerCount(varMap)
	local weekIdx = GetWeek()
	
	for	i = 0, humanCount - 1 do
		
		local humanId = GetScenePlayerObjId(varMap, i)
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, humanId, 1,1)
		LuaCallNoclosure(888895,"EventActivity",varMap, humanId,10)
		if IsPlayerStateNormal(varMap, humanId) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)

			local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
			if GUID == p then	
				if minOfDay >= 530 and minOfDay < 970 then
					if weekIdx == 1 or weekIdx == 2 or weekIdx == 3 or weekIdx == 4 or weekIdx == 5 then
						x303101_GiveTrainAwardTeamA(varMap, humanId, nBonusType)
					else
						x303101_GiveRawAwardTeamA(varMap, humanId, nBonusType)
					end
				else
					x303101_GiveRawAwardTeamA(varMap, humanId, nBonusType)
				end
			end
			
			p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
			if GUID == p then				
				if minOfDay >= 530 and minOfDay < 970 then
					if weekIdx == 1 or weekIdx == 2 or weekIdx == 3 or weekIdx == 4 or weekIdx == 5 then
						x303101_GiveTrainAwardTeamA(varMap, humanId, nBonusType)
					else
						x303101_GiveRawAwardTeamA(varMap, humanId, nBonusType)
					end
				else
					x303101_GiveRawAwardTeamA(varMap, humanId, nBonusType)
				end
			end			
		end
	end
end




function x303101_ProcGiveTeamB( varMap, nBonusType )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local humanCount = GetScenePlayerCount(varMap)

	for	i = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, i)
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)

			local p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
			if GUID == p then												
				if minOfDay >= 530 and minOfDay < 970 then
					if weekIdx == 1 or weekIdx == 2 or weekIdx == 3 or weekIdx == 4 or weekIdx == 5 then
						x303101_GiveTrainAwardTeamB(varMap, humanId, nBonusType)
					else
						x303101_GiveRawAwardTeamB(varMap, humanId, nBonusType)
					end
				else
					x303101_GiveRawAwardTeamB(varMap, humanId, nBonusType)
				end
			end
			p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				if minOfDay >= 530 and minOfDay < 970 then
					if weekIdx == 1 or weekIdx == 2 or weekIdx == 3 or weekIdx == 4 or weekIdx == 5 then
						x303101_GiveTrainAwardTeamB(varMap, humanId, nBonusType)
					else
						x303101_GiveRawAwardTeamB(varMap, humanId, nBonusType)
					end
				else
					x303101_GiveRawAwardTeamB(varMap, humanId, nBonusType)
				end
			end			
		end
	end
end




function x303101_GenBattleResult(varMap)

	
	if x303101_SceneInfo[varMap].ISCLOSING == 1 then
		return
	end
	
	local nResult = -1 

	
	
	
	
	
	if  x303101_CheckTeamA_AllLeave(varMap) == 0 and x303101_CheckTeamB_AllLeave(varMap) == 1 then
		nResult = 0
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	
	if  x303101_CheckTeamA_AllLeave(varMap) == 1 and x303101_CheckTeamB_AllLeave(varMap) == 0 then
		nResult = 1
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	
	
	
	
	
	if x303101_CheckTeamA_AllDie(varMap) == 0 and x303101_CheckTeamB_AllDie(varMap) == 1 then
		nResult = 0
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	
	if x303101_CheckTeamA_AllDie(varMap) == 1 and x303101_CheckTeamB_AllDie(varMap) == 0 then
		nResult = 1
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	
	
	
	if x303101_CheckTeamA_Live(varMap) == 1 and x303101_CheckTeamB_Live(varMap) == 0 then
		nResult = 0
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	if x303101_CheckTeamA_Live(varMap) == 0 and x303101_CheckTeamB_Live(varMap) == 1 then
		nResult = 1
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	
	
	
	if x303101_GetTeamA_LiveCount(varMap) > x303101_GetTeamB_LiveCount(varMap)  then
		nResult = 0
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
	
	if x303101_GetTeamA_LiveCount(varMap) < x303101_GetTeamB_LiveCount(varMap)  then
		nResult = 1
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end	
	
	
	
	
	
	
	if  x303101_CheckTeamA_AllLeave(varMap) == 0 and x303101_CheckTeamB_AllLeave(varMap) == 0 then
		nResult = -1
		x303101_GiveBattleBonus(varMap, nResult)
		return
	end
		
end





function x303101_CheckTeamA_AllLeave(varMap)

	local humanCount = GetScenePlayerCount(varMap)
	for	varI = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI)
		if IsPlayerStateNormal(varMap, humanId) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)
			
			
			local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
			if GUID == p then
				return 0
			end
			
			
			p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				return 0
			end
		end
	end
	
	return 1
end




function x303101_CheckTeamB_AllLeave( varMap )
	
	local humanCount = GetScenePlayerCount(varMap)
	for	varI = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI)
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)

			
			local p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				return 0
			end
			
			
			p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				return 0
			end
		end
	end
	
	return 1
	
end





function x303101_CheckTeamA_AllDie(varMap)
	
	
	
	local varCount = 0
	if x303101_TeamInfoA[varMap][1].DIE == 1 then
		varCount = varCount + 1
	end
	
	if x303101_TeamInfoA[varMap][2].DIE == 1 then
		varCount = varCount + 1
	end
	
	
	if varCount == 2 then
		return 1
	end
	
	return 0
end




function x303101_CheckTeamA_Live(varMap)
	
	
	local nLiveCount = 0
	local humanCount = GetScenePlayerCount(varMap)
	
	for	varI = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI)
		if IsPlayerStateNormal(varMap, humanId) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)

			
			local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
			if GUID == p then
				if x303101_TeamInfoA[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end

			
			p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				if x303101_TeamInfoA[varMap][2].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
		end
	end

	if nLiveCount == 0 then
		return 0				
	end

	return 1
end




function x303101_CheckTeamB_Live(varMap)
	
	
	local nLiveCount = 0
	local humanCount = GetScenePlayerCount(varMap);
	
	for	varI = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI)
		if IsPlayerStateNormal(varMap, humanId) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)
			
			
			local p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				if x303101_TeamInfoB[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				if x303101_TeamInfoB[varMap][2].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
		end
	end
	
	if nLiveCount == 0 then
		return 0				
	end
	
	return 1
end




function x303101_GetTeamA_LiveCount(varMap)
	
	
	local nLiveCount = 0
	local humanCount = GetScenePlayerCount(varMap)
	
	for	varI = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI)
		if IsPlayerStateNormal(varMap, humanId) == 1 then
			
			local GUID = GetPlayerGUID(varMap, humanId)
			
			
			local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
			if GUID == p then
				if x303101_TeamInfoA[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				if x303101_TeamInfoA[varMap][2].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
		end
	end
	
	return nLiveCount
end




function x303101_GetTeamB_LiveCount(varMap)
	
	
	local nLiveCount = 0
	local humanCount = GetScenePlayerCount(varMap)
	
	for	varI = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI)
		if IsPlayerStateNormal(varMap, humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				if x303101_TeamInfoB[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				if x303101_TeamInfoB[varMap][2].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
		end
	end
	
	return nLiveCount
end






function x303101_CheckTeamB_AllDie(varMap)
	
	
	
	local varCount = 0
	if x303101_TeamInfoB[varMap][1].DIE == 1 then
		varCount = varCount + 1
	end
	
	if x303101_TeamInfoB[varMap][2].DIE == 1 then
		varCount = varCount + 1
	end
	
	
	if varCount == 2 then
		return 1
	end
	
	return 0
end





function x303101_CheckPlayerValid(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return 1
	end
	
	return 0
end




function x303101_GetPlayerDieFlag(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return x303101_TeamInfoA[varMap][1].DIE;
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return x303101_TeamInfoA[varMap][2].DIE;
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return x303101_TeamInfoB[varMap][1].DIE;
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return x303101_TeamInfoB[varMap][2].DIE;
	end
	
	return 1
end




function x303101_SetPlayerDieFlag(varMap, varPlayer)

	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		x303101_TeamInfoA[varMap][1].DIE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		x303101_TeamInfoA[varMap][2].DIE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		x303101_TeamInfoB[varMap][1].DIE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		x303101_TeamInfoB[varMap][2].DIE = 1
		return
	end
end




function x303101_GetPlayerEnterSceneFlag(varMap, varPlayer)

	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return x303101_TeamInfoA[varMap][1].ENTER
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return x303101_TeamInfoA[varMap][2].ENTER
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return x303101_TeamInfoB[varMap][1].ENTER
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return x303101_TeamInfoB[varMap][2].ENTER
	end
	
	return 1
end




function x303101_SetPlayerEnterSceneFlag(varMap, varPlayer)

	
	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		x303101_TeamInfoA[varMap][1].ENTER = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		x303101_TeamInfoA[varMap][2].ENTER = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		x303101_TeamInfoB[varMap][1].ENTER = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		x303101_TeamInfoB[varMap][2].ENTER = 1
		return
	end
end




function x303101_GetPlayerLeaveSceneFlag(varMap, varPlayer)

	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return x303101_TeamInfoA[varMap][1].LEAVE
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return x303101_TeamInfoA[varMap][2].LEAVE
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return x303101_TeamInfoB[varMap][1].LEAVE
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return x303101_TeamInfoB[varMap][2].LEAVE
	end
	
	return 1
end




function x303101_SetPlayerLeaveSceneFlag(varMap, varPlayer)

	
	local GUID = GetPlayerGUID(varMap, varPlayer)

	local p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		x303101_TeamInfoA[varMap][1].LEAVE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		x303101_TeamInfoA[varMap][2].LEAVE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		x303101_TeamInfoB[varMap][1].LEAVE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303101_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		x303101_TeamInfoB[varMap][2].LEAVE = 1
		return
	end
end




function x303101_ProcBattleSceneReady(varMap, nTotalTime)
	
	
	x303101_SceneInfo[varMap] = {
						TICKCOUNT = 0,
						ISCLOSING = 0,
						LEAVECOUNTDOWN = 0,
						RESULT = 0,
						LIMITHOLDTIME = nTotalTime,
				  	  }
				  	  
	local varMsg = format("MPVPBATTLE:x303101_ProcBattleSceneReady varMap=%d", varMap)
	WriteLog(1, varMsg)
	
	
	x303101_SetTempImpassable(varMap)
end




function x303101_ProcBattleSceneClose(varMap, varFlag)
	
	x303101_GenBattleResult(varMap)
	
	if x303101_SceneInfo[varMap].ISCLOSING == 1 then
		return
	end
	
	
	LuaCallNoclosure(x303101_var_GrowPointScriptId, "ProcInit", varMap)	
	
	
	x303101_SceneInfo[varMap].ISCLOSING = 1	
	x303101_SceneInfo[varMap].TICKCOUNT = 0
	local varMsg = format("MPVPBATTLE:x303101_ProcBattleSceneClose varMap=%d varFlag=%d", varMap, varFlag)
	WriteLog(1, varMsg)
end





function x303101_SetPlayerNeedKick(varMap, varPlayer)
	
	local KickDown = GetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN) 
    if KickDown <= 0 or KickDown > x303101_var_Kick_Down then                
        SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, x303101_var_Kick_Down) 
    end
end




function x303101_SetAllPlayerNeedKick(varMap)
    
    local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN) 
            if KickDown <= 0 or KickDown > x303101_var_Kick_Down then                
                SetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN, x303101_var_Kick_Down) 
            end
        end
    end
end




function x303101_UpdatePlayerKickState(varMap)
    
    local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN) 
            if KickDown > 0 then                
                KickDown = KickDown - 1 
                if KickDown == 0 then
                    
                    SetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN, -1) 
                    x303101_KickPlayer(varMap,varObj )                    
                else
                    
                    SetPlayerRuntimeData(varMap, varObj, RD_BATTLE_SCENE_KICK_DOWN, KickDown) 
                end
            end
        end
    end
end




function x303101_SetTempImpassable(varMap)
	
	local varIndex = x303101_GetBattleSceneType(varMap)
	
	for varI,itm in x303101_var_TempImpassable do
		if itm.Flag == varIndex then
			AddSceneTempImpassable(varMap, itm.Left, itm.Top, itm.Right, itm.Bottom)
		end
	end
	
end




function x303101_ClearTempImpassable(varMap)
	
	LuaThisScenceM2Wrold(varMap, "战斗开始", 5, 1)
	
	local varIndex = x303101_GetBattleSceneType(varMap)
	
	for varI, itm in x303101_var_TempImpassable do
		if itm.Flag == varIndex then
			DelSceneTempImpassable(varMap, itm.Left, itm.Top, itm.Right, itm.Bottom)
		end
	end
	
	
	local varHumanCount = GetScenePlayerCount(varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId(varMap, varI)
        if varObj >= 0 then
            LuaCallNoclosure(UTILITY_SCRIPT, "StopClientMapColor", varMap, varObj, 0)
        end
    end
end

function x303101_AddPVP2V2Level(varMap, varPlayer, delta)

	local day = GetPlayerGameData(varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3])
	local curday = GetWeekFirstDay()
	if day ~= curday then
		local value = GetPVP2V2Level(varMap, varPlayer)
		SubPVP2V2Level(varMap, varPlayer, value)
		AddPVP2V2Level(varMap, varPlayer, 500)
		SetPlayerGameData(varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3], curday)
	end	
	AddPVP2V2Level(varMap, varPlayer, delta)
	
	WriteLog(1, format("x303101_AddPVP2V2Level ---- GUID = %x, delta = %d", GetGUID(varMap, varPlayer), delta))
end

function x303101_SubPVP2V2Level(varMap, varPlayer, delta)

	local day = GetPlayerGameData(varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3])
	local curday = GetWeekFirstDay()
	if day ~= curday then
		local value = GetPVP2V2Level(varMap, varPlayer)
		SubPVP2V2Level(varMap, varPlayer, value)
		AddPVP2V2Level(varMap, varPlayer, 500)
		SetPlayerGameData(varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3], curday)
	end	
	SubPVP2V2Level(varMap, varPlayer, delta)
end




function x303101_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 0
end



function x303101_ProcAccept( varMap, varPlayer )
end



function x303101_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)	
end



function x303101_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x303101_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end
