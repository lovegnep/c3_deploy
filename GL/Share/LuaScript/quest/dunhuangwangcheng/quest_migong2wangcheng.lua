

x256000_var_FileId = 256000
x256000_var_ask ={"回到王城","确定"}
x256000_var_answer ={"\t你确认要离开迷宫8层返回王城吗？"}

function x256000_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x256000_var_FileId, x256000_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x256000_var_answer[1])
			TalkAppendButton(varMap, x256000_var_FileId, x256000_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
            NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 128 + random( 0, 5), 118 + random( 0, 5), 256000)
			elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 128 + random( 0, 5), 118 + random( 0, 5), 256000)
			elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 128 + random( 0, 5), 138 + random( 0, 5), 256000)
			elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 128 + random( 0, 5), 138 + random( 0, 5), 256000)
			end
		end

	
	
end








function x256000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x256000_var_FileId, x256000_var_ask[1],0,1)
end








