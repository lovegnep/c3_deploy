

--DECLARE_QUEST_INFO_START--

x800106_var_FileId = 800106







x800106_var_QuestName="近卫军技能学习"
x800106_var_QuestStr="你应该找你的老师学习技能才是，我只能教近卫军的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800106_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 9 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800106_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800106_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800106_var_FileId,x800106_var_QuestName,3);
end





function x800106_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800106_ProcAccept( varMap, varPlayer )

end




function x800106_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800106_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800106_CheckSubmit( varMap, varPlayer )

end




function x800106_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800106_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800106_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800106_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
