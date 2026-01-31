

--DECLARE_QUEST_INFO_START--

x800017_var_FileId = 800017







x800017_var_QuestName="Âé½«Ãú¿Ì"

--DECLARE_QUEST_INFO_STOP--



function x800017_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800017_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800017_var_FileId,x800017_var_QuestName,3);
end





function x800017_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800017_ProcAccept( varMap, varPlayer )

end




function x800017_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800017_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800017_CheckSubmit( varMap, varPlayer )

end




function x800017_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800017_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800017_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800017_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
