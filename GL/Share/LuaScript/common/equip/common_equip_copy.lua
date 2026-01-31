
--DECLARE_QUEST_INFO_START--

x800061_var_FileId = 800061







x800061_var_QuestName="装备保值(同级装备)"

--DECLARE_QUEST_INFO_STOP--



function x800061_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800061_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800061_var_FileId,x800061_var_QuestName,3);
end





function x800061_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800061_ProcAccept( varMap, varPlayer )

end




function x800061_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800061_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800061_CheckSubmit( varMap, varPlayer )

end




function x800061_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800061_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800061_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800061_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
