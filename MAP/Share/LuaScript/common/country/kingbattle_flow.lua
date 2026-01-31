
x300813_var_FileId                      = 300813
x300813_var_TotalBattleTime               = 60 * 20     	


x300813_var_SceneName                     = { {Name="zhanchang_guowangzhanchang/zhanchang_guowangzhanchang.scn",Script=300813} }

x300813_var_King_Signup                  = 2     
x300813_var_King_WaitBattle              = 3     
x300813_var_King_BeginBattle             = 4     
x300813_var_King_EndBattle               = 5     


x300813_var_MaxScore                     = 49	            
x300813_var_BonusTips                    = "#G您获得了#R%d#G点经验,#R%d#G点帮会贡献,#R%d#G帮会经验!" 
x300813_var_BonusTips1                   = "您获得了奖励" 



x300813_var_WinPrise                     = 1000*0.5*20              
x300813_var_LosePrise                    = 1000*0.1*20              
x300813_var_DeucePrise                   = 1000*0.3*20              


x300813_var_WinBangGong                  = 25

x300813_var_DeuceBangGong                = 20


x300813_var_WinBangExp                   = 2
x300813_var_LoseBangExp                  = 2
x300813_var_DeuceBangExp                 = 2

x300813_var_Guild_Camp_A                 = 5
x300813_var_Guild_Camp_B                 = 6

x300813_var_Leader_Index                 = 5

x300813_var_Kick_Down                    = 8






function x300813_GetKingBattleSceneScript( varMap )

    local varName = GetBattleSceneName(varMap)
    for varI,item in x300813_var_SceneName do
        if varName == item.Name then
            return item.Script
        end
    end

    return 0
end





function x300813_ProcBattleStateEvent( varMap, varState  )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_KINGBATTLE ) == 0 then
        return
    end


	local varMapType = GetSceneType(varMap);
	if varMapType == 0 then 

        if varState == x300813_var_King_Signup then

            
            local selfStatus = GetKingBattleStatus(varMap)
            if selfStatus ~= STATE_KING_BATTLE_SIGNUP then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_SIGNUP,varMap=%d ",varMap  )
                WriteLog(1,varMsg)

            end
            
            
            SetKingBattleStatus(varMap,STATE_KING_BATTLE_SIGNUP)
            
        elseif varState == x300813_var_King_WaitBattle then

            
            local selfStatus = GetKingBattleStatus(varMap)
            if selfStatus ~= STATE_KING_BATTLE_SIGNUP_FINISH then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_SIGNUP_FINISH,varMap=%d ",varMap )
                WriteLog(1,varMsg)

            end
            
            
            SetKingBattleStatus(varMap,STATE_KING_BATTLE_SIGNUP_FINISH)
            
        elseif varState == x300813_var_King_BeginBattle then

            
            local selfStatus = GetKingBattleStatus(varMap)
            if selfStatus == STATE_KING_BATTLE_BATTLE then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_BATTLE,varMap=%d ",varMap )
                WriteLog(1,varMsg)

            end
            
            
		    SetKingBattleStatus(varMap,STATE_KING_BATTLE_BATTLE)
            SetKingBattleEnterSceneFlag( varMap,1)

        elseif varState == x300813_var_King_EndBattle then
            
            
            SetKingBattleStatus(varMap,STATE_KING_BATTLE_BATTLE_FINISH)

            
            local varMsg = format("KBL:STATE_KING_BATTLE_BATTLE_FINISH, varMap=%d",varMap )
            WriteLog(1,varMsg)

        end

	elseif varMapType == 2 then 
        
        
        local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
        if  varScriptFileId == 0 then
            return
        end

        if varState == x300813_var_King_Signup then

            
            local selfStatus = GetKingBattleStatus(varMap)
            if selfStatus ~= STATE_KING_BATTLE_READY then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_SIGNUP,varMap=%d,2 ",varMap  )
                WriteLog(1,varMsg)

            end

            KingBattleAskInit( varMap )                                               
            SetKingBattleStatus(varMap,STATE_KING_BATTLE_READY)                      


            
            SetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_SCRIPT,KINGBATTLE_FLOW_SCRIPT)

        elseif varState == x300813_var_King_WaitBattle then

            
            local selfStatus = GetKingBattleStatus(varMap)
            if selfStatus ~= STATE_KING_BATTLE_SIGNUP_FINISH then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_SIGNUP_FINISH,varMap=%d,2",varMap )
                WriteLog(1,varMsg)

            end

            
            SetKingBattleStatus(varMap,STATE_KING_BATTLE_SIGNUP_FINISH)
            SetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_SCRIPT,KINGBATTLE_FLOW_SCRIPT)

        elseif varState == x300813_var_King_BeginBattle then

            
            local selfStatus = GetKingBattleStatus(varMap)
            if selfStatus ~= STATE_KING_BATTLE_BATTLE then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_BATTLE,varMap=%d,2",varMap )
                WriteLog(1,varMsg)

            end

            
            SetKingBattleStatus(varMap,STATE_KING_BATTLE_BATTLE)                     
            SetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_SCRIPT,KINGBATTLE_FLOW_SCRIPT)
            SetKingBattleEnterSceneFlag( varMap,1)

            x300813_ProcBattleSceneReady( varMap,( x300813_var_TotalBattleTime) )

        elseif varState == x300813_var_King_EndBattle then

            local nState = GetKingBattleStatus( varMap )
            if nState > STATE_KING_BATTLE_BATTLE or nState < STATE_KING_BATTLE_READY then
                
                
                local varMsg = format("KBL:STATE_KING_BATTLE_BATTLE_FINISH,Result:nState > STATE_KING_BATTLE_BATTLE or nState < STATE_KING_BATTLE_READY  varMap=%d,varState=%d,2",varMap, nState )
                WriteLog(1,varMsg)

                
                x300813_ProcBattleSceneClose( varMap )

                
                local varMsg = format("KBL:STATE_KING_BATTLE_BATTLE_FINISH, varMap=%d,2",varMap )
                WriteLog(1,varMsg)
                return
            end

            
    		SetKingBattleStatus(varMap,STATE_KING_BATTLE_BATTLE_FINISH)
            x300813_ProcBattleSceneClose( varMap )

            
            local varMsg = format("KBL:STATE_KING_BATTLE_BATTLE_FINISH, varMap=%d,2",varMap )
            WriteLog(1,varMsg)
        end
	end
end




function x300813_ProcMapTimerTick( varMap,varTime )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
       
    x300813_ProcBattleSceneTimer( varMap, varTime)
end





function x300813_ProcPlayerEnter( varMap, varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local varStatus = GetKingBattleStatus( varMap )
    if varStatus ~= STATE_KING_BATTLE_BATTLE then
    
        
        
        x300813_SetAllPlayerNeedKick( varMap )
        
        local varMsg = format("KBL:x300813_ProcBattlePlayerEnter Kick,Player,varMap=%d,varPlayer=%d varStatus=%d",varMap,varPlayer,varStatus )
        WriteLog(1,varMsg)
        return
    end


    
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nSendCCamp = -1
    if nGuildId == nGuildA then
        nSendCCamp = 0
    elseif nGuildId == nGuildB then
        nSendCCamp = 1
    else
        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,x300813_var_Kick_Down) 
        
        local varMsg = format("KBL:x300813_ProcBattlePlayerEnter Kick 2,Player,varMap=%d,varPlayer=%d",varMap,varPlayer )
        WriteLog(1,varMsg)
        return

    end

    
    SetKingBattleDisable(varMap, varPlayer, 0, nSendCCamp )

    local strGuildA = GetGuildName( nGuildA )
    local strGuildB = GetGuildName( nGuildB )

    SendKingBattleInfo( varMap, varPlayer, strGuildA, strGuildB )

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,0)

    
    
    if nGuildId == nGuildA then
        SetCurCamp(varMap,varPlayer,x300813_var_Guild_Camp_A)
        SetPos(varMap,varPlayer,50,204)

    elseif nGuildId == nGuildB then
        SetCurCamp(varMap,varPlayer,x300813_var_Guild_Camp_B)
        SetPos(varMap,varPlayer,206,48)
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




function x300813_ProcPlayerLeave( varMap, varPlayer )
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local nCountryId = GetCurCountry(varMap,varPlayer )
    SetCurCamp( varMap,varPlayer,nCountryId )

    SetKingBattleDisable(varMap, varPlayer,1,-1)
end




function x300813_ProcPlayerLeaveGuild( varMap,varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
    
    x300813_KingBattleKickPlayer( varMap,varPlayer )
    SetKingBattleDisable(varMap, varPlayer,1,-1)

end




function x300813_ProcSetKingBattleMatchInfo( varMap,nGuildA,nGuildB,nCountryId )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    SetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD, nGuildA )
    SetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD, nGuildB )
    SetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_COUNTRYID, nCountryId )

    
    local a = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local b = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )
    local c = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_COUNTRYID )

    local varMsg = format( "KBL:KING_BATTLE_MATCHINFO:varMap=%d,A=%d,B=%d,CountryId=%d", varMap, a, b,c )
    WriteLog(1,varMsg)
end




function x300813_ProcPlayerNewConnectEnter( varMap, varPlayer )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local BattleSceneFlag = GetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG)
    if BattleSceneFlag == 0 then

        
        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN,x300813_var_Kick_Down)

        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "ErrorName"
        end
        local varMsg = format( "KBL:x300813_ProcPlayerNewConnectEnter 0,need kick,varMap=%d,varPlayer=%d,varName=%s", varMap, varPlayer, varName )
        WriteLog(1,varMsg)

    else

        
        
        
        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "ErrorName"
        end
        local varMsg = format( "KBL:x300813_ProcPlayerNewConnectEnter 1,varMap=%d,varPlayer=%d,varName=%s", varMap, varPlayer, varName )
        WriteLog(1,varMsg)

        SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,0)

    end

    
end




function x300813_ProcPlayerDie( varMap, varPlayer, varKiller  )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
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

        local varStr = format("#G%s在国王战场中被杀死%d次。",GetName(varMap,varPlayer ),nBeKilled )
        LuaThisScenceM2Wrold(varMap,varStr,3,1)
        LuaThisScenceM2Wrold(varMap,varStr,2,1)
    end

    
    if nBeKilled == 6 then

        local nCountryId = GetCurCountry( varMap,varPlayer)

        local varStr = format("#G%s在国王战场中，死亡次数已满，被迫离开战场。",GetName(varMap,varPlayer ) )
        LuaAllScenceM2Country(varMap,varStr,nCountryId,3,1)
        LuaAllScenceM2Country(varMap,varStr,nCountryId,2,1)

        
	    
	    
	    

        

        
        local KickDown = GetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ) 
        if KickDown <= 0 or KickDown > 4 then
            SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,4) 
        end
    end

end




function x300813_CheckPlayerState( varMap,varPlayer )
    

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




function x300813_ProcKingBattleChangeScene( varMap,varPlayer,newSceneID,Flag )
    

    
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
		    SetPos( varMap , varPlayer , 50 , 204 )
        else
            SetPos( varMap , varPlayer , 206,48 )
        end
	else
        
        
        local varState,varMsg = x300813_CheckPlayerState( varMap,varPlayer )
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

		NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ,300813 )
	end
end

function x300813_DoPlayerRelive( varMap, varPlayer )
	
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


function x300813_ProcPlayerRelive( varMap, varPlayer )

    
    local varScriptFileId = x300813_GetKingBattleSceneScript( varMap )
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
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

    if nGuildId == nGuildA then

        x300813_ProcKingBattleChangeScene(varMap,varPlayer,varMap,0)
    else
        x300813_ProcKingBattleChangeScene(varMap,varPlayer,varMap,1)
    end

end





function x300813_ProcBattleSceneReady( varMap,totalTime )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_STATE,-1 )
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_TIME,10 )

    
    
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_ITME,totalTime )

end

function x300813_ProcBattleSceneClose( varMap )

    if GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_COUNT_DOWN_STATE) == 1 then
        return
    end

    local varStatus = GetKingBattleStatus( varMap )
	if varStatus == STATE_KING_BATTLE_BATTLE_FINISH then
		x300813_BattleGenResult( varMap,0 )
	end


end




function x300813_ProcBattleSceneTimer( varMap,varTime )

    
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    x300813_UpdatePlayerKickState( varMap )

    local BattleStatus = GetKingBattleStatus(varMap)
    if BattleStatus ~= STATE_KING_BATTLE_BATTLE then
        return
    end

    
    
    local nTime = GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_COUNT_ITME ) - 1
    SetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_COUNT_ITME,nTime )

    
    
    if GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_COUNT_DOWN_STATE) == 1 then

	    
	    local time = GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_COUNT_DOWN_TIME)
	    if time > 0 then

		    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_TIME,time-1 )

		    local varStr = format("#G国王战场结束,#R%d秒#G后战场自动关闭",time)

		    LuaThisScenceM2Guild(varMap,varStr,GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_A_GUILD),3,1)
		    LuaThisScenceM2Guild(varMap,varStr,GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_B_GUILD),3,1)

		else

		    
	    	SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_STATE,-1 )
            
            
            x300813_RestoreAllPlayerCamp( varMap )
	    	x300813_KingBattleKickAllPlayer(varMap)

		 	
			
			ClearKingBattleSceneData(varMap)
            
            
            local varMsg = format("KBL:x300813_ProcBattleSceneTimer KingBattleFinished,varMap=%d,LeaveTime h= %d,m=%d",varMap, floor(nTime/60),mod(nTime,60) )
            WriteLog(1,varMsg)

	    end

	    return

	end

    
    
    if nTime < 18*60 then
        local bIsFinished = x300813_CheckIsFinished( varMap)
        if bIsFinished == 1 then
            
            local varStatus = GetKingBattleStatus( varMap )
            if varStatus == STATE_KING_BATTLE_BATTLE then

                x300813_BattleGenResult( varMap,1 )
                return
            end

        end
    end
	

    
    
    
    x300813_SyncGuildPower( varMap )

    
    x300813_UpdateSceneDataFlag( varMap )

end





function x300813_CheckIsFinished( varMap )

    
    
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

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





function x300813_GetWinner(varMap)

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return -1
    end

    
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

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
	        if pos == x300813_var_Leader_Index then
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




function x300813_BattleBonus( varMap,varPlayer,battleResult )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

end




function x300813_KingBattleBonus( varMap ,battleResult )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            x300813_BattleBonus( varMap,varObj,battleResult)
        end
    end
end





function x300813_RestorePlayerCamp( varMap,varPlayer )
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCurCamp(varMap,varPlayer,nCountryId )
end




function x300813_RestoreAllPlayerCamp( varMap )

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




function x300813_BattleGenResult( varMap, callerId  )
    
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

    local nCountryId = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_COUNTRYID )

    if nGuildA == nGuildB then
        return
    end

    local nWinner = x300813_GetWinner( varMap )
    if nWinner == 0 then
        

        local strGuildName = GetGuildName(nGuildA)
        local strGuildLeaderName = GetGuildLeaderName(nGuildA)
        
        local varStr = format("#G%s帮会获得%s国王战场的胜利，%s坐上了国王的宝座。",strGuildName,GetCountryName(nCountryId),strGuildLeaderName)
        LuaAllScenceM2Wrold(varMap, varStr, 2, 1)
        LuaAllScenceM2Wrold(varMap, varStr, 3, 1)

        SendKingBattleResultToGL( nCountryId,1,nGuildA,nGuildB)

    else
        
        local strGuildName = GetGuildName(nGuildB)
        
        local varStr = format("#G%s帮会团结一致的顶住了挑战，卫冕了%s国王的宝座。  ",strGuildName,GetCountryName(nCountryId) )
        local nKingGuildID = GetCountryKingGuildIdNM( nCountryId )
        if nKingGuildID < 0 then
        	
        	local strGuildLeaderName = GetGuildLeaderName(nGuildB)
        	varStr = format("#G%s帮会获得%s国王战场的胜利，%s坐上了国王的宝座。",strGuildName,GetCountryName(nCountryId),strGuildLeaderName)
        end
        LuaAllScenceM2Wrold(varMap, varStr, 2, 1)
        LuaAllScenceM2Wrold(varMap, varStr, 3, 1)

        SendKingBattleResultToGL( nCountryId,0,nGuildA,nGuildB)
    end

    
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_STATE,1 )
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_TIME,10 )

    local nTime = GetKingBattleSceneData_Param(varMap,LD_KING_BATTLE_COUNT_ITME )
        
    
    local varMsg = format("KBL:x300813_BattleGenResult varMap=%d,LeaveTime h= %d,m=%d,CallerId=%d nWinner=%d,GuildA=%d,varName=%s,GuildB=%d,varName=%s",varMap, floor(nTime/60),mod(nTime,60), callerId,nWinner,nGuildA,GetGuildName(nGuildA),nGuildB,GetGuildName(nGuildB) )
    WriteLog(1,varMsg)

    SetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD,-1 )
    SetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD,-1 )

    x300813_SetAllPlayerNeedKick(varMap)
    ClearKingBattleSceneData(varMap)
    
end




function x300813_KingBattleKickPlayer( varMap,varPlayer )

    x300813_DoPlayerRelive( varMap,varPlayer )

    x300813_RestorePlayerCamp( varMap,varPlayer)

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,0)

    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        NewWorld(varMap,varPlayer,nBakSceneId,varX,z,300813)
        return
    end

    
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        
        
        local nDestSceneId = 50
        local nPosX = 188
        local nPosZ = 39

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300813)

    elseif varCountry == 1 then
        
        
        local nDestSceneId = 150
        local nPosX = 187
        local nPosZ = 49

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300813)

    elseif varCountry == 2 then

        
        local nDestSceneId = 250
        local nPosX = 78
        local nPosZ = 217

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300813)

    elseif varCountry == 3 then
        
        
        local nDestSceneId = 350
        local nPosX = 65
        local nPosZ = 209

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300813)

    end
end




function x300813_KingBattleKickAllPlayer( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            x300813_KingBattleKickPlayer( varMap,varObj)

        end
    end
end





function x300813_SyncBattleTimeToAllPlayer( varMap ,nTime )

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




function x300813_SyncBattleTimeCloseToAllPlayer(varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);                 
        end
    end    

end




function x300813_SyncGuildPower( varMap )
    
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

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
            SyncKingBattlePowerInfo(varMap,varObj,nGuildA_Count,nGuildB_Count)
        end
    end

end




function x300813_UpdateSceneDataFlag( varMap )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    ClearSceneMapDataFlag( varMap )

	SetSceneMapDataFlag( varMap,10,8,"斯拉夫联军传送者",47.8,220,-1)
	SetSceneMapDataFlag( varMap,11,8,"亚洲联军传送者",210.5,30,-1)

    
    local GuildLeaderA = -1
    local GuildLeaderB = -1
    
    local nGuildA = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_A_GUILD )
    local nGuildB = GetKingBattleSceneData_Param( varMap, LD_KING_BATTLE_B_GUILD )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x300813_var_Leader_Index then
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




















































function x300813_ProcSyncKingBattleTime( varMap,nTime )
    
    if x300813_GetKingBattleSceneScript( varMap ) == 0 then
        return
    end

    local nTime_new = x300813_var_TotalBattleTime - NumberCastIntToUInt( nTime )
    SetKingBattleSceneData_Param(varMap, LD_KING_BATTLE_COUNT_ITME, nTime_new )

    
    
    x300813_SyncBattleTimeToAllPlayer( varMap, nTime_new )
end




function x300813_SetAllPlayerNeedKick( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown <= 0 or KickDown > x300813_var_Kick_Down then                
                SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,x300813_var_Kick_Down) 
            end
        end
    end
end




function x300813_UpdatePlayerKickState( varMap )
    
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
                    x300813_KingBattleKickPlayer( varMap,varObj )                    
                else
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,KickDown) 
                end
            end
        end
    end
end
