
--DECLARE_QUEST_INFO_START--

x800062_var_FileId = 800062







x800062_var_QuestName="±¦Ê¯Éý¼¶"

--DECLARE_QUEST_INFO_STOP--



function x800062_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800062_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800062_var_FileId,x800062_var_QuestName,3);
end





function x800062_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800062_ProcAccept( varMap, varPlayer )

end




function x800062_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800062_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800062_CheckSubmit( varMap, varPlayer )

end




function x800062_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800062_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800062_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800062_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
