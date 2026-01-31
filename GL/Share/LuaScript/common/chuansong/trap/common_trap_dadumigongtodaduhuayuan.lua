

x490030_var_FileId = 490030
x490030_var_ask ={"回到后花园","确定"}
x490030_var_answer ={"\t你确认要离开地下粮仓返回后花园吗？"}

function x490030_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

		local minOfDay = GetMinOfDay()
		local weekIdx = GetWeek()
		
	if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法传送至后花园",8 ,2)
			return
		end	
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		CancelSpecificImpact( varMap, varPlayer, 7629)	
	end
		
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x490030_var_FileId, x490030_var_ask[1],0,1)
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x490030_var_answer[1])
			TalkAppendButton(varMap, x490030_var_FileId, x490030_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
				NewWorld( varMap, varPlayer, 44, 273.449219 + random( 0, 5), 235.90036 + random( 0, 5), 490030)
			elseif selfcountry ==1 then
				NewWorld( varMap, varPlayer, 44, 273.449219 + random( 0, 5), 235.90036 + random( 0, 5), 490030)
			elseif selfcountry ==2 then
				NewWorld( varMap, varPlayer, 44, 273.449219 + random( 0, 5), 235.90036 + random( 0, 5), 490030)
			elseif selfcountry ==3 then
				NewWorld( varMap, varPlayer, 44, 273.449219 + random( 0, 5), 235.90036 + random( 0, 5), 490030)
			end
		end

	
	
end








function x490030_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x490030_var_FileId, x490030_var_ask[1],0,1)
end
