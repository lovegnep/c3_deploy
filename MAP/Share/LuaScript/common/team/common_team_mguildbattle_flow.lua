
x303117_var_FileId                      = 303117


--------------------------------------------------------------------------------
-- 以下是配置信息，策划可根据需要修改
--------------------------------------------------------------------------------
-- 战斗时长(秒)
x303117_var_TotalBattleTime               = 60 * 20

-- 地图名称
x303117_var_SceneName                     = { {"zhanchang_banghuizhanchangkuafu/zhanchang_banghuizhanchangkuafu.scn", 1} }

x303117_var_King_Signup                  = 2     
x303117_var_King_WaitBattle              = 3     
x303117_var_King_BeginBattle             = 4     
x303117_var_King_EndBattle               = 5
x303117_var_KeepStayPlayerGUID           = {2110000005,3640000005,1060000005,2270000006,3780000006,1610458266,1210368323,530000007,3350000007}			-- 要保留在战场中的玩家的GUID

-- T人倒计时长
x303117_var_Kick_Down                    = 5

-- 开场准备时间，超过该时间将不允许再进入战场
x303117_var_ReadyTime = 120

-- 闪断允许登录的时间(秒)
x303117_var_LogoutTime = 10

-- 登出后再次登录，允许进入战场的时间
x303117_var_LogoutRenterTime = 60*10

-- 双方临时阵营
x303117_var_CampFlag					= 	{5, 6}
x303117_var_Guild_Camp_A                 = 5
x303117_var_Guild_Camp_B                 = 6


-- 双方名称
x303117_var_TeamName = { "蓝方", "红方" }

-- 玩家进入战场的坐标
x303117_var_EnterScenePos =
{
	{206, 48}, -- Team A
	{50, 204}, -- Team B
}

-- 被杀次数上限
x303117_var_KillLimit = 6

x303117_var_CloseTick				= 10 -- 关闭倒计时

-- 状态常量，不要修改
x303117_var_State_Invalid				= 	-1
x303117_var_State_Signup				=  	100
x303117_var_State_SignupFinished		=  	101
x303117_var_State_Begin					=  	102
x303117_var_State_End					=  	103

x303117_var_Winner = 1
x303117_var_Loser  = 2

-- 帮助职务索引
x303117_var_Leader_Index                 = 5

-- 帮会A索引
x303117_var_GuildA_Index = 1
-- 帮会B索引
x303117_var_GuildB_Index = 2

-- 战场类型
x303117_var_Battle_MGuild = 2

--Gameopen
x303117_var_GameOpen = 1096
--------------------------------------------------------------------------------
-- 以上是配置信息
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- 以下变量
--------------------------------------------------------------------------------

-- 场景信息
x303117_SceneInfo = {}

-- 场景当前状态
x303117_var_CurrentState = {}

-- 2队当前在战场的玩家数量
x303117_var_TeamMemCount = {}

-- 双方帮会ID
x303117_var_BattleGuild = {}

-- 战场当前时长
x303117_var_BattleTime = {}

-- 进入过战场的用户数量
x303117_var_EnteredPlayerCount = {}
-- 已经进入的用户SNID
x303117_var_EnterPlayer = {}

--------------------------------------------------------------------------------
-- 以上是变量
--------------------------------------------------------------------------------


function x303117_IsBattleSceneValid(varMap)

    local varName = GetBattleSceneName(varMap)
    for varI, item in x303117_var_SceneName do
        if varName == item[1] then
            return 1
        end
    end
    return 0
end


----------------------------------------------------------------------------------------------
-- 战场状态
----------------------------------------------------------------------------------------------
function x303117_ProcMBattleState(varMap, varState)

	if GetSceneType(varMap) ~= 7 then
		return
	end    
    
    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end

	-- 报名
    if varState == x303117_var_State_Signup then
    	
    	if x303117_var_CurrentState[varMap] == x303117_var_State_Begin then
    		return
    	end
        
        x303117_var_CurrentState[varMap] = x303117_var_State_Signup
        MPVPRegisterMap(x303117_var_Battle_MGuild, varMap)
        --x303117_var_BattleGuild[varMap] = { {-1, -1}, {-1, -1} }
       
	-- 战场开始
    elseif varState == x303117_var_State_Begin then
        
        x303117_var_CurrentState[varMap] = x303117_var_State_Begin
        x303117_ProcBattleSceneReady(varMap, x303117_var_TotalBattleTime)

	-- 战场结束
    elseif varState == x303117_var_State_End then
    
    	if x303117_var_CurrentState[varMap] == x303117_var_State_End then
    		return
    	end
		
        if x303117_var_CurrentState[varMap] == x303117_var_State_Begin then
            x303117_ProcBattleSceneClose(varMap)
        end
        
        x303117_var_CurrentState[varMap] = x303117_var_State_End
    end
end


----------------------------------------------------------------------------------------------
--战场匹配队伍信息回调
----------------------------------------------------------------------------------------------
function x303117_ProcMBattleMatchInfo(varMap, varWorldID1, varGuildID1, varCountry1, varWorldID2, varGuildID2, varCountry2)
	
	local varMsg = format("x303117_ProcMBattleMatchInfo Map=%d, TeamA=%d, %d   ,TeamB=%d, %d", varMap, varWorldID1, varGuildID1, varWorldID2, varGuildID2)
    WriteLog(1,varMsg)
        
	-- A 队
	x303117_var_BattleGuild[varMap][1][1] = varWorldID1
	x303117_var_BattleGuild[varMap][1][2] = varGuildID1
	x303117_var_BattleGuild[varMap][1][3] = varCountry1
	
	-- B 队
	x303117_var_BattleGuild[varMap][2][1] = varWorldID2
	x303117_var_BattleGuild[varMap][2][2] = varGuildID2
	x303117_var_BattleGuild[varMap][2][3] = varCountry2
	
end


----------------------------------------------------------------------------------------------
--时间同步回调
----------------------------------------------------------------------------------------------
function x303117_ProcMSyncBattleTime(varMap, nTime)

    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end
    
    --x303117_SceneInfo[varMap].TICKCOUNT = NumberCastIntToUInt(nTime)
    local DownTickCount = x303117_var_TotalBattleTime - NumberCastIntToUInt(nTime)
    x303117_SyncBattleTimeToAllPlayer(varMap, DownTickCount)
	
end

----------------------------------------------------------------------------------------------
-- 战场创建时调用
----------------------------------------------------------------------------------------------
function x303117_ProcMapCreate(varMap)

	x303117_var_BattleGuild[varMap] = { {-1, -1}, {-1, -1} }
	
	x303117_SceneInfo[varMap]			= {
											TICKCOUNT = 0,
											ISCLOSING = 0,
											LEAVECOUNTDOWN = 0,
											RESULT = 0
										  }

	
	x303117_var_TeamMemCount[varMap] = {0, 0}
	
	x303117_var_EnteredPlayerCount[varMap] = 0
	x303117_var_EnterPlayer[varMap] = {}
	x303117_var_CurrentState[varMap] = x303117_var_State_Invalid
	
end


----------------------------------------------------------------------------------------------
--战场定时器
----------------------------------------------------------------------------------------------
function x303117_ProcMapTimerTick( varMap,varTime )
    
    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end
    
    x303117_UpdatePlayerKickState( varMap )

	-- 报名
    if x303117_var_CurrentState[varMap] == x303117_var_State_Signup then
    	
    	
       
	-- 战场开始
    elseif x303117_var_CurrentState[varMap] == x303117_var_State_Begin then
        
      local nTime = x303117_var_BattleTime[varMap] + 1
    	x303117_var_BattleTime[varMap] = nTime
    	
    	x303117_SyncGuildPower( varMap )
    	x303117_UpdateSceneDataFlag( varMap )
    	
    	if nTime < x303117_var_ReadyTime then
    		return
    	end
    	
    	-- 战斗是否结束
		if x303117_CheckIsFinished( varMap) == 1 then
			x303117_ProcBattleSceneClose(varMap)
	        return
	    end

	-- 战场结束
    elseif x303117_var_CurrentState[varMap] == x303117_var_State_End then
    
		local nTime = x303117_SceneInfo[varMap].LEAVECOUNTDOWN + 1
		x303117_SceneInfo[varMap].LEAVECOUNTDOWN = nTime
		
	    if nTime >= x303117_var_Kick_Down then
	    
			x303117_SyncBattleTimeCloseToAllPlayer(varMap)
	    	x303117_KingBattleKickAllPlayer(varMap)
	    	
	    	x303117_var_CurrentState[varMap] = x303117_var_State_Invalid
	    	
	    else

		    local varStr = format("#G跨服帮会战结束,#R%d秒#G后战场自动关闭", x303117_var_Kick_Down-nTime)
		    LuaThisScenceM2Wrold(varMap,varStr,3,1)
		    LuaThisScenceM2Wrold(varMap,varStr,2,1)

	    end
    	
    end

end

----------------------------------------------------------------------------------------------
--判定非本帮会的玩家且不踢掉的玩家
----------------------------------------------------------------------------------------------
function x303117_ProcCheckNeedKickPlayerGUID(varMap, varPlayer)
	
	local playerGUID = GetGUID(varMap, varPlayer)
	for index, item in x303117_var_KeepStayPlayerGUID do
		if (item == playerGUID) then
			return 0
		end
	end
	
	return 1
end

----------------------------------------------------------------------------------------------
--玩家进入战场时的处理
----------------------------------------------------------------------------------------------
function x303117_ProcPlayerEnter( varMap, varPlayer )
    
    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end

    if x303117_var_CurrentState[varMap] ~= x303117_var_State_Begin then
    	WriteLog(1, format("x303117_ProcBattlePlayerEnter battle closed, Map=%d, PlayerSNID=%X, Name=%s", varMap, GetGUID(varMap,varPlayer), GetName(varMap, varPlayer) ))
    	x303117_SetPlayerNeedKick( varMap,varPlayer )
    	return
    end

	local bReEnter = 0
    if x303117_IsPlayerEnter(varMap, varPlayer) == 1 then
    	bReEnter = 1
    	
    	-- 10分钟再次登录，可进入战场
	    if x303117_var_BattleTime[varMap] > x303117_var_LogoutRenterTime then
	    
	    	WriteLog(1, format("x303117_ProcBattlePlayerEnter greate than 10 minutes, Map=%d, PlayerSNID=%X, Name=%s", varMap, GetGUID(varMap,varPlayer), GetName(varMap, varPlayer) ))
	    	
			-- 离开游戏间隔大于设定，将不能进入战场
		    local lastLogoutTime = GetLastLogoutTime(varMap, varPlayer)
			local thisTrainTime = GetCurrentTime() - lastLogoutTime
			if thisTrainTime > x303117_var_LogoutTime then
				x303117_SetPlayerNeedKick( varMap,varPlayer )
				return
			end
		
	    end
    end
    
    local nSendCCamp = -1
    
    local nTeamIndex = x303117_GetPlayerTeamIndex(varMap, varPlayer)
    if nTeamIndex == x303117_var_GuildA_Index then
        nSendCCamp = 0
    elseif nTeamIndex == x303117_var_GuildB_Index then
        nSendCCamp = 1
    else
  			x303117_SetPlayerNeedKick( varMap,varPlayer )
      
	      local varMsg = format("KBL:x303117_ProcBattlePlayerEnter Kick 2, Map=%d, PlayerSNID=%X, Name=%s, World=%d, Guild=%d", 
	      				varMap, GetGUID(varMap,varPlayer), GetName(varMap, varPlayer), GetWorldID( varMap, varPlayer), GetGuildID( varMap, varPlayer ) )
	      WriteLog(1,varMsg)
	      return
    end
    
    SetKingBattleDisable(varMap, varPlayer, 0, nSendCCamp )
    
    if bReEnter == 0 then
    	-- 记录进入标志
    	x303117_RecordGuildMemberEnterCount(varMap, varPlayer)
    	-- 设置被杀次数
    	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_DIE_COUNT[1], MD_MGUILD_BATTLE_DIE_COUNT[2], MD_MGUILD_BATTLE_DIE_COUNT[3], 0)
    end
    
    local nGuildA = x303117_var_BattleGuild[varMap][1][2]
    local nGuildB = x303117_var_BattleGuild[varMap][2][2]

    local strGuildA = GetGuildName( nGuildA )
    local strGuildB = GetGuildName( nGuildB )
    SendKingBattleInfo( varMap, varPlayer, strGuildA, strGuildB )
    
    -- 设置阵营
    SetCurCamp( varMap, varPlayer, x303117_var_CampFlag[nTeamIndex] )
    -- 设置坐标
    SetPos( varMap, varPlayer, x303117_var_EnterScenePos[nTeamIndex][1], x303117_var_EnterScenePos[nTeamIndex][2])


    SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN,-1)
    x303117_RecordPlayerEnter(varMap, varPlayer)
    
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


----------------------------------------------------------------------------------------------
--玩家离开战场
----------------------------------------------------------------------------------------------
function x303117_ProcPlayerLeave( varMap, varPlayer )
    
    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end

    local nCountryId = GetCurCountry(varMap,varPlayer )
    SetCurCamp( varMap,varPlayer,nCountryId )

    SetKingBattleDisable(varMap, varPlayer, 1, -1)
end


----------------------------------------------------------------------------------------------
--玩家离开帮会
----------------------------------------------------------------------------------------------
function x303117_ProcPlayerLeaveGuild( varMap,varPlayer )
    
    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end
    
    x303117_KingBattleKickPlayer( varMap,varPlayer )
    SetKingBattleDisable(varMap, varPlayer, 1, -1)

end

----------------------------------------------------------------------------------------------
--玩家死亡
----------------------------------------------------------------------------------------------
function x303117_ProcPlayerDie( varMap, varPlayer, varKiller  )
    
    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end

	-- 被杀次数
    local nBeKilled = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_DIE_COUNT[1], MD_MGUILD_BATTLE_DIE_COUNT[2], MD_MGUILD_BATTLE_DIE_COUNT[3]) + 1
    SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_DIE_COUNT[1], MD_MGUILD_BATTLE_DIE_COUNT[2], MD_MGUILD_BATTLE_DIE_COUNT[3], nBeKilled)
        
    local varStr = format("#G%s在跨服帮战中被杀死%d次。",GetName(varMap,varPlayer ),nBeKilled )
    LuaThisScenceM2Wrold(varMap,varStr,3,1)
    LuaThisScenceM2Wrold(varMap,varStr,2,1)


    if nBeKilled == x303117_var_KillLimit then

        local nCountryId = GetCurCountry( varMap,varPlayer)

        local varStr = format("#G%s在跨服帮战中，死亡次数已满，被迫离开战场。",GetName(varMap,varPlayer ) )
        LuaThisScenceM2Wrold(varMap,varStr,3,1)
    	LuaThisScenceM2Wrold(varMap,varStr,2,1)
        
        local KickDown = GetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ) 
        if KickDown <= 0 or KickDown > 4 then
            SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,4) 
        end
    end

end


-- ----------------------------------------------------------------------------
-- 检查玩家能否进入战场
-- ----------------------------------------------------------------------------
function x303117_CheckPlayerState( varMap,varPlayer )
    
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

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        ErrorMsg = "处于童趣状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_PKMODE )
    if varState == 1 then
        ErrorMsg = "pk值过高或处于狂暴模式，不能进入战场"
        return 1,ErrorMsg
    end

    if GetGameOpenById( x303117_var_GameOpen ) <= 0 then
        ErrorMsg = "活动没有开启，敬请期待！"
        return 1,ErrorMsg
    end

    return 0

end


-- ----------------------------------------------------------------------------
-- 改变场景
-- ----------------------------------------------------------------------------
function x303117_ProcKingBattleChangeScene( varMap,varPlayer,newSceneID,Flag )
    
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
        	SetPos( varMap , varPlayer , 206, 48 )
        else
          	SetPos( varMap , varPlayer , 50, 204 )
        end
	else
        local varState,varMsg = x303117_CheckPlayerState( varMap,varPlayer )
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

		NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ, x303117_var_FileId )
	end
end


-- ----------------------------------------------------------------------------
-- 复活玩家
-- ----------------------------------------------------------------------------
function x303117_DoPlayerRelive( varMap, varPlayer )
	
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


-- ----------------------------------------------------------------------------
-- 处理玩家复活请求
-- ----------------------------------------------------------------------------
function x303117_ProcPlayerRelive( varMap, varPlayer )

    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end
    
    -- 判断被杀次数
    local nBeKilled = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_DIE_COUNT[1], MD_MGUILD_BATTLE_DIE_COUNT[2], MD_MGUILD_BATTLE_DIE_COUNT[3])
    if nBeKilled >= x303117_var_KillLimit then
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
    
    local nTeamIndex = x303117_GetPlayerTeamIndex(varMap, varPlayer)
    if nTeamIndex == x303117_var_GuildA_Index then
        
    x303117_ProcKingBattleChangeScene(varMap,varPlayer,varMap,0)
        
    elseif nTeamIndex == x303117_var_GuildB_Index then
        
    x303117_ProcKingBattleChangeScene(varMap,varPlayer,varMap,1)
        
    end

end


-- ----------------------------------------------------------------------------
-- 战斗开始,初始化变量
-- ----------------------------------------------------------------------------
function x303117_ProcBattleSceneReady( varMap,totalTime )

    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_STATE,-1 )
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_TIME,10 )
    x303117_var_BattleTime[varMap] = 0
    
    x303117_SceneInfo[varMap] = {
						TICKCOUNT = 0,
						ISCLOSING = 0,
						LEAVECOUNTDOWN = 0,
						RESULT = 0
				  	  }

end


-- ----------------------------------------------------------------------------
-- 关闭战场，结算奖励
-- ----------------------------------------------------------------------------
function x303117_ProcBattleSceneClose( varMap )
	
	if x303117_var_CurrentState[varMap] == x303117_var_State_End then
		return
	end
	x303117_var_CurrentState[varMap] = x303117_var_State_End
	
	-- 结算奖励
	x303117_BattleGenResult( varMap,0 )
	
	x303117_SceneInfo[varMap].LEAVECOUNTDOWN = 0
	
	x303117_ClearPlayerEnterRecord(varMap)
end


-- ----------------------------------------------------------------------------
-- 检查战场是否达到结束条件
-- ----------------------------------------------------------------------------
function x303117_CheckIsFinished( varMap )
    
    local nGuildA_MemberCount = 0
    local nGuildB_MemberCount = 0

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
        	
        	local nTeamIndex = x303117_GetPlayerTeamIndex(varMap, varObj)
		    if nTeamIndex == x303117_var_GuildA_Index then
		        
		        nGuildA_MemberCount = nGuildA_MemberCount + 1
		        
		    elseif nTeamIndex == x303117_var_GuildB_Index then
		        
		        nGuildB_MemberCount = nGuildB_MemberCount + 1
		        
		    end

        end
    end

	-- 有一方无人
    if nGuildA_MemberCount == 0 or nGuildB_MemberCount == 0 then
        return 1
    end

    return 0

end


-- ----------------------------------------------------------------------------
-- 判断谁是赢家
-- ----------------------------------------------------------------------------
function x303117_GetWinner(varMap)
	
	-- 帮会成员数量
    local nGuildA_MemberCount = 0
    local nGuildB_MemberCount = 0
	-- 帮主是否在战场
    local nGuildA_GuildIn = 0
    local nGuildB_GuildIn = 0
	-- 帮主死亡次数
    local nGuildA_GuilderDie = 0
    local nGuildB_GuilderDie = 0

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
        	
        	-- 累加帮会成员数量
        	local nTeamIndex = x303117_GetPlayerTeamIndex(varMap, varObj)
		    if nTeamIndex == x303117_var_GuildA_Index then
		        
		        nGuildA_MemberCount = nGuildA_MemberCount + 1
		        
		    elseif nTeamIndex == x303117_var_GuildB_Index then
		        
		        nGuildB_MemberCount = nGuildB_MemberCount + 1
		        
		    end

			-- 帮主信息
            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x303117_var_Leader_Index then
                if nTeamIndex == x303117_var_GuildA_Index then
                    nGuildA_GuildIn = 1
                    nGuildA_GuilderDie = GetPlayerGameData(varMap, varObj, MD_MGUILD_BATTLE_DIE_COUNT[1], MD_MGUILD_BATTLE_DIE_COUNT[2], MD_MGUILD_BATTLE_DIE_COUNT[3])
                elseif nTeamIndex == x303117_var_GuildB_Index then
                    nGuildB_GuildIn = 1
                    nGuildB_GuilderDie = GetPlayerGameData(varMap, varObj, MD_MGUILD_BATTLE_DIE_COUNT[1], MD_MGUILD_BATTLE_DIE_COUNT[2], MD_MGUILD_BATTLE_DIE_COUNT[3])
                end
            end
        end
    end
    
    -- 帮主是否在战场
    if nGuildA_GuildIn == 1 and nGuildB_GuildIn == 0 then
        return 0
    end
    if nGuildA_GuildIn == 0 and nGuildB_GuildIn == 1 then
        return 1
    end
    
	-- 帮会成员在战场的人数
    if nGuildA_MemberCount > nGuildB_MemberCount then
        return 0
    elseif nGuildA_MemberCount < nGuildB_MemberCount then
        return 1
    end
    
    -- 帮主死亡次数
    if nGuildA_GuilderDie > nGuildB_GuilderDie then
        return 1
    elseif nGuildA_GuilderDie < nGuildB_GuilderDie then
        return 0
    end

    return 1
end


-- ----------------------------------------------------------------------------
-- 结算奖励
-- ----------------------------------------------------------------------------
function x303117_BattleGenResult( varMap, callerId  )
    
    if x303117_var_BattleGuild[varMap][1][1] == x303117_var_BattleGuild[varMap][2][1] and x303117_var_BattleGuild[varMap][1][2] == x303117_var_BattleGuild[varMap][2][2] then
        return
    end
    
		local varStr = ""
    local nWinner = x303117_GetWinner( varMap )
    if nWinner == 0 then
		-- A帮赢
		varStr = format("本次跨服帮会战胜利方为蓝方")
		LuaThisScenceM2Wrold(varMap, varStr, 3, 1)
		LuaThisScenceM2Wrold(varMap, varStr, 2, 1)
		
		-- 通知GL结果
		MGuildBattleResult(varMap, 
						   x303117_var_BattleGuild[varMap][1][1], x303117_var_BattleGuild[varMap][1][2], x303117_var_BattleGuild[varMap][1][3],
						   x303117_var_BattleGuild[varMap][2][1], x303117_var_BattleGuild[varMap][2][2], x303117_var_BattleGuild[varMap][2][3])
    else
        -- B帮赢
		varStr = format("本次跨服帮会战胜利方为红方")
		LuaThisScenceM2Wrold(varMap, varStr, 3, 1)
		LuaThisScenceM2Wrold(varMap, varStr, 2, 1)
		
        -- 通知GL结果
    MGuildBattleResult(varMap, 
						   x303117_var_BattleGuild[varMap][2][1], x303117_var_BattleGuild[varMap][2][2], x303117_var_BattleGuild[varMap][2][3],
						   x303117_var_BattleGuild[varMap][1][1], x303117_var_BattleGuild[varMap][1][2], x303117_var_BattleGuild[varMap][1][3])
    end

    
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_STATE,1 )
    SetKingBattleSceneData_Param( varMap,LD_KING_BATTLE_COUNT_DOWN_TIME,10 )

		local GuildIndex = nWinner + 1
		if (GuildIndex >= 1 and GuildIndex <= 2) then
			WriteLog(1, format("x303117_BattleGenResult --- Info!!! WinnerWorld = %d, WinnerGuild = %d", 
							x303117_var_BattleGuild[varMap][GuildIndex][1], x303117_var_BattleGuild[varMap][GuildIndex][2]))
		else
			WriteLog(1, format("x303117_BattleGenResult --- Error!!! ErrorGuildIndex GuildIndex = %d", 
							GuildIndex))
		end

		-- 清除比赛配对信息
    x303117_var_BattleGuild[varMap][1][1] = -1
    x303117_var_BattleGuild[varMap][1][2] = -1
    x303117_var_BattleGuild[varMap][2][1] = -1
    x303117_var_BattleGuild[varMap][2][2] = -1

    x303117_SetAllPlayerNeedKick(varMap)
    
end

-- ----------------------------------------------------------------------------
-- 恢复某玩家阵营
-- ----------------------------------------------------------------------------
function x303117_RestorePlayerCamp( varMap,varPlayer )
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCurCamp(varMap,varPlayer,nCountryId )
end


-- ----------------------------------------------------------------------------
-- 将玩家T出战场
-- ----------------------------------------------------------------------------
function x303117_KingBattleKickPlayer( varMap,varPlayer )

	-- 复活
    x303117_DoPlayerRelive( varMap,varPlayer )
	-- 恢复阵营
    x303117_RestorePlayerCamp( varMap,varPlayer)
    
    SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, -1)
    --SetMPVP6v6BattleDisable(varMap, varPlayer, 1, 0)

	-- 传送
    local nBakSceneId,varX,varZ = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        NewWorld(varMap, varPlayer, nBakSceneId, varX, varZ, x303117_var_FileId)
        return
    end
    
    -- 没有记录合适的地图，就传送到王城
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        NewWorld(varMap, varPlayer, 50, 123, 57, x303117_var_FileId)
    elseif varCountry == 1 then
        NewWorld(varMap, varPlayer, 150, 123, 57, x303117_var_FileId)
    elseif varCountry == 2 then
        NewWorld(varMap, varPlayer, 250, 123, 57, x303117_var_FileId)
    elseif varCountry == 3 then
        NewWorld(varMap, varPlayer, 350, 123, 57, x303117_var_FileId)
    end
end


-- ----------------------------------------------------------------------------
-- 将所有玩家T出战场
-- ----------------------------------------------------------------------------
function x303117_KingBattleKickAllPlayer( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            x303117_KingBattleKickPlayer( varMap,varObj)

        end
    end
end


-- ----------------------------------------------------------------------------
-- 向所有玩家同步战场时间
-- ----------------------------------------------------------------------------
function x303117_SyncBattleTimeToAllPlayer( varMap ,nTime )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303117_var_FileId, -1, -1);                 

            if nTime > 0 then
                TimerCommand( varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE,  x303117_var_FileId, nTime, nTime );
            end
        end
    end    
end


-- ----------------------------------------------------------------------------
-- 向所有玩家同步战场时间
-- ----------------------------------------------------------------------------
function x303117_SyncBattleTimeCloseToAllPlayer(varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, x303117_var_FileId, -1, -1);
        end
    end

end


-- ----------------------------------------------------------------------------
-- 向客户端同步比分
-- ----------------------------------------------------------------------------
function x303117_SyncGuildPower( varMap )
    
    local nGuildA_Count = 0
    local nGuildB_Count = 0
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
        	local nTeamIndex = x303117_GetPlayerTeamIndex(varMap, varObj)
		    if nTeamIndex == x303117_var_GuildA_Index then
		        
		        nGuildA_Count = nGuildA_Count + 1
		        
		    elseif nTeamIndex == x303117_var_GuildB_Index then
		        
		        nGuildB_Count = nGuildB_Count + 1
		        
		    end
        end
    end

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            SyncKingBattlePowerInfo(varMap,varObj, nGuildA_Count, nGuildB_Count)
        end
    end

end


-- ----------------------------------------------------------------------------
-- 同步场景信息（传送NPC位置，帮主位置）
-- ----------------------------------------------------------------------------
function x303117_UpdateSceneDataFlag( varMap )

    if x303117_IsBattleSceneValid(varMap) == 0 then
    	return
    end
    
    ClearSceneMapDataFlag( varMap )

	SetSceneMapDataFlag( varMap,10,8,"亚洲联军传送者",47.8,220,-1)
	SetSceneMapDataFlag( varMap,11,8,"斯拉夫联军传送者",210.5,30,-1)

    
    local GuildLeaderA = -1
    local GuildLeaderB = -1
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x303117_var_Leader_Index then
	        	
	        	local nTeamIndex = x303117_GetPlayerTeamIndex(varMap, varObj)
			    if nTeamIndex == x303117_var_GuildA_Index then
			        
			        GuildLeaderA = varObj
			        
			    elseif nTeamIndex == x303117_var_GuildB_Index then
			        
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


-- ----------------------------------------------------------------------------
-- 设置某玩家T出标志
-- ----------------------------------------------------------------------------
function x303117_SetPlayerNeedKick(varMap, varPlayer)
	local playerGUID = GetGUID(varMap, varPlayer)
	if (x303117_ProcCheckNeedKickPlayerGUID(varMap, varPlayer) == 1) then
		local KickDown = GetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN)
	  if KickDown <= 0 then
	      SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, x303117_var_Kick_Down) 
	  end
	else
		WriteLog(1, format("x303117_SetPlayerNeedKick --- Player Will Stay in Map !!! varMap = %d, GUID = %d", varMap, playerGUID))
	end
end

-- ----------------------------------------------------------------------------
-- 设置所有玩家T出标志
-- ----------------------------------------------------------------------------
function x303117_SetAllPlayerNeedKick( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            x303117_SetPlayerNeedKick(varMap, varObj)
        end
    end
end

-- ----------------------------------------------------------------------------
-- 检测所有玩家T出标志
-- ----------------------------------------------------------------------------
function x303117_UpdatePlayerKickState( varMap )
    
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
                    x303117_KingBattleKickPlayer( varMap,varObj )
                else
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,KickDown) 
                end
            end
        end
    end
end


-- ----------------------------------------------------------------------------
-- 记录进入战场的玩家
-- ----------------------------------------------------------------------------
function x303117_RecordPlayerEnter(varMap, varPlayer)
	x303117_var_EnteredPlayerCount[varMap] = x303117_var_EnteredPlayerCount[varMap] + 1
	local GUID = GetPlayerGUID(varMap, varPlayer)
	x303117_var_EnterPlayer[varMap][x303117_var_EnteredPlayerCount[varMap]] = GUID
	
	WriteLog(1, format("x303117_RecordPlayerEnter --- Info !!! varMap = %d, GUID = %d", varMap, GUID))	-- 记录玩家进入的日志
end

-- ----------------------------------------------------------------------------
-- 玩家是否进入过战场
-- ----------------------------------------------------------------------------
function x303117_IsPlayerEnter(varMap, varPlayer)
	local GUID = GetPlayerGUID(varMap, varPlayer)
	
	for i=1, x303117_var_EnteredPlayerCount[varMap] do
		if NumberCastIntToUInt(x303117_var_EnterPlayer[varMap][i]) == GUID then
			return 1
		end
	end
	
	return 0
end

-- ----------------------------------------------------------------------------
-- 清除进入战场玩家记录
-- ----------------------------------------------------------------------------
function x303117_ClearPlayerEnterRecord(varMap)
	x303117_var_EnteredPlayerCount[varMap] = 0
end


-- ----------------------------------------------------------------------------
-- 取得玩家所在队伍的索引
-- ----------------------------------------------------------------------------
function x303117_GetPlayerTeamIndex( varMap, varPlayer )
    
    local nWorldID = GetWorldID( varMap, varPlayer)
    local nGuildId = GetGuildID( varMap, varPlayer )
    
    for i=1,2 do
    	if nWorldID == x303117_var_BattleGuild[varMap][i][1] and nGuildId == x303117_var_BattleGuild[varMap][i][2] then
    		return i
    	end
    end
    
    return 0

end


-- ----------------------------------------------------------------------------
-- 记录帮众进入战场相关信息
-- ----------------------------------------------------------------------------
function x303117_RecordGuildMemberEnterCount( varMap, varPlayer )
		
	local nGuildId = GetGuildID(varMap, varPlayer)
	if nGuildId == -1 then
		return
	end
	
	local thisDay = GetDayOfYear()
	
	-- 一天只记录一次
	if thisDay == GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_DATE[1], MD_MGUILD_BATTLE_JOIN_DATE[2], MD_MGUILD_BATTLE_JOIN_DATE[3]) then
		return
	end

	-- 参加比赛标记和日期
	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_FLAG[1], MD_MGUILD_BATTLE_JOIN_FLAG[2], MD_MGUILD_BATTLE_JOIN_FLAG[3], 1)
	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_DATE[1], MD_MGUILD_BATTLE_JOIN_DATE[2], MD_MGUILD_BATTLE_JOIN_DATE[3], thisDay)
	
	-- 参加的帮众人数
	local varCnt = GetGuildParamEx(varMap, varPlayer, nGuildId, GD_GUILD_MBATTLE_JOINCOUNT)
	SetGuildParamEx(varMap, varPlayer, nGuildId, GD_GUILD_MBATTLE_JOINCOUNT, varCnt + 1)
	
	-- 角色参加次数及日期，用于领取津贴
	local varCnt = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_JOINCOUNT_THISWEEK[1], MD_MGUILD_JOINCOUNT_THISWEEK[2], MD_MGUILD_JOINCOUNT_THISWEEK[3])

	if x303117_IsNewPeroid(varMap, varPlayer, MD_MGUILD_FIRSTJOINDAY_THISWEEK) > 0 then
		SetPlayerGameData(varMap, varPlayer, MD_MGUILD_FIRSTJOINDAY_THISWEEK[1], MD_MGUILD_FIRSTJOINDAY_THISWEEK[2], MD_MGUILD_FIRSTJOINDAY_THISWEEK[3], thisDay)
		SetPlayerGameData(varMap, varPlayer, MD_MGUILD_JOINCOUNT_THISWEEK[1], MD_MGUILD_JOINCOUNT_THISWEEK[2], MD_MGUILD_JOINCOUNT_THISWEEK[3], 1)
	else
		SetPlayerGameData(varMap, varPlayer, MD_MGUILD_JOINCOUNT_THISWEEK[1], MD_MGUILD_JOINCOUNT_THISWEEK[2], MD_MGUILD_JOINCOUNT_THISWEEK[3], varCnt + 1)
	end

end

-- ----------------------------------------------------------------------------
-- 判断是否跨周
-- 返回值：跨周为1，不跨周为0
-- ----------------------------------------------------------------------------
function x303117_IsNewPeroid(varMap, varPlayer, md_date)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, md_date[1], md_date[2],md_date[3] );
	
	if varToday == 500 then varToday = 0 end
	if varLastday == 500 then varLastday = 0 end
	if varLastday > varToday then
		varToday = varToday + 365
	end
	
	if varToday>=varLastday then
		local nWeek = GetWeek()
		if nWeek==0 then
			nWeek =7
		end
		if (varToday-varLastday)>=nWeek then  
			return 1
		end
	else
		return 1
	end

	return 0

end
