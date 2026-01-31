

--DECLARE_QUEST_INFO_START--

x800052_var_FileId = 800052







x800052_var_QuestName="戒指手镯打造"

--DECLARE_QUEST_INFO_STOP--



function x800052_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800052_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800052_var_FileId,x800052_var_QuestName);
end





function x800052_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800052_ProcAccept( varMap, varPlayer )

end




function x800052_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800052_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800052_CheckSubmit( varMap, varPlayer )

end




function x800052_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800052_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800052_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800052_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
