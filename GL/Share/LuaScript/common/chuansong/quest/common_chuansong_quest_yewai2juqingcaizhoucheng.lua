

x550554_var_FileId = 550554
x550554_var_ask ={"前往昔日的蔡州城","确定"}
x550554_var_answer ={"穿越这记忆之门，可以前往昔日的蔡州城。"}

function x550554_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550554_var_FileId, x550554_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550554_var_answer[1])
			TalkAppendButton(varMap, x550554_var_FileId, x550554_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer,504, 111 + random( 0, 2), 81 + random( 0, 2), 550554)
		end

	
	
end








function x550554_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550554_var_FileId, x550554_var_ask[1],0,1)
end








