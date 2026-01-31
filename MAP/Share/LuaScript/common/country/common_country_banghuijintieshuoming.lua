--DECLARE_QUEST_INFO_START-- 
x300794_var_FileId 					= 	300794
x300794_var_QuestName				= 	"【介绍】帮会津贴" 
x300794_var_QuestInfo				= 	"津贴介绍"

--Gameopen
x300794_var_GameOpen = 1096

--DECLARE_QUEST_INFO_STOP--

function x300794_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300794_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【介绍】帮会津贴#r#W"
		local Readme_2 = "\t帮会津贴，是每一个为帮会作出贡献的帮众都可以领取的奖励。#r"
		local Readme_3_1 = "\t参与#G顺利护送神兽#W的次数，#G帮会战的战果#W，将直接影响每周帮会津贴的多少。#r"
		local Readme_3_2 = "\t参与#G完成护送神兽#W的次数，将直接影响每周帮会津贴的多少。#r"
		local Readme_4 = "\t等级不低于#G60#W，每周功勋值不低于#G28点#W的玩家，每#G周日#W可以在我这里领取一周的帮会津贴。#r"
		local varReadme = nil
		if GetGameOpenById( x300794_var_GameOpen ) <= 0 then
			varReadme = Readme_1..Readme_2..Readme_3_1..Readme_4
		else
			varReadme = Readme_1..Readme_2..Readme_3_2..Readme_4
  	end
		
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300794_var_FileId, -1 );
end 

function x300794_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300794_ProcAccept( varMap, varPlayer )
end



function x300794_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300794_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300794_CheckSubmit( varMap, varPlayer )
end



function x300794_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300794_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300794_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300794_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
