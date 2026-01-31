--DECLARE_QUEST_INFO_START-- 
x300796_var_FileId 					= 	300796
x300796_var_QuestName				= 	"【介绍】国运津贴" 
x300796_var_QuestInfo				= 	"津贴介绍" 
--DECLARE_QUEST_INFO_STOP--

function x300796_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300796_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【介绍】国运津贴#r#W"
		local Readme_2 = "\t国运津贴是对在国运任务中做出贡献的#G国家官员#W和#G国王帮会成员#W的奖励。#r"
		local Readme_3 = "\t在发布#G国运令#W时间内，国内每个玩家#G完成国运任务#W的次数将直接影响国运津贴的多少。#r"
		local Readme_4 = "\t每周一到周日，每天国运令期间国运任务的完成次数将会累计，在周日，可以领取一周的国运津贴。#G国王#W领取#G四倍#W国运津贴，#G国家大臣#W领取#G两倍#W国运津贴，#G国王帮众#W领取#G一倍#W国运津贴。#r"
		local Readme_5 = "\t国家官员或者国王帮会成员，等级不低于#G60#W，每周功勋值不低于#G38点#W，每#G周日#W可以在我这里领取一周的国运津贴。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300796_var_FileId, -1 );
end 

function x300796_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300796_ProcAccept( varMap, varPlayer )
end



function x300796_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300796_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300796_CheckSubmit( varMap, varPlayer )
end



function x300796_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300796_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300796_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300796_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
