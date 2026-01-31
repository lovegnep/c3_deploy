--DECLARE_QUEST_INFO_START-- 
x562004_var_FileId 					= 	562004
x562004_var_QuestName				= 	"【迷宫除恶说明】" 
x562004_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x562004_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	TalkAppendButton(varMap, x562004_var_FileId,x562004_var_QuestName,13,1)
end

function x562004_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【迷宫除恶说明】#r#W"
		local Readme_2 = "  #Y接取任务：#W#G35级到49级#W的玩家可以接取任务，每天可完成#G一轮共10环#W任务！#r"
		local Readme_4 = "  #Y注意事项：#W放弃任务后本日就不能再次接取任务了，且#G环数将被清零#W。#r"
		local Readme_5 = "  #Y特殊提示：#W在10环的任务中，结交好友组建队伍会大大提高你完成速度，完成整轮任务会获得额外奖励#W。" 
		local varReadme = Readme_1..Readme_2..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x562004_var_FileId, -1 );
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x562004_var_FileId,x562004_var_QuestName)
end 

function x562004_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x562004_ProcAccept( varMap, varPlayer )
end



function x562004_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x562004_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x562004_CheckSubmit( varMap, varPlayer )
end



function x562004_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x562004_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x562004_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x562004_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
