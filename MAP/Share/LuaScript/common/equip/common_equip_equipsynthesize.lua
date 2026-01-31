

--DECLARE_QUEST_INFO_START--

x800004_var_FileId = 800004







x800004_var_QuestName="特制皇家装备"

--DECLARE_QUEST_INFO_STOP--



function x800004_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800004_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800004_var_FileId,x800004_var_QuestName,3);
end





function x800004_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800004_ProcAccept( varMap, varPlayer )

end




function x800004_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800004_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800004_CheckSubmit( varMap, varPlayer )

end




function x800004_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800004_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800004_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800004_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
