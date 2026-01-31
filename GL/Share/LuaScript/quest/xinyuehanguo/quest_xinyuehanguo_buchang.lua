


x211015_var_FileId = 211015
x211015_var_QuestName="补偿领取"







function x211015_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y补偿领取")
		TalkAppendString(varMap, "不少国民为国家的发展，无私的奉献了自己，汗国是不会忘记大家对国家的服出的。奉大王旨意，我这里负责对符合要求的国民给予一定的补偿。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211015_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211015_var_FileId, x211015_var_QuestName)
end









function x211015_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211015_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211015_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211015_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211015_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211015_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211015_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211015_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
