x800167_var_FileId = 800167
x800167_var_ask ={"【骑乘装备回收说明】"}
x800167_var_answer ={"#Y【骑乘装备回收说明】#W\n\t三河，伊犁，波斯，天方，大宛系列骑乘装备都可以进行回收（初级骑乘装备不能回收）。\n#Y操作说明#W：\n\t1.与王国#G装备回收大师#W或大都#G装备回收大师#W对话。\n\t2.选择#G骑乘装备回收#W选项。\n\t3.将需要回收的骑乘装备放入到骑乘装备回收介面中间的格子内。\n\t4.点击介面下方回收按钮。\n#Y注意事项#W：\n\t骑乘装备回收只返还龙鳞，不返还凤羽和耀铜矿。"}

function x800167_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800167_var_answer[1])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800167_var_answer[2])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800167_var_answer[3])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800167_var_answer[4])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 4 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800167_var_answer[5])
			TalkAppendButton(varMap, x800167_var_FileId, x800167_var_ask[1],0,0)
      TalkAppendButton(varMap, x800167_var_FileId, x800167_var_ask[2],0,1)
      TalkAppendButton(varMap, x800167_var_FileId, x800167_var_ask[3],0,2)
      TalkAppendButton(varMap, x800167_var_FileId, x800167_var_ask[4],0,3)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end

	
	
end








function x800167_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x800167_var_FileId, x800167_var_ask[1],0,0)
end








