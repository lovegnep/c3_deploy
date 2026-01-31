

--DECLARE_QUEST_INFO_START--

x800107_var_FileId = 800107







x800107_var_QuestName="隐修士技能学习"
x800107_var_QuestStr="你应该找你的老师学习技能才是，我只能教隐修士的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800107_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 10 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800107_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800107_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800107_var_FileId,x800107_var_QuestName,3);
end





function x800107_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800107_ProcAccept( varMap, varPlayer )

end




function x800107_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800107_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800107_CheckSubmit( varMap, varPlayer )

end




function x800107_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800107_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800107_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800107_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
