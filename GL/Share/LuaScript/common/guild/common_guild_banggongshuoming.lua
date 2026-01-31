--DECLARE_QUEST_INFO_START-- 
x300790_var_FileId 					= 	300790
x300790_var_QuestName				= 	"收集黑木"
x300790_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300790_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300790_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮贡说明#r#W"
		local Readme_2 = "  1，#G帮贡获得：#W帮贡通过完成帮会任务、帮会建设、帮会募集、帮会战获得。#r"
		local Readme_3 = "  2，#G帮贡用途：#W帮贡可以用来在帮会商店购买物品，兑换海蓝钻石也需要帮贡。#r"
		local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300790_var_FileId, -1 );
end 

function x300790_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300790_ProcAccept( varMap, varPlayer )
end



function x300790_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300790_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300790_CheckSubmit( varMap, varPlayer )
end



function x300790_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300790_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300790_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300790_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
