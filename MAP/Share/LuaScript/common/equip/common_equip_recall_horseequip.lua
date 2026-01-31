
--DECLARE_QUEST_INFO_START--

x800166_var_FileId = 800166







x800166_var_QuestName="骑乘装备回收"

--DECLARE_QUEST_INFO_STOP--



function x800166_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800166_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800166_var_FileId,x800166_var_QuestName,3);
end





function x800166_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800166_ProcAccept( varMap, varPlayer )

end




function x800166_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800166_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800166_CheckSubmit( varMap, varPlayer )

end




function x800166_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800166_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800166_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800166_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
