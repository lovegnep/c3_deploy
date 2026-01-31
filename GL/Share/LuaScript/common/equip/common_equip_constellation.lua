

--DECLARE_QUEST_INFO_START--

x800117_var_FileId = 800117







x800117_var_QuestName="ÐÇ×ùÃú¿Ì"

--DECLARE_QUEST_INFO_STOP--



function x800117_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800117_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800117_var_FileId,x800117_var_QuestName,3);
end





function x800117_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800117_ProcAccept( varMap, varPlayer )

end




function x800117_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800117_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800117_CheckSubmit( varMap, varPlayer )

end




function x800117_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800117_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800117_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800117_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
