x586001_var_FileId = 586001
x586001_var_ask ="360保险箱奖励说明"
x586001_var_answer ="#Y【360保险箱奖励说明】#W\n\t携手“奇虎360保险箱”，保游戏帐号安全，拿游戏经验奖励！赶快行动吧！#Y\n \n奖励内容如下：#W\n \n\t如果您的电脑安装并且运行了360保险箱，您将在游戏登陆后自动获得#R2%#W的经验加成奖励！\n \n\t如果您运行并登录360保险箱，您将在游戏登录后自动获得#R5%#W的经验加成奖励！\n \n\t如果您未运行360保险箱，可在不退出游戏的情况下启动360保险箱，之后可以到来我这领取对应的奖励。"

function x586001_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	StartTalkTask(varMap)
	TalkAppendString(varMap,x586001_var_answer)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
end








function x586001_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x586001_var_FileId, x586001_var_ask,0,0)
end


