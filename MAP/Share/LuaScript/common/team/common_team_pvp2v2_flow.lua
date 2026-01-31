x303001_var_FileId 					=   303001




x303001_TeamInfoA					= {}							  
x303001_TeamInfoB					= {}
									  



x303001_LevelFlag					= {}




x303001_SceneInfo					= {}




x303001_var_SceneMapNavPath			= 	{	{"zhanchang_shuangrenzhanchang/zhanchang_shuangrenzhanchang.scn",	1,1},	
											{"zhanchang_shuangrenzhanchang/zhanchang_shuangrenzhanchang.scn",	2,0},	
											{"zhanchang_shuangrenzhanchang/zhanchang_shuangrenzhanchang.scn",	3,0},	
										}
										
x303001_var_TempImpassable			=	{
											{Left = 89,Top = 71,Right =  168,Bottom = 183,Flag=1},
										}




x303001_var_EnterScenePos				=	{
											{ {79, 124},{79, 131},{ 176, 124},{ 176, 132}	},		
											{ {27,106},{23,107},{101,107},{104,107}	},
											{ {31,102},{27, 99},{ 93, 28},{ 98, 29} },
										}
										
x303001_var_CloseTick					= 	10													
x303001_var_LimitTotalHoldTime		=	4*60												

x303001_var_Kick_Down					=	4													

x303001_var_GameId					=	1221												




x303001_var_CampFlag					= { 5, 6 }												





x303001_var_Winner_Bonus_Level		= 1				
x303001_var_Winner_Bonus_Mark			= 30

x303001_var_Loser_Bonus_Level			= 1				
x303001_var_Loser_Bonus_Mark			= 7

x303001_var_Other_Bonus_Mark			= 7





x303001_var_State_Invalid				= -1
x303001_var_State_Signup				=  0
x303001_var_State_SignupFinished		=  1
x303001_var_State_Begin				=  2
x303001_var_State_End					=  3

x303001_var_CurrentState				= {}



function x303001_ProcMapCreate(varMap)
	
	
	x303001_TeamInfoA[varMap]			= {	
											{GUID=-1,DIE=0,ENTER=0,LEAVE=0 },
											{GUID=-1,DIE=0,ENTER=0,LEAVE=0 }
										  }
	
	
	x303001_TeamInfoB[varMap]			= {	
											{GUID=-1,DIE=0,ENTER=0,LEAVE=0 },
											{GUID=-1,DIE=0,ENTER=0,LEAVE=0 }
										  }
										  
	
	x303001_LevelFlag[varMap]			= 0
	
	
	x303001_SceneInfo[varMap]			= {
											TICKCOUNT = 0,
											ISCLOSING = 0,
											LEAVECOUNTDOWN = 0,
											RESULT = 0,
											LIMITHOLDTIME = 5*60,
										  }
										  
	x303001_var_CurrentState[varMap]		= x303001_var_State_Invalid
	
	
	
end




function x303001_GetBattleSceneType(varMap)

    local varName = GetBattleSceneName(varMap)
    for varI,item in x303001_var_SceneMapNavPath do
        if varName == item[1] then
            return item[2]
        end
    end

    return -1
	
end




function x303001_IsBattleSceneValid(varMap)

    local varName = GetBattleSceneName(varMap)
    for varI,item in x303001_var_SceneMapNavPath do
        if varName == item[1] then
            return item[3]
        end
    end

    return 0
	
end




function x303001_ProcBattleState_NormalScene(varMap,varState)

	
	if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 then
		return
	end

	
	if varState == x303001_var_State_Signup then

        if x303001_var_CurrentState[varMap] ~= x303001_var_State_Signup then
            local varMsg = format("P2BL:x303001_var_State_Signup,varMap=%d ",varMap  )
            WriteLog(1,varMsg)
        end
        
        x303001_var_CurrentState[varMap] = x303001_var_State_Signup
        
    elseif varState == x303001_var_State_SignupFinished then

        if x303001_var_CurrentState[varMap] ~= x303001_var_State_SignupFinished then
            local varMsg = format("P2BL:x303001_var_State_SignupFinished,varMap=%d ",varMap )
            WriteLog(1,varMsg)
        end
        
        x303001_var_CurrentState[varMap] = x303001_var_State_SignupFinished            
        
















    end
    
end




function x303001_ProcBattleState_BattleScene(varMap,varState)

	
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end

    if varState == x303001_var_State_Signup then
    	
    	
    	if x303001_var_CurrentState[varMap] == x303001_var_State_Begin then
    		return
    	end
    	
        if x303001_var_CurrentState[varMap] ~= x303001_var_State_Signup then
            local varMsg = format("P2BL:x303001_var_State_Signup,varMap=%d,2 ",varMap  )
            WriteLog(1,varMsg)
        end
        
        x303001_var_CurrentState[varMap] = x303001_var_State_Signup
        PVP2v2RegisterScene( varMap )












    elseif varState == x303001_var_State_Begin then

        
        if x303001_var_CurrentState[varMap] ~= x303001_var_State_Begin then
            local varMsg = format("P2BL:x303001_var_State_Begin,varMap=%d,2",varMap )
            WriteLog(1,varMsg)
        end

        
        x303001_var_CurrentState[varMap] = x303001_var_State_Begin
        x303001_ProcBattleSceneReady( varMap,x303001_var_LimitTotalHoldTime )

    elseif varState == x303001_var_State_End then

        if x303001_var_CurrentState[varMap] > x303001_var_State_Begin or x303001_var_CurrentState[varMap] < x303001_var_State_Signup then
            
            
            local varMsg = format("P2BL:x303001_var_State_End,Result:nState > x303001_var_State_Begin or nState < x303001_var_State_Signup  varMap=%d,varState=%d,2",varMap, x303001_var_CurrentState[varMap] )
            WriteLog(1,varMsg)

            
            x303001_ProcBattleSceneClose( varMap,0 )

            
            local varMsg = format("P2BL:x303001_var_State_End, varMap=%d,2",varMap )
            WriteLog(1,varMsg)
            return
        end

        
		x303001_var_CurrentState[varMap] = x303001_var_State_End
        x303001_ProcBattleSceneClose( varMap,1 )

        
        local varMsg = format("P2BL:x303001_var_State_End, varMap=%d,2",varMap )
        WriteLog(1,varMsg)
    end
end




function x303001_ProcBattleState(varMap,varState)

	local varMapType = GetSceneType(varMap);
	if varMapType == 0 then
		x303001_ProcBattleState_NormalScene(varMap,varState)
	elseif varMapType == 2 then
		x303001_ProcBattleState_BattleScene(varMap,varState)
	end
end





function x303001_IsBattleSignup( varMap )

	if varMap == 0  or varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then
		if x303001_var_CurrentState[varMap] == x303001_var_State_Signup then
			return 1
		end
	end
	
	return 0
	
end




function x303001_ProcBattleMatchInfo( varMap, leaderguid1,otherguid1,leaderguid2,otherguid2,nLevelFlag )
	
	
	x303001_TeamInfoA[varMap]			= {	
											{GUID=leaderguid1,DIE=0,ENTER=0,LEAVE=0 },
											{GUID=otherguid1, DIE=0,ENTER=0,LEAVE=0 },
										  }

	
	x303001_TeamInfoB[varMap]			= {	
											{GUID=leaderguid2,DIE=0,ENTER=0,LEAVE=0 },
											{GUID=otherguid2, DIE=0,ENTER=0,LEAVE=0 },
										  }
										  
	
	x303001_LevelFlag[varMap]			= nLevelFlag
end




function x303001_GetPlayerCampFlag( varMap,varPlayer)
	
	local GUID = GetPlayerGUID(varMap,varPlayer)
	
	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return 0
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return 0
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return 1
	end
	
	return -1
	
end




function x303001_GetPlayerPos( varMap,varPlayer )
	
	local GUID = GetPlayerGUID(varMap,varPlayer)
	local varIndex = x303001_GetBattleSceneType(varMap)
	
	
	if varIndex < 1 or varIndex > getn(x303001_var_EnterScenePos) then
		return 100,100
	end
	
	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		local varX = x303001_var_EnterScenePos[varIndex][1][1]
		local z = x303001_var_EnterScenePos[varIndex][1][2]
		return varX,z
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		local varX = x303001_var_EnterScenePos[varIndex][2][1]
		local z = x303001_var_EnterScenePos[varIndex][2][2]
		return varX,z
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		local varX = x303001_var_EnterScenePos[varIndex][3][1]
		local z = x303001_var_EnterScenePos[varIndex][3][2]
		return varX,z
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		local varX = x303001_var_EnterScenePos[varIndex][4][1]
		local z = x303001_var_EnterScenePos[varIndex][4][2]
		return varX,z
	end
	
	return 100,100
end





function x303001_AskBattleSceneEnter( varMap,varPlayer)

	
	PVP2v2AskBattleSceneEnter(varMap,varPlayer)
	
end




function x303001_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 0
end




function x303001_ProcAccept( varMap, varPlayer )
end




function x303001_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)	
end




function x303001_ProcPlayerEnter(varMap, varPlayer)

	
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end
	
	
    local scenePre = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE ) - 1
    if scenePre >= 0 then
        
        local CurX = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE)

        SetPlayerBakSceneInfo(varMap,varPlayer,scenePre,CurX,CurZ)

        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,0)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,0)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,0)

    end
    
	
	local leaveFlag = x303001_SceneInfo[varMap].ISCLOSING
	if leaveFlag > 0 then
		
		x303001_SetPlayerNeedKick(varMap,varPlayer)
		
		local varMsg = format("P2BL:x303001_ProcPlayerEnterFinished kick 0 varMap=%d ",varMap  )
		WriteLog(1,varMsg)
		
		return
	end
	
	
	if x303001_CheckPlayerValid(varMap,varPlayer ) == 0 then
		
		x303001_SetPlayerNeedKick(varMap,varPlayer)
		
		local varMsg = format("P2BL:x303001_ProcPlayerEnterFinished kick 1 varMap=%d ",varMap  )
		WriteLog(1,varMsg)
		
		return
	end
	
	
	if x303001_GetPlayerDieFlag(varMap,varPlayer ) == 1 then
		
		x303001_SetPlayerNeedKick(varMap,varPlayer)
		
		local varMsg = format("P2BL:x303001_ProcPlayerEnterFinished kick 2 varMap=%d ",varMap  )
		WriteLog(1,varMsg)
		
		return
	end
	
	
	if x303001_GetPlayerEnterSceneFlag( varMap,varPlayer ) == 1 then
		
		x303001_SetPlayerNeedKick(varMap,varPlayer)
		
		local varMsg = format("P2BL:x303001_ProcPlayerEnterFinished kick 3 varMap=%d ",varMap  )
		WriteLog(1,varMsg)
		
		return
	end
	
	
	local nCampFlag = x303001_GetPlayerCampFlag( varMap,varPlayer)
	if nCampFlag < 0 or nCampFlag > 1 then
		
		x303001_SetPlayerNeedKick(varMap,varPlayer)
		
		local varMsg = format("P2BL:x303001_ProcPlayerEnterFinished kick 4 varMap=%d ",varMap  )
		WriteLog(1,varMsg)
		
		return
	end
	
	SetCurCamp(varMap,varPlayer,x303001_var_CampFlag[nCampFlag+1])

	
	local varX,z = x303001_GetPlayerPos( varMap,varPlayer)
	SetPos(varMap,varPlayer,varX,z)
	
	
	local varName = GetName(varMap,varPlayer)
	local varMsg = format("P2BL:x303001_ProcPlayerEnterFinished playerEnter varMap=%d varX = %d, z = %d varFlag = %d varName=%s",varMap,varX,z,nCampFlag ,varName )
	WriteLog(1,varMsg)
	
	
	x303001_SetPlayerEnterSceneFlag( varMap,varPlayer)
	
	
	SetPVP2v2BattleDisable( varMap,varPlayer,0,nCampFlag)
	
	
	if x303001_SceneInfo[varMap].TICKCOUNT < 31 then
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayClientMapColor", varMap, varPlayer, 0, 0)
	end
	
	
	GamePlayScriptLog(varMap,varPlayer,x303001_var_GameId)
	
end




function x303001_ProcPlayerLeave( varMap,varPlayer)

	local nDebug = 1
	if nDebug == 1 then
		
		local n2v2LevelPre = GetPVP2V2Level(varMap,varPlayer)
		local varName = GetName(varMap,varPlayer)
		local varMsg = format("P2BL:x303001_ProcPlayerLeave 0 varMap=%d Name=%s 2v2LevelPre = %d", varMap, varName, n2v2LevelPre  )
        WriteLog(1,varMsg)
	end

	
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end
	
	
	local leaveFlag = x303001_SceneInfo[varMap].ISCLOSING
	if leaveFlag > 0 then
		return
	end
	
	
	if x303001_GetPlayerLeaveSceneFlag( varMap,varPlayer) == 0 then
		
		x303001_SetPlayerLeaveSceneFlag( varMap,varPlayer)
		
		local n2v2LevelPre = GetPVP2V2Level(varMap,varPlayer)
		
		
		x303001_SubPVP2V2Level(varMap,varPlayer,x303001_var_Loser_Bonus_Level)
		
		local n2v2LevelAfter = GetPVP2V2Level(varMap,varPlayer)
		
		
		local varName = GetName(varMap,varPlayer)
		local varMsg = format("P2BL:x303001_ProcPlayerLeave 1 varMap=%d Name=%s 2v2LevelPre = %d 2v2LevelAfter=%d", varMap, varName, n2v2LevelPre, n2v2LevelAfter  )
        WriteLog(1,varMsg)
	end	
end




function x303001_ProcMapTimerTick(varMap, nowTime)

	
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end

	x303001_UpdatePlayerKickState(varMap)

	local leaveFlag = x303001_SceneInfo[varMap].ISCLOSING
	if leaveFlag > 0 then

		
		local leaveCountDown = x303001_SceneInfo[varMap].LEAVECOUNTDOWN + 1
		x303001_SceneInfo[varMap].LEAVECOUNTDOWN = leaveCountDown

		if leaveCountDown >= x303001_var_CloseTick then
			
			local humancount = GetScenePlayerCount(varMap);
			for	varI = 0, humancount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI);
                
                TimerCommand( varMap, humanId, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303001_var_FileId, -1, -1 );	

                
                x303001_SetPlayerNeedKick(varMap,humanId)
                local varMsg = format("P2BL:x303001_ProcMapTimerTick kick 1 varMap=%d ",varMap  )
                WriteLog(1,varMsg)
			end
			
		elseif leaveCountDown < x303001_var_CloseTick then
			
			local humancount = GetScenePlayerCount(varMap);
			for	varI = 0, humancount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI);
 				local varStr = format("本场战斗将在%d秒后关闭", x303001_var_CloseTick - leaveCountDown);
  				StartTalkTask(varMap);
  				TalkAppendString(varMap, varStr);
  				StopTalkTask(varMap);
  				DeliverTalkTips(varMap, humanId);
			end
			
		end

	else
		
		if x303001_var_CurrentState[varMap] ~= x303001_var_State_Begin then
			return
		end
		
		local nowTickCount = x303001_SceneInfo[varMap].TICKCOUNT + 1;
		x303001_SceneInfo[varMap].TICKCOUNT = nowTickCount
		
		
		if nowTickCount == 31 then
			x303001_ClearTempImpassable(varMap)
		end
		
		
		if nowTickCount >= 60 then
			if x303001_CheckBattleFinished( varMap ) == 1 then
				x303001_ProcBattleSceneClose( varMap,2 )
				
				
				local varMsg = format("P2BL:x303001_ProcMapTimerTick varMap=%d,nowTickCount=%d 000 ",varMap ,nowTickCount )
                WriteLog(1,varMsg)
                
			end
		end

		
		if nowTickCount >= x303001_var_LimitTotalHoldTime then
			local humancount = GetScenePlayerCount(varMap);
			for varI = 0, humancount - 1 do
				local humanId = GetScenePlayerObjId(varMap, varI);
				
				StartTalkTask(varMap);
					TalkAppendString(varMap, format("本场战斗时间已到，将于%d秒后关闭！",x303001_var_CloseTick));
				StopTalkTask();
				DeliverTalkTips(varMap, humanId);
			end
		end

        if nowTickCount == x303001_var_LimitTotalHoldTime then
            x303001_ProcBattleSceneClose( varMap,3 )
            
            local varMsg = format("P2BL:x303001_ProcMapTimerTick varMap=%d,nowTickCount=%d 001 ",varMap ,nowTickCount )
            WriteLog(1,varMsg)
        end
	end
end




function x303001_ProcPlayerDie(varMap, varPlayer, varKiller)	
	
	
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end
    
	x303001_SetPlayerDieFlag( varMap,varPlayer )
	if x303001_CheckBattleFinished( varMap ) == 1 then
		x303001_ProcBattleSceneClose( varMap,4 )	
		
		local varMsg = format("P2BL:x303001_ProcPlayerDie varMap=%d  002 ",varMap )
        WriteLog(1,varMsg)
	end
end




function x303001_ProcPlayerRelive(varMap, varPlayer, varReliveOp)
	
	
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end
	
	local leaveFlag = x303001_SceneInfo[varMap].ISCLOSING;
	if leaveFlag > 0 then
		return
	end
	
	StartTalkTask(varMap);
		TalkAppendString(varMap, "双人战场比赛结束之前不能复活，请耐心等待！");
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	
end




function x303001_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303001_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end




function x303001_ProcSceneClose( varMap )
	
	PVP2v2SendMakeBattleSceneClose(varMap)
end




function x303001_DoPlayerRelive( varMap, varPlayer, value )

	
	local nHp = GetHp(varMap,varPlayer)
	if nHp <= 0 then
	
		ClearRageRecoverTick(varMap, varPlayer)
		RestoreHp(varMap, varPlayer,value)
		RestoreRage(varMap, varPlayer,value)
		ClearMutexState(varMap, varPlayer, 6)
		SendReliveResult(varMap, varPlayer,1)
	end
	
	
	LastMount(varMap, varPlayer )
	RestoreHp(varMap, varPlayer,0)
end




function x303001_KickPlayer(varMap,varPlayer)

	
    x303001_DoPlayerRelive( varMap, varPlayer, 100 )
    x303001_RestorePlayerCamp(varMap,varPlayer)
    SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,0)
    
    SetPVP2v2BattleDisable( varMap,varPlayer,1,0)


    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        NewWorld(varMap,varPlayer,nBakSceneId,varX,z,x303001_var_FileId)
        return
    end

    
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        
        
        local nDestSceneId = 50
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,x303001_var_FileId)

    elseif varCountry == 1 then
        
        
        local nDestSceneId = 150
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,x303001_var_FileId)

    elseif varCountry == 2 then

        
        local nDestSceneId = 250
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,x303001_var_FileId)

    elseif varCountry == 3 then
        
        
        local nDestSceneId = 350
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,x303001_var_FileId)
        
    end
end





function x303001_RestorePlayerCamp(varMap,varPlayer)

	local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCurCamp(varMap,varPlayer,nCountryId )
    
end




function x303001_SyncBattleTimeToAllPlayer(varMap,nTime)
	
	local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303001_var_FileId,-1,-1)

            if nTime > 0 then
                TimerCommand( varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303001_var_FileId, nTime, nTime );
            end
        end
    end
end




function x303001_ProcSyncBattleTime( varMap,nTime )
    
    
    local nBattleScene = x303001_GetBattleSceneType( varMap )
    if  nBattleScene <= 0 then
        return
    end
    
    
    local nBattleSceneValid = x303001_IsBattleSceneValid(varMap)
    if nBattleSceneValid ~= 1 then
    	return	
    end
    
    x303001_SceneInfo[varMap].TICKCOUNT = NumberCastIntToUInt( nTime )
    local DownTickCount = x303001_var_LimitTotalHoldTime - NumberCastIntToUInt( nTime )
    x303001_SyncBattleTimeToAllPlayer( varMap, DownTickCount )
end




function x303001_CheckBattleFinished( varMap )

	
	
	
	if  x303001_CheckTeamA_AllLeave( varMap ) == 1 or x303001_CheckTeamB_AllLeave( varMap ) == 1 then
		return 1
	end
	
	
	
	
	if x303001_CheckTeamA_AllDie( varMap ) == 1 or x303001_CheckTeamB_AllDie( varMap ) == 1 then
		return 1
	end
	
	
	
	
	if x303001_CheckTeamA_Live( varMap ) == 0 or x303001_CheckTeamB_Live( varMap ) == 0 then
		return 1
	end
	
	
	return 0
end




function x303001_GiveBattleBonus( varMap,nResult )

	if nResult == -1 then
		
		LuaThisScenceM2Wrold( varMap,"平局",5,1)
		
		x303001_ProcGiveTeamA(varMap,-1)
		x303001_ProcGiveTeamB(varMap,-1)
		
	elseif nResult == 0 then
		
		LuaThisScenceM2Wrold( varMap,"克烈军获胜",5,1)
		
		x303001_ProcGiveTeamA(varMap,0)
		x303001_ProcGiveTeamB(varMap,0)
		
	elseif nResult == 1 then
		
		LuaThisScenceM2Wrold( varMap,"乃蛮军获胜",5,1)
		
		x303001_ProcGiveTeamA(varMap,1)
		x303001_ProcGiveTeamB(varMap,1)
	end

	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,10)
end




function x303001_ProcGiveTeamA( varMap, nBonusType )
		
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, humanId, 1,1)
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )

			local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
			if GUID == p then
					
				local varName = GetName(varMap,humanId)
				if varName == nil then
					varName = "Error "
				end
				
				if nBonusType == -1 then
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Other_Bonus_Mark),varName,2,1)
					
					x303001_AddPVP2V2Level(varMap,humanId,0)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Other_Bonus_Mark)
					
				elseif nBonusType == 0 then			
					
					if x303001_LevelFlag[varMap] == 1 then
						LuaScenceM2Player( varMap,humanId,"#G战场等级相差悬殊（20级以上），无法获得战场等级！",varName,2,1)
					else
						LuaScenceM2Player( varMap,humanId,format("#G战场等级+%d",x303001_var_Winner_Bonus_Level),varName,2,1)
						x303001_AddPVP2V2Level(varMap,humanId,x303001_var_Winner_Bonus_Level)
					end
					
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Winner_Bonus_Mark),varName,2,1)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Winner_Bonus_Mark)	
					
				elseif nBonusType == 1 then
					
					LuaScenceM2Player( varMap,humanId,format("#G战场等级-%d",x303001_var_Loser_Bonus_Level),varName,2,1)
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Loser_Bonus_Mark),varName,2,1)	
					
					x303001_SubPVP2V2Level(varMap,humanId,x303001_var_Loser_Bonus_Level)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Loser_Bonus_Mark)
					
				end
				
			end
			
			p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				
				local varName = GetName(varMap,humanId)
				if varName == nil then
					varName = "Error "
				end
				
				if nBonusType == -1 then
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Other_Bonus_Mark),varName,2,1)
					
					x303001_AddPVP2V2Level(varMap,humanId,0)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Other_Bonus_Mark)
					
				elseif nBonusType == 0 then
					
					if x303001_LevelFlag[varMap] == 1 then
						LuaScenceM2Player( varMap,humanId,"#G战场等级相差悬殊（20级以上），无法获得战场等级！",varName,2,1)
					else
						LuaScenceM2Player( varMap,humanId,format("#G战场等级+%d",x303001_var_Winner_Bonus_Level),varName,2,1)	
						x303001_AddPVP2V2Level(varMap,humanId,x303001_var_Winner_Bonus_Level)
					end
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Winner_Bonus_Mark),varName,2,1)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Winner_Bonus_Mark)				
					
				elseif nBonusType == 1 then
					
					LuaScenceM2Player( varMap,humanId,format("#G战场等级-%d",x303001_var_Loser_Bonus_Level),varName,2,1)
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Loser_Bonus_Mark),varName,2,1)	
					
					x303001_SubPVP2V2Level(varMap,humanId,x303001_var_Loser_Bonus_Level)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Loser_Bonus_Mark)
				end
			end
		end
	end
end




function x303001_ProcGiveTeamB( varMap, nBonusType )

	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )

			local p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				
				local varName = GetName(varMap,humanId)
				if varName == nil then
					varName = "Error "
				end
				
				if nBonusType == -1 then
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Other_Bonus_Mark),varName,2,1)
					
					x303001_AddPVP2V2Level(varMap,humanId,0)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Other_Bonus_Mark)
					
				elseif nBonusType == 0 then
					
					LuaScenceM2Player( varMap,humanId,format("#G战场等级-%d",x303001_var_Loser_Bonus_Level),varName,2,1)
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Loser_Bonus_Mark),varName,2,1)
					
					x303001_SubPVP2V2Level(varMap,humanId,x303001_var_Loser_Bonus_Level)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Loser_Bonus_Mark)
					
				elseif nBonusType == 1 then					
					
					
					if x303001_LevelFlag[varMap] == 2 then
						LuaScenceM2Player( varMap,humanId,"#G战场等级相差悬殊（20级以上），无法获得战场等级！",varName,2,1)
					else
						LuaScenceM2Player( varMap,humanId,format("#G战场等级+%d",x303001_var_Winner_Bonus_Level),varName,2,1)
						x303001_AddPVP2V2Level(varMap,humanId,x303001_var_Winner_Bonus_Level)
					end
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Winner_Bonus_Mark),varName,2,1)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Winner_Bonus_Mark)	
					
				end
				
			end
			
			p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				
				local varName = GetName(varMap,humanId)
				if varName == nil then
					varName = "Error "
				end
				
				if nBonusType == -1 then
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Other_Bonus_Mark),varName,2,1)		
					
					x303001_AddPVP2V2Level(varMap,humanId,0)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Other_Bonus_Mark)	
					
				elseif nBonusType == 0 then
					
					LuaScenceM2Player( varMap,humanId,format("#G战场等级-%d",x303001_var_Loser_Bonus_Level),varName,2,1)
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Loser_Bonus_Mark),varName,2,1)
					
					x303001_SubPVP2V2Level(varMap,humanId,x303001_var_Loser_Bonus_Level)
					AddPVP2V2Mark(varMap,humanId,x303001_var_Loser_Bonus_Mark)
					
				elseif nBonusType == 1 then
					
					if x303001_LevelFlag[varMap] == 2 then
						LuaScenceM2Player( varMap,humanId,"#G战场等级相差悬殊（20级以上），无法获得战场等级！",varName,2,1)
					else
						LuaScenceM2Player( varMap,humanId,format("#G战场等级+%d",x303001_var_Winner_Bonus_Level),varName,2,1)
						x303001_AddPVP2V2Level(varMap,humanId,x303001_var_Winner_Bonus_Level)
					end
					
					LuaScenceM2Player( varMap,humanId,format("#G获得#R%d#G点战场积分",x303001_var_Winner_Bonus_Mark),varName,2,1)	
					AddPVP2V2Mark(varMap,humanId,x303001_var_Winner_Bonus_Mark)	
					
				end
			end
		end
	end
	
end




function x303001_GenBattleResult( varMap )

	
	if x303001_SceneInfo[varMap].ISCLOSING == 1 then
		return
	end
	
	local nResult = -1 

	
	
	
	
	
	if  x303001_CheckTeamA_AllLeave( varMap ) == 0 and x303001_CheckTeamB_AllLeave( varMap ) == 1 then
		nResult = 0
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	
	if  x303001_CheckTeamA_AllLeave( varMap ) == 1 and x303001_CheckTeamB_AllLeave( varMap ) == 0 then
		nResult = 1
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	
	
	
	
	
	if x303001_CheckTeamA_AllDie( varMap ) == 0 and x303001_CheckTeamB_AllDie( varMap ) == 1 then
		nResult = 0
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	
	if x303001_CheckTeamA_AllDie( varMap ) == 1 and x303001_CheckTeamB_AllDie( varMap ) == 0 then
		nResult = 1
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	
	
	
	if x303001_CheckTeamA_Live( varMap ) == 1 and x303001_CheckTeamB_Live( varMap ) == 0 then
		nResult = 0
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	if x303001_CheckTeamA_Live( varMap ) == 0 and x303001_CheckTeamB_Live( varMap ) == 1 then
		nResult = 1
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	
	
	
	if x303001_GetTeamA_LiveCount(varMap ) > x303001_GetTeamB_LiveCount(varMap)  then
		nResult = 0
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
	
	if x303001_GetTeamA_LiveCount(varMap ) < x303001_GetTeamB_LiveCount(varMap)  then
		nResult = 1
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end	
	
	
	
	
	
	
	if  x303001_CheckTeamA_AllLeave( varMap ) == 0 and x303001_CheckTeamB_AllLeave( varMap ) == 0 then
		nResult = -1
		x303001_GiveBattleBonus( varMap,nResult )
		return
	end
		
end





function x303001_CheckTeamA_AllLeave( varMap )

	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
			if GUID == p then
				return 0
			end
			
			
			p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				return 0
			end
		end
	end
	
	return 1

end




function x303001_CheckTeamB_AllLeave( varMap )
	
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				return 0
			end
			
			
			p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				return 0
			end
		end
	end
	
	return 1
	
end





function x303001_CheckTeamA_AllDie( varMap )
	
	
	
	local varCount = 0
	if x303001_TeamInfoA[varMap][1].DIE == 1 then
		varCount = varCount + 1
	end
	
	if x303001_TeamInfoA[varMap][2].DIE == 1 then
		varCount = varCount + 1
	end
	
	
	if varCount == 2 then
		return 1
	end
	
	return 0
end




function x303001_CheckTeamA_Live( varMap )
	
	
	local nLiveCount = 0
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
			if GUID == p then
				if x303001_TeamInfoA[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				if x303001_TeamInfoA[varMap][2].DIE ~= 1 then
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




function x303001_CheckTeamB_Live( varMap )
	
	
	local nLiveCount = 0
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				if x303001_TeamInfoB[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				if x303001_TeamInfoB[varMap][2].DIE ~= 1 then
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





function x303001_GetTeamA_LiveCount( varMap )
	
	
	local nLiveCount = 0
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
			if GUID == p then
				if x303001_TeamInfoA[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
			if GUID == p then
				if x303001_TeamInfoA[varMap][2].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
		end
		
	end
	
	return nLiveCount
end




function x303001_GetTeamB_LiveCount( varMap )
	
	
	local nLiveCount = 0
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			
			local GUID = GetPlayerGUID( varMap,humanId )
			
			
			local p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
			if GUID == p then
				if x303001_TeamInfoB[varMap][1].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
			
			
			p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
			if GUID == p then
				if x303001_TeamInfoB[varMap][2].DIE ~= 1 then
					nLiveCount = nLiveCount + 1
				end
			end
		end
	end
	
	return nLiveCount
end






function x303001_CheckTeamB_AllDie( varMap )
	
	
	
	local varCount = 0
	if x303001_TeamInfoB[varMap][1].DIE == 1 then
		varCount = varCount + 1
	end
	
	if x303001_TeamInfoB[varMap][2].DIE == 1 then
		varCount = varCount + 1
	end
	
	
	if varCount == 2 then
		return 1
	end
	
	return 0
	
end





function x303001_CheckPlayerValid( varMap,varPlayer )
	
	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return 1
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return 1
	end
	
	return 0

end




function x303001_GetPlayerDieFlag( varMap,varPlayer )
	
	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return x303001_TeamInfoA[varMap][1].DIE;
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return x303001_TeamInfoA[varMap][2].DIE;
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return x303001_TeamInfoB[varMap][1].DIE;
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return x303001_TeamInfoB[varMap][2].DIE;
	end
	
	return 1
	
end




function x303001_SetPlayerDieFlag( varMap,varPlayer )

	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		x303001_TeamInfoA[varMap][1].DIE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		x303001_TeamInfoA[varMap][2].DIE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		x303001_TeamInfoB[varMap][1].DIE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		x303001_TeamInfoB[varMap][2].DIE = 1
		return
	end
	
end




function x303001_GetPlayerEnterSceneFlag( varMap,varPlayer)

	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return x303001_TeamInfoA[varMap][1].ENTER
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return x303001_TeamInfoA[varMap][2].ENTER
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return x303001_TeamInfoB[varMap][1].ENTER
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return x303001_TeamInfoB[varMap][2].ENTER
	end
	
	return 1
end




function x303001_SetPlayerEnterSceneFlag( varMap,varPlayer)

	
	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		x303001_TeamInfoA[varMap][1].ENTER = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		x303001_TeamInfoA[varMap][2].ENTER = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		x303001_TeamInfoB[varMap][1].ENTER = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		x303001_TeamInfoB[varMap][2].ENTER = 1
		return
	end
end




function x303001_GetPlayerLeaveSceneFlag( varMap,varPlayer)

	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		return x303001_TeamInfoA[varMap][1].LEAVE
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		return x303001_TeamInfoA[varMap][2].LEAVE
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		return x303001_TeamInfoB[varMap][1].LEAVE
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		return x303001_TeamInfoB[varMap][2].LEAVE
	end
	
	return 1
end




function x303001_SetPlayerLeaveSceneFlag( varMap,varPlayer)

	
	local GUID = GetPlayerGUID(varMap,varPlayer)

	local p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][1].GUID)
	if GUID == p then
		x303001_TeamInfoA[varMap][1].LEAVE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoA[varMap][2].GUID)
	if GUID == p then
		x303001_TeamInfoA[varMap][2].LEAVE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][1].GUID)
	if GUID == p then
		x303001_TeamInfoB[varMap][1].LEAVE = 1
		return
	end
	
	p = NumberCastIntToUInt(x303001_TeamInfoB[varMap][2].GUID)
	if GUID == p then
		x303001_TeamInfoB[varMap][2].LEAVE = 1
		return
	end
end




function x303001_ProcBattleSceneReady(varMap,nTotalTime)
	
	
	x303001_SceneInfo[varMap] = {
						TICKCOUNT = 0,
						ISCLOSING = 0,
						LEAVECOUNTDOWN = 0,
						RESULT = 0,
						LIMITHOLDTIME = nTotalTime,
				  	  }
				  	  
	local varMsg = format("P2BL:x303001_ProcBattleSceneReady varMap=%d ",varMap  )
	WriteLog(1,varMsg)
	
	
	
	x303001_SetTempImpassable(varMap)
		
end




function x303001_ProcBattleSceneClose(varMap,varFlag )
	
	x303001_GenBattleResult( varMap )
	
	if x303001_SceneInfo[varMap].ISCLOSING == 1	then
		return
	end
	
	
	x303001_SceneInfo[varMap].ISCLOSING = 1	
	x303001_SceneInfo[varMap].TICKCOUNT = 0
	local varMsg = format("P2BL:x303001_ProcBattleSceneClose varMap=%d varFlag=%d",varMap,varFlag  )
	WriteLog(1,varMsg)
	
end




function x303001_ProcBattleMatchOOD(varMap,varPlayer)
	
	local varName = GetName(varMap,varPlayer)
	LuaScenceM2Player( varMap,varPlayer,"双人战场：你所在的队伍本次轮空！",varName,2,1)	
	LuaScenceM2Player( varMap,varPlayer,"双人战场：你所在的队伍本次轮空！",varName,3,1)	
	
end




function x303001_SetPlayerNeedKick( varMap,varPlayer)
	
	local KickDown = GetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ) 
    if KickDown <= 0 or KickDown > x303001_var_Kick_Down then                
        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,x303001_var_Kick_Down) 
    end
	
end




function x303001_SetAllPlayerNeedKick( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown <= 0 or KickDown > x303001_var_Kick_Down then                
                SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,x303001_var_Kick_Down) 
            end
        end
    end
end




function x303001_UpdatePlayerKickState( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown > 0 then                
                KickDown = KickDown - 1 
                if KickDown == 0 then
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,-1) 
                    x303001_KickPlayer( varMap,varObj )                    
                else
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,KickDown) 
                end
            end
        end
    end
end




function x303001_SetTempImpassable(varMap)
	
	local varIndex = x303001_GetBattleSceneType(varMap)
	
	for varI,itm in x303001_var_TempImpassable do
		if itm.Flag == varIndex then
			AddSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
		end
	end
	
end




function x303001_ClearTempImpassable(varMap)
	
	LuaThisScenceM2Wrold( varMap,"战斗开始",5,1)
	
	local varIndex = x303001_GetBattleSceneType(varMap)
	
	for varI,itm in x303001_var_TempImpassable do
		if itm.Flag == varIndex then
			DelSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
		end
	end
	
	
	local varHumanCount = GetScenePlayerCount( varMap )
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            LuaCallNoclosure(UTILITY_SCRIPT,"StopClientMapColor", varMap, varObj, 0)
        end
    end
end

function x303001_AddPVP2V2Level(varMap,varPlayer,delta)
	local day = GetPlayerGameData( varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3] )
	local curday = GetWeekFirstDay()
	if day ~= curday then
		local value = GetPVP2V2Level(varMap,varPlayer)
		SubPVP2V2Level(varMap,varPlayer,value)
		AddPVP2V2Level(varMap,varPlayer,500)
		SetPlayerGameData( varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3], curday )
	end	
	AddPVP2V2Level(varMap,varPlayer,delta)
end

function x303001_SubPVP2V2Level(varMap,varPlayer,delta)
	local day = GetPlayerGameData( varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3] )
	local curday = GetWeekFirstDay()
	if day ~= curday then
		local value = GetPVP2V2Level(varMap,varPlayer)
		SubPVP2V2Level(varMap,varPlayer,value)
		AddPVP2V2Level(varMap,varPlayer,500)
		SetPlayerGameData( varMap, varPlayer, MD_PVP2V2_LEVEL_DAY[1], MD_PVP2V2_LEVEL_DAY[2], MD_PVP2V2_LEVEL_DAY[3], curday )
	end	
	SubPVP2V2Level(varMap,varPlayer,delta)
end
