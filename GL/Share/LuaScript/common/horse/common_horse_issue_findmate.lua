

--DECLARE_QUEST_INFO_START--

x800029_var_FileId = 800029







x800029_var_QuestName="·¢²¼Æï³ËÕ÷ÓÑ"

--DECLARE_QUEST_INFO_STOP--



function x800029_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	OpenFindHorseMating(varMap, varPlayer, 0) 
end




function x800029_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800029_var_FileId,x800029_var_QuestName);
end





function x800029_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800029_ProcAccept( varMap, varPlayer )

end




function x800029_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800029_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800029_CheckSubmit( varMap, varPlayer )

end




function x800029_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800029_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800029_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800029_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
