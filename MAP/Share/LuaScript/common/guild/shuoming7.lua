--DECLARE_QUEST_INFO_START-- 
x300773_var_FileId 					= 	300773
x300773_var_QuestName				= 	"收集黑木"
x300773_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300773_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300773_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮务任务说明】#r#W"
		local Readme_2 = "  1.#G发布任务：#W帮务任务只有帮主和副帮主可以发布，发布任务后，限时#G2小时#W内完成，超时无效。#r"
		local Readme_3 = "  2.#G发布周期：#W每天可以在帮务任务中选择：#r#Y【帮会】护兽令#r【帮会】收集令#r【帮会】暗战令#r【帮会】除妖令#r【帮会】募集令#r#W其中一种，每周相同的帮务任务只允许发布一次。#r"
		local Readme_4 = "  3.#G任务途中：#W帮会成员间组队前往，可加快任务完成的速度。#r"
		local Readme_5 = "  4.#G回复完成：#W在完成此任务后，务必在时限内回复，否则只能获得基本奖励。#r"
		local Readme_6 = "  5.#G任务奖励：#W帮会成员获得#G双倍#W任务奖励，副帮主获得#G三倍#W任务奖励，帮主获得#G四倍#W任务奖励。#r" 
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300773_var_FileId, -1 );
end 

function x300773_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300773_ProcAccept( varMap, varPlayer )
end



function x300773_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300773_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300773_CheckSubmit( varMap, varPlayer )
end



function x300773_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300773_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300773_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300773_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
