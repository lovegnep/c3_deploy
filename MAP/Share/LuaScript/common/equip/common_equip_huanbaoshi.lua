

--DECLARE_QUEST_INFO_START--

x800058_var_FileId = 800058






x800058_var_QuestName="±¦Ê¯Ìæ»»"

--DECLARE_QUEST_INFO_STOP--



function x800058_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800058_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800058_var_FileId,x800058_var_QuestName,3);
end





function x800058_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800058_ProcAccept( varMap, varPlayer )

end




function x800058_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800058_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800058_CheckSubmit( varMap, varPlayer )

end




function x800058_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800058_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800058_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800058_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
