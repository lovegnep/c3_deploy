

--DECLARE_QUEST_INFO_START--

x800001_var_FileId = 800001







x800001_var_QuestName="Áé»êÃú¿Ì"

--DECLARE_QUEST_INFO_STOP--



function x800001_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800001_var_FileId,x800001_var_QuestName,3);
end





function x800001_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800001_ProcAccept( varMap, varPlayer )

end




function x800001_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800001_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800001_CheckSubmit( varMap, varPlayer )

end




function x800001_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800001_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800001_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800001_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
