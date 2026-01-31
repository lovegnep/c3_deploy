
x303005_var_FileId          		= 303005
x303005_var_Leader_Index      		= 5
x303005_var_QuestName       		="【战场】六人战场申请"




function x303005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 then
		return
	end

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end

    
    
    
    
    if LuaCallNoclosure(303006,"IsBattleSignup",varMap) == 1 then
    	TalkAppendButton(varMap,x303005_var_FileId,x303005_var_QuestName,3);
    end
end




function x303005_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
	if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350  then
		return
	end

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    if LuaCallNoclosure(303006,"IsBattleSignup",varMap) ~= 1 then
    	StartTalkTask(varMap)
        TalkAppendString(varMap, "\t【战场】六人战场报名还没有开始！");
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return
    end
    
    
    
    
    

    

    if idExt == 0 then
    	
    	
    	if HasTeam(varMap,varPlayer) == 1 and IsTeamLeader(varMap, varPlayer) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t队伍模式下,只有队长才能申请参加【战场】六人战场。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end
    	
    	
    	if LuaCallNoclosure(303006,"IsBattleSignup",varMap) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t【战场】六人战场报名还没有开始！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end
    	
        
        
        PVP6v6SignupState( varMap,varPlayer ,varTalknpc)


    elseif idExt == 1 then

        
        
    	if HasTeam(varMap,varPlayer) == 1 and IsTeamLeader(varMap, varPlayer) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t队伍模式中,只有队长才能申请参加【战场】六人战场。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end
    	
    	
    	if LuaCallNoclosure(303006,"IsBattleSignup",varMap) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t【战场】六人战场报名还没有开始！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end

        
        PVP6v6Signup( varMap,varPlayer,varTalknpc)
			
	end
    return 1

end




function x303005_ProcQuerySignupResult( varMap,varPlayer,result,varTalknpc )

		if result == 8 then
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，您的等级不足60级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
		
    elseif result == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，【战场】六人战场还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 2 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您没有队伍！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif result == 3 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t队伍模式下,您所在队伍人数必须为3人以上才能报名【战场】六人战场。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 4 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您所在队伍的玩家必须都线上。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 5 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您已经报过名了！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 6 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您的队友已经报过名了！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 7 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t这次的【战场】六人战场报名已经满了，请等候下场战斗。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0
  
    elseif result == 9 then
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，您的队友的等级必须在60级以上！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
    end


    StartTalkTask(varMap)
    TalkAppendString(varMap, "\t您是否要报名参加【战场】六人战场？");
    TalkAppendButton(varMap,x303005_var_FileId,"确定",3,1);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1

end




function x303005_ProcSignupResult( varMap,varPlayer,result,varTalknpc )
    
    if result == 8 then
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，您的等级不足60级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
		elseif result == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，【战场】六人战场还没有开始！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 2 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您没有队伍！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif result == 3 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t队伍模式下,您所在队伍人数必须为3人以上才能报名【战场】六人战场。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 4 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您所在队伍的玩家必须都线上。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 5 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您已经报过名了！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 6 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t您的队友已经报过名了！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 7 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t这次的【战场】六人战场报名已经满了，请等候下场战斗。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        return 0

    elseif result == 9 then
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，您的队友的等级必须在60级以上！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
		
    end

    StartTalkTask(varMap)
    TalkAppendString(varMap, "\t#G您顺利的申请了【战场】六人战场，请等待比赛的开始！");
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	local nTeamId = GetTeamId( varMap,varPlayer)
	if nTeamId >= 0 then
		LuaAllScenceM2Team(varMap,"您的队伍顺利的完成了【战场】六人战场的报名！",nTeamId,2,1)
		LuaAllScenceM2Team(varMap,"您的队伍顺利的完成了【战场】六人战场的报名！",nTeamId,3,1)		
	else
	
		local varName = GetName(varMap,varPlayer)
		LuaScenceM2Player(varMap,varPlayer,"您顺利的完成了【战场】六人战场的报名！",varName,2,1)
		LuaScenceM2Player(varMap,varPlayer,"您顺利的完成了【战场】六人战场的报名！",varName,3,1)		
	end

    return 1

end





function x303005_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303005_ProcAccept( varMap, varPlayer )
end




function x303005_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303005_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303005_CheckSubmit( varMap, varPlayer )
end




function x303005_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303005_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303005_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303005_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
