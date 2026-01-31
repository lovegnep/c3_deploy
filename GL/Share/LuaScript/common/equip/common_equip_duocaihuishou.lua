
--DECLARE_QUEST_INFO_START--

x800109_var_FileId = 800109







x800109_var_QuestName="±¶ Øªÿ ’"

--DECLARE_QUEST_INFO_STOP--



function x800109_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800109_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800109_var_FileId,x800109_var_QuestName,3);
end





function x800109_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800109_ProcAccept( varMap, varPlayer )

end




function x800109_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800109_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800109_CheckSubmit( varMap, varPlayer )

end




function x800109_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800109_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800109_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800109_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
