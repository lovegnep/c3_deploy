

--DECLARE_QUEST_INFO_START--

x800051_var_FileId = 800051







x800051_var_QuestName="Æï³ËÑ±Ñø"

--DECLARE_QUEST_INFO_STOP--



function x800051_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800051_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800051_var_FileId,x800051_var_QuestName,3);
end





function x800051_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800051_ProcAccept( varMap, varPlayer )

end




function x800051_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800051_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800051_CheckSubmit( varMap, varPlayer )

end




function x800051_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800051_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800051_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800051_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
