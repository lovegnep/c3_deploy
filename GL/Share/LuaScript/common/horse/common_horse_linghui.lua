

--DECLARE_QUEST_INFO_START--

x800020_var_FileId = 800020







x800020_var_QuestName="¡Ïªÿ∆Ô≥À"

--DECLARE_QUEST_INFO_STOP--



function x800020_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800020_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800020_var_FileId,x800020_var_QuestName);
end





function x800020_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800020_ProcAccept( varMap, varPlayer )

end




function x800020_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800020_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800020_CheckSubmit( varMap, varPlayer )

end




function x800020_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800020_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800020_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800020_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
