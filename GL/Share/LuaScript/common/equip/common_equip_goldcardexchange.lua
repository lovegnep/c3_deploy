

--DECLARE_QUEST_INFO_START--

x800036_var_FileId = 800036







x800036_var_QuestName="½ð¿¨¶Ò»»Òø×Ó"

--DECLARE_QUEST_INFO_STOP--



function x800036_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800036_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800036_var_FileId,x800036_var_QuestName);
end





function x800036_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800036_ProcAccept( varMap, varPlayer )

end




function x800036_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800036_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800036_CheckSubmit( varMap, varPlayer )

end




function x800036_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800036_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800036_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800036_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
