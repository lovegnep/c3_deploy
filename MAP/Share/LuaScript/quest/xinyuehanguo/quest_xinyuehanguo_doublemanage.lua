


--DECLARE_QUEST_INFO_START--
x211001_var_FileId = 211001
x211001_var_EventList={211034}

--DECLARE_QUEST_INFO_STOP--






function x211001_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"现在王城军队还在整编，等整编结束后，将给我新月汗国的勇士安排更多的双倍修炼时间。你可要注意我们的征兵告示了。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
end









function x211001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x211001_var_FileId, "领取双倍时间")
end







function x211001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x211001_ProcAccept(varMap, varPlayer)

end









function x211001_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211001_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211001_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x211001_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211001_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211001_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
