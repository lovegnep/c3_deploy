


x211014_var_FileId = 211014
x211014_var_QuestName="庆祝活动"







function x211014_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y庆祝活动")
		TalkAppendString(varMap, "每逢节日到来，国家都会有很多的庆祝活动。当然有的时候，国王心情一好，每天都有可能是节日，这个好处自然是……呵呵，不用我明说了吧。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211014_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211014_var_FileId, x211014_var_QuestName)
end









function x211014_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211014_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211014_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211014_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211014_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211014_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211014_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211014_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
