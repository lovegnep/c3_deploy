--DECLARE_QUEST_INFO_START-- 
x300789_var_FileId 					= 	300789
x300789_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300789_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300789_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会使命点#r#W"
		local Readme_2 = "  1，#G使命点获得：#W使命点通过帮会募集、帮会暗战、帮会战、世界杯大赛获得。#r"
		local Readme_3 = "  2，#G使命点显示：#W前面数位代表帮会当前使命点，后面数位代表当前帮会等级所需求使命点。#r"
		local Readme_4 = "  3，#G使命点用途：#W每月中、月末会根据帮会等级结算使命点并将剩余使命点清0。#r"
		local Readme_5 = "  4，#G使命点影响：#W若帮会当前使命点达到帮会等级所需求使命点，在结算日（每月15日和每月最后一天的24点），将会获得#G高额帮会经验#W奖励。#r"
		
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300789_var_FileId, -1 );
end 

function x300789_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300789_ProcAccept( varMap, varPlayer )
end



function x300789_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300789_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300789_CheckSubmit( varMap, varPlayer )
end



function x300789_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300789_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300789_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300789_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
