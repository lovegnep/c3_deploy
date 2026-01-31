

--DECLARE_QUEST_INFO_START--

x800113_var_FileId = 800113







x800113_var_QuestName="Ê±×°ÎÆÁú"

--DECLARE_QUEST_INFO_STOP--



function x800113_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800113_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800113_var_FileId,x800113_var_QuestName,3);
end





function x800113_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800113_ProcAccept( varMap, varPlayer )

end




function x800113_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800113_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800113_CheckSubmit( varMap, varPlayer )

end




function x800113_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800113_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800113_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800113_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
