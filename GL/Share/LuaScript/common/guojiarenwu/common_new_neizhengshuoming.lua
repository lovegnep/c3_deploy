--DECLARE_QUEST_INFO_START-- 
x300521_var_FileId 					= 	300521
x300521_var_QuestName				= 	"【国家内政说明】" 
x300521_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300521_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	TalkAppendButton(varMap, x300521_var_FileId,x300521_var_QuestName,13,1)
end

function x300521_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【国家内政说明】#r#W"
		local Readme_2 = "  #Y接取任务：#W不低于#G25级#W的玩家可以接取任务，每天可完成#G一轮共10次#W任务！#r"
		local Readme_4 = "  #Y注意事项：#W放弃任务后本日就不能再次接取任务了，且#G环数将被清零#W。#r"
		local Readme_5 = "  #Y特殊奖励：#W在#G收集马匹#W的任务中，如果你能带来对应的#G良品马#W，会获得#G高额的经验奖励#W。\n  在收集物品的任务中，如果你能按照要求上交一些#G生活技能的原材料#W或#G生活技能制造的部件#W，#G甘醇马奶酒#W等等，你会获得#G海量的奖励#W！#r" 
		local Readme_6 = "  #Y特别提示：#W只有等级#G小于90级（不包括90级）#W且低于等级排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。" 
		local varReadme = Readme_1..Readme_2..Readme_4..Readme_5..Readme_6
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300521_var_FileId, -1 );
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x300521_var_FileId,x300521_var_QuestName)
end 

function x300521_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300521_ProcAccept( varMap, varPlayer )
end



function x300521_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300521_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300521_CheckSubmit( varMap, varPlayer )
end



function x300521_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300521_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300521_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300521_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
