


x222002_var_FileId = 222002
x222002_var_QuestName="免费治疗"






function x222002_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y免费治疗")
		TalkAppendString(varMap, "现在你已经恢复健康了，去做你该做的事吧。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	StartTalkTask(varMap)
		local varText = "你全身恢复了健康"
		TalkAppendString(varMap,varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	RestoreHp(varMap, varPlayer,0)
	RestoreRage(varMap, varPlayer,100)
end









function x222002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x222002_var_FileId, x222002_var_QuestName , 3 )
end









function x222002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x222002_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x222002_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x222002_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x222002_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x222002_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x222002_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x222002_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
