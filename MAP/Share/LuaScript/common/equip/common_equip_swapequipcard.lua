

--DECLARE_QUEST_INFO_START--

x800016_var_FileId = 800016







x800016_var_QuestName="装备符文对调"

--DECLARE_QUEST_INFO_STOP--



function x800016_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800016_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800016_var_FileId,x800016_var_QuestName);
end





function x800016_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800016_ProcAccept( varMap, varPlayer )

end




function x800016_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800016_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800016_CheckSubmit( varMap, varPlayer )

end




function x800016_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800016_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800016_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800016_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
