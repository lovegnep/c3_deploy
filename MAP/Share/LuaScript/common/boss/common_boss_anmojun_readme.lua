
x305007_var_FileId = 305007
x305007_var_QuestName = "【暗·海都大王说明】" 
x305007_var_ContinueInfo="\t你可知道暗·海都大王？他很有可能出现在如下地点：\n#Y\n暗·海都大王\n#G中兴府（102，129）\n#W\n每周五晚上10点暗·海都大王将会出现。"
function x305007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x305007_var_FileId, x305007_var_QuestName, 13, 1)
end

function x305007_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305007_var_QuestName)
		TalkAppendString(varMap,x305007_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end
