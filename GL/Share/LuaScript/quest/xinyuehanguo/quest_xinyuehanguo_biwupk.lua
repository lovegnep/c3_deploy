


x211038_var_FileId = 211038
x211038_var_QuestName="擂台比武"







function x211038_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#YPK阵营")
		TalkAppendString(varMap, "你现在已经是PK阵营了，找些高手来挑战挑战，看看自己的势力到底如何！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	StartTalkTask(varMap)
		local varText = "你变换为PK阵营"
		TalkAppendString(varMap,varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	SetCurCamp(varMap, varPlayer, 4)
end









function x211038_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211038_var_FileId, "PK阵营")
end









function x211038_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211038_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211038_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211038_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211038_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211038_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211038_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211038_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
