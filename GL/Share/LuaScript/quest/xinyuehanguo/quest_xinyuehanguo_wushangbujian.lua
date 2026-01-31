


x211051_var_FileId = 211051
x211051_var_QuestName="º¹¹ú¹ã³¡"






function x211051_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	SetPos(varMap, varPlayer,108,258)
end









function x211051_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211051_var_FileId, x211051_var_QuestName)
end









function x211051_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211051_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211051_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211051_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211051_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211051_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211051_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211051_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
