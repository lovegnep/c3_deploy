

--DECLARE_QUEST_INFO_START--

x300308_var_FileId = 300308








x300308_var_QuestName= "募集资金 -（国王领取）"

--DECLARE_QUEST_INFO_STOP--



function x300308_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x300308_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x300308_var_FileId,x300308_var_QuestName);
end





function x300308_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300308_ProcAccept( varMap, varPlayer )

end




function x300308_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300308_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300308_CheckSubmit( varMap, varPlayer )

end




function x300308_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300308_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300308_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300308_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
