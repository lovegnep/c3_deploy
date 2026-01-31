

x256016_var_FileId = 256016
x256016_var_ask ={"回到后花园","确定"}
x256016_var_answer ={"\t生死有命，灾祸常生，所以，你也不必太过沮丧。\n\t你要离开这里，返回后花园吗？"}

function x256016_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x256016_var_FileId, x256016_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x256016_var_answer[1])
			TalkAppendButton(varMap, x256016_var_FileId, x256016_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
			
			local minOfDay = GetMinOfDay()
			local weekIdx = GetWeek()
      if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 then
				Msg2Player(varMap,varPlayer,"决战后花园期间，无法传送至后花园",8 ,2)
				return
			end	
			local  WorldID = GetWorldID(varMap,varPlayer)	
			local  toplevel = GetToplistCount(WorldID,0)
			local  guid,varLevelMax = GetToplistInfo(WorldID,0,toplevel-1)
	--		if varLevelMax < 70 then
	--			Msg2Player(varMap,varPlayer,"很抱歉，服务器等级排行榜最后一名达到70级才可开启后花园传送",8,2)
	--			return
	--		end
	
            
            if selfcountry == 0 then
            	NewWorld( varMap, varPlayer, 44, 269 + random( -2, 2), 423 + random( -2, 2), 256016)
            elseif selfcountry == 1 then
            	NewWorld( varMap, varPlayer, 44, 177 + random( -2, 2), 46 + random( -2, 2), 256016)
            elseif selfcountry == 2 then
            	NewWorld( varMap, varPlayer, 44, 38 + random( -2, 2), 273 + random( -2, 2), 256016)
           	elseif selfcountry == 3 then
            	NewWorld( varMap, varPlayer, 44, 418 + random( -2, 2), 31 + random( -2, 2), 256016)
            end
		end

	
	
end








function x256016_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local  WorldID = GetWorldID(varMap,varPlayer)	
		local  toplevel = GetToplistCount(WorldID,0)
		local  guid,varLevelMax = GetToplistInfo(WorldID,0,toplevel-1)
  	
	--	if varLevelMax < 70 then
	--		return
	--	end
		local Level =	GetLevel( varMap, varPlayer)
		if Level >= 70 then
			TalkAppendButton(varMap, x256016_var_FileId, x256016_var_ask[1],0,1)
		end	

	
end 
    
    
    
    
    
    
    

