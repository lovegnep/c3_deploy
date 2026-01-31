x801002_var_FileId = 801002
x801002_var_ask ="了解土地种植"
x801002_var_answer ="#Y【土地种植说明】#W\n1.在#cC40000种植管理介面#W中可以对土地和种植进行相关的操作。\n2.已开垦的土地才可以进行种植，开垦土地需要一定的费用，可开垦土地的数量会随着角色等级的提升而增加。\n3.当土地开垦后，点击“种植”按钮打开种植介面并选择作物的种子开始种植，不同的作物在收成时获得的收益也不同。\n4.从种子种下到成熟需要一定的时间，越好的种子所需的成熟时间越长，但收成会越好。\n5.作物成熟后，只需要在庄园种植区中点击已成熟的作物就可以收获了。\n6.作物收获完成后可以在该块土地继续种植，每块土地每天只可以种植#R3#W次。"

function x801002_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	StartTalkTask(varMap)
	TalkAppendString(varMap,x801002_var_answer)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
end








function x801002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x801002_var_FileId, x801002_var_ask,0,0)
end


