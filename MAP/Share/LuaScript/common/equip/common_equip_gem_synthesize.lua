
--DECLARE_QUEST_INFO_START--

x800063_var_FileId = 800063







x800063_var_QuestName="œ¥ Øº¡≈‰÷∆"

--DECLARE_QUEST_INFO_STOP--



function x800063_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800063_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800063_var_FileId,x800063_var_QuestName,3);
end





function x800063_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800063_ProcAccept( varMap, varPlayer )

end




function x800063_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800063_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800063_CheckSubmit( varMap, varPlayer )

end




function x800063_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800063_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800063_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800063_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
