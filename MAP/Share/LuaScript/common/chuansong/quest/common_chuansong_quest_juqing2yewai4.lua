

x550544_var_FileId = 550544
x550544_var_ask ={"离开此地","确定"}
x550544_var_answer ={"\t这就是当年成吉思汗在此地时的景象。\n\t你要离开这里吗？"}

function x550544_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550544_var_FileId, x550544_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550544_var_answer[1])
			TalkAppendButton(varMap, x550544_var_FileId, x550544_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 102, 220 + random( 0, 5), 170 + random( 0, 5), 550544)
		end

	
	
end








function x550544_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550544_var_FileId, x550544_var_ask[1],0,1)
end








