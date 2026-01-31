

--DECLARE_QUEST_INFO_START--

x800115_var_FileId = 800115







x800115_var_QuestName="橙色装备打造"

--DECLARE_QUEST_INFO_STOP--



function x800115_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800115_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800115_var_FileId,x800115_var_QuestName,3);
end





function x800115_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800115_ProcAccept( varMap, varPlayer )

end




function x800115_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800115_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800115_CheckSubmit( varMap, varPlayer )

end




function x800115_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800115_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800115_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800115_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
