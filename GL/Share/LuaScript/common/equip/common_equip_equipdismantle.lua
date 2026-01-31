

--DECLARE_QUEST_INFO_START--

x800005_var_FileId = 800005 







x800005_var_QuestName="×°±¸²ð½â"

--DECLARE_QUEST_INFO_STOP--



function x800005_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800005_var_FileId,x800005_var_QuestName);
end





function x800005_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800005_ProcAccept( varMap, varPlayer )

end




function x800005_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800005_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800005_CheckSubmit( varMap, varPlayer )

end




function x800005_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800005_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800005_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800005_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
