

--DECLARE_QUEST_INFO_START--

x800046_var_FileId = 800046







x800046_var_QuestName="萨满技能学习"
x800046_var_QuestStr="你应该找你的老师学习技能才是，我只能教萨满的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800046_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 5 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800046_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800046_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800046_var_FileId,x800046_var_QuestName,3);
end





function x800046_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800046_ProcAccept( varMap, varPlayer )

end




function x800046_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800046_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800046_CheckSubmit( varMap, varPlayer )

end




function x800046_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800046_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800046_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800046_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
