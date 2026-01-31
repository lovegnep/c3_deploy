x310905_var_FileId = 310905
x310905_var_name ="【端午节活动说明】"
x310905_var_ask1 ="【端午节海都袭城活动说明】"
x310905_var_ask2 ="【龙舟飞渡大赛活动说明】"
x310905_var_ask3 ="【制作粽子活动说明】"
x310905_var_answer1 ="#Y【端午节海都袭城活动说明】#W\n \n活动日期：#R6月19日至6月25日\n#W活动地点：#R大都及各国王城\n#W活动说明：#W\n1.白天的#R11:00#W、#R15:00#W、#R17:00#W大都与各国王城将会遭到大批海都先锋的袭击。\n2.晚间#R22：00#W海都将亲率大军集中进攻大都。\n3.击退海都惊喜多多，更有机会获得稀有骑乘。"
x310905_var_answer2 ="#Y【龙舟飞渡大赛活动说明】#W\n \n活动日期：#R6月19日至6月25日\n#W活动地点：#R大都南部码头 \n#W活动说明：#W\n1.每日#R18：00~19：50#W大都南部各个队伍领队处，你可以为各个队伍敬酒助威，每喝一杯队伍会返给你500文金卡，如果你支持的队伍最后获得冠军，更有额外奖励获得！\n2.每日#R19：50#W龙舟飞渡大赛正式开始，各个队伍会从#G大都南部码头#W出发，终点为大都西面#G崔府#W附近。\n3.每日#R20：00#W后，玩家可在起点各个领队处以及终点大赛裁判处查看及领取奖励，当日奖励当日领取，超过当天晚上#R24#W点则无法再领取奖励！。"
x310905_var_ItemId = 12110213

function x310905_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	if which == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#W".."\t一年一度的端午节又如期而至了，饮雄黄酒，吃粽子，赛龙舟是端午节必不可少的传统习俗。")
		TalkAppendButton(varMap, x310905_var_FileId, x310905_var_ask1,0,2)
		TalkAppendButton(varMap, x310905_var_FileId, x310905_var_ask2,0,3)
		TalkAppendButton(varMap, x310905_var_FileId, x310905_var_ask3,0,4)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif which == 2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x310905_var_answer1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif which == 3 then	
		StartTalkTask(varMap)
		TalkAppendString(varMap,x310905_var_answer2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif which == 4 then	
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y".."【制作粽子活动说明】")
		TalkAppendString(varMap,"\t端午节快乐！\n\t在这个暖暖初夏，让我们一起包粽子、赛龙舟欢度节日吧！\n\t收集#R箬竹叶#W和#R糯米团#W可以制作粽子，使用粽子可以获得#R烈焱碎片#W、#R黄金麻将#W、#R豪华将星卡包#W、#R雄黄酒#W等珍贵道具。")
		--普通粽子
		AddQuestItemBonus(varMap, x310905_var_ItemId,1)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310905_var_FileId, -1)
	end
	

			
end


function x310905_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x310905_var_FileId, x310905_var_name,0,1)
end


