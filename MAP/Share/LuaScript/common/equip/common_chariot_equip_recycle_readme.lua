x800139_var_FileId = 800139
x800139_var_ask ="【战车装备回收说明】"
x800139_var_answer ="#Y【战车装备回收说明】#W\n\t所有非新手的战车装备，都可以在我这里回收成一定数量的黄金藏宝图碎片。\n#Y操作说明#W：\n\t1.与战车工坊内的#G战车装备回收大师#W对话。\n\t2.选择#G战车装备回收#W选项。\n\t3.将需要回收的战车装备放入到装备回收介面中间的格子内。\n\t4.点击介面下方回收按钮。"

function x800139_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	StartTalkTask(varMap)
	TalkAppendString(varMap,x800139_var_answer)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
end








function x800139_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x800139_var_FileId, x800139_var_ask,0,0)
end








