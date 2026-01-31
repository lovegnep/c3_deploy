x310905_var_FileId = 310905
x310905_var_ask ="端午海都袭城说明"
x310905_var_answer ="#Y【端午海都袭城说明】#W\n1.6月19日至6月25日，每天的11:00、15:00、17:00、22:00各会出现一批海都先锋袭城活动。\n2.22:00的袭城活动中会出现BOSS—海都，击杀海都将会获得稀有骑乘“先暂时不说。”"

function x310905_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	StartTalkTask(varMap)
	TalkAppendString(varMap,x310905_var_answer)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
end








function x310905_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x310905_var_FileId, x310905_var_ask,0,0)
end


