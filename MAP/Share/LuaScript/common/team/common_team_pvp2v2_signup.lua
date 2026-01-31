
x303000_var_FileId          		= 303000
x303000_var_Leader_Index      		= 5
x303000_var_QuestName       		="【战场】双人战场申请"




function x303000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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

    
    
    
    
    if LuaCallNoclosure(303001,"IsBattleSignup",varMap) == 1 then
    	TalkAppendButton(varMap,x303000_var_FileId,x303000_var_QuestName,3);
    end
end




function x303000_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

	
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
    
    if LuaCallNoclosure(303001,"IsBattleSignup",varMap) ~= 1 then
    	StartTalkTask(varMap)
        TalkAppendString(varMap, "\t双人战场报名还没有开始！");
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    	return
    end
    
    
    
    
    

    

    if idExt == 0 then
    	if GetGameOpenById(2004) ~= 1 then
    	  	StartTalkTask(varMap)
        	TalkAppendString(varMap, "\t活动没有开启，敬请期待！");
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
			end     	
    	
    	if IsTeamLeader(varMap, varPlayer) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t只有队长才能申请参加双人战场。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end
    	
    	
    	if LuaCallNoclosure(303001,"IsBattleSignup",varMap) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t双人战场报名还没有开始！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end
    	
        
        
        PVP2v2SignupState( varMap,varPlayer ,varTalknpc)


    elseif idExt == 1 then

        
        
    	if IsTeamLeader(varMap, varPlayer) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t只有队长才能申请参加双人战场。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end
    	
    	
    	if LuaCallNoclosure(303001,"IsBattleSignup",varMap) ~= 1 then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "\t双人战场报名还没有开始！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
    	end

        
        PVP2v2Signup( varMap,varPlayer,varTalknpc)
			
	end
    return 1

end




function x303000_ProcQuerySignupResult( varMap,varPlayer,result,varTalknpc )

    if result == 8 then
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，您的等级不足60级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
    elseif result == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，双人战场还没有开始！");
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
		TalkAppendString(varMap, "\t您所在队伍人数必须为2人才能报名双人战场。");
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
		TalkAppendString(varMap, "\t这次的双人战场报名已经满了，请等候下场战斗。");
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
    TalkAppendString(varMap, "\t您是否要报名参加【战场】双人战场？");
    TalkAppendButton(varMap,x303000_var_FileId,"确定",3,1);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1

end




function x303000_ProcSignupResult( varMap,varPlayer,result,varTalknpc )
    
    if result == 8 then
    	
    	StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，您的等级不足60级！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		return 0
    elseif result == 1 then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "\t很抱歉，双人战场还没有开始！");
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
		TalkAppendString(varMap, "\t您所在队伍人数必须为2人才能报名双人战场。");
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
		TalkAppendString(varMap, "\t这次的双人战场报名已经满了，请等候下场战斗。");
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
    TalkAppendString(varMap, "\t#G您顺利的申请了【战场】双人战场，请等待比赛的开始！");
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	local nTeamId = GetTeamId( varMap,varPlayer)
	if nTeamId >= 0 then
		LuaAllScenceM2Team(varMap,"您的队伍顺利的完成了【战场】双人战场的报名！",nTeamId,2,1)
		LuaAllScenceM2Team(varMap,"您的队伍顺利的完成了【战场】双人战场的报名！",nTeamId,3,1)		
	end

    return 1

end





function x303000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x303000_ProcAccept( varMap, varPlayer )
end




function x303000_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x303000_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x303000_CheckSubmit( varMap, varPlayer )
end




function x303000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x303000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x303000_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303000_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
