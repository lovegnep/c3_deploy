

--DECLARE_QUEST_INFO_START--

x800033_var_FileId = 800033







x800033_var_QuestName="Æï³ËÑµÁ·"

--DECLARE_QUEST_INFO_STOP--



function x800033_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800033_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800033_var_FileId,x800033_var_QuestName);
end





function x800033_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800033_ProcAccept( varMap, varPlayer )

end




function x800033_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800033_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800033_CheckSubmit( varMap, varPlayer )

end




function x800033_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800033_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800033_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800033_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
