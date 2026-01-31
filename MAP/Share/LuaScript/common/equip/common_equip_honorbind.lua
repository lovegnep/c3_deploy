

--DECLARE_QUEST_INFO_START--

x800121_var_FileId = 800121







x800121_var_QuestName="Õ½¼¨Ãú¿Ì"

--DECLARE_QUEST_INFO_STOP--



function x800121_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800121_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800121_var_FileId,x800121_var_QuestName,3);
end





function x800121_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800121_ProcAccept( varMap, varPlayer )

end




function x800121_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800121_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800121_CheckSubmit( varMap, varPlayer )

end




function x800121_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800121_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800121_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800121_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
