
--DECLARE_QUEST_INFO_START--

x800168_var_FileId = 800168







x800168_var_QuestName="½«ÐÇ¿¨½µÐÇ»ØÊÕ"

--DECLARE_QUEST_INFO_STOP--



function x800168_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800168_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800168_var_FileId,x800168_var_QuestName,3);
end





function x800168_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800168_ProcAccept( varMap, varPlayer )

end




function x800168_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800168_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800168_CheckSubmit( varMap, varPlayer )

end




function x800168_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800168_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800168_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800168_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
