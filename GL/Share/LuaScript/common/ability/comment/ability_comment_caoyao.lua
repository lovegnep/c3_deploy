
x540200_var_FileId = 540200
x540200_var_QuestName = "【采集技能说明】" 
x540200_var_ContinueInfo="\t学习#R采集#W技能后，在#G草原地图#W可以采集到各种生活技能材料，地点如下：\n#Y\n1~2级技能#W  可以采集#G红花，甘草#W\n#Y采集地点   #G罕难河草原、乞颜部\n#Y\n3~4级技能#W  可以采集#G茯苓，伸筋藤#W\n#Y采集地点   #G乞颜部、塔塔尔部\n#W\n#Y5~6级技能#W  可以采集#G天麻，朱砂#W\n#Y采集地点   #G克烈部、乃蛮部\n#W\n#Y7~8级技能#W  可以采集#G防风，桂枝#W\n#Y采集地点   #G乃蛮部、居庸关\n#W请注意：剧场内是没有生活技能采集点存在的，你需要前往正常的世界地图中采集，如：王国草原-罕难河，而不是 剧场-罕难河。"

function x540200_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x540200_var_FileId, x540200_var_QuestName, 13, 1)
		
end

function x540200_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x540200_var_QuestName)
		TalkAppendString(varMap,x540200_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
