

--DECLARE_QUEST_INFO_START--

x570053_var_FileId = 570053







x570053_var_QuestName="属性天赋学习"
x570053_var_QuestStr="你还未加入任何帮会。"
x570053_var_Leader_Index=5
--DECLARE_QUEST_INFO_STOP--



function x570053_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	
	if GetGameOpenById(1053 ) == 0 then
		return
	end

	local nGuildID= GetGuildID( varMap, varPlayer)
	if nGuildID == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x570053_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	else
		OpenGuildSkillStudyUI_Char( varMap, varPlayer)
 	end

	return 0
end




function x570053_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(1053 ) == 0 then
		return
	end

	TalkAppendButton(varMap,x570053_var_FileId,x570053_var_QuestName,3);
end





function x570053_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x570053_ProcAccept( varMap, varPlayer )

end




function x570053_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570053_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570053_CheckSubmit( varMap, varPlayer )

end




function x570053_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570053_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570053_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570053_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
