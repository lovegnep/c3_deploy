

--DECLARE_QUEST_INFO_START--

x800031_var_FileId = 800031



x800031_var_GameId = 1055



x800031_var_QuestName="∆Ô≥À¡∂ªØ"

--DECLARE_QUEST_INFO_STOP--



function x800031_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800031_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x800031_var_GameId) ~= 1 then
		return
	end
	

	if LuaCallNoclosure(888888,"IsCanHorseCompose",varMap,varPlayer) == 0 then 
		TalkAppendButton(varMap,x800031_var_FileId,x800031_var_QuestName,3,3);
	else
		TalkAppendButton(varMap,x800031_var_FileId,x800031_var_QuestName,3,2);
	end
end





function x800031_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800031_ProcAccept( varMap, varPlayer )

end




function x800031_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800031_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800031_CheckSubmit( varMap, varPlayer )

end




function x800031_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800031_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800031_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800031_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
