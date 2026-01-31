x800069_var_FileId = 800069
x800069_var_ask ={"【装备回收说明】"}
x800069_var_answer ={"#Y【装备回收说明】#W\n\t所有使用声望、荣誉、帮贡和战场积分换购的装备，都可以在我这里回收成相对应的成本。此外，一些永久外装也能进行回收。\n#Y操作说明#W：\n\t1.与王国#G装备回收大师#W或大都#G装备回收大师#W对话。\n\t2.选择#G装备回收#W选项。\n\t3.将需要回收的装备放入到装备回收介面中间的格子内。\n\t4.点击介面下方回收按钮。\n#Y注意事项#W：\n\t黄色的装备在我这里只能兑换到70%的成本，而紫色的装备因为材质优异则可以兑换出100%的成本。永久外装可以兑换获得稀世奇珍兑换券。"}

function x800069_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800069_var_answer[1])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800069_var_answer[2])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800069_var_answer[3])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800069_var_answer[4])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 4 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800069_var_answer[5])
			TalkAppendButton(varMap, x800069_var_FileId, x800069_var_ask[1],0,0)
      TalkAppendButton(varMap, x800069_var_FileId, x800069_var_ask[2],0,1)
      TalkAppendButton(varMap, x800069_var_FileId, x800069_var_ask[3],0,2)
      TalkAppendButton(varMap, x800069_var_FileId, x800069_var_ask[4],0,3)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end

	
	
end








function x800069_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x800069_var_FileId, x800069_var_ask[1],0,0)
end








