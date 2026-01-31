
--DECLARE_QUEST_INFO_START--

x800037_var_FileId = 800037







x800037_var_QuestName="装备回收"

--DECLARE_QUEST_INFO_STOP--



function x800037_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800037_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800037_var_FileId,x800037_var_QuestName,3);
end





function x800037_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800037_ProcAccept( varMap, varPlayer )

end




function x800037_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800037_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800037_CheckSubmit( varMap, varPlayer )

end




function x800037_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800037_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800037_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800037_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
