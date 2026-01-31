--DECLARE_QUEST_INFO_START-- 
x300773_var_FileId 					= 	300786
x300773_var_QuestName				= 	"帮会等级" 
x300773_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300786_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300786_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会等级#r#W"
		local Readme_2 = "\t#G帮会等级：#W提升帮会等级需要一定的帮会令、现银及帮会经验。等级越高，帮会人数上限越高，帮会任务也将获得更多的奖励#r"
		local varReadme = Readme_1..Readme_2
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300773_var_FileId, -1 );
end 

function x300786_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300786_ProcAccept( varMap, varPlayer )
end



function x300786_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300786_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300786_CheckSubmit( varMap, varPlayer )
end



function x300786_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300786_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300786_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300786_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
