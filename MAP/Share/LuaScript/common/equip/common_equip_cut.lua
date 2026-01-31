
--DECLARE_QUEST_INFO_START--

x800158_var_FileId = 800158







x800158_var_QuestName="×°±¸Éý¼¶"

--DECLARE_QUEST_INFO_STOP--



function x800158_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800158_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800158_var_FileId,x800158_var_QuestName,3);
end





function x800158_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800158_ProcAccept( varMap, varPlayer )

end




function x800158_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800158_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800158_CheckSubmit( varMap, varPlayer )

end




function x800158_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800158_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800158_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800158_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
