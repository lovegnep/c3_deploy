


--DECLARE_QUEST_INFO_START--
x300642_var_FileId          = 300642
x300642_var_Leader_Index      = 5
x300642_var_QuestName       ="申请帮会战场"

--Gameopen
x300642_var_GameOpen = 1097

--DECLARE_QUEST_INFO_STOP--




function x300642_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		if GetGameOpenById( x300642_var_GameOpen ) <= 0 then
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

    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos == x300642_var_Leader_Index and GetGuildBattleStatus(varMap) == STATE_GUILD_BATTLE_SIGNUP then
        
        TalkAppendButton(varMap,x300642_var_FileId,x300642_var_QuestName,3);

    end
end




function x300642_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
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

    if idExt == 0 then
        
        
        local nGuildId = GetGuildID( varMap,varPlayer )
        QueryGuildBattleSignupState( varMap,varPlayer,nGuildId,varTalknpc )


    elseif idExt == 1 then

        
        local nGuildId = GetGuildID( varMap,varPlayer )
        if nGuildId < 0 then
            return
        end
        
        
        local pos = GetGuildOfficial(varMap, varPlayer)
        if pos ~= x300642_var_Leader_Index then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "申请失败，很抱歉，您还不是帮主无法申请帮会战。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
        end



        if GetGuildBattleStatus(varMap) ~= STATE_GUILD_BATTLE_SIGNUP then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "帮会战的申请时间为每周二和周五的17：00~~18：30");
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end

        
        SignupGuildBattle( varMap,varPlayer,nGuildId,varTalknpc )

    end
    return 1

end

function x300642_ProcQueryBattleSignup( varMap,varPlayer,result,varTalknpc )


    if result == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，活动还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 2 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "您没有帮会！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif result == 3 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "您所在的帮会还没有报名！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 4 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "帮会战还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 5 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您所在的帮会在此次帮会战中轮空！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 6 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的帮会信息区配不正确！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 7 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您不是帮主！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 8 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的帮会成员不足10人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 9 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，已经受理过您的帮战申请请求！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 10 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会战报名已达上限！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0
    end


    StartTalkTask(varMap)
    TalkAppendString(varMap, "您是否要报名今天的帮会战？");
    TalkAppendButton(varMap,x300642_var_FileId,"确定..",3,1);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1

end

function x300642_ProcBattleSignup( varMap,varPlayer,result,varTalknpc )
    
    if result == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，活动还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 2 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您没有帮会！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif result == 3 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您所在的帮会还没有报名！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 4 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会战还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 5 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您所在的帮会在此次帮会战中轮空！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 6 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的帮会信息区配不正确！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 7 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您不是帮主！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 8 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您的帮会成员不足10人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 9 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，已经受理过您的帮战申请请求！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 10 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会战报名已达上限！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0
    end

    StartTalkTask(varMap)
    TalkAppendString(varMap, "#G您的申请已经记录，#R20点#G正式开始！");
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    local varStr = "#G帮主申请了帮会战，请做好准备，#R20点#G正式开始！"
    local nGuildID = GetGuildID(varMap,varPlayer)
    LuaAllScenceM2Guild(varMap, varStr, nGuildID, 2, 1)
    LuaAllScenceM2Guild(varMap, varStr, nGuildID, 3, 1)

    return 1

end





function x300642_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x300642_ProcAccept( varMap, varPlayer )

    

	
end




function x300642_ProcReturn(varMap, varPlayer,QuestData,varQuest,varTalknpc)
















end




function x300642_ProcReturn2(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	if QuestData == 1 then    	
		local varStr = "#G帮主申请了帮会战，请做好准备，#R20点#G正式开始！"
        local nGuildID = GetGuildID(varMap,varPlayer)
        LuaAllScenceM2Guild(varMap, varStr, nGuildID, 2, 1)
        LuaAllScenceM2Guild(varMap, varStr, nGuildID, 3, 1)

        StartTalkTask(varMap)
		TalkAppendString(varMap, "您申请了帮会战，请做好准备，20点正式开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

	elseif QuestData == 0 then
  	 	StartTalkTask(varMap)
		TalkAppendString(varMap, "您的帮会不存在");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	elseif QuestData == -2 then
   	 	StartTalkTask(varMap)
		TalkAppendString(varMap, "帮会战报名数已达上限！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	elseif QuestData == -3 then
   	 	StartTalkTask(varMap)
		TalkAppendString(varMap, "您的帮会人数太少，报名失败。");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	elseif QuestData == -4 then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已经报过名了");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end

end




function x300642_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300642_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300642_CheckSubmit( varMap, varPlayer )
end




function x300642_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300642_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300642_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300642_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
