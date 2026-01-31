
--DECLARE_QUEST_INFO_START--

x800059_var_FileId = 800059







x800059_var_QuestName="×°±¸öÌ½ð£¨Ï´×Ï£©"

--DECLARE_QUEST_INFO_STOP--



function x800059_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800059_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800059_var_FileId,x800059_var_QuestName,3);
end





function x800059_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800059_ProcAccept( varMap, varPlayer )

end




function x800059_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800059_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800059_CheckSubmit( varMap, varPlayer )

end




function x800059_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800059_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800059_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800059_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
