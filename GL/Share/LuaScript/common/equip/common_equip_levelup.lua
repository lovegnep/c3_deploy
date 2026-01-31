

--DECLARE_QUEST_INFO_START--

x800047_var_FileId = 800047







x800047_var_QuestName="×°±¸ÉýÐÇ"

--DECLARE_QUEST_INFO_STOP--



function x800047_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800047_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800047_var_FileId,x800047_var_QuestName,3);
end





function x800047_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800047_ProcAccept( varMap, varPlayer )

end




function x800047_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800047_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800047_CheckSubmit( varMap, varPlayer )

end




function x800047_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800047_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800047_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800047_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
