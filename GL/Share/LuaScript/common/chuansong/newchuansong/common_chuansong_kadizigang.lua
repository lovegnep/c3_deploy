

x550581_var_FileId = 550581
x550581_var_ask ={"乘坐扬武号","确定"}
x550581_var_answer ={"\t回到威海港的航船扬武号每天从08：00开始每15分钟前往一次威海港，你确认要登上前往威海港的扬武号吗？"}
x550581_var_keyID =12010012

function x550581_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550581_var_FileId, x550581_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550581_var_answer[1])
			TalkAppendButton(varMap, x550581_var_FileId, x550581_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local h,m,s = GetHourMinSec()	
			local t =mod(m,15)
			if t ~=8 and t ~=9 then
				if t ==7 then t =60-s.."秒" 
				elseif t >9 then t=(15-t+8).."分钟"
				else t=8-t.."分钟"
				end
				Msg2Player(varMap,varPlayer,"开往威海港的船将在"..t.."后到港，请您稍候",8 ,3)
				return
			end		
		
			if DelItem(varMap,varPlayer,x550581_var_keyID,1) ~= 1 then 
				Msg2Player(varMap,varPlayer,"很抱歉，您没有船票不能上船",8 ,3)
				return 0 
			end
				
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
            NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550581)
			elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550581)
			elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550581)
			elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550581)
			end
		end

	
	
end








function x550581_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550581_var_FileId, x550581_var_ask[1],18,1)
end
