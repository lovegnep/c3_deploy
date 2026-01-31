

x270100_var_FileId = 270100
x270100_var_ask ={"回到大都·南","确定"}
x270100_var_answer ={"\t你确认要离开此副本，返回大都·南吗？"}

function x270100_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x270100_var_FileId, x270100_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x270100_var_answer[1])
			TalkAppendButton(varMap, x270100_var_FileId, x270100_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			
			
					TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
					TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
					NewWorld(varMap,varPlayer,36,128,70, 270100)
			
			
			
			
			
			
			
			
			
			
		end

	
	
end








function x270100_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x270100_var_FileId, x270100_var_ask[1],0,1)
end








