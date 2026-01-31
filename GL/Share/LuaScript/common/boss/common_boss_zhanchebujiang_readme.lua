
x305008_var_FileId = 305008
x305008_var_QuestName = "【战车精英部将说明】" 
x305008_var_ContinueInfo="\t你可知道战车精英部将？他们很有可能出现在如下地点：\n#Y\n奎甲\n#G后花园（149，363）\n#Y风翼\n#G后花园（43，69）\n#Y猎鲨\n#G后花园（307，187）\n#Y独冲\n#G后花园（466，241）\n#Y堡垒\n#G后花园（124，151）\n#Y雷爪一号\n#G后花园（176，259）\n#Y雷爪二号\n#G后花园（246，39）\n#W\n消灭各个战车精英魔君部将会获得其身上的各种财宝。"
function x305008_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x305008_var_FileId, x305008_var_QuestName, 13, 1)
end

function x305008_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305008_var_QuestName)
		TalkAppendString(varMap,x305008_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end
