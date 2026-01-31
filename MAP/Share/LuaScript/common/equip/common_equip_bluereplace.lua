
--DECLARE_QUEST_INFO_START--

x800162_var_FileId = 800162







x800162_var_QuestName="护身符去色"

--DECLARE_QUEST_INFO_STOP--



function x800162_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800162_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800162_var_FileId,x800162_var_QuestName,3);
end





function x800162_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800162_ProcAccept( varMap, varPlayer )

end




function x800162_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800162_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800162_CheckSubmit( varMap, varPlayer )

end




function x800162_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800162_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800162_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800162_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
