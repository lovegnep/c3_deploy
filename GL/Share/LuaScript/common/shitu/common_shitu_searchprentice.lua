
--DECLARE_QUEST_INFO_START--

x800040_var_FileId = 800040







x800040_var_QuestName="【师徒】查找徒弟"

--DECLARE_QUEST_INFO_STOP--



function x800040_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800040_var_FileId,x800040_var_QuestName,3,0);
end

function x800040_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	local Readme_1 = "#Y【师徒】查找徒弟#r"
	local Readme_2 = "\t#W您可以通过我的帮助找到您乖巧的徒弟，顺利结成师徒关系可在未来的日子里获得丰厚的奖励。#r\t您是否要#G查找徒弟#W？"
	local varReadme = Readme_1..Readme_2
	StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask();DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800040_var_FileId,-1);
end










function x800040_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800040_ProcAccept( varMap, varPlayer )

end




function x800040_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x800040_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x800040_CheckSubmit( varMap, varPlayer )
end




function x800040_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x800040_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x800040_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800040_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
