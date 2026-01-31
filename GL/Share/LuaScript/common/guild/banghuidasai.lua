
x300643_var_FileId                      = 300643
x300643_var_TotalBattleTime               = 60 * 20     	


x300643_var_SceneName                     = "zhanchang_banghuizhanchang/zhanchang_banghuizhanchang.scn"
x300643_var_MatchOdd                      = "#R您所在的帮会在本次帮会战中轮空！"

x300643_var_Guild_Signup                  = 3     
x300643_var_Guild_WaitBattle              = 4     
x300643_var_Guild_BeginBattle             = 5     
x300643_var_Guild_EndBattle               = 6     


x300643_var_MaxScore                      = 99	            
x300643_var_BonusTips                     = "#G您获得了#R%d#G点经验,#R%d#G点帮会贡献,#R%d#G点帮会经验,#R%d#G点帮会使命点,#R%d#G两帮会金钱!"
x300643_var_BonusTips1                    = "您获得了奖励"


x300643_var_WinPrise                      = 1000*0.5*20              
x300643_var_LosePrise                     = 1000*0.1*20              
x300643_var_DeucePrise                    = 1000*0.3*20              


x300643_var_WinBangGong                   = 150
x300643_var_LoseBangGong                  = 50
x300643_var_DeuceBangGong                 = 100


x300643_var_WinBangExp                    = 5
x300643_var_LoseBangExp                   = 5
x300643_var_DeuceBangExp                  = 5


x300643_var_WinBangshiming                = 2
x300643_var_LoseBangshiming               = 2
x300643_var_DeuceBangshiming              = 2


x300643_var_WinBangjinqian                = 40000
x300643_var_LoseBangjinqian               = 20000
x300643_var_DeuceBangjinqian              = 20000


x300643_var_WinBanggongde                 = 20
x300643_var_LoseBanggongde                = 15
x300643_var_DeuceBanggongde               = 10


x300643_var_Guild_Camp_A                  = 5
x300643_var_Guild_Camp_B                  = 6

x300643_var_Kick_Down                     = 8


x300643_var_ConvoyGrowPointState			= {}
x300643_var_ConvoyGrowPointType			= {}
x300643_var_ConvoyGrowPointPosList		= {{40,125},{30,39},{33,219},{93,46},{93,214},{125,98},{125,150},{161,44},{161,219},{213,218},{216,40},{205,122}}


x300643_var_ScoreIntervalA				= {}
x300643_var_ScoreIntervalB				= {}

x300643_var_BattleFlagA    				= {type=9771, varX=202, z=122.6, ai=7, guid=150031, facedir=0, title=""}		
x300643_var_BattleFlagB    				= {type=9770, varX=48,  z=127.1, ai=7, guid=150030, facedir=0, title=""}		


function x300643_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, varIndex)	
end




function x300643_ProcMapCreate(varMap)
	
	x300643_var_ConvoyGrowPointState[varMap]			= 0
	x300643_var_ConvoyGrowPointType[varMap]			= 114
	

	
	x300643_var_ScoreIntervalA[varMap]				= 0
	x300643_var_ScoreIntervalB[varMap]				= 0
	
end




function x300643_IsGuildBattleScene_Gjs( varMap )

    local varName = GetBattleSceneName(varMap)
    if varName == x300643_var_SceneName then
        return 1
    end

    return 0
end





function x300643_ProcBattleStateEvent( varMap, varState  )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_GUILDBATTLE ) == 0 then
        return
    end

	local varMapType = GetSceneType(varMap);
	if varMapType == 0 then 

        if varState == x300643_var_Guild_Signup then

            
            local selfStatus = GetGuildBattleStatus(varMap)
            if selfStatus ~= STATE_GUILD_BATTLE_SIGNUP then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_SIGNUP,varMap=%d ",varMap  )
                WriteLog(1,varMsg)

            end
            
            
            SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_SIGNUP)
            
        elseif varState == x300643_var_Guild_WaitBattle then

            
            local selfStatus = GetGuildBattleStatus(varMap)
            if selfStatus ~= STATE_GUILD_BATTLE_SIGNUP_FINISH then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_SIGNUP_FINISH,varMap=%d ",varMap )
                WriteLog(1,varMsg)

            end
            
            
            SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_SIGNUP_FINISH)
            
        elseif varState == x300643_var_Guild_BeginBattle then

            
            local selfStatus = GetGuildBattleStatus(varMap)
            if selfStatus == STATE_GUILD_BATTLE_BATTLE then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_BATTLE,varMap=%d ",varMap )
                WriteLog(1,varMsg)

            end
            
            
		    SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_BATTLE)

        elseif varState == x300643_var_Guild_EndBattle then
            
            
            SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_BATTLE_FINISH)

            
            local varMsg = format("GBL:STATE_GUILD_BATTLE_BATTLE_FINISH, varMap=%d",varMap )
            WriteLog(1,varMsg)

        end

	elseif varMapType == 2 then 
        
        
        local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
        if  bBattleScene_Gjs == 0 then
            return
        end

        if varState == x300643_var_Guild_Signup then

            
            local selfStatus = GetGuildBattleStatus(varMap)
            if selfStatus ~= STATE_GUILD_BATTLE_READY then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_SIGNUP,varMap=%d,2 ",varMap  )
                WriteLog(1,varMsg)

            end

            GuildBattleAskInit( varMap )                                               
            SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_READY)                      


            
            SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_SCRIPT,GUILDBATTLE_SCRIPTID)

        elseif varState == x300643_var_Guild_WaitBattle then

            
            local selfStatus = GetGuildBattleStatus(varMap)
            if selfStatus ~= STATE_GUILD_BATTLE_SIGNUP_FINISH then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_SIGNUP_FINISH,varMap=%d,2",varMap )
                WriteLog(1,varMsg)

            end

            
            SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_SIGNUP_FINISH)
            SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_SCRIPT,GUILDBATTLE_SCRIPTID)

        elseif varState == x300643_var_Guild_BeginBattle then

            
            local selfStatus = GetGuildBattleStatus(varMap)
            if selfStatus ~= STATE_GUILD_BATTLE_BATTLE then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_BATTLE,varMap=%d,2",varMap )
                WriteLog(1,varMsg)

            end

            
            SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_BATTLE)                     
            SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_SCRIPT,GUILDBATTLE_SCRIPTID)

            x300643_ProcBattleSceneReady( varMap,( x300643_var_TotalBattleTime ) )

        elseif varState == x300643_var_Guild_EndBattle then

            local nState = GetGuildBattleStatus( varMap )
            if nState > STATE_GUILD_BATTLE_BATTLE or nState < STATE_GUILD_BATTLE_READY then
                
                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_BATTLE_FINISH,Result:nState > STATE_GUILD_BATTLE_BATTLE or nState < STATE_GUILD_BATTLE_READY  varMap=%d,varState=%d,2",varMap, nState )
                WriteLog(1,varMsg)

                
                x300643_ProcBattleSceneClose(varMap )

                
                local varMsg = format("GBL:STATE_GUILD_BATTLE_BATTLE_FINISH, varMap=%d,2",varMap )
                WriteLog(1,varMsg)
                return
            end

            
    		SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_BATTLE_FINISH)
            x300643_ProcBattleSceneClose( varMap )

            
            local varMsg = format("GBL:STATE_GUILD_BATTLE_BATTLE_FINISH, varMap=%d,2",varMap )
            WriteLog(1,varMsg)
        end
	end
end




function x300643_ProcMapTimerTick( varMap,varTime )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end
       
    x300643_ProcBattleSceneTimer( varMap, varTime )
end





function x300643_ProcPlayerEnter( varMap, varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end

    local varStatus = GetGuildBattleStatus( varMap )
    if varStatus ~= STATE_GUILD_BATTLE_BATTLE then

        x300643_SetAllPlayerNeedKick( varMap,x300643_var_Kick_Down )
        
        local varMsg = format("GBL:x300643_ProcBattlePlayerEnter Kick,Player,varMap=%d,varPlayer=%d varStatus=%d",varMap,varPlayer,varStatus )
        WriteLog(1,varMsg)
        return
    end

    
    local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nSendCCamp = -1
    if nGuildId == nGuildA then
        nSendCCamp = 0
    elseif nGuildId == nGuildB then
        nSendCCamp = 1
    else

        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,x300643_var_Kick_Down) 
        
        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "<ErrorName>"
        end
        local varMsg = format("GBL:x300643_ProcBattlePlayerEnter Kick 2,Player,varMap=%d,varPlayer=%d,varName=%s,guild=%d,guildA=%d,guildB=%d",varMap, varPlayer,varName, nGuildId, nGuildA, nGuildB )
        WriteLog(1,varMsg)
        return

    end

    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_REFRESH_MAP,1)

    
    SetGuildBattleDisable(varMap, varPlayer, 0,nSendCCamp )
    
    
    local strGuildA_name = GetGuildName(nGuildA)
    local strGuildB_name = GetGuildName(nGuildB)
    SendGuildBattleMatchInfo(varMap,varPlayer,strGuildA_name,strGuildB_name)

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_BEKILLED,0)
    SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_KILLEDOTHER,0)
    SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_GETFLAG,0)

    
    if nGuildId == nGuildA then
        SetCurCamp(varMap,varPlayer,x300643_var_Guild_Camp_A)
        SetPos(varMap,varPlayer,234,126)
    elseif nGuildId == nGuildB then
        SetCurCamp(varMap,varPlayer,x300643_var_Guild_Camp_B)
        SetPos(varMap,varPlayer,21,126)
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




function x300643_ProcPlayerLeave( varMap, varPlayer )
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end

    local nCountryId = GetCurCountry(varMap,varPlayer )
    SetCurCamp( varMap,varPlayer,nCountryId )

    SetGuildBattleDisable(varMap, varPlayer,1,0)

    
    local owner = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_OWNER)
    if owner == varPlayer then
        CancelSpecificImpact(varMap,owner,LD_GUILD_BATTLE_DEC_SPEED_BUF )
        CancelSpecificImpact(varMap,owner,LD_GUILD_BATTLE_INC_DEFENCE_BUF )
        
        SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1 )

        local varX,varY = GetWorldPos(varMap, varPlayer)
        
        SetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,varX,varY)
        
        SetGrowPointIntervalContainer(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,1)
    end
end




function x300643_ProcPlayerLeaveGuild( varMap,varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end
    
    
    local owner = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_OWNER)
    if owner == varPlayer then
        CancelSpecificImpact(varMap,owner,LD_GUILD_BATTLE_DEC_SPEED_BUF )
        CancelSpecificImpact(varMap,owner,LD_GUILD_BATTLE_INC_DEFENCE_BUF )
        SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1 )

        local varX,varY = GetWorldPos(varMap, varPlayer)
        
        SetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,varX,varY)
        
        SetGrowPointIntervalContainer(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,1)
    end
    
    x300643_GuildBattleKickPlayer( varMap,varPlayer )
    SetGuildBattleDisable(varMap, varPlayer,1,0)

end




function x300643_ProcPlayerDie( varMap, varPlayer, varKiller  )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end

    local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
    if IsHaveFlag ~= 0 then

        
        SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1 )
        CancelSpecificImpact(varMap,varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
        CancelSpecificImpact(varMap,varPlayer,LD_GUILD_BATTLE_INC_DEFENCE_BUF )

        local ObjType = GetObjType(varMap, varKiller)

        
        if IsPlayerStateNormal( varMap,varKiller ) == 1 and IsPlayerMutexState(varMap,varKiller,PLAYER_STATE_DIE) ~= 1 and GetDist(varMap,varPlayer,varKiller,30) <= 30  then
            SendSpecificImpactToUnit(varMap, varKiller,varKiller,varKiller,LD_GUILD_BATTLE_DEC_SPEED_BUF,0)
            SendSpecificImpactToUnit(varMap, varKiller,varKiller,varKiller,LD_GUILD_BATTLE_INC_DEFENCE_BUF,0)

            SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,varKiller )  
            ReCallHorse( varMap, varKiller )

            local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
            local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

            local nGuildId = GetGuildID( varMap,varKiller )

            
            local nFlag = -1
            if nGuildId == nGuildA then
                nFlag = 0
            elseif nGuildId == nGuildB then
                nFlag = 1
            end

            
            if nFlag == 0 then
                
                LuaThisScenceM2Wrold(varMap,"蓝方夺取了战旗",2,1)
                LuaThisScenceM2Wrold(varMap,"蓝方夺取了战旗",3,1)

            elseif nFlag == 1 then
                
                LuaThisScenceM2Wrold(varMap,"红方夺取了战旗",2,1)
                LuaThisScenceM2Wrold(varMap,"红方夺取了战旗",3,1)
            end
        
        
        else

            local varX,varY = GetWorldPos( varMap, varPlayer )
            SetGrowPointPos( varMap, LD_GUILD_BATTLE_FLAG_GROW_POINT, varX+1, varY+1)
            SetGrowPointIntervalContainer( varMap, LD_GUILD_BATTLE_FLAG_GROW_POINT, 1000 )
            SetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_FLAG_OWNER, -1 )

            x300643_UpdateSceneDataFlag( varMap, 7 )
        end
    end

   
   local nKilledOther = GetPlayerRuntimeData( varMap, varKiller, RD_GUILDBATTLE_KILLEDOTHER ) + 1
   SetPlayerRuntimeData( varMap, varKiller, RD_GUILDBATTLE_KILLEDOTHER, nKilledOther )

   
   local nBeKilled = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_BEKILLED ) + 1
   SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_BEKILLED,nBeKilled)

end





function x300643_ProcPlayerRelive( varMap, varPlayer )

    
    local bBattleScene = x300643_IsGuildBattleScene_Gjs( varMap )
    if bBattleScene == 0 then
        return
    end
    
    
    local varStatus = GetGuildBattleStatus( varMap )
	if varStatus ~= STATE_GUILD_BATTLE_BATTLE then
        
        local KickDown = GetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ) 
        if KickDown <= 0 or KickDown > 8 then                
            SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,8 ) 
        end
        
        return
    end

    
    local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local varFlag = -1
    if nGuildId == nGuildA then
        varFlag = 0
    elseif nGuildId == nGuildB then
        varFlag = 1
    end
    
    
    LuaCallNoclosure(800021,"ProcGuildBattleChangeScene",varMap,varPlayer,varMap,varFlag)

end




function x300643_ProcGuildBattleMatchOdd( varMap, varPlayer )

    local varName = GetName(varMap,varPlayer)
    LuaScenceM2Player(varMap,  varPlayer, x300643_var_MatchOdd, varName , 2,1)
    LuaScenceM2Player(varMap,  varPlayer, x300643_var_MatchOdd, varName , 3,1)
end




function x300643_ProcRideHorse( varMap,varPlayer )
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 1
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return 1
    end

    
    local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
    if IsHaveFlag ~= 0 then
        return 0
    end

    
    return 1
end




function x300643_ProcSetGuildBattleMatchInfo( varMap,nGuildA,nGuildB )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end

    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD, nGuildA )
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD, nGuildB )

    
    local a = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD )
    local b = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD )

    local varMsg = format( "GBL:GUILD_BATTLE_MATCHINFO:varMap=%d,A=%d,B=%d",varMap,a,b )
    WriteLog(1,varMsg)
end




function x300643_ProcPlayerNewConnectEnter( varMap,varPlayer )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end

    AskGuildBattleEnter(varMap,varPlayer)

end

function x300643_ProcPlayerAskLeave( varMap,varPlayer )
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return 
    end

    
    local bBattleScene_Gjs = x300643_IsGuildBattleScene_Gjs( varMap )
    if  bBattleScene_Gjs == 0 then
        return
    end

    x300643_ProcPlayerAskLeaveGuildBattle( varMap, varPlayer )

end

function x300643_ProcDie(varMap, varPlayer, varKiller)
	if varPlayer == GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_A_ID) then
	
		SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE,200)
    	SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_BATTLE_FINISH)
        x300643_ProcBattleSceneClose( varMap )
        local varMsg = format("GBL:FLAG A DIE, STATE_GUILD_BATTLE_BATTLE_FINISH, varMap=%d,2",varMap )
        WriteLog(1,varMsg)
	elseif varPlayer == GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_B_ID) then
		SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE,200)
		SetGuildBattleStatus(varMap,STATE_GUILD_BATTLE_BATTLE_FINISH)
        x300643_ProcBattleSceneClose( varMap )
     
        local varMsg = format("GBL:FLAG B DIE, STATE_GUILD_BATTLE_BATTLE_FINISH, varMap=%d,2",varMap )
        WriteLog(1,varMsg)
	end
end

function x300643_CreateBattleFlags( varMap )

	local FlagAID,FlagBID
 	if x300643_var_BattleFlagA.title~="" then
		FlagAID = CreateMonster(varMap, x300643_var_BattleFlagA.type, x300643_var_BattleFlagA.varX, x300643_var_BattleFlagA.z, x300643_var_BattleFlagA.ai, 0, x300643_var_FileId, x300643_var_BattleFlagA.guid, x300643_var_Guild_Camp_A,-1,x300643_var_BattleFlagA.facedir,  "", x300643_var_BattleFlagA.title)
		
	else
		FlagAID = CreateMonster(varMap, x300643_var_BattleFlagA.type, x300643_var_BattleFlagA.varX, x300643_var_BattleFlagA.z, x300643_var_BattleFlagA.ai, 0, x300643_var_FileId, x300643_var_BattleFlagA.guid, x300643_var_Guild_Camp_A,-1,x300643_var_BattleFlagA.facedir)
	end
	SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_A_ID, FlagAID)
	if x300643_var_BattleFlagB.title~="" then
		FlagBID = CreateMonster(varMap, x300643_var_BattleFlagB.type, x300643_var_BattleFlagB.varX, x300643_var_BattleFlagB.z, x300643_var_BattleFlagB.ai, 0, x300643_var_FileId, x300643_var_BattleFlagB.guid, x300643_var_Guild_Camp_B,-1,x300643_var_BattleFlagB.facedir,  "", x300643_var_BattleFlagB.title)
	else
		FlagBID = CreateMonster(varMap, x300643_var_BattleFlagB.type, x300643_var_BattleFlagB.varX, x300643_var_BattleFlagB.z, x300643_var_BattleFlagB.ai, 0, x300643_var_FileId, x300643_var_BattleFlagB.guid, x300643_var_Guild_Camp_B,-1,x300643_var_BattleFlagB.facedir)
	end
	SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_B_ID, FlagBID)
	
end


function x300643_DestroyBattleFlags( varMap )
	
	local FlagAID = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_A_ID)
	local FlagBID = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_B_ID)
	
	if IsObjValid(varMap,FlagAID) == 1 and GetHp(varMap,FlagAID) > 0 then
		DeleteMonster(varMap,FlagAID)
	end
	
	if IsObjValid(varMap,FlagBID) == 1 and GetHp(varMap,FlagBID) > 0 then
		DeleteMonster(varMap,FlagBID)
	end
	
end

function x300643_ProcBattleSceneReady( varMap,totalTime )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN1_GUILD,-1)
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN2_GUILD,-1)
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN3_GUILD,-1)
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN4_GUILD,-1)
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1)

    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE,-1 )
    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_DOWN_TIME,10 )

    
    SetGrowPointIntervalContainer(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,1)

    RecycleGrowPointByType( varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,2000)
    SetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,LD_GUILD_BATTLE_FLAG_X,LD_GUILD_BATTLE_FLAG_Y)

    
    SetSceneMapDataFlag( varMap,5,1,"仓库",219,122.6,-1)
    SetSceneMapDataFlag( varMap,6,2,"仓库",34, 127.1,-1)

    
    SetGuildBattleSceneData_Param(varMap, LD_GUILD_BATTLE_REFRESH_MAP,1)

    
    
    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_TIME,-1 )

    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_ITME,totalTime )
    
    
    x300643_var_ConvoyGrowPointState[varMap] = 0
    x300643_ResetConvoyGrowPoint(varMap,0)
    
    
    x300643_var_ScoreIntervalA[varMap] = 0
	x300643_var_ScoreIntervalB[varMap] = 0
	
	
	x300643_CreateBattleFlags(varMap)
end

function x300643_ProcBattleSceneClose( varMap )

    if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE) == 1 then
        return
    end

    local varStatus = GetGuildBattleStatus( varMap )
	if varStatus == STATE_GUILD_BATTLE_BATTLE_FINISH then
		x300643_BattleGenResult( varMap,0 )
        SendGuildBattleFinishedToGL( varMap )
	end
end

function x300643_GetBattleState( varMap )
    
    local down_state = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE)
    local down_time  = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_DOWN_TIME)

    if down_state == -1  and down_time <= 0 then
        return 0
    end

    return 1

end

function x300643_GetBattleDownState( varMap )
    
    local down_state = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE)

    if down_state == 1 then
        return 0
    end

    return 1

end

function x300643_CheckBattleState( varMap )
    
    if x300643_GetBattleState(varMap) == 0 then
        return 0
    end

    if x300643_GetBattleDownState(varMap) == 0 then
        return 0
    end

    return 1

end




function x300643_ProcBattleSceneTimer( varMap,varTime )

    
    
    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    x300643_UpdatePlayerKickState( varMap )


    local varStatus = GetGuildBattleStatus( varMap )
	if varStatus ~= STATE_GUILD_BATTLE_BATTLE then
        return
    end
    
    
    if x300643_var_ConvoyGrowPointState[varMap] == 0 then
    	
		x300643_ResetConvoyGrowPoint(varMap,1)    	
		x300643_var_ConvoyGrowPointState[varMap] = 1
    end


    
    
    local nTime = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_ITME ) - 1
    SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_ITME,nTime )

    
    
    if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE) == 1 then

	    
	    local time = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_DOWN_TIME)
	    if time > 0 then

		    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_DOWN_TIME,time-1 )

		else

		    
	    	SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE,-1 )
            
            
            x300643_RestoreAllPlayerCamp( varMap )
	    	x300643_GuildBattleKickAllPlayer(varMap)

		 	
			
			ClearGuildBattleSceneData(varMap)
            
            
            local varMsg = format("GBL:x300643_ProcBattleSceneTimer GuildBattleFinished,varMap=%d,LeaveTime m= %d,s=%d",varMap, floor(nTime/60),mod(nTime,60) )
            WriteLog(1,varMsg)

	    end

	    return

	end

    
    if x300643_GetBattleState( varMap) == 0 then
        return
    end

    
    
	local varStatus = GetGuildBattleStatus( varMap )
	if varStatus == STATE_GUILD_BATTLE_BATTLE_FINISH then

		x300643_BattleGenResult( varMap,1 )
        SendGuildBattleFinishedToGL( varMap )
        
        x300643_AddActivity( varMap)
		return
	end

    
    
    local nRefresh =  GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_REFRESH_MAP)
    if nRefresh == 1 then

        SetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_REFRESH_MAP,0)
        
        for varI=1,13 do
        	x300643_UpdateSceneDataFlag( varMap,varI )
        end

    end

    
    
    local owner = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_OWNER)
    if owner ~= -1 then
        x300643_UpdateSceneDataFlag( varMap,7 )
    end


    
    
    x300643_UpdateBarnScore(varMap,0)	 
    x300643_UpdateBarnScore(varMap,1)	 
    x300643_UpdateBarnScore(varMap,2)	 
    x300643_UpdateBarnScore(varMap,3)	 

    
    
    local FlagNumA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_FLAG_NUM)
    local FlagNumB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_FLAG_NUM)

    BroadcastGuildBattleScore(varMap, 0,GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE)+1,FlagNumA+1 )
    BroadcastGuildBattleScore(varMap, 1,GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE)+1,FlagNumB+1 )

    
    
    local FlagTime = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_TIME)

    if FlagTime > 0 then

        SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_TIME,FlagTime-1 )     
        FlagTime = FlagTime - 1
        if FlagTime <= 0 then       

            
            CancelSpecificImpact(varMap,owner,LD_GUILD_BATTLE_DEC_SPEED_BUF )
            CancelSpecificImpact(varMap,owner,LD_GUILD_BATTLE_INC_DEFENCE_BUF )
            

            SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_TIME,-1 )
            SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1 )

            
            RecycleGrowPointByType( varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,2000)
            SetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,LD_GUILD_BATTLE_FLAG_X,LD_GUILD_BATTLE_FLAG_Y)

            
            

            x300643_UpdateSceneDataFlag( varMap,7 )

        end
    end

    
    
    local IsFinished = 0

    local ScoreA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE)
    local ScoreB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE)

    if ScoreA >= x300643_var_MaxScore  or ScoreB>=x300643_var_MaxScore  then

        
        IsFinished = 1

    end

    if IsFinished == 1 then

        x300643_BattleGenResult( varMap,2 )
        SendGuildBattleFinishedToGL( varMap )
        return
    end
    
    
    
    
    x300643_SyncGuildPower(varMap )

end


function x300643_AddActivity( varMap)
    local varHumanCount = GetScenePlayerCount( varMap)
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap, varI)
        if varObj >= 0 then
            
            local varId = GetGuildID( varMap, varObj)
            if varId ~= -1 then
                AddGuildActivity( varMap, varObj, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM8) )
            end
        end
    end
end





function x300643_GetWinner(varMap)

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return -1
    end

    
    local ScoreA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE)
    local ScoreB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE)

    if ScoreA > ScoreB then
        return 0
    elseif ScoreA < ScoreB then
        return 1
    else
        return 2
    end

    return 2

end






function x300643_UpdateBarnScore(varMap,BarnNum)

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

	local Guild1 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN1_GUILD)
	local Guild2 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN2_GUILD)
	local Guild3 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN3_GUILD)
	local Guild4 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN4_GUILD)

    local Guild = Guild1
    if BarnNum == 0 then
        Guild = Guild1
    elseif BarnNum == 1 then
        Guild = Guild2
    elseif BarnNum == 2 then
        Guild = Guild3
    elseif BarnNum == 3 then
        Guild = Guild4
    end


 	local ScoreA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE)
	local ScoreB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE)

    local GuildA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD)
    local GuildB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD)

	local OldTime = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN1_TIME + BarnNum)
  	SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_BARN1_TIME + BarnNum,OldTime+1)

	
	
	local ResPointA = x300643_var_ScoreIntervalA[varMap]
	local ResPointB = x300643_var_ScoreIntervalB[varMap]
	if OldTime >= 10 then
		if Guild1 == Guild2 and Guild1 == Guild3 and Guild1 == Guild4 then
			if GuildA >= 0 and GuildA == Guild1 then 		
				SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_A_SOCRE,ScoreA+4) 
				x300643_var_ScoreIntervalA[varMap] = x300643_var_ScoreIntervalA[varMap] + 8
				BroadcastGuildBattleResourceScore(varMap, 0,x300643_var_ScoreIntervalA[varMap] )
			elseif GuildB >= 0 and GuildB == Guild1 then 	
                SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_B_SOCRE,ScoreB+4)
                x300643_var_ScoreIntervalB[varMap] = x300643_var_ScoreIntervalB[varMap] + 8
                BroadcastGuildBattleResourceScore(varMap, 1,x300643_var_ScoreIntervalB[varMap] )
            end
            
        else

			if GuildA >= 0 and GuildA == Guild then 		
                SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_A_SOCRE,ScoreA+1)
                x300643_var_ScoreIntervalA[varMap] = x300643_var_ScoreIntervalA[varMap] + 1
                BroadcastGuildBattleResourceScore(varMap, 0,x300643_var_ScoreIntervalA[varMap] )
            elseif GuildB >= 0 and GuildB == Guild then 	
                SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_B_SOCRE,ScoreB+1)
                x300643_var_ScoreIntervalB[varMap] = x300643_var_ScoreIntervalB[varMap] + 1
                BroadcastGuildBattleResourceScore(varMap, 1,x300643_var_ScoreIntervalB[varMap] )
			end
		end
		
		
		
		SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_BARN1_TIME + BarnNum,-1 )
	end
	
    































    
  	if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE) > x300643_var_MaxScore  then
  	   SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_A_SOCRE,x300643_var_MaxScore)
  	end

  	if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE) > x300643_var_MaxScore  then
  	   SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_B_SOCRE,x300643_var_MaxScore)
  	end
end




function x300643_UpdateSceneDataFlag( varMap,idx )

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end


    
    local Guild1 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN1_GUILD)
    local Guild2 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN2_GUILD)
    local Guild3 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN3_GUILD)
    local Guild4 = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN4_GUILD)

    local GuidA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD)
    local GuidB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD)

    
    if idx == 1 then
        if Guild1 < 0 then
            SetSceneMapDataFlag( varMap,1,0,"粮仓",19,32,-1)
        else
            if Guild1 == GuidA then
                SetSceneMapDataFlag( varMap,1,2,"粮仓",19,32,-1)
            elseif Guild1 == GuidB then
                SetSceneMapDataFlag( varMap,1,1,"粮仓",19,32,-1)
            else
                SetSceneMapDataFlag( varMap,1,0,"粮仓",19,32,-1)
            end
        end
    end

    
    if idx == 2 then
        if Guild2 < 0 then
            SetSceneMapDataFlag( varMap,2,0,"粮仓",231,33,-1)
        else
            if Guild2 == GuidA then
                SetSceneMapDataFlag( varMap,2,2,"粮仓",231,33,-1)
            elseif Guild2 == GuidB then
                SetSceneMapDataFlag( varMap,2,1,"粮仓",231,33,-1)
            else
                SetSceneMapDataFlag( varMap,2,0,"粮仓",231,33,-1)
            end
        end
    end

    
    if idx == 3 then
        if Guild3 < 0 then
            SetSceneMapDataFlag( varMap,3,0,"粮仓",20,218,-1)
        else
            if Guild3 == GuidA then
                SetSceneMapDataFlag( varMap,3,2,"粮仓",20,218,-1)
            elseif Guild3 == GuidB then
                SetSceneMapDataFlag( varMap,3,1,"粮仓",20,218,-1)
            else
                SetSceneMapDataFlag( varMap,3,0,"粮仓",20,218,-1)
            end
        end
    end

    
    if idx == 4 then
        if Guild4 < 0 then
            SetSceneMapDataFlag( varMap,4,0,"粮仓",233,221,-1)
        else
            if Guild4 == GuidA then
                SetSceneMapDataFlag( varMap,4,2,"粮仓",233,221,-1)
            elseif Guild4== GuidB then
                SetSceneMapDataFlag( varMap,4,1,"粮仓",233,221,-1)
            else
                SetSceneMapDataFlag( varMap,4,0,"粮仓",233,221,-1)
            end
        end
    end

    
    if idx == 5 then
       SetSceneMapDataFlag( varMap,5,4,"仓库",219,122.6,-1)
    end

    
    if idx == 6 then
       SetSceneMapDataFlag( varMap,6,3,"仓库",34,127.1,-1)
    end

    
    if idx == 7 then
        local owner = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_OWNER)
        if owner ~= -1 and IsPlayerStateNormal(varMap,owner) == 1  then

            local nGuildID = GetGuildID(varMap,owner)
            local varX,z = GetWorldPos(varMap,owner)

            if nGuildID == GuidA then
                SetSceneMapDataFlag( varMap,7,6,"旗子",varX,z,-1)
            elseif nGuildID == GuidB then
                SetSceneMapDataFlag( varMap,7,5,"旗子",varX,z,-1)
            else
                local varX,z= GetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT )
                if varX ~= nil and z ~= nil then
                    SetSceneMapDataFlag( varMap,7,7,"旗子",varX,z,-1)
                else
                    SetSceneMapDataFlag( varMap,7,7,"旗子",LD_GUILD_BATTLE_FLAG_X,LD_GUILD_BATTLE_FLAG_Y,-1)
                end
            end

        else

            local varX,z= GetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT )

            if varX ~= nil and z ~= nil then
                SetSceneMapDataFlag( varMap,7,7,"旗子",varX,z,-1)
            else
                SetSceneMapDataFlag( varMap,7,7,"旗子",LD_GUILD_BATTLE_FLAG_X,LD_GUILD_BATTLE_FLAG_Y,-1)
            end
        end
    end

    
    if idx == 8 then
        SetSceneMapDataFlag( varMap,8,8,"帮会战场传送者",17.3,134,-1)
    end

    
    
    
    

    if idx == 10 then
        SetSceneMapDataFlag( varMap,10,8,"帮会战场管理员",237.8,129.8,-1)
    end

    
    if idx == 11 then
        SetSceneMapDataFlag( varMap,11,8,"帮会战场传送者",237.8,115,-1)
    end

    
    
    
    

    if idx == 13 then
        SetSceneMapDataFlag( varMap,13,8,"帮会战场管理员",17.3,120,-1)
    end
end




function x300643_BattleBonus( varMap,varPlayer,battleResult ,nSortID)

    local varMapType = GetSceneType(varMap) ;
    if varMapType ~= 2 then
        return
    end

    local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID(varMap,varPlayer)

    local nGuildFlag = -1

    
    if nGuildId == nGuildA then
        nGuildFlag = 0
    elseif nGuildId == nGuildB then
        nGuildFlag = 1
    end


    local nBonusType = 2

    
    if battleResult == 0 then
        
        if nGuildFlag == 0 then
            nBonusType = 1
        else
            nBonusType = 0
        end

    elseif battleResult == 1 then
        
        if nGuildFlag == 0 then
            nBonusType = 0
        else
            nBonusType = 1
        end
    end

    if nBonusType == 0 then

        local varLevel = GetLevel(varMap,varPlayer)
        local varName = GetName(varMap,varPlayer)
        
        local expNum =varLevel * x300643_var_LosePrise
        local bangGong =  x300643_var_LoseBangGong
        local bangExp = x300643_var_LoseBangExp
		local bangshiming = x300643_var_LoseBangshiming 
		local bangjinqian = x300643_var_LoseBangjinqian
		

        local varMsg = format(x300643_var_BonusTips,expNum,bangGong,bangExp,bangshiming,20)

        LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
        LuaScenceM2Player(varMap, varPlayer, x300643_var_BonusTips1,varName , 3,1)

        AddExp(varMap,varPlayer,expNum)
        AddGuildUserPoint(varMap,varPlayer,bangGong)
        AddGuildExp(varMap,varPlayer,bangExp)
		AddGuildShiMing (varMap,varPlayer,bangshiming)
		AddGuildMoney(varMap,varPlayer,bangjinqian)
		

        
        local nCountryId   = GetCurCountry( varMap, varPlayer )
        local nBeKilled    = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_BEKILLED)
        local nKilledOther = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_KILLEDOTHER)
        local nGetFlag     = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_GETFLAG)

        local varRongYu = nKilledOther*2
        AddHonor(varMap,varPlayer,varRongYu)

        GuildBattleSendPlayerInfo(varMap,varName,nCountryId,nBeKilled,nKilledOther,nGetFlag,varRongYu,expNum,nGuildFlag)

    elseif nBonusType == 1 then

        local varLevel = GetLevel(varMap,varPlayer)
        local varName = GetName(varMap,varPlayer)
        
        local expNum =varLevel * x300643_var_WinPrise
        local bangGong = x300643_var_WinBangGong
        local bangExp =  x300643_var_WinBangExp
		local bangshiming = x300643_var_WinBangshiming
		local bangjinqian = x300643_var_WinBangjinqian
		

        local varMsg = format(x300643_var_BonusTips,expNum,bangGong,bangExp,bangshiming,40)

        LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
        LuaScenceM2Player(varMap, varPlayer, x300643_var_BonusTips1,varName , 3,1)

        AddExp(varMap,varPlayer,expNum)
        AddGuildUserPoint(varMap,varPlayer,bangGong)
        AddGuildExp(varMap,varPlayer,bangExp)
		AddGuildShiMing (varMap,varPlayer,bangshiming)
		AddGuildMoney(varMap,varPlayer,bangjinqian)
		

        
        local nCountryId   = GetCurCountry( varMap, varPlayer )
        local nBeKilled    = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_BEKILLED)
        local nKilledOther = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_KILLEDOTHER)
        local nGetFlag     = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_GETFLAG)

        local varRongYu = nKilledOther*2
        AddHonor(varMap,varPlayer,varRongYu)
        
        GuildBattleSendPlayerInfo(varMap,varName,nCountryId,nBeKilled,nKilledOther,nGetFlag,varRongYu,expNum,nGuildFlag)

    elseif nBonusType == 2 then

        local varLevel = GetLevel(varMap,varPlayer)
        local varName = GetName(varMap,varPlayer)
        
        local expNum =varLevel * x300643_var_DeucePrise
        local bangGong = x300643_var_DeuceBangGong
        local bangExp = x300643_var_DeuceBangExp
		local bangshiming = x300643_var_DeuceBangshiming
		local bangjinqian = x300643_var_DeuceBangjinqian
		

        local varMsg = format(x300643_var_BonusTips,expNum,bangGong,bangExp,bangshiming,20)

        LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
        LuaScenceM2Player(varMap, varPlayer, x300643_var_BonusTips1,varName , 3,1)

        AddExp(varMap,varPlayer,expNum)
        AddGuildUserPoint(varMap,varPlayer,bangGong)
        AddGuildExp(varMap,varPlayer,bangExp)
		AddGuildShiMing (varMap,varPlayer,bangshiming)
		AddGuildMoney(varMap,varPlayer,bangjinqian)
		

        
        local nCountryId   = GetCurCountry( varMap, varPlayer )
        local nBeKilled    = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_BEKILLED)
        local nKilledOther = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_KILLEDOTHER)
        local nGetFlag     = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_GETFLAG)

        local varRongYu = nKilledOther*2
        AddHonor(varMap,varPlayer,varRongYu)
        
        GuildBattleSendPlayerInfo(varMap,varName,nCountryId,nBeKilled,nKilledOther,nGetFlag,varRongYu,expNum,nGuildFlag)

    end
    
    
    
    	
    	
    	
    	
    	
    	
        
    	
    
    	
    	
    	
    	
    	
    	
        
    	
    
    
    	
    	
    	
    	
    	
        
    
    
end




function x300643_GuildBattleBonus( varMap ,battleResult )

	
	local PlayerList = {}
	local PlayerCount = 0
	
	local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
        	
        	local nBeKilled    	= GetPlayerRuntimeData(varMap,varObj,RD_GUILDBATTLE_BEKILLED)
	        local nKilledOther 	= GetPlayerRuntimeData(varMap,varObj,RD_GUILDBATTLE_KILLEDOTHER)
	        local nGetFlag     	= GetPlayerRuntimeData(varMap,varObj,RD_GUILDBATTLE_GETFLAG)
	        local nPower 		= nKilledOther*5000 + nGetFlag*1000 - nBeKilled 
	        
	        
            PlayerCount = PlayerCount + 1
            PlayerList[PlayerCount] = {varObj,nPower}
        end
    end
    
    
    
    if PlayerCount == 0 then
    	return
    end
    
    
    local sortproc = function(a,b) return a[2] > b[2] end 
    sort(PlayerList,sortproc)
    
    
    for varI = 1,PlayerCount do
    	x300643_BattleBonus( varMap,PlayerList[varI][1],battleResult,varI)
    end
    
end





function x300643_RestoreAllPlayerCamp( varMap )

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




function x300643_RestorePlayerCamp( varMap,varPlayer )
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCurCamp(varMap,varPlayer,nCountryId )
end




function x300643_BattleGenResult( varMap, callerId  )

    local nTime = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_COUNT_ITME )
    
    
    local GuildIdA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD)
    SetGuildQuestData(varMap,GuildIdA,GD_GUILD_INDEX_BATTL_STATE,-1)

    local GuildIdB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD)
    SetGuildQuestData(varMap,GuildIdB,GD_GUILD_INDEX_BATTL_STATE,-1)

    local textA = "帮会战结束"
    local textB = "帮会战结束"

    local SystemTipsA = ""
    local SystemTipsB = ""

    
    local Winner = x300643_GetWinner(varMap)

    
    local TitleBlue = GetGuildName( GuildIdA)
    local TitleRed  = GetGuildName( GuildIdB)

    GuildBattleSendBaseInfo(varMap,TitleBlue,TitleRed,Winner,nTime)

    x300643_GuildBattleBonus( varMap,Winner )

    if Winner == 0 then        

        SetGuildQuestData( varMap,GuildIdA,GD_GUILD_INDEX_BATTL_WIN_NUM,1,1 )
        SetGuildQuestData( varMap,GuildIdB,GD_GUILD_INDEX_BATTL_LOSE_NUM,1,1 )
		
		LuaCallNoclosure( 300638, "SaveGuildWeekResult", varMap,GuildIdA, 2 )	
		LuaCallNoclosure( 300638, "SaveGuildWeekResult", varMap,GuildIdB, 0 )
		

        
        textA = "#G您所在的帮会在本次帮会战中取得胜利"
        textB = "#G您所在的帮会在本次帮会战中惨遭失败"

        SystemTipsA = "战场胜利"
        SystemTipsB = "战场失败"

    elseif Winner == 1 then    

        SetGuildQuestData( varMap,GuildIdB,GD_GUILD_INDEX_BATTL_WIN_NUM,1,1 )
        SetGuildQuestData( varMap,GuildIdA,GD_GUILD_INDEX_BATTL_LOSE_NUM,1,1 )
		LuaCallNoclosure( 300638, "SaveGuildWeekResult", varMap,GuildIdA, 0 )	
		LuaCallNoclosure( 300638, "SaveGuildWeekResult", varMap,GuildIdB, 2 )

        
        textA = "#G您所在的帮会在本次帮会战中惨遭失败"
        textB = "#G您所在的帮会在本次帮会战中取得胜利"

        SystemTipsA = "战场失败"
        SystemTipsB = "战场胜利"

    else                        

        SetGuildQuestData( varMap,GuildIdA,GD_GUILD_INDEX_BATTL_DEUCE_NUM,1,1 )
        SetGuildQuestData( varMap,GuildIdB,GD_GUILD_INDEX_BATTL_DEUCE_NUM,1,1 )
		LuaCallNoclosure( 300638, "SaveGuildWeekResult", varMap,GuildIdA, 1 )	
		LuaCallNoclosure( 300638, "SaveGuildWeekResult", varMap,GuildIdB, 1 )

        
        textA = "#G您所在的帮会在本次帮会战中打成平手"
        textB = "#G您所在的帮会在本次帮会战中打成平手"

        SystemTipsA = "双方战平"
        SystemTipsB = "双方战平"
    end

    
    LuaThisScenceM2Guild(varMap,textA,GuildIdA,2,1)
    LuaThisScenceM2Guild(varMap,textB,GuildIdB,2,1)

    LuaThisScenceM2Guild(varMap,textA,GuildIdA,3,1)
    LuaThisScenceM2Guild(varMap,textB,GuildIdB,3,1)

    LuaThisScenceM2Guild(varMap,SystemTipsA,GuildIdA,5,1)
    LuaThisScenceM2Guild(varMap,SystemTipsB,GuildIdB,5,1)


    
    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_DOWN_STATE,1 )
    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_COUNT_DOWN_TIME,60 )
        
    
    local varMsg = format("GBL:x300643_BattleGenResult varMap=%d,LeaveTime h= %d,m=%d,CallerId=%d",varMap, floor(nTime/60),mod(nTime,60), callerId )
    WriteLog(1,varMsg)

    x300643_SetAllPlayerNeedKick(varMap,60)
    x300643_DestroyBattleFlags( varMap )
    ClearGuildBattleSceneData(varMap)

end




function x300643_GuildBattleKickPlayer( varMap,varPlayer )

    
    if GetHp(varMap,varPlayer) <= 0 then
	
		ClearRageRecoverTick(varMap, varPlayer)
		RestoreHp(varMap, varPlayer,100)
		RestoreRage(varMap, varPlayer,100)
		ClearMutexState(varMap, varPlayer, 6)
		SendReliveResult(varMap, varPlayer,1)	
	end
	
	LastMount(varMap, varPlayer )
	RestoreHp(varMap, varPlayer,0)
	
    x300643_RestorePlayerCamp(varMap,varPlayer)

    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        NewWorld(varMap,varPlayer,nBakSceneId,varX,z,300643)
        return
    end

    
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        
        
        local nDestSceneId = 50
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300643)

    elseif varCountry == 1 then
        
        
        local nDestSceneId = 150
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300643)

    elseif varCountry == 2 then

        
        local nDestSceneId = 250
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300643)

    elseif varCountry == 3 then
        
        
        local nDestSceneId = 350
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300643)

    end
end




function x300643_GuildBattleKickAllPlayer( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            x300643_GuildBattleKickPlayer( varMap,varObj)

        end
    end
end




function x300643_SyncBattleTimeToAllPlayer( varMap ,nTime )

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




function x300643_ProcPlayerAskLeaveGuildBattle( varMap,varPlayer )
    
    x300643_GuildBattleKickPlayer( varMap, varPlayer )

end




function x300643_ProcSyncGuildBattleTime( varMap,nTime )
    
    if x300643_IsGuildBattleScene_Gjs( varMap ) == 0 then
        return
    end

    if x300643_CheckBattleState( varMap ) == 0 then
        return
    end

    local nTime_new = x300643_var_TotalBattleTime - NumberCastIntToUInt( nTime )
    SetGuildBattleSceneData_Param(varMap, LD_GUILD_BATTLE_COUNT_ITME, nTime_new )

    
    
    x300643_SyncBattleTimeToAllPlayer( varMap, nTime_new )
end





function x300643_SetAllPlayerNeedKick( varMap,nKickTime )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown <= 0 or KickDown > nKickTime then                
                SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,nKickTime) 
            end
        end
    end
end




function x300643_UpdatePlayerKickState( varMap )
    
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
                    x300643_GuildBattleKickPlayer( varMap,varObj )
                else
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,KickDown) 
                end
            end
        end
    end
end




function x300643_SyncGuildPower( varMap )
    
    local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

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
    
    
    BroadcastGuildBattlePower(varMap,nGuildA_Count,nGuildB_Count)

end




function x300643_ResetConvoyGrowPoint(varMap,bShowMsg)

	local varCount = getn(x300643_var_ConvoyGrowPointPosList)
	local varIndex = random(1,varCount)
	
	if varIndex < 1 then
		varIndex = 1
	elseif varIndex > varCount then
		varIndex = varCount
	end
	
	local varX = x300643_var_ConvoyGrowPointPosList[varIndex][1]
	local z = x300643_var_ConvoyGrowPointPosList[varIndex][2]
	
	RecycleGrowPointByType(varMap,x300643_var_ConvoyGrowPointType[varMap],1000)
    SetGrowPointPos(varMap,x300643_var_ConvoyGrowPointType[varMap],varX,z)
    
    if bShowMsg == 1 then
	    local varMsg = format("战神留下的宝箱出现在(%d,%d)",varX,z)
	    LuaThisScenceM2Wrold(varMap,varMsg,2,1)	
	    LuaThisScenceM2Wrold(varMap,varMsg,3,1)
    end
end




function x300643_ProcRecyleConvoyGrowPoint_Check(varMap,varPlayer)
	
	local varStatus = GetGuildBattleStatus( varMap )
    if varStatus ~= STATE_GUILD_BATTLE_BATTLE then
    	return 1
    end
    
    local nCampID = GetCurCamp(varMap,varPlayer)
    if nCampID ~= x300643_var_Guild_Camp_A and nCampID ~= x300643_var_Guild_Camp_B then
    	return 1
    end
	
	return 0
end




function x300643_ProcRecyleConvoyGrowPoint(varMap,varPlayer)


	
	local varStatus = GetGuildBattleStatus( varMap )
    if varStatus ~= STATE_GUILD_BATTLE_BATTLE then
    	return 0
    end
    
    local nCampID = GetCurCamp(varMap,varPlayer)
    if nCampID ~= x300643_var_Guild_Camp_A and nCampID ~= x300643_var_Guild_Camp_B then
    	return 0
    end
	
	
	if nCampID == x300643_var_Guild_Camp_A then
		x300643_var_ScoreIntervalA[varMap] = x300643_var_ScoreIntervalA[varMap] + 10
		BroadcastGuildBattleResourceScore(varMap, 0,x300643_var_ScoreIntervalA[varMap] )
	end
	
	
	if nCampID == x300643_var_Guild_Camp_B then
		x300643_var_ScoreIntervalB[varMap] = x300643_var_ScoreIntervalB[varMap] + 10
		BroadcastGuildBattleResourceScore(varMap, 1,x300643_var_ScoreIntervalB[varMap] )
	end
	
	
	x300643_var_ConvoyGrowPointState[varMap] = 0
	
	
	SetGrowPointIntervalContainer(varMap,x300643_var_ConvoyGrowPointType[varMap],-1)
	
	
	return 1
end




function x300643_GetScoreIntervalA(varMap)
	return x300643_var_ScoreIntervalA[varMap]
end




function x300643_GetScoreIntervalB(varMap)
	return x300643_var_ScoreIntervalB[varMap]
end







function x300643_GetScoreInterval(varMap,CampId)
	if CampId == x300643_var_Guild_Camp_A then
		local ResPointA = x300643_var_ScoreIntervalA[varMap]
		return ResPointA
	elseif CampId == x300643_var_Guild_Camp_B then
		local ResPointB = x300643_var_ScoreIntervalB[varMap]
		return ResPointB
	end
	return -1
end





function x300643_SetScoreIntervalInc(varMap,CampId,resPointInc)
	if CampId == x300643_var_Guild_Camp_A then
		local ResPointA = x300643_var_ScoreIntervalA[varMap]
		x300643_var_ScoreIntervalA[varMap] = ResPointA + resPointInc
		BroadcastGuildBattleResourceScore(varMap, 0,x300643_var_ScoreIntervalA[varMap] )

	elseif CampId == x300643_var_Guild_Camp_B then
		local ResPointB = x300643_var_ScoreIntervalB[varMap]
		x300643_var_ScoreIntervalB[varMap] = ResPointB + resPointInc
		BroadcastGuildBattleResourceScore(varMap, 1,x300643_var_ScoreIntervalB[varMap] )
	end

end
