
x310113_var_FileId                      = 310113
x310113_var_TotalBattleTime               = 60 * 20     	


x310113_var_SceneName                     = { {Name="zhanchang_zhuqueshouhu/zhanchang_zhuqueshouhu.scn",Script=310113} }

x310113_var_ZhuQue_Signup                  = 100     
x310113_var_ZhuQue_WaitBattle              = 101     
x310113_var_ZhuQue_BeginBattle             = 102     
x310113_var_ZhuQue_EndBattle               = 103     


x310113_var_MaxScore                     = 49	     
x310113_var_BonusTips                    = "#G您获得了#R%d#G点经验,#R%d#G点帮会贡献,#R%d#G帮会经验!" 
x310113_var_BonusTips1                   = "您获得了奖励" 



x310113_var_WinPrise                     = 1000*0.5*20              
x310113_var_LosePrise                    = 1000*0.1*20              
x310113_var_DeucePrise                   = 1000*0.3*20              


x310113_var_WinBangGong                  = 25
x310113_var_DeuceBangGong                = 20


x310113_var_WinBangExp                   = 2
x310113_var_LoseBangExp                  = 2
x310113_var_DeuceBangExp                 = 2

x310113_var_Guild_Camp_A                 = 5
x310113_var_Guild_Camp_B                 = 6

x310113_var_Leader_Index                 = 5

x310113_var_Kick_Down                    = 8



x310113_var_BattleState				   = {}
x310113_var_BattleEnterFlag			   = {}
x310113_var_GuildA					   = {}
x310113_var_GuildB					   = {}
x310113_var_CountryID					   = {}
x310113_var_CountDownState			   = {}
x310113_var_CountDownTime				   = {}
x310113_var_CountTime				       = {}




function x310113_ProcMapCreate(varMap)
	
	x310113_var_BattleState[varMap]				   	= -1
	x310113_var_BattleEnterFlag[varMap]			   	= 0
	x310113_var_GuildA[varMap]					   	= -1
	x310113_var_GuildB[varMap]					   	= -1
	x310113_var_CountryID[varMap]					= -1
	x310113_var_CountDownState[varMap]			   	= -1
	x310113_var_CountDownTime[varMap]				= -1
	x310113_var_CountTime[varMap]				    = -1
	
end





function x310113_GetBattleState(varMap)
	
	return x310113_var_BattleState[varMap]
	
end




function x310113_GetBattleEnterSceneFlag(varMap)
	return x310113_var_BattleEnterFlag[varMap];
end




function x310113_SetBattleEnterSceneFlag(varMap,nEnterSceneFlag)
	x310113_var_BattleEnterFlag[varMap] = nEnterSceneFlag
end




function x310113_GetZhuQueBattleSceneScript( varMap )

    local varName = GetBattleSceneName(varMap)
    for varI,item in x310113_var_SceneName do
        if varName == item.Name then
            return item.Script
        end
    end

    return 0
end





function x310113_ProcBattleStateEvent( varMap, varState  )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_ZHUQUEBATTLELITE ) == 0 then
        return
    end


	local varMapType = GetSceneType(varMap);
	if varMapType == 0 then 

		
		
		
		
        if varState == x310113_var_ZhuQue_Signup then

            
            if x310113_var_BattleState[varMap] ~= x310113_var_ZhuQue_Signup then
                local varMsg = format("ZQBL:x310113_var_ZhuQue_Signup,varMap=%d ",varMap  )
                WriteLog(1,varMsg)
            end

            
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_Signup
            
        elseif varState == x310113_var_ZhuQue_WaitBattle then

            
            if x310113_var_BattleState[varMap] ~= x310113_var_ZhuQue_WaitBattle then
                local varMsg = format("ZQBL:x310113_var_ZhuQue_WaitBattle,varMap=%d ",varMap )
                WriteLog(1,varMsg)
            end
            
            
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_WaitBattle
            
        elseif varState == x310113_var_ZhuQue_BeginBattle then

            
            if x310113_var_BattleState[varMap] == x310113_var_ZhuQue_BeginBattle then
                local varMsg = format("ZQBL:x310113_var_ZhuQue_BeginBattle,varMap=%d ",varMap )
                WriteLog(1,varMsg)
            end
            
            
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_BeginBattle
            x310113_var_BattleEnterFlag[varMap] = 1

        elseif varState == x310113_var_ZhuQue_EndBattle then
            
            
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_EndBattle

            local varMsg = format("ZQBL:x310113_var_ZhuQue_EndBattle, varMap=%d",varMap )
            WriteLog(1,varMsg)

        end

	elseif varMapType == 2 then
	
		
		
		
        
        
        local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
        if  varScriptFileId == 0 then
            return
        end

        if varState == x310113_var_ZhuQue_Signup then

            
            if x310113_var_BattleState[varMap] ~= x310113_var_ZhuQue_Signup then
                
                
                local varMsg = format("ZQBL:x310113_var_ZhuQue_Signup,varMap=%d,2 ",varMap  )
                WriteLog(1,varMsg)

            end

            GameBattleSceneAskInit( varMap,0 )                                             
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_Signup		                      	

        elseif varState == x310113_var_ZhuQue_WaitBattle then

            
            if x310113_var_BattleState[varMap] ~= x310113_var_ZhuQue_WaitBattle then
                local varMsg = format("ZQBL:x310113_var_ZhuQue_WaitBattle,varMap=%d,2",varMap )
                WriteLog(1,varMsg)
            end

            
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_WaitBattle
            
        elseif varState == x310113_var_ZhuQue_BeginBattle then

            
            if x310113_var_BattleState[varMap] ~= x310113_var_ZhuQue_BeginBattle then
                local varMsg = format("ZQBL:x310113_var_ZhuQue_BeginBattle,varMap=%d,2",varMap )
                WriteLog(1,varMsg)
            end

            
            x310113_var_BattleState[varMap] = x310113_var_ZhuQue_BeginBattle
            x310113_ProcBattleSceneReady( varMap,( x310113_var_TotalBattleTime) )

        elseif varState == x310113_var_ZhuQue_EndBattle then

            if x310113_var_BattleState[varMap] > x310113_var_ZhuQue_BeginBattle or x310113_var_BattleState[varMap] < x310113_var_ZhuQue_Signup then
                
                local varMsg = format("ZQBL:x310113_var_ZhuQue_EndBattle,Result:nState > x310113_var_ZhuQue_BeginBattle or nState < x310113_var_ZhuQue_Signup  varMap=%d,varState=%d,2",varMap, varState )
                WriteLog(1,varMsg)

                
                x310113_ProcBattleSceneClose( varMap )

                local varMsg = format("ZQBL:x310113_var_ZhuQue_EndBattle, varMap=%d,2",varMap )
                WriteLog(1,varMsg)
                return
            end

            
    		x310113_var_BattleState[varMap] = x310113_var_ZhuQue_EndBattle 
            x310113_ProcBattleSceneClose( varMap )

            local varMsg = format("ZQBL:x310113_var_ZhuQue_EndBattle, varMap=%d,3",varMap )
            WriteLog(1,varMsg)
        end
	end
end




function x310113_ProcMapTimerTick( varMap,varTime )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
       
    x310113_ProcBattleSceneTimer( varMap, varTime)
end





function x310113_ProcPlayerEnter( varMap, varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local varStatus = x310113_var_BattleState[varMap]
    if varStatus ~= x310113_var_ZhuQue_BeginBattle then
    
        x310113_SetAllPlayerNeedKick( varMap )
        
        local varMsg = format("ZQBL:x310113_ProcBattlePlayerEnter Kick,Player,varMap=%d,varPlayer=%d varStatus=%d",varMap,varPlayer,varStatus )
        WriteLog(1,varMsg)
        return
    end


    
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nSendCCamp = -1
    if nGuildId == nGuildA then
        nSendCCamp = 0
    elseif nGuildId == nGuildB then
        nSendCCamp = 1
    else
        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,x310113_var_Kick_Down) 
        
        local varMsg = format("ZQBL:x310113_ProcBattlePlayerEnter Kick 2,Player,varMap=%d,varPlayer=%d",varMap,varPlayer )
        WriteLog(1,varMsg)
        return

    end

    
    GameBattleSetDisable(varMap, varPlayer, 0, nSendCCamp,0 )

    local strGuildA = GetGuildName( nGuildA )
    local strGuildB = GetGuildName( nGuildB )

    GameBattleSendBattleInfo( varMap, varPlayer, strGuildA, strGuildB,0 )

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,0)

    
    
    if nGuildId == nGuildA then
        SetCurCamp(varMap,varPlayer,x310113_var_Guild_Camp_A)
        SetPos(varMap,varPlayer,47,218)

    elseif nGuildId == nGuildB then
        SetCurCamp(varMap,varPlayer,x310113_var_Guild_Camp_B)
        SetPos(varMap,varPlayer,209,35)
    end

    SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN,-1)

    
    local scenePre = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE ) - 1
    if scenePre >= 0 then
        
        local CurX = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE)

        SetPlayerBakSceneInfo(varMap,varPlayer,scenePre,CurX,CurZ)

        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,0)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,0)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,0)

    end

end




function x310113_ProcPlayerLeave( varMap, varPlayer )
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local nCountryId = GetCurCountry(varMap,varPlayer )
    SetCurCamp( varMap,varPlayer,nCountryId )

    GameBattleSetDisable(varMap, varPlayer,1,-1,0)
end




function x310113_ProcPlayerLeaveGuild( varMap,varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
    
    x310113_ZhuQueBattleKickPlayer( varMap,varPlayer )
    GameBattleSetDisable(varMap, varPlayer,1,-1,0)

end




function x310113_ProcSetZhuQueBattleMatchInfo( varMap,nGuildA,nGuildB,nCountryId )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

	
    x310113_var_GuildA[varMap] = nGuildB 
    x310113_var_GuildB[varMap] = nGuildA
    x310113_var_CountryID[varMap] = nCountryId

    
    local a = x310113_var_GuildA[varMap]
    local b = x310113_var_GuildB[varMap]
    local c = x310113_var_CountryID[varMap]

    local varMsg = format( "ZQBL:ZHUQUE_BATTLE_MATCHINFO:varMap=%d,A=%d,B=%d,CountryId=%d", varMap, a, b,c )
    WriteLog(1,varMsg)
end




function x310113_ProcPlayerNewConnectEnter( varMap, varPlayer )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local BattleSceneFlag = GetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG)
    if BattleSceneFlag == 0 then

        
        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN,x310113_var_Kick_Down)

        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "ErrorName"
        end
        local varMsg = format( "ZQBL:x310113_ProcPlayerNewConnectEnter 0,need kick,varMap=%d,varPlayer=%d,varName=%s", varMap, varPlayer, varName )
        WriteLog(1,varMsg)

    else

        
        
        
        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "ErrorName"
        end
        local varMsg = format( "ZQBL:x310113_ProcPlayerNewConnectEnter 1,varMap=%d,varPlayer=%d,varName=%s", varMap, varPlayer, varName )
        WriteLog(1,varMsg)

        SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,0)

    end
end




function x310113_ProcPlayerDie( varMap, varPlayer, varKiller  )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    
    local nBeKilled = GetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED ) + 1
    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,nBeKilled)

    
    local ObjType = GetObjType(varMap, varKiller)

    
    if IsPlayerStateNormal( varMap,varKiller ) == 1 and ObjType == 1 and nBeKilled <= 6 then

        AddGuildUserPoint(varMap,varKiller,10)

        local varMsg = "您获得了10点帮贡"
        local varName = GetName(varMap,varKiller )

        LuaScenceM2Player(varMap, varKiller, varMsg, varName , 2,1)
    
    end

    
    if nBeKilled <= 6 then 

        local varStr = format("#G%s在朱雀战场中被杀死%d次。",GetName(varMap,varPlayer ),nBeKilled )
        LuaThisScenceM2Wrold(varMap,varStr,3,1)
        LuaThisScenceM2Wrold(varMap,varStr,2,1)
    end

    
    if nBeKilled == 6 then

        local nCountryId = GetCurCountry( varMap,varPlayer)

        local varStr = format("#G%s在朱雀战场中，死亡次数已满，被迫离开战场。",GetName(varMap,varPlayer ) )
        LuaAllScenceM2Country(varMap,varStr,nCountryId,3,1)
        LuaAllScenceM2Country(varMap,varStr,nCountryId,2,1)

        
        local KickDown = GetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ) 
        if KickDown <= 0 or KickDown > 4 then
            SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,4) 
        end
    end

end




function x310113_CheckPlayerState( varMap,varPlayer )
    

    local varState
    local ErrorMsg

    varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        ErrorMsg = "状态异常"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        ErrorMsg = "处于答题状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        ErrorMsg = "处于设摊状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        ErrorMsg = "处于死亡状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        ErrorMsg = "处于运镖状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        ErrorMsg = "处于挂机状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        ErrorMsg = "处于代练状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        ErrorMsg = "处于bus状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_PKMODE )
    if varState == 1 then
        ErrorMsg = "pk值过高或处于狂暴模式，不能进入战场"
        return 1,ErrorMsg
    end
    
    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        ErrorMsg = "处于童趣状态，不能进入战场"
        return 1,ErrorMsg
    end
  
    return 0

end




function x310113_ProcZhuQueBattleChangeScene( varMap,varPlayer,newSceneID,Flag )
    

    
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask(varMap)
		local varText = "监狱里还不老实,想走,没门。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end

    local PosX = 100
    local PosZ = 100


    if varMap == newSceneID then
        
        if Flag == 0 then
		    SetPos( varMap , varPlayer , 47 , 218 )
        else
            SetPos( varMap , varPlayer , 209,35 )
        end
	else
        
        
        local varState,varMsg = x310113_CheckPlayerState( varMap,varPlayer )
        if varState == 1 then
            
            StartTalkTask(varMap)
            TalkAppendString( varMap, varMsg );
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end

        
        local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)
        SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,1)

		NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ,310113 )
	end
end

function x310113_DoPlayerRelive( varMap, varPlayer )
	
	if GetHp(varMap,varPlayer) > 0 then
		return
	end
	
    RestoreHp(varMap, varPlayer,0)
	RestoreRage(varMap, varPlayer,100)
	ClearMutexState(varMap, varPlayer, 6)
	SendReliveResult(varMap, varPlayer,1)	

    
    RelivePlayerNM(varMap,varPlayer,2)	
    SetPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE,0)
end


function x310113_ProcPlayerRelive( varMap, varPlayer )

    
    local varScriptFileId = x310113_GetZhuQueBattleSceneScript( varMap )
    if varScriptFileId == 0 then
        return
    end
    
    
    local nBeKilled = GetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED )
    if nBeKilled >= 6 then
        
        
        local KickDown = GetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ) 
        if KickDown <= 0 or KickDown > 4 then
            SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,4) 
        end
        
        return
    end
    
    
    ClearRageRecoverTick(varMap, varPlayer)
	RestoreHp(varMap, varPlayer,100)
	RestoreRage(varMap, varPlayer,100)
	ClearMutexState(varMap, varPlayer, 6)
	SendReliveResult(varMap, varPlayer,1)

	
    local nGuildId = GetGuildID( varMap,varPlayer )
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    if nGuildId == nGuildA then

        x310113_ProcZhuQueBattleChangeScene(varMap,varPlayer,varMap,0)
    else
        x310113_ProcZhuQueBattleChangeScene(varMap,varPlayer,varMap,1)
    end

end





function x310113_ProcBattleSceneReady( varMap,totalTime )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    x310113_var_CountDownState[varMap] = -1
    x310113_var_CountDownTime[varMap] = 10

    
    x310113_var_CountTime[varMap] = totalTime

end

function x310113_ProcBattleSceneClose( varMap )

    if x310113_var_CountDownState[varMap] == 1 then
        return
    end

    local varStatus = x310113_var_BattleState[varMap]
	if varStatus == x310113_var_ZhuQue_EndBattle then
		x310113_BattleGenResult( varMap,0 )
	end


end




function x310113_ProcBattleSceneTimer( varMap,varTime )

    
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    x310113_UpdatePlayerKickState( varMap )

    local BattleStatus = x310113_var_BattleState[varMap]
    if BattleStatus ~= x310113_var_ZhuQue_BeginBattle then
        return
    end

    
    
    local nTime = x310113_var_CountTime[varMap] - 1
    x310113_var_CountTime[varMap] = nTime

    
    
    if x310113_var_CountDownState[varMap] == 1 then

	    
	    local time = x310113_var_CountDownTime[varMap]
	    if time > 0 then

		    x310113_var_CountDownTime[varMap] = time - 1

		    local varStr = format("#G朱雀战场结束,#R%d秒#G后战场自动关闭",time)

		    LuaThisScenceM2Guild(varMap,varStr,x310113_var_GuildA[varMap],3,1)
		    LuaThisScenceM2Guild(varMap,varStr,x310113_var_GuildB[varMap],3,1)

		else

            
            x310113_RestoreAllPlayerCamp( varMap )
	    	x310113_ZhuQueBattleKickAllPlayer(varMap)

			
			x310113_var_BattleState[varMap]				   = -1
			x310113_var_GuildA[varMap]					   = -1
			x310113_var_GuildB[varMap]					   = -1
			x310113_var_CountryID[varMap]					   = -1
			x310113_var_CountDownState[varMap]			   = -1
			x310113_var_CountDownTime[varMap]				   = -1
			x310113_var_CountTime[varMap]				       = -1
            
            
            local varMsg = format("ZQBL:x310113_ProcBattleSceneTimer ZhuQueBattleFinished,varMap=%d,LeaveTime h= %d,m=%d",varMap, floor(nTime/60),mod(nTime,60) )
            WriteLog(1,varMsg)

	    end

	    return

	end

    
    
    if nTime < 18*60 then
        local bIsFinished = x310113_CheckIsFinished( varMap)
        if bIsFinished == 1 then
            
            local varStatus = x310113_var_BattleState[varMap]
            if varStatus == x310113_var_ZhuQue_BeginBattle then

                x310113_BattleGenResult( varMap,1 )
                return
            end

        end
    end
	

    
    
    x310113_SyncGuildPower( varMap )

    
    x310113_UpdateSceneDataFlag( varMap )

end





function x310113_CheckIsFinished( varMap )

    
    
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    local nGuildA_MemberCount = 0
    local nGuildB_MemberCount = 0


    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA then
                nGuildA_MemberCount = nGuildA_MemberCount + 1
            elseif nGuildId == nGuildB then
                nGuildB_MemberCount = nGuildB_MemberCount + 1
            end
        end
    end

    if nGuildA_MemberCount == 0 and nGuildB_MemberCount == 0 then
        return 1
    end

    
    if nGuildA_MemberCount == 0 and nGuildB_MemberCount > 0 then
        return 1
    end

    if nGuildB_MemberCount == 0 and nGuildA_MemberCount > 0 then
        return 1
    end

    return 0

end





function x310113_GetWinner(varMap)

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return -1
    end

    
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    local nGuildA_MemberCount = 0
    local nGuildB_MemberCount = 0

    local nGuildA_GuildIn = 0
    local nGuildB_GuildIn = 0

    local nGuildA_GuilderDie = 0
    local nGuildB_GuilderDie = 0

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA then
                nGuildA_MemberCount = nGuildA_MemberCount + 1
            elseif nGuildId == nGuildB then
                nGuildB_MemberCount = nGuildB_MemberCount + 1
            end

            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x310113_var_Leader_Index then
                if nGuildId == nGuildA then
                    nGuildA_GuildIn = 1
                    nGuildA_GuilderDie = GetPlayerRuntimeData(varMap,varObj,RD_KING_BATTLE_BEKILLED )
                else
                    nGuildB_GuildIn = 1
                    nGuildB_GuilderDie = GetPlayerRuntimeData(varMap,varObj,RD_KING_BATTLE_BEKILLED )
                end
            end
        end
    end


    

    
    if nGuildA_GuildIn == 1 and nGuildB_GuildIn == 0 then
        return 0
    end

    if nGuildA_GuildIn == 0 and nGuildB_GuildIn == 1 then
        return 1
    end

    
    if nGuildA_MemberCount == 0 and nGuildB_MemberCount > 0 then
        return 1
    end

    if nGuildB_MemberCount == 0 and nGuildA_MemberCount > 0 then
        return 0
    end

    
    if nGuildA_MemberCount > 0 and nGuildB_MemberCount > 0 then
        if nGuildA_MemberCount > nGuildB_MemberCount then
            return 0
        elseif nGuildA_MemberCount < nGuildB_MemberCount then
            return 1
        else
            
            
            if nGuildA_GuildIn == 0 and nGuildB_GuildIn == 0 then
                
                return 1            
            elseif nGuildA_GuildIn == 1 and nGuildB_GuildIn == 0 then
                
                return 0
            elseif nGuildA_GuildIn == 0 and nGuildB_GuildIn == 1 then
                
                return 1
            else
                
                if nGuildA_GuilderDie > nGuildB_GuilderDie then
                    return 1

                elseif nGuildA_GuilderDie < nGuildB_GuilderDie then
                    return 0

                
                else
                    return 1
                end
            end
        end
    end

    return 1
end




function x310113_BattleBonus( varMap,varPlayer,battleResult )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

end




function x310113_ZhuQueBattleBonus( varMap ,battleResult )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            x310113_BattleBonus( varMap,varObj,battleResult)
        end
    end
end





function x310113_RestorePlayerCamp( varMap,varPlayer )
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCurCamp(varMap,varPlayer,nCountryId )
end




function x310113_RestoreAllPlayerCamp( varMap )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nCountryId = GetCurCountry( varMap,varObj )
            SetCurCamp(varMap,varObj,nCountryId )
        end
    end
end




function x310113_BattleGenResult( varMap, callerId  )
    
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    local nCountryId = x310113_var_CountryID[varMap]

    if nGuildA == nGuildB then
        return
    end

    local nWinner = x310113_GetWinner( varMap )
    if nWinner == 0 then
        

        local strGuildName = GetGuildName(nGuildA)
        local strGuildLeaderName = GetGuildLeaderName(nGuildA)
        
        local varStr = format("#G%s帮会获得朱雀战场的胜利，%s坐上了%s朱雀之主的宝座。",strGuildName,strGuildLeaderName,GetCountryName(nCountryId))
        LuaAllScenceM2Wrold(varMap, varStr, 2, 1)
        LuaAllScenceM2Wrold(varMap, varStr, 3, 1)
        GameBattleSendResultToGL( 0,1,nCountryId,nGuildB,nGuildA)
    else
        
        local strGuildName = GetGuildName(nGuildB)
        
        local varStr = format("#G%s帮会团结一致的顶住了挑战，登上了%s朱雀之主的宝座。",strGuildName,GetCountryName(nCountryId) )
        local nOfficalGUID = CountryGetOfficerGUID(x310113_var_CountryID[varMap],1)
        if nOfficalGUID ~= nil and nOfficalGUID > 0 then
        	varStr = format("#G%s帮会团结一致的顶住了挑战，卫冕了%s朱雀之主的宝座。",strGuildName,GetCountryName(nCountryId) )
        end
        
        LuaAllScenceM2Wrold(varMap, varStr, 2, 1)
        LuaAllScenceM2Wrold(varMap, varStr, 3, 1)
        GameBattleSendResultToGL( 0,0,nCountryId,nGuildB,nGuildA)
    end

    
    x310113_var_CountDownState[varMap] = 1
    x310113_var_CountDownTime[varMap] = 10

    local nTime = x310113_var_CountTime[varMap]
        
    
    local varMsg = format("ZQBL:x310113_BattleGenResult varMap=%d,LeaveTime h= %d,m=%d,CallerId=%d",varMap, floor(nTime/60),mod(nTime,60), callerId )
    WriteLog(1,varMsg)

    x310113_var_GuildA[varMap] = -1
    x310113_var_GuildB[varMap] = -1

    x310113_SetAllPlayerNeedKick(varMap)
    
    
end




function x310113_ZhuQueBattleKickPlayer( varMap,varPlayer )

    x310113_DoPlayerRelive( varMap,varPlayer )

    x310113_RestorePlayerCamp( varMap,varPlayer)

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,0)

    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        NewWorld(varMap,varPlayer,nBakSceneId,varX,z,310113)
        return
    end

    
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        
        
        local nDestSceneId = 50
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,310113)

    elseif varCountry == 1 then
        
        
        local nDestSceneId = 150
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,310113)

    elseif varCountry == 2 then

        
        local nDestSceneId = 250
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,310113)

    elseif varCountry == 3 then
        
        
        local nDestSceneId = 350
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,310113)

    end
end




function x310113_ZhuQueBattleKickAllPlayer( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            x310113_ZhuQueBattleKickPlayer( varMap,varObj)

        end
    end
end





function x310113_SyncBattleTimeToAllPlayer( varMap ,nTime )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);                 

            if nTime > 0 then
                TimerCommand( varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID, nTime, nTime );
            end
        end
    end    
end




function x310113_SyncBattleTimeCloseToAllPlayer(varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);                 
        end
    end    

end




function x310113_SyncGuildPower( varMap )
    
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    local nGuildA_Count = 0
    local nGuildB_Count = 0

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA then
                nGuildA_Count = nGuildA_Count + 1
            elseif nGuildId == nGuildB then
                nGuildB_Count = nGuildB_Count + 1
            end
        end
    end

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            GameBattleSyncPowerInfo(varMap,varObj,nGuildA_Count,nGuildB_Count,0)
        end
    end

end




function x310113_UpdateSceneDataFlag( varMap )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    ClearSceneMapDataFlag( varMap )

	SetSceneMapDataFlag( varMap,10,8,"申请方传送者",40,217,-1)
	SetSceneMapDataFlag( varMap,11,8,"朱雀方传送者",217,37,-1)

    
    local GuildLeaderA = -1
    local GuildLeaderB = -1
    
    local nGuildA = x310113_var_GuildA[varMap]
    local nGuildB = x310113_var_GuildB[varMap]

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x310113_var_Leader_Index then
                local nGuild = GetGuildID( varMap,varObj )
                if nGuild == nGuildA then
                    GuildLeaderA = varObj
                elseif nGuild == nGuildB then
                    GuildLeaderB = varObj
                end
            end
        end
    end


    local a_leader_name = ""
    local a_leader_x = 0
    local a_leader_z = 0
    
    if GuildLeaderA > 0 then
        
        a_leader_name = GetName(varMap,GuildLeaderA)
        a_leader_x,a_leader_z = GetWorldPos(varMap,GuildLeaderA)
    end

    local b_leader_name = ""
    local b_leader_x = 0
    local b_leader_z = 0
    
    if GuildLeaderB > 0 then

        b_leader_name = GetName(varMap,GuildLeaderB)
        b_leader_x,b_leader_z = GetWorldPos(varMap,GuildLeaderB)
    end

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            if GuildLeaderA > 0 and GuildLeaderA ~= varObj then
                SetSceneMapDataFlagToPlayer( varMap,varObj,12,8,a_leader_name,a_leader_x,a_leader_z,-1)
            end

            if GuildLeaderB > 0 and GuildLeaderB ~= varObj then
                SetSceneMapDataFlagToPlayer( varMap,varObj,13,8,b_leader_name,b_leader_x,b_leader_z,-1)
            end
        end
    end
end




function x310113_ProcSyncZhuQueBattleTime( varMap,nTime )
    
    if x310113_GetZhuQueBattleSceneScript( varMap ) == 0 then
        return
    end

    local nTime_new = x310113_var_TotalBattleTime - NumberCastIntToUInt( nTime )
    x310113_var_CountTime[varMap] = nTime_new

    
    
    x310113_SyncBattleTimeToAllPlayer( varMap, nTime_new )
end




function x310113_SetAllPlayerNeedKick( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown <= 0 or KickDown > x310113_var_Kick_Down then                
                SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,x310113_var_Kick_Down) 
            end
        end
    end
end




function x310113_UpdatePlayerKickState( varMap )
    
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
                    x310113_ZhuQueBattleKickPlayer( varMap,varObj )                    
                else
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,KickDown) 
                end
            end
        end
    end
end
