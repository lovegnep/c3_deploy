


x211012_var_FileId = 211012
x211012_var_QuestName="日常任务"







function x211012_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y日常任务")
		TalkAppendString(varMap, "我除了有钱，什么都没有。一天无所事事，难受得要紧，所以我就发出告示帮全国的人做些事。这下好，每天都有n多的人来找我帮忙了，我哪里忙得过来。你可愿意替我分担一些，我说了我除了有钱，什么都没有，所以我不会亏待你的。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211012_var_FileId, x211012_var_QuestName)
end









function x211012_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211012_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211012_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211012_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211012_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211012_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211012_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211012_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
