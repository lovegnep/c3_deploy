

--DECLARE_QUEST_INFO_START--

x800013_var_FileId = 800013







x800013_var_QuestName="Æï³Ë¼¼ÄÜÑ§Ï°"

--DECLARE_QUEST_INFO_STOP--



function x800013_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800013_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800013_var_FileId,x800013_var_QuestName);
end





function x800013_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800013_ProcAccept( varMap, varPlayer )

end




function x800013_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800013_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800013_CheckSubmit( varMap, varPlayer )

end




function x800013_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800013_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800013_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800013_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
