
--DECLARE_QUEST_INFO_START--

x800070_var_FileId = 800070







x800070_var_QuestName="ÖÆÔì·ûÎÄ"

--DECLARE_QUEST_INFO_STOP--



function x800070_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800070_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800070_var_FileId,x800070_var_QuestName,3);
end





function x800070_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800070_ProcAccept( varMap, varPlayer )

end




function x800070_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800070_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800070_CheckSubmit( varMap, varPlayer )

end




function x800070_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800070_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800070_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800070_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
