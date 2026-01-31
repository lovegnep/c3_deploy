


x211017_var_FileId = 211017
x211017_var_QuestName="²Ö¿â"







function x211017_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	BankBegin(varMap, varPlayer,varTalknpc)
end









function x211017_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211017_var_FileId, x211017_var_QuestName)
end









function x211017_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211017_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211017_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211017_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211017_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211017_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211017_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211017_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
