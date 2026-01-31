
--DECLARE_QUEST_INFO_START--

x550530_var_FileId = 550530

x550530_var_QuestName="国王战场传送"
--DECLARE_QUEST_INFO_STOP--




function x550530_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    StartTalkTask(varMap)
    TalkAppendString(varMap,"\t我可以送你#G离开战场#W，一旦离开，你在本次争夺战中#G无法再次进入#W。\n \n你确定要#G放弃#W并#G离开战场#W吗？")
    StopTalkTask(varMap)
    DeliverTalkInfo(varMap,varPlayer,varTalknpc,x550530_var_FileId,-1)
    TalkAppendButton(varMap,x550530_var_FileId,"离开战场",3,2)
end


function x550530_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )

    StartTalkTask(varMap)
    TalkAppendString(varMap,"一旦离开战场将不能再次进入，您确定要离开吗？")
    StopTalkTask(varMap)
    DeliverTalkInfo(varMap,varPlayer,varTalknpc,x550530_var_FileId,-1)
    return 1
end




function x550530_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x550530_ProcAccept( varMap, varPlayer )
    LuaCallNoclosure( KINGBATTLE_FLOW_SCRIPT,"ProcPlayerLeave",varMap, varPlayer)
    LuaCallNoclosure( KINGBATTLE_FLOW_SCRIPT,"KingBattleKickPlayer",varMap,varPlayer)
end




function x550530_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x550530_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x550530_CheckSubmit( varMap, varPlayer )
end




function x550530_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

