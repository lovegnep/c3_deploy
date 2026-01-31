

x550003_var_FileId 					= 550003
x550003_var_QuestName				= "Õæ¡ï´«ËÍ"






function x550003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550003_var_FileId, x550003_var_QuestName);
	
end







function x550003_ProcEventEntry(varMap, varPlayer, varTalknpc)
		DeliverTransferType(varMap, varPlayer, varTalknpc, 3, -1)
end







function x550003_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550003_ProcAccept(varMap, varPlayer, varTalknpc)

end
