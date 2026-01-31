

--DECLARE_QUEST_INFO_START--
x310845_var_FileId = 310845
x310845_var_QuestName = "【个人】天赋奖励"
x310845_var_TargetLevel= 50
x310845_var_RequireInherenceLevel= 1
x310845_var_RequireLevel= 80 --不要修改
--DECLARE_QUEST_INFO_STOP--

function x310845_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton( varMap, x310845_var_FileId, x310845_var_QuestName, 3, 1)
end

function x310845_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
	StartTalkTask( varMap)
	TalkAppendString( varMap, x310845_var_QuestName..format( "\n\t凡是天赋等级达到%d级并且人物达到%d的玩家可以在我这提升天赋等级到%d级。", x310845_var_RequireInherenceLevel, x310845_var_RequireLevel, x310845_var_TargetLevel ) )
	StopTalkTask()
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310845_var_FileId, -1)
end

function x310845_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x310845_ProcAccept( varMap, varPlayer)
	if GetLevel(varMap,varPlayer) < x310845_var_RequireLevel then
		Msg2Player( varMap, varPlayer, "您人物等级过低，无法领取奖励", 8, 3)
		return
	end

	if GetInherenceLevel(varMap,varPlayer) < x310845_var_RequireInherenceLevel then
		Msg2Player( varMap, varPlayer, "您天赋等级过低，无法领取奖励", 8, 3)
		return
	end

	if GetInherenceLevel(varMap,varPlayer) >= x310845_var_TargetLevel then
		Msg2Player( varMap, varPlayer, "您天赋等级过高，无法领取奖励", 8, 3)
		return
	end

	AddInherenceExp(varMap,varPlayer,100000)
	Msg2Player( varMap, varPlayer, "领取奖励成功", 8, 3)
end

