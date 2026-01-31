
--DECLARE_QUEST_INFO_START--

x800110_var_FileId = 800110







x800110_var_QuestName="»¤Éí·û²¹É«"

--DECLARE_QUEST_INFO_STOP--



function x800110_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800110_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800110_var_FileId,x800110_var_QuestName,3);
end





function x800110_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800110_ProcAccept( varMap, varPlayer )

end




function x800110_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800110_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800110_CheckSubmit( varMap, varPlayer )

end




function x800110_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800110_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800110_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800110_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
