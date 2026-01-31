x302533_var_FileId = 302533
x302533_var_ask1 ="【周年欢乐送】"

x302533_var_answer1 ="【周年欢乐送】#W\n \n活动日期：#R7月10日至7月30日\n#W活动说明：#W\n1.每日完成10轮内政任务、官府押运、国家守边、敌国除奸、敌国刺杀、敌国情报、敌国夺旗、争夺龙魂，均有几率可获得欢乐周年兑换券。积攒一定量的兑换券可在活动使者处兑换道具，还可兑换新型大礼包哦！"

function x302533_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	


	if which == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x302533_var_answer1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

	end
	

			
end


function x302533_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x302533_var_FileId, x302533_var_ask1,0,1)
end


