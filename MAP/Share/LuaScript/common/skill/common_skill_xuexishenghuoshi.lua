

--DECLARE_QUEST_INFO_START--

x800104_var_FileId = 800104







x800104_var_QuestName="圣火使技能学习"
x800104_var_QuestStr="你应该找你的老师学习技能才是，我只能教圣火使的技能。"
--DECLARE_QUEST_INFO_STOP--



function x800104_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe == 7 then
		OpenSkillStudyUI( varMap, varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap, x800104_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end


end




function x800104_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800104_var_FileId,x800104_var_QuestName,3);
end





function x800104_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800104_ProcAccept( varMap, varPlayer )

end




function x800104_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800104_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800104_CheckSubmit( varMap, varPlayer )

end




function x800104_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800104_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800104_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800104_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
