x310075_var_FileId = 310075

x310075_var_QuestName = "【云游贩采购说明】"
x310075_var_QuestComment = "\t朝廷每隔一定时间就需委托野路的云游贩采购一些罕见的货物，但我平常诸事繁忙，不知道该拜托谁来完成这个事情啊！\n\t其实只需要牵着这匹拥有朝廷刻印的马儿，到宫外领取马车，向云游贩说明原委并将货物转交到各大驿站就好，可却总找不到人愿意帮忙。难道朝廷还得不到民众的信任吗？我们会给相应的报酬的。\n\t注：本活动于#g每日16：30~17：30#w开放，#g等级在40或以上#w的玩家可以领取任务。"

function x310075_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310075_var_QuestName)
			TalkAppendString(varMap,x310075_var_QuestComment)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end









function x310075_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		
	
end
