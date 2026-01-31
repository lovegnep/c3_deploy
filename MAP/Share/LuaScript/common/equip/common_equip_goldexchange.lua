

--DECLARE_QUEST_INFO_START--

x800035_var_FileId = 800035







x800035_var_QuestName="½ð±Ò¶Ò»»Òø×Ó"

--DECLARE_QUEST_INFO_STOP--



function x800035_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800035_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800035_var_FileId,x800035_var_QuestName);
end





function x800035_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800035_ProcAccept( varMap, varPlayer )

end




function x800035_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800035_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800035_CheckSubmit( varMap, varPlayer )

end




function x800035_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800035_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800035_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800035_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
