

x550550_var_FileId = 550550
x550550_var_ask ={"前往昔日的乃蛮部","确定"}
x550550_var_answer ={"穿越这记忆之门，可以前往昔日的乃蛮部。"}

function x550550_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550550_var_FileId, x550550_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550550_var_answer[1])
			TalkAppendButton(varMap, x550550_var_FileId, x550550_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 56, 39 + random( 0, 5), 125 + random( 0, 5), 550550)
		end

	
	
end








function x550550_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550550_var_FileId, x550550_var_ask[1],0,1)
end








