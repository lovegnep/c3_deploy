



x211010_var_FileId = 211010
x211010_var_QuestName="二级运镖"







function x211010_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y二级运镖")
		TalkAppendString(varMap, "哈马斯大人是我信仰的主，在他的庇佑下，我才能在这道上混口饭吃。我和我二弟哈底斯现在是哈马斯大人的左臂右膀，你有什么事先找我俩，哈马斯大人很忙，不随便见外人的，知道了吗？")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211010_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211010_var_FileId, x211010_var_QuestName)
end









function x211010_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211010_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211010_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211010_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211010_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211010_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211010_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211010_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
