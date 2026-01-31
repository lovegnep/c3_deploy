

x300271_var_FileId = 300271
x300271_var_ask ={"回到王城南门","确定"}
x300271_var_answer ={"\t你要离开这里，返回王城南门吗？"}

function x300271_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x300271_var_FileId, x300271_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x300271_var_answer[1])
			TalkAppendButton(varMap, x300271_var_FileId, x300271_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 128 + random( 0, 5), 165 + random( 0, 5), 300271)
		end

	
	
end








function x300271_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x300271_var_FileId, x300271_var_ask[1],0,1)
end








