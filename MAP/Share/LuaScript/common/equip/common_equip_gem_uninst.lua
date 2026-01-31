
--DECLARE_QUEST_INFO_START--

x800064_var_FileId = 800064







x800064_var_QuestName="±¦Ê¯²ðÐ¶"

--DECLARE_QUEST_INFO_STOP--



function x800064_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800064_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800064_var_FileId,x800064_var_QuestName,3);
end





function x800064_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800064_ProcAccept( varMap, varPlayer )

end




function x800064_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800064_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800064_CheckSubmit( varMap, varPlayer )

end




function x800064_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800064_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800064_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800064_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
