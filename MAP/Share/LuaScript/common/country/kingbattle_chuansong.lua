x310100_var_FileId = 310100
x310100_var_QuestName="国王战场传送"

function x310100_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end

    if GetKingBattleStatus(varMap) ~= STATE_KING_BATTLE_BATTLE then
        return 1
    end

    if GetKingBattleEnterSceneFlag(varMap) ~= 1 then
        return 1
    end

	TalkAppendButton(varMap,x310100_var_FileId,x310100_var_QuestName,3);
end


function x310100_ProcEventEntry( varMap, varPlayer, varTalknpc )
    


























	
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

    
    local varState,varMsg = x310100_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 1
    end

    StartTalkTask( varMap )
    TalkAppendString( varMap, "确认要进入国王战场吗？" )
    StopTalkTask( varMap )
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310100_var_FileId,-1 )

    return 1
end

function x310100_CheckPlayerState( varMap,varPlayer )
    

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





function x310100_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310100_ProcAccept( varMap, varPlayer )

	
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

    
	if GetKingBattleStatus(varMap) ~= STATE_KING_BATTLE_BATTLE then
		return
	end

    local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return
	end

    if GetKingBattleEnterSceneFlag(varMap) ~= 1 then
        return
    end

    
    local varState,varMsg = x310100_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        return
    end

    
    RequestEnterKingBattleScene(varMap, varPlayer)
    
end

function x310100_AskEnterKingBattle( varMap,varPlayer )

    
    local varState,varMsg = x310100_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        
        return

    end

    
    RequestEnterKingBattleScene(varMap, varPlayer)

end




function x310100_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310100_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310100_CheckSubmit( varMap, varPlayer )
end




function x310100_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

