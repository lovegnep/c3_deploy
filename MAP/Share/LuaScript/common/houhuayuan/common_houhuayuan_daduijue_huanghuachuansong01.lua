

x320027_var_FileId = 320027
x320027_var_ask ={"传送至我方侧翼","确定"}
x320027_var_answer ={"\t你可以在我方两个大营之间自由传送。"}

function x320027_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x320027_var_FileId, x320027_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x320027_var_answer[1])
			TalkAppendButton(varMap, x320027_var_FileId, x320027_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
--			local selfcountry =GetCurCountry( varMap, varPlayer)
--            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
--            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
--			if selfcountry == 0 then
--            NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), 320027)
--			elseif selfcountry ==1 then
--			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 75 + random( 0, 5), 180 + random( 0, 5), 320027)
--			elseif selfcountry ==2 then
--			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), 320027)
--			elseif selfcountry ==3 then
--			NewWorld( varMap, varPlayer, selfcountry * 100 + 50, 181 + random( 0, 5), 76 + random( 0, 5), 320027)
--			end
			local InBus = IsBusMember(varMap, varPlayer)
			if InBus ~= 1 then
				SetPos(varMap,varPlayer,269,387)
			else
				Msg2Player(varMap,varPlayer,"你处于护送状态，无法传送！",8,3)
				Msg2Player(varMap,varPlayer,"你处于护送状态，无法传送！",8,2)
				return
			end
		end

	
	
end








function x320027_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetCurCamp(varMap, varPlayer) ~= 6 then
		return
	end
			TalkAppendButton(varMap, x320027_var_FileId, x320027_var_ask[1],0,1)
end








