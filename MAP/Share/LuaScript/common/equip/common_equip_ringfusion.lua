x800065_var_FileId = 800065



x800065_var_QuestName="ª º“√ÿ“¯»€¡∂"

--DECLARE_QUEST_INFO_STOP--



function x800065_ProcEventEntry( varMap, varPlayer, varTalknpc )	
end




function x800065_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800065_var_FileId,x800065_var_QuestName,3);
end





function x800065_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800065_ProcAccept( varMap, varPlayer )

end




function x800065_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800065_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800065_CheckSubmit( varMap, varPlayer )

end




function x800065_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800065_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800065_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800065_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
