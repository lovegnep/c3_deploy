
--DECLARE_QUEST_INFO_START--

x550527_var_FileId = 550527



x550527_var_QuestName="山庄回援传送者"

--DECLARE_QUEST_INFO_STOP--

x550527_var_ChuanSong_X = 24.689863
x550527_var_ChuanSong_Z = 234.467072



function x550527_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

    
    if GetGuildBattleStatus(varMap) ~= 3 then
        return
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

    if nFlag == 1 then
	    TalkAppendButton(varMap,x550527_var_FileId,"回援传送",13,1)
    end
end


function x550527_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )

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

    
    local nFlag = 1
    if nGuildId == nGuildA then
        nFlag = 0
    elseif nGuildId == nGuildB then
        nFlag = 1
    end

    if nFlag ~= 1 then
        return
    end

    SetPos(varMap,varPlayer,x550527_var_ChuanSong_X,x550527_var_ChuanSong_Z)


end




function x550527_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x550527_ProcAccept( varMap, varPlayer )

end




function x550527_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x550527_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x550527_CheckSubmit( varMap, varPlayer )
end




function x550527_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

