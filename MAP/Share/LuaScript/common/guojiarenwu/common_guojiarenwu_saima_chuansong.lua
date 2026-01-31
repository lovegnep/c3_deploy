

x430612_var_FileId = 430612
x430612_var_ask ={"前往大都","前往王城","确定"}
x430612_var_answer ={"\t你确认要前往大都吗？","\t你确认要前往王城吗？"}

function x430612_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if IsHaveQuest(varMap,varPlayer, 10284) > 0 then
			Msg2Player(varMap,varPlayer,"很抱歉，请先完成【个人】那达慕赛马大会",4,3)
			return
		end

		if which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x430612_var_answer[1])
			TalkAppendButton(varMap, x430612_var_FileId, x430612_var_ask[3],0,2)
		  	StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x430612_var_answer[2])
			TalkAppendButton(varMap, x430612_var_FileId, x430612_var_ask[3],0,4)
		  	StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		-----大都传送------
		elseif which == 2 then	
			local Level = GetLevel(varMap, varPlayer)                     
      local BusId = GetBusId(varMap, varPlayer)
      if Level >= 40 then
				if BusId ~=-1 then
          ReadyBusChangeScene(varMap, 0,BusId)
					NewWorld( varMap, varPlayer, 0, 255 + random( 0, 5), 160 + random( 0, 5), 430612)
					DeleteBus(varMap, BusId,0)	
				else
          NewWorld( varMap, varPlayer, 0, 255 + random( 0, 5), 160 + random( 0, 5), 430612)
        end
      else
       	Msg2Player(varMap,varPlayer,"#Y等级不足#G40级#Y，无法传送",4,3)
      end

			----王城传送-----
		elseif which == 4 then		
			local Level = GetLevel(varMap, varPlayer)
			local selfcountry =GetCurCountry( varMap, varPlayer)                     
	    local BusId = GetBusId(varMap, varPlayer)
	    local countrymapbase =100 * selfcountry
			if Level >= 40 then	
				if BusId ~=-1 then
	        ReadyBusChangeScene(varMap, countrymapbase + 50,BusId)
					NewWorld( varMap, varPlayer, countrymapbase + 50, 255 + random( 0, 5), 115 + random( 0, 5), 430612)
					DeleteBus(varMap, BusId,0)	
				else
	        NewWorld( varMap, varPlayer, countrymapbase + 50, 255 + random( 0, 5), 115 + random( 0, 5), 430612)
	      end
			else
				Msg2Player(varMap,varPlayer,"#Y等级不足#G40级#Y，无法传送",4,3)
			end
		else
			return
		end		
end
			
		

	
	









function x430612_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x430612_var_FileId, x430612_var_ask[1],0,1)
			TalkAppendButton(varMap, x430612_var_FileId, x430612_var_ask[2],0,3)

end
