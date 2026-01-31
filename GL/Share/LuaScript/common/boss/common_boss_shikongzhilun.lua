
x305050_var_FileId = 305050
x305050_var_QuestName = "【时空之轮说明】" 
x305050_var_ContinueInfo="\t乌云遮挡了太阳的光芒，风雨淋湿了雄鹰的双翼，成吉思汗正在受到黑锁巨人的威胁，历史的轨迹正在悄然变化！\n\t勇士们，请通过#G记忆之门#W，去往#G克烈部#W及之后的历史场景中消灭他们吧！\n\t每日#G11：00，15：00，19：00，23：00#W将在每个历史场景中出现30个黑锁巨人，请有志者抓紧时间退敌！"

function x305050_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x305050_var_FileId, x305050_var_QuestName, 13, 1)
		
end

function x305050_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305050_var_QuestName)
		TalkAppendString(varMap,x305050_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
