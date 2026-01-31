


x211039_var_FileId = 211039
x211039_var_QuestName="擂台比武"







function x211039_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y新手阵营")
		TalkAppendString(varMap, "你恢复了新手阵营，这样别人就没法找你的茬了！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	StartTalkTask(varMap)
		local varText = "你变换为新手阵营"
		TalkAppendString(varMap,varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	SetCurCamp(varMap, varPlayer, 0)
end









function x211039_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211039_var_FileId, "新手阵营")
end









function x211039_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211039_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211039_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211039_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211039_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211039_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211039_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211039_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
