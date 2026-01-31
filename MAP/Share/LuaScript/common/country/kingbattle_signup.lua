


--DECLARE_QUEST_INFO_START--
x300815_var_FileId              = 300815
x300815_var_Leader_Index          = 5
x300815_var_QuestName           ="【国家】挑战国王"
x300815_var_QuestName0          ="【国家】争夺国王"
x300815_var_QuestName1          ="【国家】国王战场查询"
x300815_var_NeedMoney             = 50*1000
x300815_var_GuildLevel            = 1
x300815_var_GuildMemberNum        = 1

x300815_var_Signup_None                       = -1         
x300815_var_Signup_OK                         =  0         
x300815_var_Signup_Failed                     =  1         
x300815_var_Signup_Signed                     =  2         
x300815_var_Signup_Other                      =  3         
x300815_var_Signup_TimeNotMatch               =  4         
x300815_var_Signup_NoGuild                    =  5         
x300815_var_Signup_GuildNotMatchPlayer        =  6         
x300815_var_Signup_NotGuildLeader             =  7         
x300815_var_Signup_GuildLevelError            =  8         
x300815_var_Signup_GuildMemberCountError      =  9         
x300815_var_Signup_NoKing                     =  10        
x300815_var_Signup_KingPlayerInSameGuild      =  11        
x300815_var_Signup_KingPlayerIsOnePlayer      =  12        
x300815_var_Signup_PowerNotEnough             =  13        
x300815_var_KingBattleNotPermitSignUp         =  14        
x300815_var_Signup_OtherError                 =  15        
x300815_var_Leader_Index                      =  5
--DECLARE_QUEST_INFO_STOP--



function x300815_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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

    
    local nGuildId = GetGuildID(varMap,varPlayer )

    
    if nGuildId < 0 then
        return
    end
    

    
    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300815_var_Leader_Index then
        return
    end

    local nHumanGUID = GetPlayerGUID( varMap,varPlayer )
    
    
    local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
    local nKingGuildID = GetCountryKingGuildId( varMap,varPlayer )
    if nHumanGUID ~= nKingGUID then
    	if nKingGuildID < 0 then
        	TalkAppendButton(varMap,x300815_var_FileId,x300815_var_QuestName0,3);
        else
        	TalkAppendButton(varMap,x300815_var_FileId,x300815_var_QuestName0,3);
        end
        
        
        if GetKingBattleStatus( varMap ) >= STATE_KING_BATTLE_SIGNUP and GetKingBattleStatus( varMap ) < STATE_KING_BATTLE_BATTLE then
        	TalkAppendButton(varMap,x300815_var_FileId,x300815_var_QuestName1,3,x300815_var_FileId);
        end
        
    end
    
end




function x300815_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

    if idExt == 0 then
    
    	
    	if GetKingBattleStatus( varMap ) ~= STATE_KING_BATTLE_SIGNUP then
    		StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，很抱歉，现在不是报名时间。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
    		return
    	end

        
        local nGuildId = GetGuildID( varMap,varPlayer )
        
         








	    
        QueryKingBattleSignupState( varMap,varPlayer,nGuildId,varTalknpc )

    elseif idExt == 1 then

        
        local pos = GetGuildOfficial(varMap, varPlayer)
        if pos ~= x300815_var_Leader_Index then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，很抱歉，您还不是帮主无法申请国王。");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
        end

        local nGuildId = GetGuildID(varMap,varPlayer )
        local nLevel,nMemberNum,nExp = GetGuildSimpleData( nGuildId )

        
        
            
            
            
            
            
        

        
        if nMemberNum < x300815_var_GuildMemberNum then
            StartTalkTask(varMap)
            TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，帮会成员不足15人！");
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
            return
        end
        
        
        









        









        
        
        
        
        
        
        
        

        
        

        
        SignupKingBattle( varMap,varPlayer,nGuildId )

    elseif idExt == x300815_var_FileId then
    	
    	KingBattleQueryCurrentGuild(varMap,varPlayer,varTalknpc)
    	
    end

    return 1

end




function x300815_ProcQueryKingBattleSignupState( varMap,varPlayer,nResult,varTalknpc,nCurrentGuildA,nCurrentGuildB )
    
    if nResult == x300815_var_Signup_None then

        
        x300815_KingBattleSignup( varMap,varPlayer,varTalknpc,nCurrentGuildA,nCurrentGuildB )

    elseif nResult == x300815_var_Signup_Signed then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t很抱歉，已经受理了您挑战国王的请求，无法再次挑战国王。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_Other then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，很抱歉，在您之前已经有帮会进行了申请国王。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    
        
        
		
		
		
    
    elseif nResult == x300815_var_Signup_NoGuild then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，必须有帮会才能申请挑战！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_GuildNotMatchPlayer then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，申请帮会资讯与玩家所在帮会不匹配！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_NotGuildLeader then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，必须是帮主才可以申请！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    

        
		
		
		

    elseif nResult == x300815_var_Signup_GuildMemberCountError then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，帮会成员不足15人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_NoKing then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，无法申请挑战，现在还没有国王！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_KingPlayerInSameGuild then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，不能与国王在同一个帮会！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_KingPlayerIsOnePlayer then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，国王不能申请国王战场！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
		
	elseif nResult == x300815_var_Signup_PowerNotEnough then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，帮会实力必须大于已经申请的帮会实力！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif nResult == x300815_var_KingBattleNotPermitSignUp then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败,你所在国家的国王争夺战尚未开启!");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		

    else
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，未知原因，可能国王战场申请数已达上线！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    end

    return 1

end




function x300815_KingBattleSignup( varMap,varPlayer,varTalknpc ,nCurrentGuildA,nCurrentGuildB)
    
    
    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300815_var_Leader_Index then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t很抱歉，您还不是帮主无法申请国王。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
	end

    local nGuildId = GetGuildID(varMap,varPlayer )
    local nLevel,nMemberNum,nExp = GetGuildSimpleData( nGuildId )

    
    
        
		
		
		
		
    

    
    if nMemberNum < x300815_var_GuildMemberNum then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，帮会成员不足15人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
    end
    
    





    










    
	if GetKingBattleStatus(varMap) ~= STATE_KING_BATTLE_SIGNUP then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，很抱歉，请在周日14：00~17：00之间申请国王。");
		StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 0
	end


	
	local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
	local nKingGuildID = GetCountryKingGuildId( varMap,varPlayer )
	
	local varMsg = ""
	if nKingGuildID >= 0 then
		if nCurrentGuildA >= 0 then
			local strCurrentGuildName = GetGuildName( nCurrentGuildA )
			varMsg = format("#R已经有国王，您确定发起对现任国王的挑战吗？\n#G当前已发起对国王挑战并且实力最强帮会为:#c0000FF%s",strCurrentGuildName)
		else
			varMsg = "#R已经有国王，您确定发起对现任国王的挑战吗？\n#G当前没有帮会发起对国王的争夺!"
		end
	else
		if nCurrentGuildA < 0 and nCurrentGuildB < 0 then
			varMsg = "#R目前没有国王，您确定要争夺国王吗？\n#G当前没有帮会发起对国王的争夺!"
		elseif nCurrentGuildA <0 and nCurrentGuildB >= 0 then
			local strGuildBName = GetGuildName( nCurrentGuildB )
			varMsg = format("#R目前没有国王，您确定要争夺国王吗？\n#G当前已发起对国王挑战并且实力最强帮会为:#c0000FF%s!",strGuildBName)
		elseif nCurrentGuildA >= 0 and nCurrentGuildB >= 0 then
			local strGuildBNameA = GetGuildName( nCurrentGuildA )
			local strGuildBNameB = GetGuildName( nCurrentGuildB )
			varMsg = format("#R目前没有国王，您确定要争夺国王吗？\n#G当前已发起对国王挑战并且实力最强帮会为:#c0000FF%s,%s!",strGuildBNameA,strGuildBNameB)
		end
	end 
	
    StartTalkTask(varMap)
	local varMsg1 ="#Y【国家】争夺国王#W#r #r 1、您必须在#G周日14：00-17：00#W之间申请#W。#r #r2、当您申请后，如果有在#G帮会实力榜#W上排名高于您所在帮会排名的帮会报名，您的报名申请将会被#G顶替#W。#W#r #r 3、如果到达报名截止时间，#G只有一个#W帮会报名，则该帮会#G自动成为王者卫队#W，帮主#G自动成为国王#W。#W#r #r 4、如果到达报名截止时间，申请报名的帮会有2个，则会在#G周日20：00-20：20#W开启国王战场，胜者帮会成为王者卫队，帮主成为国王。#W#r #r5、您必须是某个帮会的#G帮主#W。#r #r6、您的帮会#G人数#W必须#G大于15人#W。#r #r"
	TalkAppendString(varMap, varMsg1);
    TalkAppendString(varMap, varMsg);
    TalkAppendButton(varMap,x300815_var_FileId,"确定..",3,1);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1
end

function x300815_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x300815_ProcAccept( varMap, varPlayer )
end





function x300815_ProcKingBattleSignupResult( varMap,varPlayer,nResult,varTalknpc ,nSignupCount)
    

    
    if nResult == x300815_var_Signup_OK then

        local nGuildId = GetGuildID(varMap,varPlayer )
        local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )

        local strGuildA = GetGuildName( nGuildId )
        local strGuildB = GetGuildName( GetCountryKingGuildId( varMap,varPlayer ) )

        local strMsg = ""
        
        if nSignupCount > 0 then
        	strMsg = format("恭喜本帮会完成报名国王战场，目前为止已有%d个帮会报名参加。",nSignupCount)
        else
        	strMsg = "恭喜本帮会完成报名国王战场，目前除了本帮会还没有其他帮会报名参加。"
        end
        
        LuaAllScenceM2Guild(varMap,strMsg,nGuildId,3,1)
        LuaAllScenceM2Guild(varMap,strMsg,nGuildId,2,1)

        StartTalkTask(varMap)
		TalkAppendString(varMap, strMsg);
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    elseif nResult == x300815_var_Signup_Signed then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t很抱歉，已经受理了您挑战国王的请求，无法再次挑战国王。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    elseif nResult == x300815_var_Signup_Other then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "##Y【国家】争夺国王#W#r\t申请失败，很抱歉，在您之前已经有帮会进行了申请国王。");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    
        
        
		
		
		

        
        
    
    elseif nResult == x300815_var_Signup_NoGuild then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，必须有帮会才能申请挑战！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    elseif nResult == x300815_var_Signup_GuildNotMatchPlayer then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，申请帮会资讯与玩家所在帮会不匹配！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    elseif nResult == x300815_var_Signup_NotGuildLeader then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，必须是帮主才可以申请！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    

        
		
		
		

        
        

    elseif nResult == x300815_var_Signup_GuildMemberCountError then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，帮会成员不足15人！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    elseif nResult == x300815_var_Signup_NoKing then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，无法申请挑战，现在还没有国王！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    elseif nResult == x300815_var_Signup_KingPlayerInSameGuild then
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，不能与国王在同一个帮会！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

    elseif nResult == x300815_var_Signup_KingPlayerIsOnePlayer then

        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，国王不能申请国王战场！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        

	elseif nResult == x300815_var_Signup_PowerNotEnough then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，帮会实力必须大于已经申请的帮会实力！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		
        
		
	elseif nResult == x300815_var_KingBattleNotPermitSignUp then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败,你所在国家的国王争夺战尚未开启!");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc) 
		
    else
        
        StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y【国家】争夺国王#W#r\t申请失败，未知原因，可能国王战场申请数已达上线！");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

        
        
    end

    return 1

end




function x300815_ProcKingBattleAskPlayerEnterScene( varMap, varPlayer )

    
    KingBattleAskEnterScene( varMap, varPlayer )
    
end





function x300815_ProcQueryCurrentGuild(varMap,varPlayer,varTalknpc,nCurrentGuildA,nCurrentGuildB,varCount)
	
	
	local nCountryId,nKingGUID,szKingName,nCountryGold = GetCountrySimpleData( varMap,varPlayer )
	local nKingGuildID = GetCountryKingGuildId( varMap,varPlayer )
	
	local varMsg = ""
	if nKingGuildID >= 0 then
		if nCurrentGuildA >= 0 then
			local strCurrentGuildName = GetGuildName( nCurrentGuildA )
			varMsg = format("#Y【国家】国王战场查询#W#r #r #R已经有国王，您确定对其进行挑战吗？\n#G当前已发起对国王的挑战并且实力最强帮会为:#c0000FF%s",strCurrentGuildName)
		else
			varMsg = "#Y【国家】国王战场查询#W#r #r #R已经有国王，您确定对其进行挑战吗？\n#G当前没有帮会发起对国王的争夺!"
		end
	else
		if nCurrentGuildA < 0 and nCurrentGuildB < 0 then	
			varMsg = "#Y【国家】国王战场查询#W#r #r #R目前没有国王!\n\t#G当前没有帮会发起到国王的争夺!"
		elseif nCurrentGuildA <0 and nCurrentGuildB >= 0 then
			local strGuildBName = GetGuildName( nCurrentGuildB )
			varMsg = format("#Y【国家】国王战场查询#W#r #r #R目前没有国王!\n#G当前已发起对国王的挑战并且实力最强帮会为:#c0000FF%s!",strGuildBName)
		elseif nCurrentGuildA >= 0 and nCurrentGuildB >= 0 then
			local strGuildBNameA = GetGuildName( nCurrentGuildA )
			local strGuildBNameB = GetGuildName( nCurrentGuildB )
			varMsg = format("#Y【国家】国王战场查询#W#r #r #R目前没有国王!\n#G当前已发起对国王的挑战并且实力最强帮会为:#c0000FF%s,%s!",strGuildBNameA,strGuildBNameB)
		end
	end 

    StartTalkTask(varMap)
    TalkAppendString(varMap, varMsg);
    StopTalkTask(varMap)
    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

    return 1
    	
end





function x300815_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x300815_ProcAccept( varMap, varPlayer )
end




function x300815_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300815_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300815_CheckSubmit( varMap, varPlayer )
end




function x300815_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300815_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300815_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300815_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
