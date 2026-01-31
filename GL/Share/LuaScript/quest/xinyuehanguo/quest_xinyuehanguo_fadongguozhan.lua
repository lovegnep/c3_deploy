


--DECLARE_QUEST_INFO_START--
x211006_var_FileId = 211006

x211006_var_QuestName = "发动国战"
--DECLARE_QUEST_INFO_STOP--






function x211006_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y发动国战")
		TalkAppendString(varMap, "对于敌人，我们坚决不能示弱。保持国人的战斗热情，我国才能在战争中抢得先机。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211006_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211006_var_FileId, x211006_var_QuestName)
end









function x211006_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211006_ProcAccept(varMap, varPlayer)
    
end









function x211006_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211006_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211006_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211006_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211006_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211006_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
