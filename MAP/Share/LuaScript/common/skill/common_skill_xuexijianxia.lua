

--DECLARE_QUEST_INFO_START--

x800042_var_FileId = 800042







x800042_var_QuestName="剑侠技能学习"
x800042_var_QuestStr="你应该找你的老师学习技能才是，我只能教剑侠的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800042_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 1 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800042_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800042_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800042_var_FileId,x800042_var_QuestName,3);
end





function x800042_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800042_ProcAccept( varMap, varPlayer )

end




function x800042_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800042_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800042_CheckSubmit( varMap, varPlayer )

end




function x800042_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800042_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800042_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800042_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
