

--DECLARE_QUEST_INFO_START--

x300307_var_FileId = 300307







x300307_var_QuestName="¹úÍõÄ¼¼¯"

--DECLARE_QUEST_INFO_STOP--



function x300307_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x300307_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x300307_var_FileId,x300307_var_QuestName);
end





function x300307_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300307_ProcAccept( varMap, varPlayer )

end




function x300307_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300307_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300307_CheckSubmit( varMap, varPlayer )

end




function x300307_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300307_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300307_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300307_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
