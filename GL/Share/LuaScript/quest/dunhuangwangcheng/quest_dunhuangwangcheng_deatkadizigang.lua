

x256017_var_FileId = 256017
x256017_var_ask ={"回到卡迪兹港","确定"}
x256017_var_answer ={"\t生死有命，灾祸常生，所以，你也不必太过沮丧。\n\t你要离开这里，返回卡迪兹港吗？"}

function x256017_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x256017_var_FileId, x256017_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x256017_var_answer[1])
			TalkAppendButton(varMap, x256017_var_FileId, x256017_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
			
			
	
		local  guid,Level50 = GetToplistInfo(varMap,0,49)
	--	if Level50 <80 then
	--		 Msg2Player(varMap, varPlayer, format("很抱歉，等级排行榜上第50名玩家不足80级"), 0, 3)
	--		return
	--	end
	if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <POINT_KADIZI_TRANS then
			 Msg2Player(varMap, varPlayer, format("很抱歉，当前征服度不足"..POINT_KADIZI_TRANS.."点"), 0, 3)
			return	
	end
            
		
            
            
            if selfcountry == 0 then
            	NewWorld( varMap, varPlayer, 569, 212 + random( -2, 2), 361 + random( -2, 2), 256017)
            elseif selfcountry == 1 then
            	NewWorld( varMap, varPlayer, 569, 212 + random( -2, 2), 361 + random( -2, 2), 256017)
            elseif selfcountry == 2 then
            	NewWorld( varMap, varPlayer, 569, 212 + random( -2, 2), 361 + random( -2, 2), 256017)
           	elseif selfcountry == 3 then
            	NewWorld( varMap, varPlayer, 569, 212 + random( -2, 2), 361 + random( -2, 2), 256017)
            end
		end

	
	
end








function x256017_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
		local  guid,Level50 = GetToplistInfo(varMap,0,49)
--		if Level50 <80 then
--			return
--		end
	
		local Level =	GetLevel( varMap, varPlayer)
		if Level >= 80 then
			TalkAppendButton(varMap, x256017_var_FileId, x256017_var_ask[1],0,1)
		end	

	
end 
    
    
    
    
    
    
    

