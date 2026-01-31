
--DECLARE_QUEST_INFO_START--

x303118_var_FileId = 303118

x303118_var_QuestName="跨服帮会战场传送"
--DECLARE_QUEST_INFO_STOP--




function x303118_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    StartTalkTask(varMap)
    TalkAppendString(varMap,"\t我可以送你#G离开战场#W，一旦离开，你在本次争夺战中#G无法再次进入#W。\n \n你确定要#G放弃#W并#G离开战场#W吗？")
    StopTalkTask(varMap)
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x303118_var_FileId, -1)
    TalkAppendButton(varMap,x303118_var_FileId,"离开战场",3,2)
end


function x303118_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )

    StartTalkTask(varMap)
    TalkAppendString(varMap,"一旦离开战场将不能再次进入，您确定要离开吗？")
    StopTalkTask(varMap)
    DeliverTalkInfo(varMap,varPlayer,varTalknpc,x303118_var_FileId,-1)
    return 1
end


function x303118_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x303118_ProcAccept( varMap, varPlayer )
    LuaCallNoclosure( MGUILD_BATTLE_SCRIPT, "ProcPlayerLeave", varMap, varPlayer)
    LuaCallNoclosure( MGUILD_BATTLE_SCRIPT, "KingBattleKickPlayer", varMap, varPlayer)
end


function x303118_ProcQuestAbandon( varMap, varPlayer, varQuest )
end


function x303118_ProcContinue( varMap, varPlayer, varTalknpc )
end


function x303118_CheckSubmit( varMap, varPlayer )
end


function x303118_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
