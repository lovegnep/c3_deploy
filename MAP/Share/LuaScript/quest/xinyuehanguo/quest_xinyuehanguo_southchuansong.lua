


x211032_var_FileId = 211032
x211032_var_QuestName="º¹¹ú¹ã³¡"






function x211032_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	SetPos(varMap, varPlayer,108,258)
end









function x211032_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211032_var_FileId, x211032_var_QuestName)
end









function x211032_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211032_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211032_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211032_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211032_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211032_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211032_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211032_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
