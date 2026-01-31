--DECLARE_QUEST_INFO_START-- 
x300804_var_FileId 					= 	300804
x300804_var_QuestName				= 	"帮会跑环" 
x300804_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300804_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300804_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会跑环#r#W"
		local Readme_2 = "  1，#G接取任务：#W帮会内#G75级以上#W成员可以接取该任务。从完成整轮任务起计时，#G五天#W后可以再次接取。\n\t放弃任务后，可继续接取任务，直至任务完成。#r"
		local Readme_3 = "  2，#G任务环数：#W玩家的#G帮会功德#W小于50点，每轮跑环任务可以完成#G100环#W子任务。随着自身帮会功德的增加，子任务环数也会增加，最高为每轮可完成#G200环#W子任务。#r"
		local Readme_4 = "  3，#G任务种类：#W跑环任务分为送信、收集物品和杀怪三种形式。#r"
		local Readme_5 = "  4，#G任务奖励：#W完成任务，您将获得巨额的#G经验奖励#W。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300804_var_FileId, -1 );
end 

function x300804_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300804_ProcAccept( varMap, varPlayer )
end



function x300804_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300804_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300804_CheckSubmit( varMap, varPlayer )
end



function x300804_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300804_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300804_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300804_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
