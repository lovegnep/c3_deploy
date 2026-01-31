

--DECLARE_QUEST_INFO_START--

x570052_var_FileId = 570052







x570052_var_QuestName="属性天赋研究"
x570052_var_QuestStr="你还未加入任何帮会。"
x570052_var_Leader_Index=5
--DECLARE_QUEST_INFO_STOP--



function x570052_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	if GetGameOpenById(1052 ) == 0 then
		return
	end

	local nGuildID= GetGuildID( varMap, varPlayer)
	if nGuildID == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap, x570052_var_QuestStr)
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	else
		local pos = GetGuildOfficial(varMap, varPlayer)
		if pos ~= x570052_var_Leader_Index then			
			StartTalkTask(varMap)
			TalkAppendString(varMap, "抱歉，您不是帮主，没有权利升级帮会属性天赋！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else
			OpenGuildSkillStudyUI_Guild( varMap, varPlayer)
		end

	
 	end

	return 0
end




function x570052_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(1052 ) == 0 then
		return
	end

	TalkAppendButton(varMap,x570052_var_FileId,x570052_var_QuestName,3);
end





function x570052_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x570052_ProcAccept( varMap, varPlayer )

end




function x570052_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570052_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570052_CheckSubmit( varMap, varPlayer )

end




function x570052_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570052_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570052_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570052_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
