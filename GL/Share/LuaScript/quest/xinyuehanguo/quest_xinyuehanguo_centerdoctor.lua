


x211023_var_FileId = 211023
x211023_var_QuestName="免费治疗"






function x211023_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y免费治疗")
		TalkAppendString(varMap, "\t目前国家正处于不断发展阶段，我这里可以为你免费治疗。现在你已经恢复了健康，去做你该做的事吧。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	StartTalkTask(varMap)
		local	varText = "你恢复了健康"
		TalkAppendString(varMap,varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	RestoreHp(varMap, varPlayer,0)
	RestoreRage(varMap, varPlayer,100)
end









function x211023_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211023_var_FileId, x211023_var_QuestName , 3 )
end









function x211023_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211023_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211023_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211023_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211023_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211023_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211023_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211023_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
