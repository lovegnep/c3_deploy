
--DECLARE_QUEST_INFO_START--

x800060_var_FileId = 800060







x800060_var_QuestName="×°±¸»ØÂ¯£¨Ï´×Ï£©"

--DECLARE_QUEST_INFO_STOP--



function x800060_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800060_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800060_var_FileId,x800060_var_QuestName,3);
end





function x800060_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800060_ProcAccept( varMap, varPlayer )

end




function x800060_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800060_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800060_CheckSubmit( varMap, varPlayer )

end




function x800060_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800060_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800060_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800060_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
