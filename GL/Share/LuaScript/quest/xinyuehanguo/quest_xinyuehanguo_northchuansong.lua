


x211030_var_FileId = 211030
x211030_var_QuestName="º¹¹ú¹ã³¡"






function x211030_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	SetPos(varMap, varPlayer,108,258)
end









function x211030_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211030_var_FileId, x211030_var_QuestName)
end









function x211030_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211030_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211030_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211030_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211030_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211030_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211030_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211030_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
