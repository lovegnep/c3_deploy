

x550578_var_FileId = 550578
x550578_var_ask ={"乘坐扬武号","确定"}
x550578_var_answer ={"\t前往地中海卡迪兹港的航船扬武号每天从00：00开始每15分钟前往一次地中海的卡迪兹港，你确认要登上前往卡迪兹港的扬武号吗？"}
x550578_var_keyID =12010012

function x550578_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)




	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x550578_var_FileId, x550578_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550578_var_answer[1])
			TalkAppendButton(varMap, x550578_var_FileId, x550578_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
		local  guid,Level50 = GetToplistInfo(varMap,0,49)
	--	if Level50 <80 then
	--		 Msg2Player(varMap, varPlayer, format("很抱歉，等级排行榜上第50名玩家不足80级"), 0, 3)
	--		return
	--	end
			
		
		  if GetLevel( varMap, varPlayer) < 80 then
   		  Msg2Player(varMap,varPlayer,"很抱歉，你的等级不足80级",8 ,3)
        return 
   	  end
   	  
			local h,m,s = GetHourMinSec()	
			local t =mod(m,15)
			if t >1 then
				if t ==14 then t =60-s.."秒" 
				else t = 15-t.."分钟"
				end
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后到港，请您稍候",8 ,3)
				return
			end
			
			if DelItem(varMap,varPlayer,x550578_var_keyID,1) ~= 1 then 
				Msg2Player(varMap,varPlayer,"很抱歉，您没有船票不能上船",8 ,3)
				return 0 
			end
			
			local selfcountry =GetCurCountry( varMap, varPlayer)
            TimerCommand( varMap, varPlayer, 1, 7010, 3, -1, -1, -1 )
            TimerCommand( varMap, varPlayer, 2, 7010, 3, -1, -1, -1 )
			if selfcountry == 0 then
        NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550578)
			elseif selfcountry ==1 then
				NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550578)
			elseif selfcountry ==2 then
				NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550578)
			elseif selfcountry ==3 then
				NewWorld( varMap, varPlayer, 571, 95 + random( 0, 5), 123 + random( 0, 5), 550578)
			end
		end

	
	
end








function x550578_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x550578_var_FileId, x550578_var_ask[1],18,1)
end



function x550578_EnterScene( varMap, varPlayer)
		if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) > POINT_KADIZI_TRANS then
			return 
		end	

    if varMap == 15 then
      local h,m,s = GetHourMinSec()	
			local t =mod(m,15)
			if t >1 then
				if t ==14 then t =60-s.."秒" 
				else t = 15-t.."分钟"
				end
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后到港，请您及时关注",8 ,2)
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后到港，请您及时关注",8 ,1)
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后到港，请您及时关注",8 ,5)
      else 
      	t =(120-( s+ t*60)).."秒"
       	Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后离港，请您及时关注",8 ,2)
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后离港，请您及时关注",8 ,1)
				Msg2Player(varMap,varPlayer,"开往卡迪兹港的船将在"..t.."后离港，请您及时关注",8 ,5)
    	end
    end	
end
