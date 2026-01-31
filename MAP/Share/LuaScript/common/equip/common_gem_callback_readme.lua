x800112_var_FileId = 800112
x800112_var_ask ={"【宝石回收说明】"}
x800112_var_answer ={"#Y【宝石回收说明】#W\n\t多彩宝石，宗师级宝石，传说级宝石，都可以在我这里回收成相对应的成本（暴击，命中，闪避，韧性，防御类宝石不能回收）。\n#Y操作说明#W：\n\t1.与王国#G装备回收大师#W或大都#G装备回收大师#W对话。\n\t2.选择#G宝石回收#W选项。\n\t3.将需要回收的宝石放入到宝石回收介面中间的格子内。\n\t4.点击介面下方回收按钮。\n#Y注意事项#W：\n\t所有多彩宝石都可以在我这里兑换出100%的成本，宗师级宝石（传说级宝石）会返还7个（10个）雪山之星。"}

function x800112_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800112_var_answer[1])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800112_var_answer[2])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800112_var_answer[3])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800112_var_answer[4])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 4 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800112_var_answer[5])
			TalkAppendButton(varMap, x800112_var_FileId, x800112_var_ask[1],0,0)
      TalkAppendButton(varMap, x800112_var_FileId, x800112_var_ask[2],0,1)
      TalkAppendButton(varMap, x800112_var_FileId, x800112_var_ask[3],0,2)
      TalkAppendButton(varMap, x800112_var_FileId, x800112_var_ask[4],0,3)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end

	
	
end








function x800112_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x800112_var_FileId, x800112_var_ask[1],0,0)
end








