

--DECLARE_QUEST_INFO_START--

x800002_var_FileId = 800002







x800002_var_QuestName="×°±¸ÌØÐÞ"

--DECLARE_QUEST_INFO_STOP--



function x800002_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800002_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800002_var_FileId,x800002_var_QuestName);
end





function x800002_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800002_ProcAccept( varMap, varPlayer )

end




function x800002_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800002_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800002_CheckSubmit( varMap, varPlayer )

end




function x800002_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800002_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800002_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800002_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
