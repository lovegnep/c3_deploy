




x300970_var_FileId = 300970

function x300970_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	
	if GetWeek() == 0 then 
		return
	end
	
	local nWorldId = GetWorldIdEx()
	local nGuid , nRank = GetToplistInfo(nWorldId, 0 , 0) 
	if nRank < 50 then
		return
	end

	for varI=0, 3 do 
		if GetCountryKingGuildIdNM(varI) < 0 then
			x300970_BroadcastMsg2Country(varMap , varI , varParam1)
		end
	end
end
			
			

function x300970_BroadcastMsg2Country(varMap , varCountryID , varParam1)			
	
	if varParam1 == 0 then
		
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！", varCountryID , CHAT_RIGHTDOWN,1)
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！", varCountryID , CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！", varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
		
	elseif varParam1 == 1 then
		
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！", varCountryID , CHAT_RIGHTDOWN,1)
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！", varCountryID , CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！", varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
		
	elseif varParam1 == 2 then
		
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！",varCountryID , CHAT_RIGHTDOWN,1)      
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！",varCountryID , CHAT_LEFTDOWN, 1)      
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
		
	elseif varParam1 == 3 then
		
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！",varCountryID , CHAT_RIGHTDOWN,1)      
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！",varCountryID , CHAT_LEFTDOWN, 1)      
		LuaAllScenceM2Country(varMap,"国王战场报名时间将在14：00开始，请参加报名的帮会做好准备！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	
	elseif varParam1 == 4 then
	
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_RIGHTDOWN,1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_LEFTDOWN, 1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	elseif varParam1 == 5 then
	
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_RIGHTDOWN,1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_LEFTDOWN, 1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	elseif varParam1 == 6 then
	
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_RIGHTDOWN,1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_LEFTDOWN, 1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名开始，请参加的帮会前往本国王城国家管理员处报名！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	elseif varParam1 == 7 then
	
	    LuaAllScenceM2Country(varMap,"国王战场报名结束！",varCountryID , CHAT_RIGHTDOWN,1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名结束！",varCountryID , CHAT_LEFTDOWN, 1)      
	    LuaAllScenceM2Country(varMap,"国王战场报名结束！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	elseif varParam1 == 8 then
	
		LuaAllScenceM2Country(varMap,"国王战场将在20：00分开启，请提前做好准备！",varCountryID , CHAT_RIGHTDOWN,1)      
		LuaAllScenceM2Country(varMap,"国王战场将在20：00分开启，请提前做好准备！",varCountryID , CHAT_LEFTDOWN, 1)      
		LuaAllScenceM2Country(varMap,"国王战场将在20：00分开启，请提前做好准备！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	elseif varParam1 == 9 then
	
		LuaAllScenceM2Country(varMap,"国王战场开始了！",varCountryID , CHAT_RIGHTDOWN,1)      
		LuaAllScenceM2Country(varMap,"国王战场开始了！",varCountryID , CHAT_LEFTDOWN, 1)      
		LuaAllScenceM2Country(varMap,"国王战场开始了！",varCountryID , CHAT_MAIN_RIGHTDOWN, 1)
	end
end
