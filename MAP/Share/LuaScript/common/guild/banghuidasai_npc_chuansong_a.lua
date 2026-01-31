
--DECLARE_QUEST_INFO_START--

x550524_var_FileId = 550524



x550524_var_QuestName="山寨前线传送"

--DECLARE_QUEST_INFO_STOP--

x550524_var_ChuanSong_X = 226.027695
x550524_var_ChuanSong_Z = 232.85527



function x550524_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

    
    if GetGuildBattleStatus(varMap) ~= 3 then
        TalkAppendButton(varMap,x550524_var_FileId,"离开战场",3,2)
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
    end
    
    if nFlag == 0 or nFlag == -1 then
	    
        TalkAppendButton(varMap,x550524_var_FileId,"离开战场",3,2)
    end
end


function x550524_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )

    if idExt == 2 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"你真的要离开战场吗？")
        StopTalkTask(varMap)
        DeliverTalkInfo(varMap,varPlayer,varTalknpc,x550524_var_FileId,-1)
        return 1

    end

	if GetGuildBattleStatus(varMap) ~= 3 then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "战场未开放");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

    
	local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    local nFlag = 0
    if nGuildId == nGuildA then
        nFlag = 0
    elseif nGuildId == nGuildB then
        nFlag = 1
    end

    if nFlag ~= 0 then
        return
    end

    if idExt == 1 then
        SetPos(varMap,varPlayer,x550524_var_ChuanSong_X,x550524_var_ChuanSong_Z)
    end


end




function x550524_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x550524_ProcAccept( varMap, varPlayer )
    LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"ProcPlayerLeave",varMap, varPlayer)
    TimerCommand( varMap, varPlayer, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);
    LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"GuildBattleKickPlayer",varMap,varPlayer)
end




function x550524_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x550524_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x550524_CheckSubmit( varMap, varPlayer )
end




function x550524_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

