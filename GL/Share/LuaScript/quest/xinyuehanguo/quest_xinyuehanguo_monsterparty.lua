


x211013_var_FileId = 211013
x211013_var_QuestName="怪兽总动员"







function x211013_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y怪兽总动员")
		TalkAppendString(varMap, "最近国内豪门流行招揽门客，我手底下也有不少来自各地的人才，你可敢与他们较量较量，我也正好看看他们是不是有真本事。文斗武斗，你来选。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211013_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211013_var_FileId, x211013_var_QuestName)
end









function x211013_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211013_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211013_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211013_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211013_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211013_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211013_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211013_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
