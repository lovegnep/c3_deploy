--DECLARE_QUEST_INFO_START-- 
x300830_var_FileId 					= 	300830
x300830_var_QuestName				= 	"帮会速成" 
x300830_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300830_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300830_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会速成说明】#r#W"
		local Readme_2 = "  1.#G接取任务：#W首先服务器中有1个4级及以上的帮会，该任务才会开启。必须为低于最高等级帮会2级（含2级）以下的达到40级的帮会成员，花费3两现金/金卡才可接受任务。#r"
		local Readme_3 = "  2.#G任务途中：#W帮会成员可一同前往完成任务，如果杀死相应的魔君爪牙后，周围同帮会玩家均可完成该任务。#r"
		local Readme_4 = "  3.#G回复完成：#W完成此任务请在当日进行回复，如隔日回复将造成当日无法接取此任务。#r"
		local Readme_5 = "  4.#G任务奖励：#W完成此任务，您将获得一颗还魂丹，帮会经验，帮贡奖励。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300830_var_FileId, -1 );
end 

function x300830_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300830_ProcAccept( varMap, varPlayer )
end



function x300830_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300830_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300830_CheckSubmit( varMap, varPlayer )
end



function x300830_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300830_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300830_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300830_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
