

x550541_var_FileId = 550541
x550541_var_ask ={"离开此地","确定"}
x550541_var_answer ={"\t这就是当年成吉思汗在此地时的景象。\n\t你要离开这里吗？"}

function x550541_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550541_var_FileId, x550541_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550541_var_answer[1])
			TalkAppendButton(varMap, x550541_var_FileId, x550541_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 99, 25 + random( 0, 5), 150 + random( 0, 5), 550541)
		end

	
	
end








function x550541_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550541_var_FileId, x550541_var_ask[1],0,1)
end








