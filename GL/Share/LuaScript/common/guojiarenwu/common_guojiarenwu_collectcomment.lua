
--DECLARE_QUEST_INFO_START--
x300502_var_FileId = 300502
x300502_var_LevelLess	= 	30 
x300502_var_QuestName = "【收集材料任务说明】" 
x300502_var_ContinueInfo="\t#W该任务十环为一轮，每天只能完成一轮。在任务中，也许材料收集人会#G多次向你收集同一物品#W，满足他的需求，你将会获得丰厚的奖励。\n\t#G如果你放弃了任务，当天无法再次领取收集材料任务了。\n\t#W你可以通过在野外打怪掉落获得材料，也可以去找@npc_138591、@npc_138592或@npc_138593学习生活技能获得所需的材料。"
--DECLARE_QUEST_INFO_STOP--

function x300502_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x300502_var_FileId, x300502_var_QuestName, 13, 1)
		
end

function x300502_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300502_var_QuestName)
		TalkAppendString(varMap,x300502_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
