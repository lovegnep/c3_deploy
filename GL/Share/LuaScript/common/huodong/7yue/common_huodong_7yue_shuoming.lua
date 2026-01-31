x302531_var_FileId = 302531
x302531_var_name ="《成吉思汗 恶狼传说》周年活动说明"
x302531_var_ask1 ="【活动】天狼国入侵"
x302531_var_answer1 ="#Y【天狼国入侵】#W\n \n活动日期：#R7月24日至7月30日\n#W活动地点：#R【各国王城】\n#W活动说明：#W\n\t1.每日的#R22:00#W天狼巫师将出现在#R王城城外#W。\n\t2.天狼国巫师开启传送将自己传送至各国王城，勇士们可击杀天狼国巫师，并将获得其携带的物品。\n\t3.巫师死亡时将会召唤出天狼进行最后的攻击，勇士们千万不要轻视这些生物！"
x302531_var_ItemId = 12110213

function x302531_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	


	if which == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x302531_var_answer1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

	end
	

			
end


function x302531_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x302531_var_FileId, x302531_var_ask1,0,1)
	--TalkAppendButton(varMap, x302531_var_FileId, x302531_var_ask1,0,1)
end


