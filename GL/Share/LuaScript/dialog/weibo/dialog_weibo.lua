

--DECLARE_QUEST_INFO_START--

x103060_var_FileId = 103060







x103060_var_QuestName="·¢²¼Î¢²©"

--DECLARE_QUEST_INFO_STOP--



function x103060_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end



function x103060_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x103060_var_FileId,x103060_var_QuestName,3);
end





function x103060_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x103060_ProcAccept( varMap, varPlayer )

end




function x103060_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x103060_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x103060_CheckSubmit( varMap, varPlayer )

end




function x103060_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x103060_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x103060_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x103060_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
