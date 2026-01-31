
-- ----------------------------------------------------------------------------
-- 传入战场
-- ----------------------------------------------------------------------------

x303116_var_FileId = 303116
x303116_var_QuestName = "【帮会】跨服帮会战传送"

--Gameopen
x303116_var_GameOpen = 1096

function x303116_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById( x303116_var_GameOpen ) <= 0 then
    return
  end

  if GetMergeDBToggle() == 1 then
    return
  end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end

	TalkAppendButton(varMap,x303116_var_FileId,x303116_var_QuestName,3);
end


function x303116_ProcEventEntry( varMap, varPlayer, varTalknpc )
	
  if GetMergeDBToggle() == 1 then
    return
  end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    local varState,varMsg = x303116_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 1
    end
    
    local Readme_1   = "#Y【传送】跨服帮会战场#W"
    local Readme_2   = " 如果由于特殊原因，没能进入跨服帮会战场，则在战场开始2分钟内，可以从这里进入。"
    local Readme_3   = " 确认要进入跨服帮会战场吗？"
    
    x303116_var_QuestContent_1 = Readme_1
		x303116_var_QuestContent_2 = Readme_2
		x303116_var_QuestContent_3 = Readme_3

    StartTalkTask( varMap )
    TalkAppendString( varMap, x303116_var_QuestContent_1 )
    TalkAppendString( varMap, x303116_var_QuestContent_2 )
    TalkAppendString( varMap, x303116_var_QuestContent_3 )
    StopTalkTask( varMap )
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x303116_var_FileId, -1 )

    return 1
end

function x303116_CheckPlayerState( varMap,varPlayer )

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

    return 0

end


function x303116_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x303116_ProcAccept( varMap, varPlayer )
	
    if GetMergeDBToggle() == 1 then
        return
    end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return
	end

    local varState,varMsg = x303116_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        return
    end

    AskEnterMGuildBattleScene(varMap, varPlayer)
    
end

function x303116_AskEnterKingBattle( varMap,varPlayer )

    local varState,varMsg = x303116_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        
        return

    end
    
    AskEnterMGuildBattleScene(varMap, varPlayer)

end

function x303116_ProcQuestAbandon( varMap, varPlayer, varQuest )
end


function x303116_ProcContinue( varMap, varPlayer, varTalknpc )
end


function x303116_CheckSubmit( varMap, varPlayer )
end


function x303116_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
