

--DECLARE_QUEST_INFO_START--

x800014_var_FileId = 800014







x800014_var_QuestName="∆Ô≥ÀΩª≈‰"

--DECLARE_QUEST_INFO_STOP--



function x800014_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800014_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800014_var_FileId,x800014_var_QuestName);
end





function x800014_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800014_ProcAccept( varMap, varPlayer )

end




function x800014_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800014_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800014_CheckSubmit( varMap, varPlayer )

end




function x800014_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800014_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800014_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800014_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
