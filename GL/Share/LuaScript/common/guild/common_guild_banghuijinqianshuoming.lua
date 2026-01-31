--DECLARE_QUEST_INFO_START-- 
x300788_var_FileId 					= 	300788
x300788_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300788_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300788_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会金钱#r#W"
		local Readme_2 = "  1，#G帮会金钱获得：#W帮会金钱通过帮会募集，帮会捐献，帮会跑商任务获得。#r"
		local Readme_3 = "  2，#G帮会金钱用途：#W拥有足够的帮会金钱，可由帮主发布帮务任务，也可以用于属性天赋研究。#r"
		local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300788_var_FileId, -1 );
end 

function x300788_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300788_ProcAccept( varMap, varPlayer )
end



function x300788_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300788_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300788_CheckSubmit( varMap, varPlayer )
end



function x300788_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300788_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300788_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300788_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
