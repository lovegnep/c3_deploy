
x540201_var_FileId = 540201
x540201_var_QuestName = "【捕捉技能说明】" 
x540201_var_ContinueInfo="\t学习#R捕捉#W技能后，在#G草原地图#W可以捕捉到各种生活技能材料，地点如下：\n#Y\n1~2级技能#W  可以捕捉#G马蜂#W\n#Y捕捉地点   #G罕难河草原、乞颜部\n#W\n#Y3~4级技能#W  可以捕捉#G牛虻#W\n#Y捕捉地点   #G乞颜部、塔塔尔部\n#W\n#Y5~6级技能#W  可以捕捉#G吸血蝙蝠#W\n#Y捕捉地点   #G克烈部、乃蛮部\n#W\n#Y7~8级技能#W  可以捕捉#G碧血蟾蜍#W\n#Y捕捉地点   #G乃蛮部、居庸关\n#W请注意：剧场内是没有生活技能采集点存在的，你需要前往正常的世界地图中采集，如：王国草原-罕难河，而不是 剧场-罕难河。"

function x540201_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	TalkAppendButton(varMap, x540201_var_FileId, x540201_var_QuestName, 13, 1)
		
end

function x540201_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x540201_var_QuestName)
		TalkAppendString(varMap,x540201_var_ContinueInfo)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end
