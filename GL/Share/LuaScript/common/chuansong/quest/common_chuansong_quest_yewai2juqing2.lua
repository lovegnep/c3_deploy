

x550548_var_FileId = 550548
x550548_var_ask ={"前往昔日的塔塔尔部","确定"}
x550548_var_answer ={"穿越这记忆之门，可以前往昔日的塔塔尔部。"}

function x550548_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550548_var_FileId, x550548_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550548_var_answer[1])
			TalkAppendButton(varMap, x550548_var_FileId, x550548_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 55, 209 + random( 0, 5), 190 + random( 0, 5), 550548)
		end

	
	
end








function x550548_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550548_var_FileId, x550548_var_ask[1],0,1)
end








