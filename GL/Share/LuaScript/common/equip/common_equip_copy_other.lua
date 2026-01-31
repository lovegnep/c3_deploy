
--DECLARE_QUEST_INFO_START--

x800066_var_FileId = 800066







x800066_var_QuestName="装备保值(跨级装备)"

--DECLARE_QUEST_INFO_STOP--



function x800066_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800066_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800066_var_FileId,x800066_var_QuestName,3);
end





function x800066_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800066_ProcAccept( varMap, varPlayer )

end




function x800066_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800066_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800066_CheckSubmit( varMap, varPlayer )

end




function x800066_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800066_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800066_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800066_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
