--DECLARE_QUEST_INFO_START-- 
x300787_var_FileId 					= 	300787
x300787_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300787_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300787_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会经验#r#W"
		local Readme_2 = "  1，#G帮会经验获得：#W帮会经验可以通过帮会建设、帮会募集、帮会战以及完成帮会任务获得。#r"
		local Readme_3 = "  2，#G帮会经验用途：#W帮会经验用于升级帮会和启动帮会商店的稀有商品。#r"
		local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300787_var_FileId, -1 );
end 

function x300787_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300787_ProcAccept( varMap, varPlayer )
end



function x300787_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300787_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300787_CheckSubmit( varMap, varPlayer )
end



function x300787_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300787_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300787_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300787_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
