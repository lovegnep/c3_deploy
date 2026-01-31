

--DECLARE_QUEST_INFO_START--

x800030_var_FileId = 800030







x800030_var_QuestName="²éÑ¯Æï³ËÕ÷ÓÑ"

--DECLARE_QUEST_INFO_STOP--



function x800030_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	OpenFindHorseMating(varMap, varPlayer, 1) 
end




function x800030_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800030_var_FileId,x800030_var_QuestName);
end





function x800030_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800030_ProcAccept( varMap, varPlayer )

end




function x800030_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800030_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800030_CheckSubmit( varMap, varPlayer )

end




function x800030_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800030_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800030_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800030_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
