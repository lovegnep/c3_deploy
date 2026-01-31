


x211008_var_FileId = 211008
x211008_var_QuestName="擂台比武"







function x211008_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y擂台比武")
		TalkAppendString(varMap, "比武场还在修缮中，等到比武场开放的时候，你可要多来看看，这里可是高手云集。想要一战成名，想要钻研更高武学，都可以来找我，我会帮助你的。当然了我会收取一点点小费了，你要是现在就报名，还可以给你打个折！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211008_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211008_var_FileId, x211008_var_QuestName)
end









function x211008_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211008_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211008_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211008_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211008_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211008_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211008_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211008_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
