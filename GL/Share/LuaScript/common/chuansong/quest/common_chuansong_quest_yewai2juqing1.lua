

x550547_var_FileId = 550547
x550547_var_ask ={"前往昔日的乞颜部","确定"}
x550547_var_answer ={"\t穿越这记忆之门，可以前往昔日的乞颜部。"}

function x550547_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550547_var_FileId, x550547_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550547_var_answer[1])
			TalkAppendButton(varMap, x550547_var_FileId, x550547_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 53, 90 + random( 0, 5), 186 + random( 0, 5), 550547)
		end

	
	
end








function x550547_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550547_var_FileId, x550547_var_ask[1],0,1)
end








