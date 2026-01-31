

--DECLARE_QUEST_INFO_START--

x800045_var_FileId = 800045







x800045_var_QuestName="火枪技能学习"
x800045_var_QuestStr="你应该找你的老师学习技能才是，我只能教火枪的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800045_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 3 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800045_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800045_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800045_var_FileId,x800045_var_QuestName,3);
end





function x800045_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800045_ProcAccept( varMap, varPlayer )

end




function x800045_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800045_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800045_CheckSubmit( varMap, varPlayer )

end




function x800045_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800045_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800045_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800045_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
