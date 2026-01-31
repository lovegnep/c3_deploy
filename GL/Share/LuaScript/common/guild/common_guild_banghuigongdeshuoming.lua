--DECLARE_QUEST_INFO_START-- 
x300791_var_FileId 					= 	300791
x300791_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300791_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300791_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会功德#r#W"
		local Readme_2 = "  1，#G功德获得：#W功德可以通过完成帮会任务（帮会内政除外）、帮会建设、帮会募集、帮会战获得。#r"
		local Readme_3 = "  2，#G功德影响：#W功德小于5的帮会成员，在完成帮会任务后，不会增加帮会经验。#r"
		local Readme_4 = "  3, #G功德用途：#W功德值越高,完成护送神兽、帮会暗战、收集黑木、收集丹木、粮仓除妖、仙人谷除妖任务时所获得的经验加成越多,接受帮会跑环任务时共可完成的环数上限越高。#r"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300791_var_FileId, -1 );
end 

function x300791_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300791_ProcAccept( varMap, varPlayer )
end



function x300791_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300791_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300791_CheckSubmit( varMap, varPlayer )
end



function x300791_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300791_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300791_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300791_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
