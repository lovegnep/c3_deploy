

--DECLARE_QUEST_INFO_START--

x800102_var_FileId = 800102







x800102_var_QuestName="×°±¸¶ÍÔì"

--DECLARE_QUEST_INFO_STOP--



function x800102_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800102_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800102_var_FileId,x800102_var_QuestName,3);
end





function x800102_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800102_ProcAccept( varMap, varPlayer )

end




function x800102_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800102_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800102_CheckSubmit( varMap, varPlayer )

end




function x800102_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800102_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800102_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800102_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
