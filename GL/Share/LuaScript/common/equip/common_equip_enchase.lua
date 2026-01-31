

--DECLARE_QUEST_INFO_START--

x800028_var_FileId = 800028 






x800028_var_QuestName="±¶ Øœ‚«∂"

--DECLARE_QUEST_INFO_STOP--



function x800028_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800028_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800028_var_FileId,x800028_var_QuestName,3);
end





function x800028_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800028_ProcAccept( varMap, varPlayer )

end




function x800028_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800028_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800028_CheckSubmit( varMap, varPlayer )

end




function x800028_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800028_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800028_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800028_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
