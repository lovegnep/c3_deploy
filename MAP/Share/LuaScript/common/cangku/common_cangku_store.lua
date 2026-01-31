


x561000_var_FileId = 561000
x561000_var_QuestName="²Ö¿â"







function x561000_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	BankBegin(varMap, varPlayer,varTalknpc)
end









function x561000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x561000_var_FileId, x561000_var_QuestName,12)
end









function x561000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561000_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561000_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561000_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
