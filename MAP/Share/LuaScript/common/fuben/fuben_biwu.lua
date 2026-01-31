--DECLARE_QUEST_INFO_START--






x700005_var_FileId              = 700005
x700005_var_QuestId             = 409

x700005_var_FuBenType             = 1

x700005_var_FubenName         = "比武"
x700005_var_Name                  = ""
x700005_var_FubenType         	= FUBEN_BIWULEITAI
x700005_var_TickTime              = 5             
x700005_var_LimitTotalHoldTime    = 100   
x700005_var_CloseTick             = 6             
x700005_var_NoUserTime            = 10            
x700005_var_Fuben_X1              = 46                
x700005_var_Fuben_Z1              = 64                
x700005_var_Fuben_X2              = 82                
x700005_var_Fuben_Z2              = 66                
x700005_var_Back_X                = 227                
x700005_var_Back_Z                = 239.5               


x700005_var_QuestName           = "离开比武场"
x700005_var_QuestInfo           = "你确定要离开比武场吗？"

x700005_var_FuBenCreateOK             = "比武擂台创建完成！"
x700005_var_FuBenCreateFailed         = "比武擂台已达上限，请稍后再试！"
x700005_var_QuestAbandon            = "任务失败！"
x700005_var_CountDownMessage          = "你将在%d秒后离开比武擂台！"
x700005_var_SceneMapNavPath           = "fuben_biwuleitai/fuben_biwuleitai.nav"

--DECLARE_QUEST_INFO_STOP--

x700005_var_QuestNPCName            =   {
                                            {scene = 11, varName = "苏菲"},        
                                            {scene = 18, varName = "苏菲"},        
                                            {scene = 21, varName = "苏菲"},        
                                            {scene = 24, varName = "苏菲"},        
                                            {scene = 36, varName = "天衣居"}       
                                        }







x700005_OK                          = 0
x700005_OK_RETURN                   = 1
x700005_ERROR_UNKNOWN               = -1

x700005_FAILED_COUNTRY              = 10
x700005_FAILED_LEVEL                = 11
x700005_FAILED_TEAM                 = 14
x700005_FAILED_TEAMNUM              = 15
x700005_FAILED_CAPTAIN              = 16

x700005_FAILED_OTHERLEVEL           = 20
x700005_FAILED_OTHERMISSION         = 22
x700005_FAILED_OTHERAROUND          = 23

x700005_MP_AIMSCENE                 = 0
x700005_MP_TEAMID                   = 1
x700005_MP_KILLMONSTER              = 2
x700005_MP_ISCOMPLETE               = 7

x700005_CSP_FUBENTYPE               = 0
x700005_CSP_SCRIPTID                = 1
x700005_CSP_TICKCOUNT               = 2
x700005_CSP_FROMSCENEID             = 3
x700005_CSP_ISCLOSING               = 4
x700005_CSP_LEAVECOUNTDOWN          = 5

x700005_CSP_TEAMID_1                = 10
x700005_CSP_TEAMID_2                = 11


x700005_CAMP_Team1                  = 5
x700005_CAMP_Team2                  = 6

x700005_Skill_ID                    = 7602	

x700005_wintalk                     =   "承认……承认……承认……承认……承认……"
x700005_losetalk                    =   "残念……残念……残念……残念……残念……"


function x700005_MakeFubenEx(varMap, varPlayer, memberNum, varTalknpc, memberNum2)

    
    

    local teamid = GetTeamId(varMap, varPlayer)
    local teamid2 = GetTeamId(varMap, varTalknpc)

    local guid1 = ObjId2Guid( varMap,varPlayer )
    local guid2 = ObjId2Guid( varMap,varTalknpc )


    if teamid ~=-1 and teamid2 ~=-1 and teamid == teamid2 then
        StartTalkTask(varMap);
            TalkAppendString(varMap, "你和对方在同一队伍里，不能参加比武！");
        StopTalkTask();
        DeliverTalkTips(varMap, varPlayer);
        DeliverTalkTips(varMap, varTalknpc);
        return
    end

    local leaderguid = ObjId2Guid(varMap, varPlayer);
    SetSceneLoad_Map(varMap, x700005_var_SceneMapNavPath); 
    SetFubenData_TeamLeader(varMap, leaderguid);
    SetFubenData_NoUserCloseTime(varMap, x700005_var_NoUserTime * 1000);
    SetFubenData_Timer(varMap, x700005_var_TickTime * 1000);
    SetFubenData_Param(varMap, x700005_CSP_FUBENTYPE, x700005_var_FubenType);
    SetFubenData_Param(varMap, x700005_CSP_SCRIPTID, x700005_var_FileId);
    SetFubenData_Param(varMap, x700005_CSP_TICKCOUNT, 0);
    SetFubenData_Param(varMap, x700005_CSP_FROMSCENEID, varMap);
    SetFubenData_Param(varMap, x700005_CSP_ISCLOSING, 0);
    SetFubenData_Param(varMap, x700005_CSP_LEAVECOUNTDOWN, 0);


    SetFubenData_Param(varMap, x700005_CSP_TEAMID_1, guid1); 
    SetFubenData_Param(varMap, x700005_CSP_TEAMID_2, guid2); 


    local varSelectMap = CreateFuben(varMap); 

    StartTalkTask(varMap);
    if varSelectMap > 0 then
        TalkAppendString(varMap, x700005_var_FuBenCreateOK);
    else
        TalkAppendString(varMap, x700005_var_FuBenCreateFailed);
    end
    StopTalkTask();
    DeliverTalkTips(varMap, varPlayer);

end








function x700005_ProcPlayerDie(varMap, varPlayer, varKiller)


    
    StartTalkTask(varMap)
        Msg2Player(varMap,varKiller,"承认……承认……承认……承认……承认……",4,2)
        Msg2Player(varMap,varPlayer,"残念……残念……残念……残念……残念……",4,2)
    StopTalkTask()



end







function x700005_ProcPlayerEnter(varMap, varPlayer)

    

    SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer,x700005_Skill_ID,10);

end


function x700005_RestorePlayerCamp( varMap,varPlayer)

      local varCountry = GetCurCountry( varMap,varPlayer )
      SetCurCamp( varMap,varPlayer,varCountry )
end






function x700005_ProcFubenReady(varMap, destsceneId)




    SetFubenData_Param(destsceneId, x700005_CSP_FROMSCENEID, varMap);

    local selfGuidID    = GetFubenData_Param(varMap, x700005_CSP_TEAMID_1);
    local targetGuidID  = GetFubenData_Param(varMap, x700005_CSP_TEAMID_2);

    local varPlayer = Guid2ObjId( varMap,selfGuidID)
    local varTalknpc = Guid2ObjId( varMap,targetGuidID)

    local selfTeamID   = GetTeamId(varMap, varPlayer)
    local targetTeamID = GetTeamId(varMap, varTalknpc)

    
    if selfTeamID == -1 then

            SetCurCamp(varMap,varPlayer,x700005_CAMP_Team1)
            NewWorld(varMap, varPlayer, destsceneId, x700005_var_Fuben_X1, x700005_var_Fuben_Z1,700005);

    else
        local memberNum = GetNearTeamCount(varMap, varPlayer);
        for varI = 0, memberNum - 1 do

            local memberId = GetNearTeamMember(varMap, varPlayer, varI)

            SetCurCamp(varMap,memberId,x700005_CAMP_Team1)
            NewWorld(varMap, memberId, destsceneId, x700005_var_Fuben_X1, x700005_var_Fuben_Z1,700005)
        end
    end

    
    if targetTeamID == -1 then

            SetCurCamp(varMap,varTalknpc,x700005_CAMP_Team2)
            NewWorld(varMap, varTalknpc, destsceneId, x700005_var_Fuben_X2, x700005_var_Fuben_Z2,700005)

    else
        local memberNum = GetNearTeamCount(varMap, varTalknpc);
        for varI = 0, memberNum - 1 do

            local memberId = GetNearTeamMember(varMap, varTalknpc, varI)

            SetCurCamp(varMap,memberId,x700005_CAMP_Team2);
            NewWorld(varMap, memberId, destsceneId, x700005_var_Fuben_X2, x700005_var_Fuben_Z2,700005)
        end
    end

end








function x700005_ProcEventEntry(varMap, varPlayer, varTalknpc)  

    StartTalkTask(varMap)
        TalkAppendString(varMap, x700005_var_QuestInfo)
    StopTalkTask()
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700005_var_FileId, x700005_var_QuestName)

end









function x700005_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


        TalkAppendButton(varMap, x700005_var_FileId, x700005_var_QuestName)



end









function x700005_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
return 1
end








function x700005_CheckPushList(varMap, varPlayer, varTalknpc)

end







function x700005_ProcAccept(varMap, varPlayer)
end

function x700005_ProcLeaveBiwu(varMap, varPlayer)

    x700005_RestorePlayerCamp(varMap,varPlayer)

    local oldsceneId = GetFubenData_Param(varMap, x700005_CSP_FROMSCENEID);
    SetPlayerMutexState( varMap,varPlayer,PLAYER_STATE_DIE,0) 
    NewWorld(varMap,varPlayer,oldsceneId,x700005_var_Back_X,x700005_var_Back_Z,700005)
end









function x700005_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x700005_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x700005_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)


end






function x700005_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x700005_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end




function x700005_CancelQuest(varMap, varPlayer)
end






function x700005_ProcFubenTimer( varMap, nowTime )
    local nowTickCount = GetFubenData_Param(varMap, x700005_CSP_TICKCOUNT) + 1;
    SetFubenData_Param(varMap, x700005_CSP_TICKCOUNT, nowTickCount);


    local leaveFlag = GetFubenData_Param(varMap, x700005_CSP_ISCLOSING);

    if leaveFlag > 0 then

        
        local leaveCountDown = GetFubenData_Param(varMap, x700005_CSP_LEAVECOUNTDOWN) + 1;
        SetFubenData_Param(varMap, x700005_CSP_LEAVECOUNTDOWN, leaveCountDown);

        if leaveCountDown == x700005_var_CloseTick then
            local oldsceneId = GetFubenData_Param(varMap, x700005_CSP_FROMSCENEID);
            local humancount = GetFuben_PlayerCount(varMap);
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI);
                RelivePlayerNM( varMap,humanId,2) 
                SetPlayerMutexState( varMap,humanId,PLAYER_STATE_DIE,0) 
                x700005_RestorePlayerCamp(varMap,humanId)
                NewWorld(varMap,humanId,oldsceneId,x700005_var_Back_X,x700005_var_Back_Z,700005)
            end
        elseif leaveCountDown < x700005_var_CloseTick then
            local humancount = GetFuben_PlayerCount(varMap);
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI);
                local varStr = format(x700005_var_CountDownMessage, (x700005_var_CloseTick - leaveCountDown) * x700005_var_TickTime);
                StartTalkTask(varMap);
                TalkAppendString(varMap, varStr);
                StopTalkTask(varMap);
                DeliverTalkTips(varMap, humanId);
            end
        end

    else

        if nowTickCount > 4 then


            local humancount = GetFuben_PlayerCount(varMap);

            if humancount == 1 then

                SetFubenData_Param(varMap, x700005_CSP_ISCLOSING,1)

            elseif humancount > 1 then

                
                local bLeave = 1
                local bSameTeam = 1
                local bNotInTeam = 1
                local nTeamid = -2
                local nPreteamid = -2

                for varI = 0, humancount - 1 do

                    local humanId = GetFuben_PlayerObjId(varMap, varI);

                    nPreteamid = nTeamid
                    nTeamid = GetTeamId( varMap, humanId )


                    if nPreteamid ==- 2 then
                        nPreteamid = nTeamid
                    end

                    if nTeamid ~= nPreteamid then
                        bSameTeam = 0
                    end

                    if nTeamid ~= -1 then
                        bNotInTeam = 0
                    end
                end

                
                if bSameTeam == 1 then

                    if bNotInTeam == 1 then
                        bLeave = 0
                    end
                else
                    bLeave = 0
                end

                
                if nowTickCount == x700005_var_LimitTotalHoldTime then
                    for varI = 0, humancount - 1 do

                        local humanId = GetFuben_PlayerObjId(varMap, varI);
                        local nClosing = GetFubenData_Param(varMap, x700005_CSP_ISCLOSING )
                        if nClosing == 0 then
                            local oldsceneId = x700005_CancelQuest(varMap, humanId);
                            StartTalkTask(varMap);
                                TalkAppendString(varMap, "将在30秒后退出比武！");
                            StopTalkTask();
                            DeliverTalkTips(varMap, humanId);
                        end
                    end

                    SetFubenData_Param(varMap, x700005_CSP_ISCLOSING,1)
                end

                
                if bLeave == 1 then
                    SetFubenData_Param(varMap, x700005_CSP_ISCLOSING,1)
                end
            end
        end
    end
end
