
x305009_var_FileId = 305009
x305009_var_QuestName = "【战车之王说明】" 
x305009_var_ContinueInfo="\t战车之王非常凶悍。他们很有可能出现在如下地点！\n \n#G地下粮仓五层#W，#G仙人谷五层。"
function x305009_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x305009_var_FileId, x305009_var_QuestName, 13, 1)
		
end

function x305009_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305009_var_QuestName)
		TalkAppendString(varMap,x305009_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
