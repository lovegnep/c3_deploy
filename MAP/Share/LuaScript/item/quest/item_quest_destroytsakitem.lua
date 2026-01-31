

--DECLARE_QUEST_INFO_START--

x800057_var_FileId = 800057







x800057_var_QuestName="删除任务道具"

--DECLARE_QUEST_INFO_STOP--



function x800057_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800057_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x800057_var_FileId, x800057_var_QuestName,3 ,1 );
end





function x800057_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800057_ProcAccept( varMap, varPlayer )

end




function x800057_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800057_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800057_CheckSubmit( varMap, varPlayer )

end




function x800057_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800057_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800057_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800057_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
