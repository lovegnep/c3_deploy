

x550001_var_FileId 					= 550001
x550001_var_QuestName				= "Âí³µ·ò"






function x550001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x550001_var_FileId, x550001_var_QuestName,15);
	
end







function x550001_ProcEventEntry(varMap, varPlayer, varTalknpc)
	local varCountry = GetCurCountry(varMap,varPlayer)
	if varCountry == 0 then
		DeliverTransferType(varMap, varPlayer, varTalknpc, 7, -1)
	elseif varCountry == 1 then
		DeliverTransferType(varMap, varPlayer, varTalknpc, 10, -1)
	elseif varCountry == 2 then	
		DeliverTransferType(varMap, varPlayer, varTalknpc, 13, -1)
	elseif varCountry == 3 then
		DeliverTransferType(varMap, varPlayer, varTalknpc, 16, -1)
	end	
end







function x550001_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x550001_ProcAccept(varMap, varPlayer, varTalknpc)

end
