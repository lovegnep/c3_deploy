

--DECLARE_QUEST_INFO_START--

x800027_var_FileId = 800027






x800027_var_QuestName="装备改造"

--DECLARE_QUEST_INFO_STOP--



function x800027_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800027_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800027_var_FileId,x800027_var_QuestName);
end





function x800027_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800027_ProcAccept( varMap, varPlayer )

end




function x800027_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800027_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800027_CheckSubmit( varMap, varPlayer )

end




function x800027_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800027_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800027_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800027_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
