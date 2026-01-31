


x211028_var_FileId = 211028
x211028_var_QuestName="º¹¹ú¹ã³¡"






function x211028_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	SetPos(varMap, varPlayer,108,258)
end









function x211028_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211028_var_FileId, x211028_var_QuestName)
end









function x211028_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211028_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211028_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211028_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211028_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211028_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211028_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211028_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
