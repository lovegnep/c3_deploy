

x290002_var_FileId 										= 290002

x290002_var_Leader_Index 							= 5

x290002_var_QuestName									="修理战车"



function x290002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x290002_var_FileId,x290002_var_QuestName, 3, 1)
end




function x290002_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	
	if 0 == IsHaveChariot(varMap, varPlayer) then
			Msg2Player(varMap,varPlayer,"拥有战车才可以修理",8, 2)
			Msg2Player(varMap,varPlayer,"拥有战车才可以修理",8, 3)
			return
	end
	RepaireChariot(varMap, varPlayer, -1, -1, -1);
	Msg2Player(varMap,varPlayer,"战车生命恢复满了",8, 2)
	Msg2Player(varMap,varPlayer,"战车生命恢复满了",8, 3)
	return 0
end
