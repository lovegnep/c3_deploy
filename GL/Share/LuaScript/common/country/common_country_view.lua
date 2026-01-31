

--DECLARE_QUEST_INFO_START--

x800022_var_FileId = 800022







x800022_var_QuestName="查看国家管理人员"

--DECLARE_QUEST_INFO_STOP--



function x800022_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800022_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800022_var_FileId,x800022_var_QuestName);
end





function x800022_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800022_ProcAccept( varMap, varPlayer )

end




function x800022_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800022_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800022_CheckSubmit( varMap, varPlayer )

end




function x800022_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800022_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800022_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800022_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
