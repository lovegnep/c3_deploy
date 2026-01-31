

--DECLARE_QUEST_INFO_START--

x300641_var_FileId = 300641
x300641_var_QuestName="帮会战场传送"

--Gameopen
x300641_var_GameOpen = 1097



x300641_var_CountryID = 3
--DECLARE_QUEST_INFO_STOP--


function x300641_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		if GetGameOpenById( x300641_var_GameOpen ) <= 0 then
		    return
		end
		
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

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end

    if GetGuildBattleStatus(varMap) ~= STATE_GUILD_BATTLE_BATTLE then
        return 1
    end

	TalkAppendButton(varMap,x300641_var_FileId,x300641_var_QuestName,3);
end


function x300641_ProcEventEntry( varMap, varPlayer, varTalknpc ,idScript,idExt )









	
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

    local varState,varMsg = x300641_CheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        return
    end

    GuildBattleAskEnterScene(varMap, varPlayer)

    return 1
end

function x300641_ProcEnterSceneError( varMap,varPlayer,nError )
    

    if nError == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，活动还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 2 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您没有帮会！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

    elseif nError == 3 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您所在的帮会还没有报名！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 4 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会战还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 5 then

        
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您所在的帮会在此次帮会战中轮空！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 6 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的帮会信息区配不正确！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 7 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您不是帮主！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 8 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的帮会成员不足10人！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 9 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，已经受理过您的帮战申请请求！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    elseif nError == 10 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会战报名已达上限！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0
    elseif nError == 11 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会战已经结束！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    else
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，未知错误！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        return 0

    end
end

function x300641_CheckPlayerState( varMap,varPlayer )
    

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

    local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,7702 )
    if IsHaveFlag ~= 0 then
        ErrorMsg = "在夺旗状态下，不能进入战场"
        return 1,ErrorMsg
    end

    return 0

end





function x300641_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300641_ProcAccept( varMap, varPlayer )

end




function x300641_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300641_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300641_CheckSubmit( varMap, varPlayer )
end




function x300641_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

