


--DECLARE_QUEST_INFO_START--
x211004_var_FileId = 211004

x211004_var_QuestName = "建设工程"
--DECLARE_QUEST_INFO_STOP--






function x211004_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y建设工程")
		TalkAppendString(varMap, "国家基础建设跟上了，国民的生活质量才有提高。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211004_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211004_var_FileId, x211004_var_QuestName)
end









function x211004_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211004_ProcAccept(varMap, varPlayer)
    
end









function x211004_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211004_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211004_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211004_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211004_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211004_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
