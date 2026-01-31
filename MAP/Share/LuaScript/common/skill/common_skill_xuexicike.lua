

--DECLARE_QUEST_INFO_START--

x800105_var_FileId = 800105







x800105_var_QuestName="刺客技能学习"
x800105_var_QuestStr="你应该找你的老师学习技能才是，我只能教刺客的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800105_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 8 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800105_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800105_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800105_var_FileId,x800105_var_QuestName,3);
end





function x800105_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800105_ProcAccept( varMap, varPlayer )

end




function x800105_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800105_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800105_CheckSubmit( varMap, varPlayer )

end




function x800105_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800105_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800105_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800105_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
