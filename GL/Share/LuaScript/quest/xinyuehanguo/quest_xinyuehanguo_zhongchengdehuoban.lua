


x211049_var_FileId = 211049
x211049_var_QuestName="º¹¹ú¹ã³¡"






function x211049_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	SetPos(varMap, varPlayer,108,258)
end









function x211049_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211049_var_FileId, x211049_var_QuestName)
end









function x211049_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211049_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211049_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211049_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211049_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211049_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211049_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211049_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
