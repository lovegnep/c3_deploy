--DECLARE_QUEST_INFO_START-- 
x300767_var_FileId 					= 	300767
x300767_var_QuestName				= 	"帮会暗战" 
x300767_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300767_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300767_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会暗战说明】#r#W"
		local Readme_2 = "  1.#G接取任务：#W30级以上的帮会成员每天可以自行接取此任务。#r"
		local Readme_3 = "  2.#G任务途中：#W帮会成员间组队，可加快任务完成速度。#r"
		local Readme_4 = "  3.#G回复完成：#W完成此任务请在当日进行回复，如隔日回复将造成当日无法接取此任务。#r"
		local Readme_5 = "  4.#G任务奖励：#W完成此任务，您将获得高额的经验，帮会经验，帮贡奖励。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300767_var_FileId, -1 );
end 

function x300767_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300767_ProcAccept( varMap, varPlayer )
end



function x300767_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300767_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300767_CheckSubmit( varMap, varPlayer )
end



function x300767_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300767_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300767_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300767_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
