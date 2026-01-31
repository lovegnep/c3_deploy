

--DECLARE_QUEST_INFO_START--

x800108_var_FileId = 800108







x800108_var_QuestName="僧侣技能学习"
x800108_var_QuestStr="你应该找你的老师学习技能才是，我只能教僧侣的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800108_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 11 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800108_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800108_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800108_var_FileId,x800108_var_QuestName,3);
end





function x800108_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800108_ProcAccept( varMap, varPlayer )

end




function x800108_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800108_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800108_CheckSubmit( varMap, varPlayer )

end




function x800108_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800108_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800108_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800108_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
