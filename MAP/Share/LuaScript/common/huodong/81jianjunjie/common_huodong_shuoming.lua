x302544_var_FileId = 302544
x302544_var_name ="八一军演活动说明"
x302544_var_ask1 ="【活动】八一军演"
x302544_var_answer1 ="#Y【活动】八一军演#W\n \n活动日期：#R7月31日至8月6日\n#W活动地点：#G边塞中兴府#W\n#W活动说明：#W\n\t1.每日的#R22:20#W中兴府会举行盛大的军事演习。\n\t2.中兴府会出现五个大营，每个国家都有自己的营地。\n\t3.玩家可以在大都跨界传送人处选择想要的位置传送至中兴府。\n\t4.活动开始后，玩家可以攻打其他国家的营地，消灭该国家的所有NPC后该营地即被占领，怪物将重新刷新。\n\t5.中间大营为中立营地，任意国家都可攻打。\n\t6.活动期间需身着军演作战服时装，身穿时装在活动地图会获得丰厚奖励。"


function x302544_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	


	if which == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x302544_var_answer1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

	end
	

			
end


function x302544_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x302544_var_FileId, x302544_var_ask1,0,1)
	--TalkAppendButton(varMap, x302544_var_FileId, x302544_var_ask1,0,1)
end


