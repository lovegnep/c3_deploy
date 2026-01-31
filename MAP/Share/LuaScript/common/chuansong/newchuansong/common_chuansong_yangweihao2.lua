

x550580_var_FileId = 550580
x550580_var_ask ={"登陆卡迪兹港","确定"}
x550580_var_answer ={"\t你确认要离开扬武号传送到卡迪兹港吗？"}

function x550580_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550580_var_FileId, x550580_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
		  if GetLevel( varMap, varPlayer) < 80 then
   		  Msg2Player(varMap,varPlayer,"很抱歉，你的等级不足80级",8 ,3)
        return 
   	  end		
			local h,m,s = GetHourMinSec()	
			local t =mod(m,15)
			if t >=8 then
				Msg2Player(varMap,varPlayer,"现在正在开往威海港口",8 ,2)
				Msg2Player(varMap,varPlayer,"现在正在开往威海港口",8 ,3)
				return
			end	
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550580_var_answer[1])
			TalkAppendButton(varMap, x550580_var_FileId, x550580_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
		  if GetLevel( varMap, varPlayer) < 80 then
   		  Msg2Player(varMap,varPlayer,"很抱歉，你的等级不足80级",8 ,3)
        return 
   	  end		
					local h,m,s = GetHourMinSec()	
			local t =mod(m,15)
			if t >=8 then
				Msg2Player(varMap,varPlayer,"现在正在开往威海港口",8 ,2)
				Msg2Player(varMap,varPlayer,"现在正在开往威海港口",8 ,3)
				return
			elseif t<6 then
				if t ==5 then t =60-s.."秒" 
				else t = 6-t.."分钟"
				end
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后到港，请您稍候",8 ,3)
				return					
			end
			
			
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
            NewWorld( varMap, varPlayer, 569, 205 + random( 0, 5), 358 + random( 0, 5), 550580)
			elseif selfcountry ==1 then
			NewWorld( varMap, varPlayer, 569, 205 + random( 0, 5), 358 + random( 0, 5), 550580)
			elseif selfcountry ==2 then
			NewWorld( varMap, varPlayer, 569, 205 + random( 0, 5), 358 + random( 0, 5), 550580)
			elseif selfcountry ==3 then
			NewWorld( varMap, varPlayer, 569, 205 + random( 0, 5), 358 + random( 0, 5), 550580)
			end
		end

	
	
end








function x550580_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550580_var_FileId, x550580_var_ask[1],18,1)
end
