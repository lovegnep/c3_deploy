

x550005_var_FileId 					= 550005
x550005_var_QuestName				= "ËùÓÐ³¡¾°"






function x550005_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550005_var_FileId, x550005_var_QuestName);
	
end







function x550005_ProcEventEntry(varMap, varPlayer, varTalknpc)

		DeliverTransferType(varMap, varPlayer, varPlayer, 2, -1)
end







function x550005_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550005_ProcAccept(varMap, varPlayer, varTalknpc)

end
function x550005_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end
function x550005_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end
function x550005_ProcConditionCheck( varMap, varPlayer )
	return 1
end
function x550005_ProcDeplete( varMap, varPlayer )
	DeliverTransferType(varMap, varPlayer, varPlayer, 2, -1)
	return 0
end
