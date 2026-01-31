--DECLARE_QUEST_INFO_START-- 
x300784_var_FileId 					= 	300784
x300784_var_QuestName				= 	"收集黑木"
x300784_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300784_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300784_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会贡品说明】#r#W"
		local Readme_2 = "    帮会贡品任务，分为#G寻物#W和#G送信#W两种，您只需要按照帮会任务发布人的要求完成任务，就可以获得#G经验#W和#G帮贡#W的奖励。#r"
		local varReadme = Readme_1..Readme_2
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300784_var_FileId, -1 );
end 

function x300784_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300784_ProcAccept( varMap, varPlayer )
end



function x300784_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300784_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300784_CheckSubmit( varMap, varPlayer )
end



function x300784_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300784_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300784_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300784_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
