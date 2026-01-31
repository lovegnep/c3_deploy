

--DECLARE_QUEST_INFO_START--

x800050_var_FileId = 800050







x800050_var_QuestName="Æï³Ë·±Ö³"

--DECLARE_QUEST_INFO_STOP--



function x800050_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800050_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800050_var_FileId,x800050_var_QuestName,3);
end





function x800050_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800050_ProcAccept( varMap, varPlayer )

end




function x800050_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800050_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800050_CheckSubmit( varMap, varPlayer )

end




function x800050_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800050_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800050_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800050_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
