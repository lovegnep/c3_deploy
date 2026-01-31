

x550552_var_FileId = 550552
x550552_var_ask ={"前往昔日的太行山","确定"}
x550552_var_answer ={"穿越这记忆之门，可以前往昔日的太行山。"}

function x550552_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550552_var_FileId, x550552_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550552_var_answer[1])
			TalkAppendButton(varMap, x550552_var_FileId, x550552_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer,502, 150 + random( 0, 2), 39 + random( 0, 2), 550552)
		end

	
	
end








function x550552_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550552_var_FileId, x550552_var_ask[1],0,1)
end








