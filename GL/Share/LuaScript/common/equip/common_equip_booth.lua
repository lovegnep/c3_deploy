

--DECLARE_QUEST_INFO_START--

x800003_var_FileId = 800003 






x800003_var_QuestName="…ÃµÍ∆’–ﬁ"

--DECLARE_QUEST_INFO_STOP--



function x800003_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800003_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800003_var_FileId,x800003_var_QuestName);
end





function x800003_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800003_ProcAccept( varMap, varPlayer )

end




function x800003_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800003_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800003_CheckSubmit( varMap, varPlayer )

end




function x800003_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800003_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800003_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800003_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
