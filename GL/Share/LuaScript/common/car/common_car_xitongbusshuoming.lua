x310084_var_FileId = 310084

x310084_var_QuestName = "【游览玄武飞艇说明】"
x310084_var_QuestComment = "\t每日#G12：15~12：45,14：15~14：45,16：15~16：45和18：15~18：45#W，玄武飞艇将从此处降临，绕王城三周后返回，#G超过20级#W的玩家将可以免费乘坐玄武飞艇游览整个王城，威风神武！并且在飞艇行进过程中，每隔一定时间将会获得#G高额经验和银卡奖励#W，飞艇上坐的人#G越多#W，获得的#G经验#W就会#G越高#W，欢迎乘坐！\n\t玄武飞艇只可#R乘坐8人#W，请大家在规定时间内，在发车车站附近有序登上飞艇。\n\t注意，玄武飞艇驶出后将不再接受乘客中途登上飞艇，请大家有序排队等候。"

function x310084_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310084_var_QuestName)
			TalkAppendString(varMap,x310084_var_QuestComment)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end









function x310084_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x310084_var_FileId, x310084_var_QuestName,13,1)
	
end
