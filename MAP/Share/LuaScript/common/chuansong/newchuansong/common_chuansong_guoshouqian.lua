


x550004_var_FileId 					= 550004
x550004_var_QuestName				= "º«“‰÷Æ√≈"






function x550004_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550004_var_FileId, x550004_var_QuestName);
	
end







function x550004_ProcEventEntry(varMap, varPlayer, varTalknpc)
		DeliverTransferType(varMap, varPlayer, varTalknpc, 5, -1)
end







function x550004_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550004_ProcAccept(varMap, varPlayer, varTalknpc)

end
