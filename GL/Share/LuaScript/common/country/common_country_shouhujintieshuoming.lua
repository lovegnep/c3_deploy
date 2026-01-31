--DECLARE_QUEST_INFO_START-- 
x300799_var_FileId 					= 	300799
x300799_var_QuestName				= 	"【介绍】守护津贴" 
x300799_var_QuestInfo				= 	"津贴介绍" 
--DECLARE_QUEST_INFO_STOP--

function x300799_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300799_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【介绍】守护津贴#r#W"
		local Readme_2 = "\t守护津贴，是每一个为守护国家做出贡献的，#G守护帮会成员#W及#G帮主#W都可以领取的奖励。#r"
		local Readme_3 = "\t在发布#G出国令#W时间内，每个玩家完成#G出国任务的次数#W将直接影响当天守护津贴的多少。#r"
		local Readme_4 = "\t每#G周一#W到#G周日#W，每天出国令期间#G出国任务的完成次数#W将会#G累计#W，在#G周日#W，可以领取一周的守护津贴。在功勋值足够的基础上，#G帮众#W领取#G基本#W津贴，#G帮主#W领取#G四倍#W津贴。#r"
		local Readme_5 = "\t达到#G60级#W的守护帮会成员每周功勋值不低于#G32#W点，每#G周日#W可以在我这里领取一周的守护津贴，功勋值是每人在出国令期间完成出国任务时获得。#r"
		local Readme_6 = "#G小提示：若守护帮会成员为国家官员，在守护津贴或出国及国运津贴中只能领取其中一种。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300799_var_FileId, -1 );
end 
	
function x300799_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300799_ProcAccept( varMap, varPlayer )
end



function x300799_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300799_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300799_CheckSubmit( varMap, varPlayer )
end



function x300799_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300799_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300799_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300799_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
