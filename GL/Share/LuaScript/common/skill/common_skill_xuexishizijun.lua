

--DECLARE_QUEST_INFO_START--

x800103_var_FileId = 800103







x800103_var_QuestName="十字军技能学习"
x800103_var_QuestStr="你应该找你的老师学习技能才是，我只能教十字军的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800103_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 6 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800103_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800103_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800103_var_FileId,x800103_var_QuestName,3);
end





function x800103_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800103_ProcAccept( varMap, varPlayer )

end




function x800103_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800103_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800103_CheckSubmit( varMap, varPlayer )

end




function x800103_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800103_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800103_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800103_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
