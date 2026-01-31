

x270200_var_FileId = 270200
x270200_var_ask ={"回到威海港","确定"}
x270200_var_answer ={"\t你确认要离开此副本，返回威海港吗？"}

function x270200_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x270200_var_FileId, x270200_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x270200_var_answer[1])
			TalkAppendButton(varMap, x270200_var_FileId, x270200_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			
			
					TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
					TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
					NewWorld(varMap,varPlayer,15,151,106, 270200)
			
			
			
			
			
			
			
			
			
			
		end

	
	
end








function x270200_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x270200_var_FileId, x270200_var_ask[1],0,1)
end








