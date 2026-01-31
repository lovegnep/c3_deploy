--DECLARE_QUEST_INFO_START-- 
x310130_var_FileId 					= 	310130
x310130_var_QuestName				= 	"【皇帝争夺战说明】" 
x310130_var_QuestInfo				= 	"皇帝争夺战说明" 
--DECLARE_QUEST_INFO_STOP--

function x310130_ProcEnumEvent( varMap, varPlayer, varTalknpc )

	TalkAppendButton(varMap, x310130_var_FileId, x310130_var_QuestName, 13,0)
end

function x310130_ProcEventEntry(varMap, varPlayer,varTalknpc)	

		StartTalkTask(varMap)
		local Readme_1 = "#Y【国家】皇帝战说明#r#W"
		local Readme_2 = "\t皇帝战，在每周六的#G20：00-21：00#W进行。全服所有#G60#W级以上的玩家都可参与。#r"
		local Readme_3 = "\t在未产生第一位皇帝之前，皇帝战将为夺旗模式，在周六的#G20：00-21：00#W进行。\n\t在此模式下，整场战斗期间#G沙城王旗#W会定时刷新在城南的圆形平台上，率先夺得3面#G沙城王旗#W的国王将成为第一届皇帝。若战斗结束时出现夺旗数量相等，则选取国家强弱榜分值更高的国家成为第一届皇帝。#r"
		local Readme_4 = "\t在产生了第一位皇帝之后，皇帝战将升级为攻守模式，在每周六的20：00-21：00进行。\n\t在此种模式下，系统将会自动将非皇帝方的三国结为#G同盟国#W，按照国家强弱榜资料，每周依次选择一个国家为主攻方，其他两个国家为辅攻方。\n\t攻击方顺利摧毁沙城内的#G勇猛之魂，威武之魂，统御之魂或沙城皇宫内的长生天#W后，主攻国将成为新的皇帝国。"
		local Readme_5 = "\n\t所有攻方国家在皇帝战期间均可在各国的国家物资官处，领取对应的攻城任务，获得丰厚奖励。\n\t皇帝国顺利连任次数越多，皇帝会获得能力#G更强#W的皇帝时装和皇帝坐骑。#r"
		local Readme_6 = "\n\t皇帝战期间，无法使用帮会，队伍召集令等道具，只能通过#G沙城召集石#W，消耗国家粮草（沙城日常任务获得）进行召集。也只能通过#G皇帝战回魂丹#W进行原地复活。#r"
		
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310130_var_FileId, -1 );
end 

function x310130_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x310130_ProcAccept( varMap, varPlayer )
end



function x310130_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x310130_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x310130_CheckSubmit( varMap, varPlayer )
end



function x310130_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x310130_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x310130_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x310130_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
