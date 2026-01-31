
x561110_var_FileId = 561110
x561110_var_GameId = 1036
x561110_var_QuestName = "领取cd-key礼包"


function x561110_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x561110_var_FileId,x561110_var_QuestName,3,-1)
	
end



function x561110_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	if GetGameOpenById( x561110_var_GameId) <= 0 then
        x561110_ShowTips(varMap, varPlayer, varTalknpc, "此活动已关闭")
		return 0
    end
    
	
	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_NPCID,varTalknpc  )
	
	
	OpenAwardBox( varMap, varPlayer )

end


function x561110_ShowTips(varMap, varPlayer,varTalknpc, varStr)

	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561110_var_FileId, -1);
	
end

function x561110_ProcAccept( varMap, varPlayer )
	return 0
end

function x561110_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 0
end

function x561103_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end
