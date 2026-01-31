

--DECLARE_QUEST_INFO_START--

x800034_var_FileId = 800034







x800034_var_QuestName="Æï³Ë¼¼ÄÜ"

--DECLARE_QUEST_INFO_STOP--



function x800034_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800034_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800034_var_FileId,x800034_var_QuestName);
end





function x800034_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800034_ProcAccept( varMap, varPlayer )

end




function x800034_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800034_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800034_CheckSubmit( varMap, varPlayer )

end




function x800034_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800034_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800034_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800034_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
