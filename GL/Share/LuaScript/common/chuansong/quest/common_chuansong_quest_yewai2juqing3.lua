

x550549_var_FileId = 550549
x550549_var_ask ={"前往昔日的克烈部","确定"}
x550549_var_answer ={"穿越这记忆之门，可以前往昔日的克烈部。"}

function x550549_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550549_var_FileId, x550549_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550549_var_answer[1])
			TalkAppendButton(varMap, x550549_var_FileId, x550549_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 54, 176 + random( 0, 5), 117 + random( 0, 5), 550549)
		end

	
	
end








function x550549_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550549_var_FileId, x550549_var_ask[1],0,1)
end








