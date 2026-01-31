

x550546_var_FileId = 550546
x550546_var_ask ={"前往昔日的罕难河草原","确定"}
x550546_var_answer ={"\t穿越这记忆之门，可以前往昔日的罕难河草原。"}

function x550546_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550546_var_FileId, x550546_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550546_var_answer[1])
			TalkAppendButton(varMap, x550546_var_FileId, x550546_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 52, 55 + random( 0, 5), 208 + random( 0, 5), 550546)
		end

	
	
end








function x550546_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550546_var_FileId, x550546_var_ask[1],0,1)
end








