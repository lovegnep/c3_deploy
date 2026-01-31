

--DECLARE_QUEST_INFO_START--

x800032_var_FileId = 800032







x800032_var_QuestName="Æï³ËÏ´µã"

--DECLARE_QUEST_INFO_STOP--



function x800032_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800032_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800032_var_FileId,x800032_var_QuestName);
end





function x800032_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800032_ProcAccept( varMap, varPlayer )

end




function x800032_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800032_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800032_CheckSubmit( varMap, varPlayer )

end




function x800032_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800032_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800032_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800032_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
