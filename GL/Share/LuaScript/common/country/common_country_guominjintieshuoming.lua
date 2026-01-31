--DECLARE_QUEST_INFO_START-- 
x300793_var_FileId 					= 	300793
x300793_var_QuestName				= 	"【介绍】国民津贴" 
x300793_var_QuestInfo				= 	"津贴介绍" 
--DECLARE_QUEST_INFO_STOP--

function x300793_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300793_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【介绍】国民津贴#r#W"
		local Readme_2 = "\t国民津贴，是每一个为国家做出贡献的国民都可以领取的奖励。#r"
		local Readme_3 = "\t#G每天#W是否能坚持#G完成一整轮内政#W，将直接影响每周国民津贴的多少。#r"
		local Readme_4 = "\t等级不低于#G60#W，每周功勋值不低于#G18点#W的玩家，每#G周日#W可以在我这里领取一周的国民津贴。#r"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300793_var_FileId, -1 );
end 

function x300793_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300793_ProcAccept( varMap, varPlayer )
end



function x300793_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300793_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300793_CheckSubmit( varMap, varPlayer )
end



function x300793_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300793_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300793_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300793_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
