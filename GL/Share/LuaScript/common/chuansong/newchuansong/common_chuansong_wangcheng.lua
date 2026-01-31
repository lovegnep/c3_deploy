

x550000_var_FileId = 550000
x550000_var_ask ={"回到王城","确定"}
x550000_var_answer ={"\t你确认要离开剧场返回王城吗？"}

function x550000_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550000_var_FileId, x550000_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550000_var_answer[1])
			TalkAppendButton(varMap, x550000_var_FileId, x550000_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
            NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 199 + random( 0, 5), 44 + random( 0, 5), 550000)
			elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 199 + random( 0, 5), 44 + random( 0, 5), 550000)
			elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 199 + random( 0, 5), 44 + random( 0, 5), 550000)
			elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 199 + random( 0, 5), 44 + random( 0, 5), 550000)
			end
		end

	
	
end








function x550000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550000_var_FileId, x550000_var_ask[1],0,1)
end
