
--DECLARE_QUEST_INFO_START--

x800071_var_FileId = 800071







x800071_var_QuestName="护身符上色"

--DECLARE_QUEST_INFO_STOP--



function x800071_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800071_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800071_var_FileId,x800071_var_QuestName,3);
end





function x800071_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800071_ProcAccept( varMap, varPlayer )

end




function x800071_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800071_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800071_CheckSubmit( varMap, varPlayer )

end




function x800071_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800071_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800071_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800071_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
