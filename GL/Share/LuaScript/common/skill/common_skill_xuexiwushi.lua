

--DECLARE_QUEST_INFO_START--

x800041_var_FileId = 800041







x800041_var_QuestName="武士技能学习"
x800041_var_QuestStr="你应该找你的老师学习技能才是，我只能教武士的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800041_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 0 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800041_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800041_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800041_var_FileId,x800041_var_QuestName,3);
end





function x800041_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800041_ProcAccept( varMap, varPlayer )

end




function x800041_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800041_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800041_CheckSubmit( varMap, varPlayer )

end




function x800041_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800041_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800041_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800041_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
