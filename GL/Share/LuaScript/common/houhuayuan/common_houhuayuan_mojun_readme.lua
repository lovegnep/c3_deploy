
x305006_var_FileId = 305006
x305006_var_QuestName = "【冥·十八魔君说明】" 
x305006_var_ContinueInfo="\t你可知道冥·十八魔君？在决战后花园资料片中，万奴冥王率领了东夏军一夜之间摧毁了威海港，打算通过后花园连接的混沌之路刺杀忽必烈，他们可能会在每日23：00点出现在以下地点：\n#Y\n万奴冥王\n#G后花园（345，239）\n#Y伏尔加冥王\n#G粮仓五层（65，47）\n#Y埃及冥王\n#G仙人谷五层（60，63）\n#Y高加索冥王\n#G威海港（158，130）"
function x305006_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x305006_var_FileId, x305006_var_QuestName, 13, 1)
end

function x305006_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305006_var_QuestName)
		TalkAppendString(varMap,x305006_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end
