

--DECLARE_QUEST_INFO_START--

x302600_var_FileId = 302600







x302600_var_QuestName="Ñ°Çó×é¶Ó"

--DECLARE_QUEST_INFO_STOP--



function x302600_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x302600_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x302600_var_FileId,x302600_var_QuestName,3);
end





function x302600_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x302600_ProcAccept( varMap, varPlayer )

end




function x302600_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302600_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302600_CheckSubmit( varMap, varPlayer )

end




function x302600_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302600_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302600_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302600_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
