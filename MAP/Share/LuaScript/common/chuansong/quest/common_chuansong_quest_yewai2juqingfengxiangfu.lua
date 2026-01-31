

x550553_var_FileId = 550553
x550553_var_ask ={"前往昔日的凤翔府","确定"}
x550553_var_answer ={"穿越这记忆之门，可以前往昔日的凤翔府。"}

function x550553_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550553_var_FileId, x550553_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550553_var_answer[1])
			TalkAppendButton(varMap, x550553_var_FileId, x550553_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer,503, 105 + random( 0, 2), 66 + random( 0, 2), 550553)
		end

	
	
end








function x550553_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550553_var_FileId, x550553_var_ask[1],0,1)
end








