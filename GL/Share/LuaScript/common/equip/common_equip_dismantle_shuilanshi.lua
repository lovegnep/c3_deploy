
--DECLARE_QUEST_INFO_START--

x800937_var_FileId = 800937







x800937_var_QuestName="¿∂ ØÃ·¡∂"

--DECLARE_QUEST_INFO_STOP--



function x800937_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800937_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800937_var_FileId,x800937_var_QuestName,3);
end





function x800937_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800937_ProcAccept( varMap, varPlayer )

end




function x800937_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800937_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800937_CheckSubmit( varMap, varPlayer )

end




function x800937_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800937_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800937_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800937_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
