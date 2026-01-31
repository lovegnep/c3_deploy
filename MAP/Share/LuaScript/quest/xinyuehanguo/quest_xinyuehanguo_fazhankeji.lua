


--DECLARE_QUEST_INFO_START--
x211002_var_FileId = 211002

x211002_var_QuestName = "发展科技"
--DECLARE_QUEST_INFO_STOP--






function x211002_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y发展科技")
		TalkAppendString(varMap, "国家要发展强大，需要科技的不断提升。国强则民强，国弱则民弱，为国奉献，义不容辞。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211002_var_FileId, x211002_var_QuestName)
end









function x211002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211002_ProcAccept(varMap, varPlayer)
    
end









function x211002_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211002_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211002_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211002_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211002_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211002_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
