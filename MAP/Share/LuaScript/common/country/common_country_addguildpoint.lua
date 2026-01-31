



--DECLARE_QUEST_INFO_START--


x300306_var_FileId = 300306



x300306_var_QuestName="…Ò∞°£¨«Î¥ÕŒ“∞Ôπ±∞…£°"
x300306_var_QuestInfo="æÕ…Õƒ„’‚100∞Ôπ±∞…£°"

function x300306_ProcEventEntry( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)
		
		TalkAppendString(varMap,x300306_var_QuestInfo)
	
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap,varPlayer,varTalknpc,x300306_var_FileId,-1)
	
end


function x300306_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	return	1

end


function x300306_ProcAccept( varMap, varPlayer )

	AddGuildUserPoint(varMap,varPlayer,100)

end



function x300306_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x300306_var_FileId, x300306_var_QuestName)
end
