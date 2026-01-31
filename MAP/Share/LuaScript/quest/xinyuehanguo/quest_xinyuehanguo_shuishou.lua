


--DECLARE_QUEST_INFO_START--
x211003_var_FileId = 211003

x211003_var_QuestName = "税收"
--DECLARE_QUEST_INFO_STOP--






function x211003_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y税收")
		TalkAppendString(varMap, "有了充足的税收，国家就可以发展科技，建设工程。但是过重的税收也会导致民怨，所以慎之慎之啊！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211003_var_FileId, x211003_var_QuestName)
end









function x211003_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211003_ProcAccept(varMap, varPlayer)
    
end









function x211003_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211003_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211003_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211003_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211003_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211003_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
