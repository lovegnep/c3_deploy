
--DECLARE_QUEST_INFO_START--

x550526_var_FileId = 550526



x550526_var_QuestName="山庄前线传送者"

--DECLARE_QUEST_INFO_STOP--

x550526_var_ChuanSong_X = 22.041122
x550526_var_ChuanSong_Z = 23.897568



function x550526_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

    
    if GetGuildBattleStatus(varMap) ~= 3 then
        TalkAppendButton(varMap,x550526_var_FileId,"离开战场",3,2)
        return
    end

    
	local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nFlag = -1
    if nGuildId == nGuildA then
        nFlag = 0
    elseif nGuildId == nGuildB then
        nFlag = 1
    else
        nFlag = 1
    end

    if nFlag == 1 then
	    
        TalkAppendButton(varMap,x550526_var_FileId,"离开战场",3,2)
    end
end


function x550526_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )

    if idExt == 2 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"你真的要离开战场吗？")
        StopTalkTask(varMap)
        DeliverTalkInfo(varMap,varPlayer,varTalknpc,x550526_var_FileId,-1)
        return 1
    end

	if GetGuildBattleStatus(varMap) ~= 3 then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "战场未开放");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

    
	local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nFlag = 1
    if nGuildId == nGuildA then
        nFlag = 0
    elseif nGuildId == nGuildB then
        nFlag = 1
    end

    if nFlag ~= 1 then
        return
    end

    if idExt == 1 then
        SetPos(varMap,varPlayer,x550526_var_ChuanSong_X,x550526_var_ChuanSong_Z)
    end


end




function x550526_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x550526_ProcAccept( varMap, varPlayer )
    LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"ProcPlayerLeave",varMap, varPlayer)
    TimerCommand( varMap, varPlayer, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);
    LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"GuildBattleKickPlayer",varMap,varPlayer)
end




function x550526_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x550526_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x550526_CheckSubmit( varMap, varPlayer )
end




function x550526_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

