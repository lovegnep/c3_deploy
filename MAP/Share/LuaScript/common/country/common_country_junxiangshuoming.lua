--DECLARE_QUEST_INFO_START-- 
x300831_var_FileId 					= 	300831
x300831_var_QuestName				= 	"【介绍】领取军饷" 
x300831_var_QuestInfo				= 	"津贴介绍" 
--DECLARE_QUEST_INFO_STOP--

function x300831_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300831_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【介绍】领取军饷#r#W"
		local Readme_2 = "\t军饷，是每一个为国家做出贡献的军人都可以领取的工资。#r"
		local Readme_3 = "\t#G每天#W是否能坚持#G完成一整轮内政#W，将直接影响每周军饷的多少。军阶等级的高低也会影响领取军饷的数额。#r"
		local Readme_4 = "\t等级不低于#G60#W，每周功勋值不低于#G12点#W，且当周完成至少一整轮内政任务的玩家，每#G周日#W可以在我这里领取一周的军饷。#r"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300831_var_FileId, -1 );
end 

function x300831_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300831_ProcAccept( varMap, varPlayer )
end



function x300831_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300831_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300831_CheckSubmit( varMap, varPlayer )
end



function x300831_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300831_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300831_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300831_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
