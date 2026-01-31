x586002_var_FileId = 586002
x586002_var_ask ="新浪微博说明"
x586002_var_answer ="#Y【新浪微博说明】#W\n\t为了让您可以随时随地使用新浪微博分享自己的游戏生活，建议您点击雷达图周边的“#cF77B00博#W”字按钮打开新浪微博上传功能。\n \n#Y【领取礼盒说明】#W\n1.只有通过游戏中的新浪微博功能上传才可以获得“新浪微博达人礼盒”。\n2.每完成上传#R1#W次，都可以获得#R1#W份“新浪微博达人礼盒”，每个角色每天最多可获得#R3#W份。\n3.所获得的礼盒需要玩家登录官网的游戏帐号中心，将礼盒划拨到所在游戏服务器，再通过游戏中的#c178BFF领奖大使#W领取。\n4.打开礼盒将有机会获得“#R残破的神兵之魂#W”和“#R烈焱碎片#W”。"

function x586002_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	StartTalkTask(varMap)
	TalkAppendString(varMap,x586002_var_answer)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
end








function x586002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x586002_var_FileId, x586002_var_ask,0,0)
end


