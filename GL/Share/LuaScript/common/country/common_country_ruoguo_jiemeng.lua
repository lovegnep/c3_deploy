

x310215_var_FileId 					= 	310215                  
x310215_var_Quest_Max_Count = 1 
x310215_var_GameId = 1057
x310215_var_Title = "【国家】退出弱国联盟"


function x310215_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if IsToggleCountryColleague() == 0 then 
		return -1
	end
	
	local countryofficial = CountryGetOfficial(varMap,varPlayer)
	if countryofficial ~= 8 then
		return -1
	end


	TalkAppendButton(varMap,x310215_var_FileId,x310215_var_Title, 3, -1)	
end



function x310215_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	
	local varCountryID = GetCurCountry(varMap, varPlayer)
	local nLeagueA,nLeagueB = x310215_GetLeagueCountry( varCountryID )
	local varStr = ""
    if nLeagueA >=0 and nLeagueA < 4 then
        varStr = varStr..x310215_GetCountryName( nLeagueA )
    end
    if nLeagueB >=0 and nLeagueB < 4 then
        if varStr ~= "" then
           varStr = varStr.."和"
        end
        varStr = varStr..x310215_GetCountryName( nLeagueB )
    end 
	
	if  varStr == "" then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310215_var_Title)
		TalkAppendString(varMap,"\t很抱歉，您的国家没有盟国！")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, -1, -1,  0)	
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310215_var_Title)
		TalkAppendString(varMap,format("\t目前我国的联盟国家是%s，如果出现了一些特殊情况，退出联盟或许是一个选择。但是，希望你在慎重考虑之后再做决定。你是否要退出与%s的联盟？",varStr,varStr))
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310215_var_FileId, -1,  0)	
	end

end



function x310215_GetLeagueCountry( varCountry )

    local country1 = -1
    local country2 = -1
    
    for i = 0, 3 do
    
        if i ~= varCountry then
        
            if IsLeague( varCountry, i ) == 1 then
                
                if country1 < 0 then
                    country1 = i 
                elseif country2 < 0 then
                    country2 = i
                end
                
            end
            
        end
  
    end
    
    return country1, country2

end



function x310215_ProcAccept( varMap, varPlayer )
	
	if  x310215_CheckCountryLevel(varMap, varPlayer) < 0 then
		Msg2Player(varMap, varPlayer,"你的国家当前没有盟国", 8, 2)
		Msg2Player(varMap, varPlayer,"你的国家当前没有盟国", 8, 3)
		return -1
	end

	if 	 x310215_CheckCountryIfColleague(varMap, varPlayer) < 0 then
		Msg2Player(varMap, varPlayer,"你的国家当前没有盟国", 8, 2)
		Msg2Player(varMap, varPlayer,"你的国家当前没有盟国", 8, 3)
		return -1
	end
	
	if x310215_GetDayCount(varMap, varPlayer) > 0 then
		Msg2Player(varMap, varPlayer,"每天只能申请解盟一次，请明日再来", 8, 2)
		Msg2Player(varMap, varPlayer,"每天只能申请解盟一次，请明日再来", 8, 3)
		return -1
	end
	
	
	x310215_SetDayCount( varMap, varPlayer )
	ClearCountryColleague( varMap, varPlayer ) 
	
	
	Msg2Player(varMap, varPlayer,"退出联盟完成", 8, 2)
	Msg2Player(varMap, varPlayer,"退出联盟完成", 8, 3)
	
	local logFmtMsg         = "x310215_ProcAccept : ClearCountryColleague : varMap = %d,varPlayer = %d" 	
	local logMsg = format(logFmtMsg,varMap,varPlayer)
	WriteLog(1,logMsg)

end

function x310215_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end



function x310215_ProcQuestAccept( varMap, varPlayer, varTalknpc )
	
end



function x310215_GetDayCount(varMap, varPlayer)
	local varCountryID = GetCurCountry(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetCountryParam(varMap, varCountryID, CD_DISMISS_COLLEAGUE_DATE)
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount =  GetCountryParam(varMap, varCountryID,CD_DISMISS_COLLEAGUE_COUNT )
	return varDaycount
end




function x310215_SetDayCount(varMap, varPlayer)
	local varCountryID = GetCurCountry(varMap, varPlayer,CD_DISMISS_COLLEAGUE_DATE)
	local varToday = GetDayOfYear()
	local varLastday = GetCountryParam(varMap, varCountryID, CD_DISMISS_COLLEAGUE_DATE)
	if varLastday ~= varToday then
		SetCountryParam(varMap, varCountryID, CD_DISMISS_COLLEAGUE_DATE, varToday)
		SetCountryParam(varMap, varCountryID,CD_DISMISS_COLLEAGUE_COUNT,1)
	else
		local varDaycount = GetCountryParam(varMap, varCountryID,CD_DISMISS_COLLEAGUE_COUNT )
		SetCountryParam(varMap, varCountryID,CD_DISMISS_COLLEAGUE_COUNT, varDaycount+1)		
	end
end



function x310215_CheckCountryLevel(varMap, varPlayer)
	local varCountryID = GetCurCountry(varMap, varPlayer )
	local nLevel     =  GetCountryParam(varMap, varCountryID, CD_STRONG_WEAK_LEVEL)
	if nLevel ~= 1 and nLevel ~= 2 and nLevel ~= 3 then
		return -1
	end
	
	return 1
	
end


function x310215_CheckCountryIfColleague(varMap, varPlayer)
	local varCountryID = GetCurCountry(varMap, varPlayer )
	
	for i = 0, 3 do
	
	    if varCountryID ~= i then
	        
	        if IsLeague( i, varCountryID ) == 1 then
	            return 1
	        end
	    
	    end
	
	end
	
	return -1
	
end

function x310215_GetCountryName( varCountryID )
    
    if varCountryID == 0 then
        return "楼兰王国"
    elseif varCountryID == 1 then
        return "天山王国"
    elseif varCountryID == 2 then
        return "昆仑王国"
    elseif varCountryID == 3 then
        return "敦煌王国"
    else
        return "天朝"
    end
    
end


