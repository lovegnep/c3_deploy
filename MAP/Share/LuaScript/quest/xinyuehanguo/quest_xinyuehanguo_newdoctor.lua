


x211042_var_FileId = 211042
x211042_var_QuestName="免费治疗"






function x211042_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y免费治疗")
		TalkAppendString(varMap, "目前国家正处于不断发展阶段，我这里也响应号召，为大家免费治疗。现在你已经恢复健康了，去做你该做的事吧，不要荒废了光阴。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	StartTalkTask(varMap)
		local varText = "你全身恢复了健康"
		TalkAppendString(varMap,varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	RestoreHp(varMap, varPlayer,100)
	RestoreRage(varMap, varPlayer,100)
end









function x211042_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211042_var_FileId, x211042_var_QuestName)
end









function x211042_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211042_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211042_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211042_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211042_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211042_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211042_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211042_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
