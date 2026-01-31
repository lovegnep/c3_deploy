

x550002_var_FileId 					= 550002
x550002_var_QuestName				= "Âí³µ·ò"






function x550002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550002_var_FileId, x550002_var_QuestName,15);
	
end







function x550002_ProcEventEntry(varMap, varPlayer, varTalknpc)
	local varCountry = GetCurCountry(varMap,varPlayer)
	if varCountry == 0 then
		DeliverTransferType(varMap, varPlayer, varTalknpc, 8, -1)
	elseif varCountry == 1 then
		DeliverTransferType(varMap, varPlayer, varTalknpc, 11, -1)
	elseif varCountry == 2 then	
		DeliverTransferType(varMap, varPlayer, varTalknpc, 14, -1)
	elseif varCountry == 3 then
		DeliverTransferType(varMap, varPlayer, varTalknpc, 17, -1)
	end	
		
		
end







function x550002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550002_ProcAccept(varMap, varPlayer, varTalknpc)

end
