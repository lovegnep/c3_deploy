

--DECLARE_QUEST_INFO_START--

x800000_var_FileId = 800000






x800000_var_QuestName="×°±¸´ò¿×"

--DECLARE_QUEST_INFO_STOP--



function x800000_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800000_var_FileId,x800000_var_QuestName,3);
end





function x800000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800000_ProcAccept( varMap, varPlayer )

end




function x800000_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800000_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800000_CheckSubmit( varMap, varPlayer )

end




function x800000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800000_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800000_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
