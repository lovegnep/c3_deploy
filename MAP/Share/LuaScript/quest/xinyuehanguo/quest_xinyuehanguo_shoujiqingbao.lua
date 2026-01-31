


--DECLARE_QUEST_INFO_START--
x211005_var_FileId = 211005

x211005_var_QuestName = "收集情报"
--DECLARE_QUEST_INFO_STOP--






function x211005_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y收集情报")
		TalkAppendString(varMap, "两国交战，情报的收集工作尤为重要。情报人员虽然不在战场上冲锋陷阵杀敌，但是一条重要的情报，往往杀人无数于无形中。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211005_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211005_var_FileId, x211005_var_QuestName)
end









function x211005_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211005_ProcAccept(varMap, varPlayer)
    
end









function x211005_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211005_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211005_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211005_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211005_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211005_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
