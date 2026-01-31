


--DECLARE_QUEST_INFO_START--
x211007_var_FileId = 211007

x211007_var_QuestName = "筹集军粮"
--DECLARE_QUEST_INFO_STOP--






function x211007_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y筹集军粮")
		TalkAppendString(varMap, "前线的战士们正在浴血奋战，我们做后勤的一定不能掉链子，做好他们的大后方。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211007_var_FileId, x211007_var_QuestName)
end









function x211007_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end









function x211007_ProcAccept(varMap, varPlayer)
    
end









function x211007_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211007_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211007_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211007_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211007_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211007_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
