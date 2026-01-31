
--DECLARE_QUEST_INFO_START--

x800151_var_FileId = 800151







x800151_var_QuestName="±¦Ê¯Å×¹â"

--DECLARE_QUEST_INFO_STOP--



function x800151_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800151_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel( varMap, varPlayer) < 80 then
    return 
  end
	TalkAppendButton(varMap,x800151_var_FileId,x800151_var_QuestName,3);
end





function x800151_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800151_ProcAccept( varMap, varPlayer )

end




function x800151_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800151_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800151_CheckSubmit( varMap, varPlayer )

end




function x800151_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800151_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800151_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800151_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
