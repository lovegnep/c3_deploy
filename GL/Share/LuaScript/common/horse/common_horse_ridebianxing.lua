

--DECLARE_QUEST_INFO_START--

x800038_var_FileId = 800038 






x800038_var_QuestName="∆Ô≥À”¿æ√±‰–Œ"

--DECLARE_QUEST_INFO_STOP--



function x800038_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800038_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800038_var_FileId,x800038_var_QuestName);
end





function x800038_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800038_ProcAccept( varMap, varPlayer )

end




function x800038_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800038_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800038_CheckSubmit( varMap, varPlayer )

end




function x800038_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800038_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800038_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800038_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
