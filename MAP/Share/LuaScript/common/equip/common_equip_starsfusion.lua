x800119_var_FileId = 800119



x800119_var_QuestName="–«≥Ω¥„¡∂"

--DECLARE_QUEST_INFO_STOP--



function x800119_ProcEventEntry( varMap, varPlayer, varTalknpc )	
end




function x800119_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800119_var_FileId,x800119_var_QuestName,3);
end





function x800119_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800119_ProcAccept( varMap, varPlayer )

end




function x800119_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800119_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800119_CheckSubmit( varMap, varPlayer )

end




function x800119_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800119_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800119_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800119_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
