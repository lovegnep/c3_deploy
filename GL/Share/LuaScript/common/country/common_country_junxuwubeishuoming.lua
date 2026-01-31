
--DECLARE_QUEST_INFO_START--
x300798_var_FileId = 300798
x300798_var_LevelLess	= 	75 
x300798_var_QuestName = "【军需武备说明】" 
x300798_var_ContinueInfo="\t接取任务：#G75级#W以上玩家可以接取军需武备任务，每轮任务为#G30环#W。\n\t1.从完成整轮任务起计时，#G下周#W可以再次接取。\n\t2.如上周任务没有全部完成，本周仍可继续完成。例如：#G上周完成任务为(24/30)环，本周继续此任务(24/30)环#W，但完成30环任务后无法继续接取，#G下周#W可以再次接取任务。\n\t3.玩家放弃任务后，下周才能重新接受新一轮任务。\n\t4.#W完成的任务环数越多，获得#G经验奖励#W就会越丰厚。\n\t5.完成第30环时有几率获得了一个@item_10310003"
--DECLARE_QUEST_INFO_STOP--

function x300798_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x300798_var_FileId, x300798_var_QuestName, 13, 1)
		
end

function x300798_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300798_var_QuestName)
		TalkAppendString(varMap,x300798_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
