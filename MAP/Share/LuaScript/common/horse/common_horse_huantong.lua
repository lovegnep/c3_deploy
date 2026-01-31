

--DECLARE_QUEST_INFO_START--

x800015_var_FileId = 800015







x800015_var_QuestName="Æï³Ë»¹Í¯"

--DECLARE_QUEST_INFO_STOP--



function x800015_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800015_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800015_var_FileId,x800015_var_QuestName);
end





function x800015_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800015_ProcAccept( varMap, varPlayer )

end




function x800015_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800015_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800015_CheckSubmit( varMap, varPlayer )

end




function x800015_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800015_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800015_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800015_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
