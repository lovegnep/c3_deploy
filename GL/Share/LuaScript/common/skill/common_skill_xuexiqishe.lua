

--DECLARE_QUEST_INFO_START--

x800043_var_FileId = 800043







x800043_var_QuestName="骑射技能学习"
x800043_var_QuestStr="你应该找你的老师学习技能才是，我只能教骑射的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800043_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 2 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800043_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800043_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800043_var_FileId,x800043_var_QuestName,3);
end





function x800043_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800043_ProcAccept( varMap, varPlayer )

end




function x800043_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800043_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800043_CheckSubmit( varMap, varPlayer )

end




function x800043_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800043_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800043_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800043_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
