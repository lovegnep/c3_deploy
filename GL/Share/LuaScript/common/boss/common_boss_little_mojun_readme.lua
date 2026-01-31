
x305004_var_FileId = 305004
x305004_var_QuestName = "【魔君部将说明】" 
x305004_var_ContinueInfo="\t十八魔君的部将们各个身手了得，暴虐成性。他们很有可能出现在如下地点！\n#y\n完颜洪烈部将#g（凤翔府）\n \n#y屈出律部将#g（阿尔金山）\n \n#y札兰丁部将#g（撒马尔罕）  \n \n#y弗拉基米尔部将#g（莫斯科公国）\n \n#y贝拉四世部将#g（匈牙利）\n \n#y哈里发部将#g（大马士革）\n \n#w\n消灭各个魔君部将会获得其身上的各种财宝。"
function x305004_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x305004_var_FileId, x305004_var_QuestName, 13, 1)
		
end

function x305004_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305004_var_QuestName)
		TalkAppendString(varMap,x305004_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
