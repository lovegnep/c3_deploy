


x211016_var_FileId = 211016
x211016_var_QuestName="推广员系统"







function x211016_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y推广员系统")
		TalkAppendString(varMap, "只要你能邀请更多的人加入到游戏里来，国家都将给予你相当的奖励。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211016_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211016_var_FileId, x211016_var_QuestName)
end









function x211016_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211016_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211016_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211016_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211016_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211016_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211016_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211016_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
