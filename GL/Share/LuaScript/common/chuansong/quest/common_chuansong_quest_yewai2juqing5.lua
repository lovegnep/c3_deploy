

x550551_var_FileId = 550551
x550551_var_ask ={"前往昔日的居庸关","确定"}
x550551_var_answer ={"穿越这记忆之门，可以前往昔日的居庸关。"}

function x550551_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550551_var_FileId, x550551_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550551_var_answer[1])
			TalkAppendButton(varMap, x550551_var_FileId, x550551_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 57, 71 + random( 0, 5), 62 + random( 0, 5), 550551)
		end

	
	
end








function x550551_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550551_var_FileId, x550551_var_ask[1],0,1)
end








