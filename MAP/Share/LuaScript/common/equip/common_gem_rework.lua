
--DECLARE_QUEST_INFO_START--

x800149_var_FileId = 800149







x800149_var_QuestName="±¦Ê¯µñ×Á"

--DECLARE_QUEST_INFO_STOP--



function x800149_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800149_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel( varMap, varPlayer) < 80 then
    return 
  end
	TalkAppendButton(varMap,x800149_var_FileId,x800149_var_QuestName,3);
end





function x800149_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800149_ProcAccept( varMap, varPlayer )

end




function x800149_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800149_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800149_CheckSubmit( varMap, varPlayer )

end




function x800149_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800149_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800149_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800149_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
