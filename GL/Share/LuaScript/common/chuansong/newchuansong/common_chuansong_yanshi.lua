

x550007_var_FileId 					= 550007
x550007_var_QuestName				= "ÑÝÊ¾´«ËÍ"






function x550007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550007_var_FileId, x550007_var_QuestName);
	
end







function x550007_ProcEventEntry(varMap, varPlayer, varTalknpc)

		DeliverTransferType(varMap, varPlayer, varPlayer, 8, -1)
end







function x550007_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550007_ProcAccept(varMap, varPlayer, varTalknpc)

end
function x550007_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end
function x550007_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end
function x550007_ProcConditionCheck( varMap, varPlayer )
	return 1
end
function x550007_ProcDeplete( varMap, varPlayer )
	DeliverTransferType(varMap, varPlayer, varPlayer, 2, -1)
	return 0
end
