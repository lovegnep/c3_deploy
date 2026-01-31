

--DECLARE_QUEST_INFO_START--

x800018_var_FileId = 800018







x800018_var_QuestName="成长率鉴定"

--DECLARE_QUEST_INFO_STOP--



function x800018_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800018_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800018_var_FileId,x800018_var_QuestName);
end





function x800018_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800018_ProcAccept( varMap, varPlayer )

end




function x800018_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800018_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800018_CheckSubmit( varMap, varPlayer )

end




function x800018_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800018_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800018_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800018_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
