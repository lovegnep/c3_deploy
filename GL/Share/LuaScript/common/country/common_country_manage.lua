

--DECLARE_QUEST_INFO_START--

x800023_var_FileId = 800023







x800023_var_QuestName="任免国家管理人员"

--DECLARE_QUEST_INFO_STOP--



function x800023_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800023_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800023_var_FileId,x800023_var_QuestName);
end





function x800023_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800023_ProcAccept( varMap, varPlayer )

end




function x800023_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800023_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800023_CheckSubmit( varMap, varPlayer )

end




function x800023_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800023_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800023_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800023_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
